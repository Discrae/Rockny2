import express, {type Response, type Request} from "express";
import UserController from "../controller/user_controller.js";

class UserRouter {
    // Propriétés
    private router = express.Router();

    // Méthode  
    public getRoutes = () => {
        this.router.get("/", new UserController().index);

        // Créer une variable de route en la préfixant d'un --> :
        this.router.get("/:id", new UserController().one)

        return this.router;
    };
}
export default UserRouter