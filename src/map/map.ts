import config from '../config'
import { map, tileLayer } from 'leaflet'
import { attribution } from './attribution/map-attribution'

export default function () {
    const initBounds = config.map.initial.boundaries
    const leaflet = map('map', {
        zoomControl: false,
        // zoom: false,
        // touchZoom: false,
        // scrollWheelZoom: false,
        // boxZoom: false,
        // keyboard: false,
    }).fitBounds([
        [initBounds.minLat, initBounds.minLon],
        [initBounds.maxLat, initBounds.maxLon],
    ])

    tileLayer(config.mapbox.url, {
        crossOrigin: true,
        attribution,
        // maxZoom: config.map.maxZoom,
        id: config.mapbox.layer,
        tileSize: config.mapbox.tileSize,
        zoomOffset: -1,
        accessToken: config.mapbox.token,
    }).addTo(leaflet)
}
