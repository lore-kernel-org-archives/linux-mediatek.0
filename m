From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH v2] staging: mt7621-eth: Fix sparse warning in ethtool.c
Date: Tue, 03 Apr 2018 08:39:55 +1000
Message-ID: <87efjx1bd0.fsf@notabene.neil.brown.name>
References: <20180329095637.GA16778@kroah.com> <20180329124745.24694-1-cmc@babblebit.net> <87vada1owt.fsf@notabene.neil.brown.name> <1522638255.18424.44.camel@mtkswgap22> <87po3i1dhu.fsf@notabene.neil.brown.name> <20180402114103.GA29354@demeter.lkamp.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180402114103.GA29354@demeter.lkamp.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian =?utf-8?Q?L=C3=BCtke-Stetzkamp?= <christian@lkamp.de>
Cc: Sean Wang <sean.wang@mediatek.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chris Coffey <cmc@babblebit.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 02 2018, Christian L=C3=BCtke-Stetzkamp wrote:

> On Mon, Apr 02, 2018 at 01:41:33PM +1000, NeilBrown wrote:
>> On Mon, Apr 02 2018, Sean Wang wrote:
>> > Hi, Neil
>> >
>> > Forgive me I cannot find the cover letter in the original series in my
>> > mailbox to make a reply, so I rudely made here just letting you know
>> > something good to the growth of mt7621 support in upstream.
>> >
>> > If so, it would become a bit easier for me that maybe I could give a
>> > hand for migrating these staging driver for mt7621 to mainline. I
>> > thought mmc, pci, ethernet, gsw and hsdma all could probably reuse the
>> > current mainline code.
>>=20
>> I agree that it is quite likely that several of these drivers could and
>> should reuse current mainline code.  I would love to have some help
>> sorting this out.  I won't have much time myself to dig into it for
>> several weeks, but I'll make time to review and test any code that is
>> contributed.
>>=20
>> Thanks,
>> NeilBrown
>
> Hi,
>
> I have started a patch series for the mmc driver that is currently in
> staging, that makes some of the first cleanups (whitespace, indent,..)
> and also starts to clean up the code, to make the similarities and
> differences to the current mainline code clearer. The series is far
> from being complete, but I think I'm going to send it out today, so
> you can look and comment.
>
> I would suggest that we continue cleaning the code that is currently
> in staging to remove the dead parts and make the diff to the mainline
> code obvious. Do you agree with that proposal or do you suggest a
> different plan?

I think this is an excellent plan - thanks for doing it.
I'll hopefully look over your patches today and send any comments.

Thanks,
NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlrCsTsACgkQOeye3VZi
gbnWZBAAgM+nDheq63eqsAz9aPkevInjx3b4v591NkaKQ7TwjZhonCYMOBZaz9LV
gRQ3i6ybs+muzGOe1BkaRjZDQJ3EP4GJ6jm4d6IUwu0SXNqa0qcyDa3Z/QmeYGb+
0BkGJFqf1jYtsgt5VeLLZdhsoR3GyzwLaWCGxOlwhnbT+8Xm4+97t18AzQjHMmER
vJjY8BnfoaZM9FGosDd/VeFqtaPg91LhHMzdb/AXBP5d/K5vF6HugSIjsLCOwsR4
HxoqM83IehvEozmDIjfSVuqLanaP03VylBDTdFjy4N/ATkUriNOG8M/Bt6ForbWS
JNuWtl7jtOFEkD/5v5rK1x0RfJtt/AOAFnGVKTrH7nrswW407pf//6lU/Wmdb8jN
gADYgnPp/Pz9CkKmLy/yKO9Q3Y+j8v36bhc4mEMrZfcRKL3m6C6oFAhzS2ZJ0Ktg
M6/LgZeExXGiNbeaSCUbg5+8XJqn5jgRN4MWY/YGNx3nH/lqr29ou5GVTLShQub3
ZsJEjMdQmqi0W4P6/ZKkTLh2AdoPos/PYATgfg2Ls8ov7BpTugAKJAkFP7LHBQDz
vKp+wpVXh17Y/OhlhDu6yoyqh/irdGQk+T0tfWF4BaJI1RNIGBaaVPt2J4jHqKlZ
Ac75L70vuGRVYw7B3jsZx7IjOwFFk1FKiz///GUbPSuIC7OYEKg=
=F9Ie
-----END PGP SIGNATURE-----
--=-=-=--
