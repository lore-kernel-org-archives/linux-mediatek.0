From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 1/6] drm: Add Content Protection property
Date: Tue, 5 Dec 2017 18:34:08 +0100
Message-ID: <20171205173408.GA18425@amd>
References: <20171130030907.26848-1-seanpaul@chromium.org>
 <20171130030907.26848-2-seanpaul@chromium.org>
 <20171205102840.GB12982@amd>
 <20171205104538.b4fxdjad3c46koas@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0767536170=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20171205104538.b4fxdjad3c46koas@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============0767536170==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-12-05 11:45:38, Daniel Vetter wrote:
> On Tue, Dec 05, 2017 at 11:28:40AM +0100, Pavel Machek wrote:
> > On Wed 2017-11-29 22:08:56, Sean Paul wrote:
> > > This patch adds a new optional connector property to allow userspace =
to enable
> > > protection over the content it is displaying. This will typically be =
implemented
> > > by the driver using HDCP.
> > >=20
> > > The property is a tri-state with the following values:
> > > - OFF: Self explanatory, no content protection
> > > - DESIRED: Userspace requests that the driver enable protection
> > > - ENABLED: Once the driver has authenticated the link, it sets this v=
alue
> > >=20
> > > The driver is responsible for downgrading ENABLED to DESIRED if the l=
ink becomes
> > > unprotected. The driver should also maintain the desiredness of prote=
ction
> > > across hotplug/dpms/suspend.
> >=20
> > Why would user of the machine want this to be something else than
> > 'OFF'?
> >=20
> > If kernel implements this, will it mean hardware vendors will have to
> > prevent user from updating kernel on machines they own?
> >=20
> > If this is merged, does it open kernel developers to DMCA threats if
> > they try to change it?
>=20
> Because this just implements one part of the content protection scheme.
> This only gives you an option to enable HDCP (aka encryption, it's really
> nothing else) on the cable. Just because it has Content Protection in the
> name does _not_ mean it is (stand-alone) an effective nor complete content
> protection scheme. It's simply encrypting data, that's all.

Yep. So my first question was: why would user of the machine ever want
encryption "ENABLED" or "DESIRED"? Could you answer it?

> If you want to actually lock down a machine to implement content
> protection, then you need secure boot without unlockable boot-loader and a
> pile more bits in userspace.  If you do all that, only then do you have
> full content protection. And yes, then you don't really own the machine
> fully, and I think users who are concerned with being able to update
> their

Yes, so... This patch makes it more likely to see machines with locked
down kernels, preventing developers from working with systems their
own, running hardware. That is evil, and direct threat to Free
software movement.

Users compiling their own kernels get no benefit from it. Actually it
looks like this only benefits Intel and Disney. We don't want that.

> kernels and be able to exercise their software freedoms already know to
> avoid such locked down systems.
>=20
> So yeah it would be better to call this the "HDMI/DP cable encryption
> support", but well, it's not what it's called really.

Well, it does not belong in kernel, no matter what is the name.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlom2JAACgkQMOfwapXb+vJ+2wCgiz49231c4gvT55SQNQp4yPum
+rwAn0TURpxXzFqV3S4N+Ml4xmGM4PFf
=MpZJ
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

--===============0767536170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0767536170==--
