<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="sweetalert2.min.css">  
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.6/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.6/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="style.css">
    <title>Mi namora</title>
</head>
<body>  
       <div class="d-flex justify-content-center align-items-center vh-100">
  <div>
    <h1 class="text-center texto">Aceitas namorar cmg?</h1>
    <br>
    <br>
    <div class="text-center">
        <button onclick="aceitar()"id="aceitar" class="btn btn-light btn-md">Sim</button>
        <button onmouseenter="fugir()" id="fugir" class="btn btn-light btn-md">Não</button>
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.2.2/dist/canvas-confetti.min.js"></script>


<script>

function fugir(){
    const botao = document.getElementById("fugir");
    const x = Math.floor(Math.random() * window.innerWidth);
    const y = Math.floor(Math.random() * window.innerHeight);
    botao.style.top = y + "px";
    botao.style.left = x + "px";

}
        function aceitar(){
            Swal.fire({
            icon: 'success',
            title: 'Te amo',
            text:'Agora vc namora oficialmente', 
    
        })
        }

</script>
</body>
</html>