-- Mason core.
return {
  'williamboman/mason.nvim',
  cmd = { 'Mason', 'MasonInstall', 'MasonUninstall' },
  build = ':MasonUpdate',

  opts = {
    ensure_installed = {}, -- dynamically extended
    ui = {
      icons = { package_installed = '✓', package_pending = '➜', package_uninstalled = '✗' },
    },
  },

  config = function(_, opts)
    local mason = require 'mason'
    local registry = require 'mason-registry'

    mason.setup(opts)

    local function ensure()
      for _, tool in ipairs(opts.ensure_installed) do
        local pkg = registry.get_package(tool)
        if not pkg:is_installed() then
          pkg:install()
        end
      end
    end

    if registry.refresh then
      registry.refresh(ensure)
    else
      ensure()
    end
  end,
}
