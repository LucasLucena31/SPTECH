var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/listar/:idCap", function (req, res) {
    avisoController.listar(req, res);
});

router.get("/plotar", function (req, res) {
    avisoController.plotar(req, res);
});

router.get("/plotarComent", function (req, res) {
    avisoController.plotarComent(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    avisoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    avisoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.put("/editar/:idAviso", function (req, res) {
    avisoController.editar(req, res);
});

router.delete("/deletar/:idDiv/:idCap", function (req, res) {
    avisoController.deletar(req, res);
});

module.exports = router;