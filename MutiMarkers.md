## Sqlite 多筆地址移入googlemap


<img src="https://upload.cc/i1/2020/12/29/hV31vq.png" style="zoom:70%" />


### Step1. 在dbmanager建立一個function return 需要用到的字串.(字串拿去做listview了,依自己的需求改成陣列)
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
            locationRows += cursor.getString(5)+","; //Address
            cursor.moveToNext();
        }
        if (cursor != null && !cursor.isClosed())
        {
            cursor.close();
        }
        return locationRows;
    }  
    
      public String retrieveRows_Firend_fn()
    {
        String nameRows = "";
        String[] columns = new String[] {"Friend", "FirstName", "LastName","Gender","Age","Address", "Image"};
        Cursor cursor = db.query(DB_TABLE, columns, null, null, null, null, null);
        cursor.moveToFirst();
        while (cursor.isAfterLast() == false)
        {
            nameRows += cursor.getString(1)+","; // FirstName
            cursor.moveToNext();
        }
        if (cursor != null && !cursor.isClosed())
        {
            cursor.close();
        }
        return nameRows;
    }
    public String retrieveRows_Firend_ln()
    {
        String nameRows = "";
        String[] columns = new String[] {"Friend", "FirstName", "LastName","Gender","Age","Address", "Image"};
        Cursor cursor = db.query(DB_TABLE, columns, null, null, null, null, null);
        cursor.moveToFirst();
        while (cursor.isAfterLast() == false)
        {
            nameRows += cursor.getString(2)+","; // LastName
            cursor.moveToNext();
        }
        if (cursor != null && !cursor.isClosed())
        {
            cursor.close();
        }
        return nameRows;
    }
```
### Step2. googlemap.java 將字串改成陣列

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
#### Needed functions: Geocoder, MarkerOptions
```java

public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        List<Address> addressList = null;
        MarkerOptions markerOptions = new MarkerOptions ();

        LatLng sydney = new LatLng (-33.89440695735913,151.20481783518255); // default location

                Geocoder geocoder = new Geocoder (this);

                try
                {
                    for (int i = 0; i<address.length; i++){

                        addressList = geocoder.getFromLocationName (address[i],6); //這個6指getFromLocationName傳出來的東西 像是getlongitude(),getLatitude()


                        if (addressList != null){

                            for (int k = 0 ; k < addressList.size (); k++)
                            {
                                Address userAddress = addressList.get (k);
                                LatLng latLng = new LatLng (userAddress.getLatitude (), userAddress.getLongitude ());

                                markerOptions.position (latLng);
                                markerOptions.title (fn[i]+", "+ln[i]);
                                markerOptions.icon (BitmapDescriptorFactory.defaultMarker (BitmapDescriptorFactory.HUE_AZURE));

                                mMap.addMarker (markerOptions);
                                mMap.moveCamera (CameraUpdateFactory.newLatLng (sydney)); //雖然不影響,但是應該不用放在迴圈裏面
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
    
    

    
    
    

