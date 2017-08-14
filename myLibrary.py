import requests
import json

base_url = 'https://maps.googleapis.com/maps/api/geocode/json?'

def search_place(search_string):
    search_payload = {'address' : search_string}
    #uri = base_url + urllib.parse.urlencode(search_payload)
    resp = requests.get(base_url, params = search_payload)
    return resp

def get_status_code(search_string):
    resp = search_place(search_string)
    status = resp.status_code
    print 'Response Status Code:', status# 200
    return str(status)

def get_status(search_string):
    resp = search_place(search_string)
    resp_json = resp.json()
    json_status = resp_json['status']
    print 'Response Status:', json_status
    return json_status

def get_address(search_string):
    resp = search_place(search_string)
    resp_json = resp.json()
    json_status = resp_json['status']
    if json_status == "OK":
        res = resp_json['results']
        address = res[0]['formatted_address']
        print 'address:', address
        return address
    else:
        return None

def get_place_id(search_string):
    resp = search_place(search_string)
    resp_json = resp.json()
    json_status = resp_json['status']
    if json_status == "OK":
        res = resp_json['results']
        place_id = res[0]['place_id']
        print 'place_id:', place_id
        return place_id
    else:
        return None

get_status('95117')


# get_place_id('95117')
# place_id: ChIJ4YcqPMHKj4AR_oe_L8U_ojs

# get_address('95117')
# Response Status: OK
# address: San Jose, CA 95117, USA