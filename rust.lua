return {
	-- Control flow:

	s({ trig = "for", dscr = "`for _ in _` loop", priority = 5000 }, {
		t({ "for " }),
		i(1, "pat"),
		t({ " in " }),
		i(2, "expr"),
		t({ " {", "\t" }),
		i(0),
		t({ "todo!();" }),
		t({ "", "}" }),
	}),

	s("if", {
		t({ "if " }),
		i(1, "expr"),
		t({ " {", "\t" }),
		i(0),
		t({ "todo!();" }),
		t({ "", "}" }),
	}),

	s("else", {
		t({ "else {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	s("ifelse", {
		t({ "if " }),
		i(1, "expr"),
		t({ " {", "\t" }),
		i(0),
		t({ "todo!();" }),
		t({ "", "} else {", "\t" }),
		i(0),
		t({ "todo!();" }),
		t({ "", "}" }),
	}),

	s({ trig = "match", dscr = "`match` with two matching arms." }, {
		t({ "match " }),
		i(1, "expr"),
		t({ " {", "\t" }),
		i(2, "Some(expr)"),
		t({ " => " }),
		i(3, "expr"),
		t({ ",", "\t" }),
		i(4, "None"),
		t({ " => " }),
		i(4, "expr"),
		t({ ",", "" }),
		t({ "}" }),
	}),

	-- Custom Types:

	s({ trig = "struct", dscr = "Classic `struct` that implements `std::fmt::Debug`" }, {
		t({ "#[derive(Debug)]", "" }),
		t({ "struct " }),
		i(1, "Name"),
		t({ " {", "\t" }),
		i(0),
		t({ "", "" }),
		t({ "}", "" }),
	}),

	s("string", t('String::from("");')),

	-- Derives:

	s("deadcode", t("#[allow(dead_code)]")),
	s("debug", t("#[derive(Debug)]")),
	s("deserialize", t("#[derive(Deserialize)]")),
	s("serialize", t("#[derive(Serialize)]")),

	-- Actix_web:

	s({ trig = "get", dscr = 'Implements get("/...") method' }, {
		t({ '#[get("/' }),
		i(1, "path"),
		t({ '")]', "" }),
		t({ "async fn " }),
		i(2, "path"),
		t({ "() -> impl Responder {", "\t" }),
		i(0),
		t({ "HttpResponse::Ok()", "" }),
		t({ "}", "" }),
	}),

	s({ trig = "post", dscr = 'Implements post("/...") method' }, {
		t({ '#[post("/' }),
		i(1, "path"),
		t({ '")]', "" }),
		t({ "async fn " }),
		i(2, "path"),
		t({ "() -> impl Responder {", "\t" }),
		i(0),
		t({ "HttpResponse::Ok()", "" }),
		t({ "}", "" }),
	}),

	-- Formatted print:

	s({ trig = "format", dscr = '`format!("Some text {:?}", arg)`\nFormat `String` with outside args' }, {
		t({ 'format!("' }),
		i(1),
		t({ " {" }),
		t({ ':?}", ' }),
		i(0, "args"),
		t({ ");" }),
	}),
}
