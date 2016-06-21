From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm: mediatek: remove IOMMU_DMA select
Date: Tue, 21 Jun 2016 15:19:12 +0200
Message-ID: <20160621131912.GA6060@ulmo.ba.sec>
References: <1462982509-342936-1-git-send-email-arnd@arndb.de>
 <1462997501-982363-1-git-send-email-arnd@arndb.de>
 <3436915.Zo8cThvXaA@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1850849221=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3436915.Zo8cThvXaA@wuerfel>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, airlied@redhat.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============1850849221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 10:15:20PM +0200, Arnd Bergmann wrote:
> On Wednesday 11 May 2016 22:11:07 Arnd Bergmann wrote:
> > We get a harmless build warning when trying to use the mediatek
> > DRM driver with IOMMU support disabled:
> >=20
> > warning: (DRM_MEDIATEK) selects IOMMU_DMA which has unmet direct depend=
encies (IOMMU_SUPPORT)
> >=20
> > However, the IOMMU_DMA symbol is not meant to be used by drivers
> > at all, and this driver doesn't seem to have a strict dependency
> > on it other than using the mediatek IOMMU driver that does.
> >=20
> > Since we also want to be able to do compile tests with the
> > driver on other platforms, the IOMMU_DMA symbol should not
> > be selected here.
> >=20
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > If someone has a better explanation about why the 'select' is here,
> > let me know, it certainly seems out of place.
>=20
> Sorry, I didn't mean to send this as a reply to "More build fixes for
> omapdrm in current -next", I copied the wrong command line.
>=20
> I'll resend it if necessary.

That's probably the reason why patchwork didn't include the commit
message in the downloaded mbox. I've pieced it together manually and
applied this to topic/drm-misc.

Thanks,
Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaT7MAAoJEN0jrNd/PrOhir8P/1tBC0bj/eVXEWTAt36gcfAY
gW8IHFV281f2xGwJfSgUqljke35PyPggTvVYRWrE2PzA4BHnJCDUWKNvp45l7I7J
K0btRkdTUQPUIjwPYewxgffYXp+VsDTNTMYdcRXvQLU/O6Y8xVUTuwF0/MQ3LuSH
B5sfAH9vtx6vwqOuRD63zrsfLsTLT17JQ9+HdVW53pIGadPO6oQzUcmsMB/+rY46
3DAru+N0CEtfaN6IEeQspV5vs66amZGQ8Wxg5yGwh/i+tTZ/zSltUIMWu87e49Vz
HyZDSc6yTBxUGc0T7S3xv3npVP3WGBKlAWVgm6uoLNo9FvIOd/VpcIKQy3Yr7R23
qZ9Mr9CSR5r1LN5803PnJjX2Wg0cxS1mW0Bo9htuhlIDCySIm3pAjPet6Go336ME
qMwBZrB+SEeDY1sgJjT+NtfQMumWmzTmOF9fArUp0mFD1P0eGd1EzQLzapoC2lKg
M7NqMDeb4LRemxV+SU2YpHwgjwviL4YEuwASYMZvKTBvNycLnou0w6UR0DpvIAox
qdPPG/D0Qh1GxPbmxUWD8JVPSrnysX32qvtlgKbL2YjEX4i3V67y0icFiDplg0EG
4THxkE73QEL5feHk6H8K8sgEnu0lQyG+uGUyp3L5cbiStgLJU0m6WbVrexXXtTk+
pUZCbsK7+YMv8yK+W3DP
=med2
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============1850849221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1850849221==--
