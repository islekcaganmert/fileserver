from bevyframe import Response, Context


def get(context: Context) -> Response:
    return context.create_response('500 Internal Server Error', headers={'Content-Type': 'text/plain'})
