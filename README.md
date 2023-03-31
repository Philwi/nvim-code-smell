# NVIM-CODE-SMELL - Tooling for better code quality

This is my first plugin for neovim. It is a wrapper for existing code smell tools like reek for ruby.
It takes the output from these tools, adapting and displays it inside neovim.

## Installation

### lazy

```lua
return {
  "philwi/nvim-code-smell",
  config = function()
    require("nvim-code-smell").setup()
  end
}
```

## Configuration

```lua
{
  smell_finders = {
    "reek"
  },
  outputs = {
    "buffer",
    "quickfix"
  }
}
```

### Sample Configuration

```lua
return {
  "philwi/nvim-code-smell",
  config = function()
    require("nvim-code-smell").setup({
      outputs = {
        "buffer",
      }
    })
  end
}
```

## Usage

* `RunDiagnostic` to run the code smell check for the current file
