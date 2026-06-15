vim.cmd [[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
source ~/.vimrc
]]

vim.opt.laststatus = 3

vim.diagnostic.config({
    severity_sort = true,
    underline = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "■ ",
            [vim.diagnostic.severity.WARN] = "■ ",
            [vim.diagnostic.severity.INFO] = "■ ",
            [vim.diagnostic.severity.HINT] = "■ ",
        },
    },
    virtual_text = {
        source = "if_many",
        spacing = 2,
        format = function(diagnostic)
            local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
        end,
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if not client then return end

        if client:supports_method("textDocument/formatting") then
            local lsp_formatting_augroup = vim.api.nvim_create_augroup(
                "UserLspFormatting", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = lsp_formatting_augroup,
                buffer = event.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = event.buf })
                end,
            })
        end

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, event.buf,
                { autotrigger = false })
        end

        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
            { desc = "Open diagnostic [Q]uickfix list" })

        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func,
                { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("<C-p>", vim.lsp.completion.get, "Trigger autocompletion", "i")

        local lsp_diagnostics_augroup = vim.api.nvim_create_augroup(
            "UserLspDiagnostics", { clear = true })

        local function show_diagnostics()
            vim.diagnostic.enable(true)
            vim.cmd("redrawstatus")
        end

        local function hide_diagnostics()
            vim.diagnostic.enable(false)
            vim.cmd("redrawstatus")
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = lsp_diagnostics_augroup,
            buffer = event.buf,
            callback = show_diagnostics,
        })

        vim.api.nvim_create_autocmd("ModeChanged", {
            group = lsp_diagnostics_augroup,
            pattern = "n:*",
            callback = hide_diagnostics,
        })

        vim.api.nvim_create_autocmd("ModeChanged", {
            group = lsp_diagnostics_augroup,
            pattern = "*:n",
            callback = show_diagnostics,
        })

        show_diagnostics()
    end,
})

vim.lsp.config("*", {
    root_markers = { ".git" },
    capabilities = {
        textDocument = {
            diagnostic = {
                dynamicRegistration = true,
                relatedDocumentSupport = true,
            },
        },
    },
})

vim.lsp.config("bash-language-server", {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh" },
})

vim.lsp.config("biome", {
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
        "astro",
        "css",
        "graphql",
        "html",
        "svelte",
        "vue",
    },
    root_markers = {
        ".git",
        "biome.json",
        "biome.jsonc",
        ".biome.json",
        ".biome.jsonc",
        "package.json",
    },
})

vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = {
        ".git",
        "compile_commands.json",
        "compile_flags.txt",
        ".clangd",
    },
})

vim.lsp.config("deno", {
    cmd = { "deno", "lsp" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
    },
    root_markers = { ".git", "deno.json", "deno.jsonc", "package.json" },
    settings = {
        deno = {
            enable = true,
            lint = true,
            unstable = true,
        },
    },
})

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { ".git", "go.work", "go.mod" },
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
        },
    },
})

vim.lsp.config("lua-language-server", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git", ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml" },
    on_init = function(client)
        client.settings = vim.tbl_deep_extend("force", client.settings, {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                    },
                },
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_size = "4",
                        indent_style = "space",
                        max_line_length = "80",
                        quote_style = "double",
                        trailing_table_separator = "smart",
                    },
                },
            },
        })
    end,
})

vim.lsp.config("rumdl", {
    cmd = { "rumdl", "server" },
    filetypes = { "markdown" },
    root_markers = { ".git", ".rumdl.toml" },
})

vim.lsp.config("rust-analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", "Cargo.toml", "Cargo.lock" },
})

vim.lsp.config("tombi", {
    cmd = { "tombi", "lsp" },
    filetypes = { "toml" },
    root_markers = { ".git", "pyproject.toml", "tombi.toml" },
})

vim.lsp.enable("bash-language-server")
vim.lsp.enable("biome")
vim.lsp.enable("clangd")
vim.lsp.enable("deno")
vim.lsp.enable("gopls")
vim.lsp.enable("lua-language-server")
vim.lsp.enable("rumdl")
vim.lsp.enable("rust-analyzer")
vim.lsp.enable("tombi")

local local_config = vim.fn.expand("~/.nvim.local")
if vim.uv.fs_stat(local_config) then
    local ok, err = pcall(dofile, local_config)
    if not ok then
        vim.notify(".nvim.local: " .. err, vim.log.levels.ERROR)
    end
end
