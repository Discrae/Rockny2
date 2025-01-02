import http from "node:http";
import express, { type Router, type Express, type Request, type Response } from "express";
import HomePageRouter from "../router/homepage_router.js";
import RoleRouter from "../router/role_router.js";
import UserRouter from "../router/user_router.js";
import NotFoundRouter from "../router/notfound_router.js";


class Server {

    // Instancier une application Express
private app: Express = express();

    // Définir un routeur pour Express
private router: Router = express.Router();
constructor() {

    // Lier l'application Express au routeur
this.app.use(this.router);

    // Définir la liste des routeurs
this.getRoutersList();
}
    
// Méthodes | Liste des routeurs
    private getRoutersList = (): void => {
        // Préfixe à toutes les routes d'un routeur
        this.router.use('/', new HomePageRouter().getRoutes());

        this.router.use('/user', new UserRouter().getRoutes());

        this.router.use('/role', new RoleRouter().getRoutes());
   
        // Routeur des routes inexistantes doit être obligatoirement en dernière position
        this.router.use('*', new NotFoundRouter().getRoutes());
    };

// Créer un serveur Node.js / Express
public createServer = (): http.Server => {
return http.createServer(this.app);
};
}

export default Server;