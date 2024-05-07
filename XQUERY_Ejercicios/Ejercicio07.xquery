<html>
    <head>
        <title>Superhéroes de Marvel</title>
    </head>
    <body> {
        for $superheroe in doc('superheroes.xml')/marvel/superheroe
        let $nombre := $superheroe/@nombre
        let $poderes := $superheroe/@poderes
        let $amigos := $superheroe/@amigos
        let $nivel := $superheroe/@nivel
        
        return
            <table border="1" align="center" width="100%" style="margin: 33px;">
                <tr style="background-color: lightblue;">
                    <td>Nombre</td>
                    <td>Poderes</td>
                    <td>Amigos</td>
                    <td>Nivel</td>
                </tr>
                <tr>
                    <td>{data($nombre)}</td>
                    <td>{data($poderes)}</td>
                    <td>{data($amigos)}</td>
                    <td>{data($nivel)}</td>
                </tr>
            </table>
        
    } </body>

</html>