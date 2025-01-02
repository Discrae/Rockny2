import { RouterProvider } from "react-router";
import "./assets/css/reset.css";
import router from "./service/router";

function App() {
	return <RouterProvider router={router} />;
}

export default App;
