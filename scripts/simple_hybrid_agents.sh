#!/data/data/com.termux/files/usr/bin/bashlogfile=~/aikre8tive/logs/simple_hybrid_agents.log
echo "Sovereign Hybrid Build + Deploy Activated" | tee -a $logfile
echo "Mission started at $(date)" | tee -a $logfile

cd ~/aikre8tive/backend/agents

for agent_file in *.py; do
    [ -e "$agent_file" ] || continue
    agent_name="${agent_file%.py}"
    echo "Deploying persistent build for $agent_name" | tee -a $logfile
    nohup bash -c "
        while true
        do
            git pull
            pip install -r requirements.txt
            python3 \"$agent_file\"
            sleep 30
        done
    " >> ~/aikre8tive/logs/${agent_name}.log 2>&1 &
    echo \"$agent_name active.\" | tee -a $logfile
done

echo "All agents running with simplified build-deploy loop." | tee -a $logfile
