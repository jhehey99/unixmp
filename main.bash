#!/bin/bash

source ".app.conf"

main()
{
	Logger.Initialize
	Window.Initialize

	# hanggang i-stop ung application, mag show lng
	until [ $APPSTATE -eq $AppState_STOP ]; do
		Window.Show
	done

	Window.Close
}

main
exit $APPSTATUS
