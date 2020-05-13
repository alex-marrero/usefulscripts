REM Simple Command to Unregister Device to Azure
REM AD Connect Syncs with Azure every 30 minutes
REM Next time Sync will force Device to Register


dsregcmd /leave


exit /b 0