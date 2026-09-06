local M = {}

-- Автоопределение типа проекта
local function detect_project_type()
  local cwd = vim.fn.getcwd()
  if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
    return "cmake"
  elseif vim.fn.filereadable(cwd .. "/Makefile") == 1 or vim.fn.filereadable(cwd .. "/makefile") == 1 then
    return "make"
  else
    return "single"
  end
end

function M.run(with_asan, force_single)
  local project_type = force_single and "single" or detect_project_type()
  local cmd = ""
  local title = ""

  -- 1. Сборка CMake проекта
  if project_type == "cmake" then
    if vim.fn.executable("cmake") == 0 then
      vim.notify("DictorRunner Error: 'cmake' not found in PATH.", vim.log.levels.ERROR)
      return
    end
    vim.cmd("silent! wa")
    local asan_flag = with_asan and ' -DCMAKE_CXX_FLAGS="-fsanitize=address,undefined -g"' or ""
    cmd = string.format(
      "cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON%s && cmake --build build -j$(nproc); echo ''; read -p '[Build finished. Press Enter to close]'",
      asan_flag
    )
    title = with_asan and " DictorBuild: CMake (ASan) " or " DictorBuild: CMake "

  -- 2. Сборка через Makefile
  elseif project_type == "make" then
    if vim.fn.executable("make") == 0 then
      vim.notify("DictorRunner Error: 'make' not found in PATH.", vim.log.levels.ERROR)
      return
    end
    vim.cmd("silent! wa")
    cmd = "make -j$(nproc); echo ''; read -p '[Build finished. Press Enter to close]'"
    title = " DictorBuild: Make "

  -- 3. Одиночный файл C/C++ (Алгоритмы, олимпиады, PoC эксплойты)
  else
    local file = vim.fn.expand("%:p")
    local ext = vim.fn.expand("%:e")

    if ext ~= "cpp" and ext ~= "c" then
      vim.notify("DictorRunner: Current buffer is not a C/C++ source file.", vim.log.levels.WARN)
      return
    end

    if vim.fn.executable("g++") == 0 then
      vim.notify("DictorRunner Error: 'g++' compiler not found in system PATH.", vim.log.levels.ERROR)
      return
    end

    vim.cmd("silent! write")
    local outfile = "/tmp/dictor_bin"
    local time_cmd = vim.fn.executable("/usr/bin/time") == 1 and "/usr/bin/time -p " or ""

    if with_asan then
      cmd = string.format(
        "g++ -std=c++20 -O1 -g -fsanitize=address,undefined -Wall -Wextra '%s' -o '%s' && '%s'; echo ''; read -p '[ASan Finished. Press Enter to close]'",
        file, outfile, outfile
      )
      title = " DictorSecurity: AddressSanitizer "
    else
      cmd = string.format(
        "g++ -std=c++20 -O3 -Wall '%s' -o '%s' && %s'%s'; echo ''; read -p '[Execution Finished. Press Enter to close]'",
        file, outfile, time_cmd, outfile
      )
      title = " DictorRunner: C++20 Execution "
    end
  end

  -- Плавающий терминал
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = title,
    title_pos = "center",
  })

  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end

return M
