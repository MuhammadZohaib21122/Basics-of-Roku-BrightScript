sub Init()

    m.top.backgroundColor = "#1B1927"
    startDeeplink()
end sub

function startDeeplink()
    args = m.top.launchArgs
    ShowFirstScreen()
end function

function OnKeyEvent(key as string, press as boolean) as boolean
    result = false
    if press
        ' handle "back" key press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if

    return result
end function


function customSuspend(arg as dynamic)
    for each key in arg
        m.top.exitApp = true
    end for
end function
sub CloseScreen(node as object)
    if node = invalid or (m.screenStack.Peek() <> invalid and m.screenStack.Peek().IsSameNode(node))
        last = m.screenStack.Pop() ' remove screen from screenStack
        last.visible = false ' hide screen
        m.top.RemoveChild(last)
        ' take previous screen and make it visible
        prev = m.screenStack.Peek()
        if prev <> invalid
            prev.visible = true
            prev.SetFocus(true)
        end if
    end if
end sub