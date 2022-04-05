local M = {}

function M.get(cp)
    return {
        DiagnosticError = { fg = cp.red },
        DiagnosticWarning = { fg = cp.yellow },
        DiagnosticInformation = { fg = cp.blue },
        DiagnosticHint = { fg = cp.hint },
        LspFloatWinNormal = { bg = cp.black },
        LspFloatWinBorder = { fg = cp.magenta },
        LspSagaBorderTitle = { fg = cp.brightMagenta },
        LspSagaHoverBorder = { fg = cp.magenta },
        LspSagaRenameBorder = { fg = cp.magenta },
        LspSagaDefPreviewBorder = { fg = cp.magenta },
        LspSagaCodeActionBorder = { fg = cp.magenta },
        LspSagaFinderSelection = { fg = cp.xgray4 },
        LspSagaCodeActionTitle = { fg = cp.brightBlue },
        LspSagaCodeActionContent = { fg = cp.brightMagenta },
        LspSagaSignatureHelpBorder = { fg = cp.magenta },
        ReferencesCount = { fg = cp.magenta },
        DefinitionCount = { fg = cp.magenta },
        DefinitionIcon = { fg = cp.blue },
        ReferencesIcon = { fg = cp.blue },
        TargetWord = { fg = cp.brightMagenta },
    }
end

return M
