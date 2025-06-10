<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post" name="plano" action="">
        <label>Plano</label>
            <input type="text" name="nome_plano" maxlength="50" required>
        <label>Descrição</label>
            <input type="text" name="descricao" maxlength="200" required>
        <label>Valor</label>
            <input type="number" name="Valor" required>
            
        <div>
            <label>Cobertura Roubo</label>
            <input type="radio" name="cobertura_roubo" value="1"> Sim
            <input type="radio" name="cobertura_roubo" value="0" checked> Não
        </div>

        <div>
            <label>Cobertura Danos</label>
            <input type="radio" name="cobertura_danos" value="1"> Sim
            <input type="radio" name="cobertura_danos" value="0" checked> Não
        </div>

        <div>
            <label>Cobertura Reposição</label>
            <input type="radio" name="cobertura_reposicao" value="1"> Sim
            <input type="radio" name="cobertura_reposicao" value="0" checked> Não
        </div>

        <div>
            <label>Cobertura Internacional</label>
            <input type="radio" name="cobertura_internacional" value="1"> Sim
            <input type="radio" name="cobertura_internacional" value="0" checked> Não
        </div>

        <button type="submit">Enviar</button>
    </form>
</body>
</html>
