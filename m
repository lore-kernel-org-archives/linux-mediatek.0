From: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt76x0 bug report
Date: Wed, 19 Sep 2018 14:01:20 -0400
Message-ID: <CAM0KTbBxNoDyymefJXXn-4rrUfxg0+3nEZKsCjkzvuJ3+fY4KA@mail.gmail.com>
References: <CAJ0CqmXHHE2J5O4irPogrypL_H95EDm2y+1_6rpWG1v3ZHxzXA@mail.gmail.com>
 <CAM0KTbAF_ztZzFk_iECyPbiWY69xrcdT_93ypnuTzocjX_fRuQ@mail.gmail.com>
 <20180907082413.GC2725@localhost.localdomain> <CAM0KTbAputKNN3seOfN-1zhz5XmT6yg_pbKBnapOsR6Vigv1XQ@mail.gmail.com>
 <CAM0KTbAu-LJ2ThAHbmbrggMw_ttpQ8fXr0+HTjGBZF6PBPiD8Q@mail.gmail.com>
 <CAJ0CqmUDT44W7sb4qpmt6mPDZ5LwUDPgKCrhor_8POWpx_RaQA@mail.gmail.com>
 <CAM0KTbDb4X7JZgYZa6-NmjD72_UHOqQ43Czv=HwWS3D0WcWrgQ@mail.gmail.com>
 <CAM0KTbA0QE-5oTz-aeU9zmnCS-LrYZmHwmEv0afjR0yFWvTevA@mail.gmail.com>
 <20180918115616.GC15285@redhat.com> <CAM0KTbDq7v6phbr72LXEoYzu9iQ9L-MN85Zzn5Oz9kGsuVCV_Q@mail.gmail.com>
 <20180919111525.GD22689@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180919111525.GD22689-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dcaratti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Sep 19, 2018 at 7:15 AM Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
>
> On Tue, Sep 18, 2018 at 01:36:51PM -0400, Sid Hayn wrote:
> > On Tue, Sep 18, 2018 at 7:56 AM Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=
 wrote:
> > >
> > > On Mon, Sep 17, 2018 at 11:18:57PM -0400, Sid Hayn wrote:
> > > > Sorry to bump the one thing that we both agreed was low priority bu=
t....
> > > >
> > > > So was testing all of my dongles that use the driver you are workin=
g
> > > > on, and running them through my connect scripts.  I moved the AP to
> > > > maybe <5ft from the clients and something wierd happened.  The t1u
> > > > tried to connect to one of the 2.4GHz only networks.  It failed, bu=
t
> > > > it actually got enough scan data back to attempt authentication wit=
h a
> > > > valid 2.4GHz only bssid.  Which means in short, that the eeprom isn=
't
> > > > lying and your parsing of it is correct.  Something obviously makes
> > > > this a 5GHz only device, as the connection failed and most of the t=
ime
> > > > nothing at all is seen on 2.4GHz, but clearly it's some filter or
> > > > antenna or some other mechanism which makes it 5GHz only.  So proba=
bly
> > > > hardware lying to you is now even lower on your list since this saf=
ely
> > > > rules out the driver parsing the eeprom incorrectly.
> > >
> > > First of all would be good to check if problem is not already solved,
> > > latest version of the driver can be found here:
> > > https://github.com/nbd168/wireless
> >
> > Booting that kernel gets me instant to near instant kernel panics, so
> > I am unable to test much.
>
> This has to be fixed as well, can you provide kernel messages ?
Working on it, please stand by.
>
> > > Second, is there vendor driver available for this particular device?
> > > Perhaps there are some tweeks needed that are not provided by generic
> > > driver.
> >
> > No clue, haven't even tried to look.  This hardware was all sitting on
> > a shelf till it looked like a real driver was being merged into the
> > kernel.... so um, thanks :-)
>
> Why do you think device is 5GHz only? This is very unusual. I know
> only single-band 2.4GHz or dual-band 2.4GHz & 5GHz devices.

https://www.tp-link.com/us/faq-2253.html
"Note: Before you do these troubleshooting, please kindly check
whether the adapter you use is Archer T1U. For this model, it only
supports 5GHz network. So if the router you use only provides 2.4GHz
network, =E2=80=98you can=E2=80=99t find the 5GHz network any more."

Yup, I agree, it's wierd.

-Zero

>
> Regards
> Stanislaw
