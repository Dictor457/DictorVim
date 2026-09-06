local M = {}

-- Компиляция и запуск C++ в плавающем терминале
function M.run_cpp(with_asan)
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")

  if ext ~= "cpp" and ext ~= "c" then
    vim.notify("DictorRunner: Current buffer is not C/C++ source", vim.log.levels.WARN)
    return
  end

  vim.cmd("silent! write")
  local outfile = "/tmp/dictor_bin"
  local cmd = ""

  if with_asan then
    -- Сборка с AddressSanitizer для поиска уязвимостей и утечек памяти
    cmd = string.format(
      "g++ -std=c++20 -O1 -g -fsanitize=address,undefined -Wall -Wextra '%s' -o '%s' && '%s'; echo ''; read -p '[ASan Finished. Press Enter to close]'",
      file, outfile, outfile
    )
  else
    -- Быстрая оптимизированная сборка для алгоритмов
    cmd = string.format(
      "g++ -std=c++20 -O3 -Wall '%s' -o '%s' && /usr/bin/time -p '%s'; echo ''; read -p '[Execution Finished. Press Enter to close]'",
      file, outfile, outfile
    )
  end

  -- Открытие плавающего окна терминала
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = with_asan and " DictorSecurity: AddressSanitizer " or " DictorRunner: C++20 Execution ",
    title_pos = "center",
  })

  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end

return M
