var avisoModel = require("../models/avisoModel");

function listar(req, res) {
    var idCap = req.params.idCap;

    avisoModel.listar(idCap)
    .then(function (resultado) {
            res.status(200).json(resultado);
        
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os posts: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function listarPorUsuario(req, res) {
    var idUsuario = req.params.idUsuario;

    avisoModel.listarPorUsuario(idUsuario)
        .then(
            function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "Houve um erro ao buscar os posts: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function pesquisarDescricao(req, res) {
    var descricao = req.params.descricao;

    avisoModel.pesquisarDescricao(descricao)
        .then(
            function (resultado) {
                if (resultado.length > 0) {
                    res.status(200).json(resultado);
                } else {
                    res.status(204).send("Nenhum resultado encontrado!");
                }
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao buscar os posts: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function plotar(req, res) {
    avisoModel.plotar()
    .then(function (resultado) {
        res.json({
            Acao: resultado[0].gen,
            Ficcao: resultado[1].gen,
            Romance: resultado[2].gen,
            Terror: resultado[3].gen
        });
        
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os posts: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function plotarComent(req, res) {
    avisoModel.plotarComent()
    .then(function (resultado) {
        res.json({
            C1: resultado[0].num,
            C2: resultado[1].num,
            C3: resultado[2].num,
            C4: resultado[3].num,
            C5: resultado[4].num,
            C6: resultado[5].num,
            C7: resultado[6].num,
            C8: resultado[7].num,
            C9: resultado[8].num,
            C10: resultado[9].num,
            C11: resultado[10].num,
            C12: resultado[11].num,
            C13: resultado[12].num,
            C14: resultado[13].num,
            C15: resultado[14].num,
            C16: resultado[15].num,
            C17: resultado[16].num,
            C18: resultado[17].num,
            C19: resultado[18].num,
            C20: resultado[19].num,
            C21: resultado[20].num,
            C22: resultado[21].num,
            C23: resultado[22].num,
            C24: resultado[23].num,
            C25: resultado[24].num,
            C26: resultado[25].num,
            C27: resultado[26].num
        });
        
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os posts: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function publicar(req, res) {
    var titulo = req.body.titulo;
    var descricao = req.body.descricao;
    var idUsuario = req.params.idUsuario;
    var capitulo = req.body.capitulo;
    var id = req.body.id

    if (titulo == undefined) {
        res.status(400).send("O título está indefinido!");
    } else if (descricao == undefined) {
        res.status(400).send("A descrição está indefinido!");
    } else if (idUsuario == undefined) {
        res.status(403).send("O id do usuário está indefinido!");
    } else {
        avisoModel.publicar(titulo, descricao, idUsuario, capitulo, id)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            )
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function editar(req, res) {
    var novaDescricao = req.body.descricao;
    var idPost = req.params.idPost;

    avisoModel.editar(novaDescricao, idPost)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );

}

function deletar(req, res) {
    var idDiv = req.params.idDiv;
    var idCap = req.params.idCap;

    avisoModel.deletar(idDiv, idCap)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao deletar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    listar,
    listarPorUsuario,
    pesquisarDescricao,
    publicar,
    editar,
    deletar, 
    plotar,
    plotarComent
}