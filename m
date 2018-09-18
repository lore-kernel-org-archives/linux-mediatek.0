From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x0 bug report
Date: Tue, 18 Sep 2018 13:56:17 +0200
Message-ID: <20180918115616.GC15285@redhat.com>
References: <20180906093213.GB16539@redhat.com>
 <CAM0KTbBRGqNAu1H0myVoWg6Qu1aMXMneSJ7bXQUKbJGZUFkC_A@mail.gmail.com>
 <CAJ0CqmXHHE2J5O4irPogrypL_H95EDm2y+1_6rpWG1v3ZHxzXA@mail.gmail.com>
 <CAM0KTbAF_ztZzFk_iECyPbiWY69xrcdT_93ypnuTzocjX_fRuQ@mail.gmail.com>
 <20180907082413.GC2725@localhost.localdomain>
 <CAM0KTbAputKNN3seOfN-1zhz5XmT6yg_pbKBnapOsR6Vigv1XQ@mail.gmail.com>
 <CAM0KTbAu-LJ2ThAHbmbrggMw_ttpQ8fXr0+HTjGBZF6PBPiD8Q@mail.gmail.com>
 <CAJ0CqmUDT44W7sb4qpmt6mPDZ5LwUDPgKCrhor_8POWpx_RaQA@mail.gmail.com>
 <CAM0KTbDb4X7JZgYZa6-NmjD72_UHOqQ43Czv=HwWS3D0WcWrgQ@mail.gmail.com>
 <CAM0KTbA0QE-5oTz-aeU9zmnCS-LrYZmHwmEv0afjR0yFWvTevA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAM0KTbA0QE-5oTz-aeU9zmnCS-LrYZmHwmEv0afjR0yFWvTevA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dcaratti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Sep 17, 2018 at 11:18:57PM -0400, Sid Hayn wrote:
> Sorry to bump the one thing that we both agreed was low priority but....
> 
> So was testing all of my dongles that use the driver you are working
> on, and running them through my connect scripts.  I moved the AP to
> maybe <5ft from the clients and something wierd happened.  The t1u
> tried to connect to one of the 2.4GHz only networks.  It failed, but
> it actually got enough scan data back to attempt authentication with a
> valid 2.4GHz only bssid.  Which means in short, that the eeprom isn't
> lying and your parsing of it is correct.  Something obviously makes
> this a 5GHz only device, as the connection failed and most of the time
> nothing at all is seen on 2.4GHz, but clearly it's some filter or
> antenna or some other mechanism which makes it 5GHz only.  So probably
> hardware lying to you is now even lower on your list since this safely
> rules out the driver parsing the eeprom incorrectly.

First of all would be good to check if problem is not already solved,
latest version of the driver can be found here:
https://github.com/nbd168/wireless

Second, is there vendor driver available for this particular device?
Perhaps there are some tweeks needed that are not provided by generic
driver.

Thanks
Stanislaw 
