package oto;
import org.jboss.logging.Logger;

import io.quarkus.logging.Log;
import io.quarkus.runtime.StartupEvent;
import io.quarkus.vertx.web.RouteFilter;
import io.vertx.ext.web.RoutingContext;
import jakarta.enterprise.context.control.ActivateRequestContext;
import jakarta.enterprise.event.Observes;

public class LoggingFilter {
    @RouteFilter(999)
    @ActivateRequestContext
    void filter(RoutingContext routingContext) {
        var request = routingContext.request();
        var method = request.method().name();
        var uri = request.uri();
        var clientIP = request.remoteAddress().hostAddress();
        Log.infof("%s %s from %s", method, uri, clientIP);
    }
}