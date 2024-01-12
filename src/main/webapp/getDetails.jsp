<%@page import="java.net.*"%>
<%@page import="java.net.http.*"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.*"%>
<%
    String inputText = request.getParameter("input");
    HttpRequest request1 = HttpRequest.newBuilder()
    		.uri(URI.create("https://open-ai21.p.rapidapi.com/conversationgpt35"))
    		.header("content-type", "application/json")
    		.header("X-RapidAPI-Key", "USE YOUR OWN API KEY")
    		.header("X-RapidAPI-Host", "open-ai21.p.rapidapi.com")
            .method("POST", HttpRequest.BodyPublishers.ofString("{\r\n    \"messages\": [\r\n        {\r\n            \"role\": \"user\",\r\n            \"content\": \""+inputText+"\"\r\n        }\r\n    ]\r\n}"))
            .build();
    HttpResponse<String> response1 = null;
    try {
        response1 = HttpClient.newHttpClient().send(request1, HttpResponse.BodyHandlers.ofString());
    } catch (IOException | InterruptedException e) {
        throw new RuntimeException(e);
    }
    String outputJSON = response1.body();

    JSONObject jsonObject = new JSONObject(outputJSON);
    String data = jsonObject.getString("result");
    out.println("TELEMEDBOT:\n"+data);
%>