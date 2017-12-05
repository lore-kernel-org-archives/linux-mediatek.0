From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 1/6] drm: Add Content Protection property
Date: Tue, 5 Dec 2017 11:28:40 +0100
Message-ID: <20171205102840.GB12982@amd>
References: <20171130030907.26848-1-seanpaul@chromium.org>
 <20171130030907.26848-2-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1470175305=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171130030907.26848-2-seanpaul@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============1470175305==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-11-29 22:08:56, Sean Paul wrote:
> This patch adds a new optional connector property to allow userspace to e=
nable
> protection over the content it is displaying. This will typically be impl=
emented
> by the driver using HDCP.
>=20
> The property is a tri-state with the following values:
> - OFF: Self explanatory, no content protection
> - DESIRED: Userspace requests that the driver enable protection
> - ENABLED: Once the driver has authenticated the link, it sets this value
>=20
> The driver is responsible for downgrading ENABLED to DESIRED if the link =
becomes
> unprotected. The driver should also maintain the desiredness of protection
> across hotplug/dpms/suspend.

Why would user of the machine want this to be something else than
'OFF'?

If kernel implements this, will it mean hardware vendors will have to
prevent user from updating kernel on machines they own?

If this is merged, does it open kernel developers to DMCA threats if
they try to change it?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlomdNgACgkQMOfwapXb+vL3qwCcDcqWqudF2z1/Zq02sIazmCM1
uvIAoJOYcM6RIhyQOmsMM6k3ns01SbG0
=QWQx
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--

--===============1470175305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1470175305==--
