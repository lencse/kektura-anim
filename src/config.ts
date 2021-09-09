export default {
    map: {
        initial: {
            boundaries: {
                minLat: 45.7784476,
                minLon: 16.1653928,
                maxLat: 48.560605,
                maxLon: 22.8617631,
            }
        },
        maxZoom: 32,
    },
    mapbox: {
        token: String(process.env["MAPBOX_TOKEN"]),
        layer: 'mapbox/outdoors-v11',
        tileSize: 512,
        url: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
    },
}
