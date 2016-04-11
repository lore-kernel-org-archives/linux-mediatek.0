From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: core: buffer: avoid NULL pointer dereferrence
Date: Mon, 11 Apr 2016 11:24:22 +0300
Message-ID: <87y48ko8nd.fsf@intel.com>
References: <1460106483-24793-1-git-send-email-chunfeng.yun@mediatek.com> <20160408140701.GA3547@kroah.com> <1460343705.10419.12.camel@mhfsdcap03> <87shyspwbz.fsf@intel.com> <1460358968.10419.26.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460358968.10419.26.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
>> > On Fri, 2016-04-08 at 07:07 -0700, Greg Kroah-Hartman wrote:
>> >> On Fri, Apr 08, 2016 at 05:08:03PM +0800, Chunfeng Yun wrote:
>> >> > NULL pointer dereferrence will happen when class driver
>> >> > wants to allocate zero length buffer and pool_max[0]
>> >> > can't be used, so skip reserved pool in this case.
>> >>=20
>> >> Why would a driver want to allocate a 0 length buffer?  What driver d=
oes
>> >> this?
>> > It's misc/usbtest.c
>>=20
>> that'll do what you ask it to do with the userspace tool testusb. Are
>> you trying to pass a size of 0 ?
>>=20
> No, I just ran "testusb -t10" which called test_ctrl_queue().
> In this function, sub-case 8 passed a parameter @len as 0 to
> simple_alloc_urb(), and then it tried to allocate a 0-length buffer.

odd, I have never seen this problem running testusb with the same
arguments.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXC182AAoJEIaOsuA1yqREIRcP/14TqylKGQ0vf80Xt3j/gxaX
5Nus+jaHazLF23QOsNzIRL8Sg3YUTOIzLdehwYZdMtq4dcvM6p6Knc4wcgOoAxnP
5gV/qPqnoYvaXmmP4M543tqexfz4rBmbnH6n1QxVcPQW4yiZBWrd8LUgfxOfThD4
4OgDsZyCBjRuEbho8ewZYuN9l4jhkU1eD0mY9DLlQ1KIAxRI14kRMCNdxpJ+XCDQ
+TmMc9mMPNe7BirCR+VtKww8JTobq6bD0yP3kZq2xyjRk+yV+tlwd9OPSwbpdAmf
tpF1ZxJhu5XWMMI55BT9Fv9w7CAGZUJ3482UMBnMobesj2bBK4IWkdjpqRe5bk52
Ad8UV/KkLlMUUt8V2uhxQ4JtzVJuZ2kOK62I8UUCdY3V5iJzsrZnus5xdKylqCTs
ilX9Wynnxa1KLQ2iF+RoRv1lOnqSTrurP3IAQJP65YvJ9TXiGMhHt6gVJB+sPJQU
JkO3zYclj7NDHWlUv8ilmQDF4stQn0HqCmS16iGSkQ1Dzqw7Q5+n4fQLqvfmLRwZ
qEFZRSrJKpQB3giqTZC0mJnWP0roXENFHor7tGm+eP4scFLPlAXiCkIupfHIks4H
2nwx7o939u0izVUg7ooqPSUKPhCsrf2EugRazdWIqZec8AwrSGyr3v6epyiBYcJE
Gr6HBWB00oVF1FhvYZcz
=OkB2
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
