import { Outlet } from "react-router";
import Footer from "../component/common/Footer";
import Header from "../component/common/Header";

const BaseLayout = () => {
	return (
		<>
			<Header />
			<Outlet />
			<Footer />
		</>
	);
};

export default BaseLayout;
