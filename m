From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: core: buffer: avoid NULL pointer dereferrence
Date: Mon, 11 Apr 2016 08:07:28 +0300
Message-ID: <87shyspwbz.fsf@intel.com>
References: <1460106483-24793-1-git-send-email-chunfeng.yun@mediatek.com> <20160408140701.GA3547@kroah.com> <1460343705.10419.12.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460343705.10419.12.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> On Fri, 2016-04-08 at 07:07 -0700, Greg Kroah-Hartman wrote:
>> On Fri, Apr 08, 2016 at 05:08:03PM +0800, Chunfeng Yun wrote:
>> > NULL pointer dereferrence will happen when class driver
>> > wants to allocate zero length buffer and pool_max[0]
>> > can't be used, so skip reserved pool in this case.
>>=20
>> Why would a driver want to allocate a 0 length buffer?  What driver does
>> this?
> It's misc/usbtest.c

that'll do what you ask it to do with the userspace tool testusb. Are
you trying to pass a size of 0 ?

>> Shouldn't we fix that issue instead?
> I don't know which way is better, but it seems simple to fix it up in
> buffer.c=20

I think we should, really, avoid a 0-length allocation, but passing a
size of 0 to testusb isn't very good either ;-) How are you calling
testusb ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXCzERAAoJEIaOsuA1yqRESLEP/2sYgXArkny8AZmdvDEp2tfl
9NNoU/MG1fiKqesBtgj03YSe3OIpMvC/xowEQBELS6VH6F4nEwphPNo3tuxs1PqJ
EXqIvk12aW1RcIdcG6aebE9WT8SS2Mfgy1oIyjcZigshLIVpcDaHCDnXe0igRS/e
3Q8HktZredNmQG7JE7EvJr6ZwtA7WhtBqL641SAihlaGavigxREvM+Uez2ZErNw+
HVOBCZf8kZcoYeLAD9Pdbs6wJw88jCQ0UIsYaGq9Sd30jSjj0jxVjmAs1w6KPV6P
f7Gdx7LopRkV+92FqmsjPmZI32/CYbV1nZtUg4IYGw27ItlrLVnB3sIOaodPaOHM
TSM2Eqi0mTTrSbqe9pbtUn7MCyWixxirJDoQ7wiI5F6V4juN/kyAM560qmcCiW1Z
Aw86tTRdBj4stJGkLd6rmaLWsAAsuM07xAKlYmngT3YaZe8SsChGNo6X9wal0TgR
vzaCVwpCIqgFb5pT43MNb1pgvfNi0Sc2t7EIdlcctAWaE6JXgxm1v5mNuAHSW0e6
8g9irPgzRh6l9qvf+/7qDPmRqA67ayWgXPiXxUOyaakVb9lbCybbd9wWDF9czwMg
LQCm1akSk23vC3ntPcxWfZkni8VQ+LDVnduzTcPG7joihMs8Sypu96CGoW1hN8Ly
jhS8odYFlT7QKRYir2WG
=gT+2
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
