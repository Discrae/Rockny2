import express, {type Response, type Request} from "express";
import HomepageController from "../controller/homepage_controller.js";

class HomePageRouter {
    // Propriétés
    private router = express.Router();

    // Méthode  
    public getRoutes = () => {
        this.router.get("/", new HomepageController().index);

        return this.router;
    };
}
export default HomePageRouter