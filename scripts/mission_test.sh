#!/data/data/com.termux/files/usr/bin/bash
echo "== Initiating Planetary Agent Mission Test =="
cd
set +H
# example
cat > ~/aikre8tive/scripts/mission_test.sh <<EOF
#!/data/data/com.termux/files/usr/bin/bash
echo "== Initiating Planetary Agent Mission Test =="
cd ~/aikre8tive/backend/agents
for agent_file in *.py; do
    echo "-----------------------------------------------"
    echo "Launching: $agent_file"
    python $agent_file
    echo "-----------------------------------------------"
done
echo "== All agents have been compiled and tested =="
