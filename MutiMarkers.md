## Sqlite 多筆地址移入googlemap


<img src="https://upload.cc/i1/2020/12/29/hV31vq.png" style="zoom:70%" />


### Step1. 在dbmanager建立一個function return locationRows字串.()
#### return例子:"newtown,chippendale,148 crown NSW..."
```java
  public String retrieveRows_Firend_Location()
    {
        String locationRows = "";
        String[] columns = new String[] {"Friend", "FirstName", "LastName","Gender","Age","Address", "Image"};
        Cursor cursor = db.query(DB_TABLE, columns, null, null, null, null, null);
        cursor.moveToFirst();
        while (cursor.isAfterLast() == false)
        {
            locationRows += cursor.getString(5)+","; //todo_loaction
            cursor.moveToNext();
        }
        if (cursor != null && !cursor.isClosed())
        {
            cursor.close();
        }
        return locationRows;
    }  
```
### Step2. googlemap.java 

```java

public class    googlemap extends FragmentActivity implements OnMapReadyCallback {


pprivate DatabaseManager db;
private GoogleMap mMap;
public String[] address,fn,ln;

protected void onCreate(Bundle savedInstanceState) {
        super.onCreate (savedInstanceState);
        setContentView (R.layout.activity_address_f);
        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager ()
                .findFragmentById (R.id.fmap);
                
        DatabaseManager db = new DatabaseManager(googlemap.this);
        
        String adrsRows = db.retrieveRows_Firend_Location();
        address = adrsRows.split (","); //改成arr[]

        String fnRows = db.retrieveRows_Firend_fn ();
        fn = fnRows.split (","); //改成arr[]

        String lnRows = db.retrieveRows_Firend_ln ();
        ln = lnRows.split (","); //改成arr[]
                
        }

```

### Step3. googlemap.java 的 onMapReady
```java

public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        // Add a marker in Sydney and move the camera

        mMap.setMapStyle(
                MapStyleOptions.loadRawResourceStyle(
                        this, R.raw.style_json));


        List<Address> addressList = null;
        MarkerOptions markerOptions = new MarkerOptions ();

        LatLng sydney = new LatLng (-33.89440695735913,151.20481783518255);

                Geocoder geocoder = new Geocoder (this);

                try
                {
                    for (int i = 0; i<address.length; i++){

                        addressList = geocoder.getFromLocationName (address[i],6); //這個六是指getFromLocationName的東西 像是getlongitude(),getLatitude()


                        if (addressList != null){

                            for (int k = 0 ; k < addressList.size (); k++)
                            {
                                Address userAddress = addressList.get (k);
                                LatLng latLng = new LatLng (userAddress.getLatitude (), userAddress.getLongitude ());

                                markerOptions.position (latLng);
                                markerOptions.title (fn[i]+", "+ln[i]);
                                markerOptions.icon (BitmapDescriptorFactory.defaultMarker (BitmapDescriptorFactory.HUE_AZURE));

                                mMap.addMarker (markerOptions);
                                mMap.moveCamera (CameraUpdateFactory.newLatLng (sydney));
                                mMap.animateCamera(CameraUpdateFactory.zoomTo(11));

                            }
                        }
                    }
                }
                catch (IOException e)

                {
                    e.printStackTrace ();
                }

        }
    }
```
    
    

    
    
    

