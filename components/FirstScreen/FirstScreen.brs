sub Init()

    m.scene = m.top.getScene()

    ' m.textFlag = invalid

    m.top.observeField("visible", "onScreenVisibilityChange")
    m.main_background = m.top.findNode("main_background")

    m.BtnBack = m.top.findNode("BtnBack")
    m.Btnsetting = m.top.findNode("Btnsetting")
    m.BtnRetry = m.top.findNode("BtnRetry")

    m.ExitGroup = m.top.findNode("ExitGroup")
    m.Exitbackground = m.top.findNode("Exitbackground")
    m.ExitPopup = m.top.findNode("ExitPopup")
    m.BtnAppExit = m.top.findNode("BtnAppExit")
    m.BtnAppExitCancel = m.top.findNode("BtnAppExitCancel")

    m.BtnBack.observeField("buttonSelected", "onBackButtonSelected")
    m.Btnsetting.observeField("buttonSelected", "onSettingButtonSelected")
    m.BtnRetry.observeField("buttonSelected", "onRetryButtonSelected")
    m.BtnAppExit.observeField("buttonSelected", "CloseApp")
    m.BtnAppExitCancel.observeField("buttonSelected", "CloseExitPopup")

    m.BtnBack.setFocus(true)
end sub

sub onBackButtonSelected()

    m.ExitGroup.visible = true
    m.BtnAppExitCancel.setFocus(true)

end sub

sub onSettingButtonSelected()


end sub

sub onRetryButtonSelected()


end sub

sub CloseExitPopup()

    ?"onExitButtonClicked()"
    m.ExitGroup.visible = false
    m.BtnBack.setFocus(true)
end sub

sub CloseApp()
    ' m.top.close = true
    ' scene.appExit = true
    
end sub


function onKeyEvent(key as string, press as boolean) as boolean
    handled = false


    if press

        if key = "back"

            return true
        else if key = "right" and m.BtnBack.hasFocus()

            m.BtnBack.setFocus(false)
            m.Btnsetting.setFocus(true)

        else if key = "left" and m.BtnBack.hasFocus()

            m.BtnBack.setFocus(false)
            m.Btnsetting.setFocus(true)

        else if key = "down" and m.BtnBack.hasFocus()

            m.BtnBack.setFocus(false)
            m.BtnRetry.setFocus(true)

        else if key = "down" and m.Btnsetting.hasFocus()

            m.Btnsetting.setFocus(false)
            m.BtnRetry.setFocus(true)

        else if key = "up" and m.BtnRetry.hasFocus()

            m.BtnRetry.setFocus(false)
            m.BtnBack.setFocus(true)

        else if key = "left" and m.Btnsetting.hasFocus()

            m.Btnsetting.setFocus(false)
            m.BtnBack.setFocus(true)

        else if key = "right" and m.Btnsetting.hasFocus()

            m.Btnsetting.setFocus(false)
            m.BtnBack.setFocus(true)

        else if key = "back" and m.ExitGroup.visible = true

            m.ExitGroup.visible = false
            m.BtnBack.setFocus(true)

        else if key = "right" and m.BtnAppExitCancel.hasFocus()

            m.BtnAppExitCancel.setFocus(false)
            m.BtnAppExit.setFocus(true)

        else if key = "left" and m.BtnAppExit.hasFocus()

            m.BtnAppExit.setFocus(false)
            m.BtnAppExitCancel.setFocus(true)


        end if
    end if
    return handled
end function


