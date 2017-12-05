From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 1/6] drm: Add Content Protection property
Date: Tue, 5 Dec 2017 19:01:07 +0100
Message-ID: <20171205180107.GA22672@amd>
References: <20171130030907.26848-1-seanpaul@chromium.org>
 <20171130030907.26848-2-seanpaul@chromium.org>
 <20171205102840.GB12982@amd>
 <20171205104538.b4fxdjad3c46koas@phenom.ffwll.local>
 <20171205173408.GA18425@amd>
 <CADnq5_PcbBeGL+3CxOpNgRiih4czU9SnmjNbRyyRHOn-OZvy5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1401438999=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CADnq5_PcbBeGL+3CxOpNgRiih4czU9SnmjNbRyyRHOn-OZvy5Q@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org


--===============1401438999==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> > Why would user of the machine want this to be something else than
> >> > 'OFF'?
> >> >
> >> > If kernel implements this, will it mean hardware vendors will have to
> >> > prevent user from updating kernel on machines they own?
> >> >
> >> > If this is merged, does it open kernel developers to DMCA threats if
> >> > they try to change it?
> >>
> >> Because this just implements one part of the content protection scheme.
> >> This only gives you an option to enable HDCP (aka encryption, it's rea=
lly
> >> nothing else) on the cable. Just because it has Content Protection in =
the
> >> name does _not_ mean it is (stand-alone) an effective nor complete con=
tent
> >> protection scheme. It's simply encrypting data, that's all.
> >
> > Yep. So my first question was: why would user of the machine ever want
> > encryption "ENABLED" or "DESIRED"? Could you answer it?
>=20
> How about for sensitive video streams in government offices where you
> want to avoid a spy potentially tapping the cable to see the video
> stream?

Except that spies already have the keys, as every monitor
manufacturer has them?

> >> kernels and be able to exercise their software freedoms already know to
> >> avoid such locked down systems.
> >>
> >> So yeah it would be better to call this the "HDMI/DP cable encryption
> >> support", but well, it's not what it's called really.
> >
> > Well, it does not belong in kernel, no matter what is the name.
>=20
> Should we remove support for encrypted file systems and encrypted
> virtual machines?  Just like them the option is there is you want to
> use it.  If you don't want to, you don't have to.

Encrypted file systems benefit users. Encrypted video is designed to
work against users. In particular, users don't have encryption keys
for video they generate. I'd have nothing against feature that would
let users encrypt video with keys they control.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlom3uMACgkQMOfwapXb+vJypQCeJ1UqmMUB7ENbOT0y9upXV+pP
iBMAmwXGhltjHelMc08wlcuPXrCawQtK
=OiP4
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

--===============1401438999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1401438999==--
