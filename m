From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH] regulator: core: Move device_link_remove out from
 regulator_list_mutex
Date: Thu, 18 Jul 2019 12:45:12 +0100
Message-ID: <20190718114512.GA5761@sirena.org.uk>
References: <1563432146-28097-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1563432146-28097-1-git-send-email-yong.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, chao.hao@mediatek.com, cui.zhang@mediatek.com, ming-fan.chen@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>
List-Id: linux-mediatek@lists.infradead.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 02:42:26PM +0800, Yong Wu wrote:
> The MediaTek SMI adding device_link patch looks reveal a deadlock
> issue reported in [1], This patch is to fix this deadlock issue.

Can you please describe in words what this issue is and how the patch
addresses it?

> This is the detailed log:
>=20
> [    4.664194] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    4.670368] WARNING: possible circular locking dependency detected
> [    4.676545] 5.2.0-rc2-next-20190528-44527-g6c94b6475c04 #20 Tainted: G=
 S
> [    4.684539] ------------------------------------------------------

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative then it's
usually better to pull out the relevant sections.

> index 955a0a1..3db9350 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -2048,7 +2048,9 @@ static void _regulator_put(struct regulator *regula=
tor)
>  	debugfs_remove_recursive(regulator->debugfs);
> =20
>  	if (regulator->dev) {
> +		mutex_unlock(&regulator_list_mutex);
>  		device_link_remove(regulator->dev, &rdev->dev);
> +		mutex_lock(&regulator_list_mutex);
> =20
>  		/* remove any sysfs entries */
>  		sysfs_remove_link(&rdev->dev.kobj, regulator->supply_name);
> --=20
> 1.9.1
>=20

Just randomly dropping and reacquiring the lock in the middle of a
series of operations sounds potentially racy...  What happens if the
list gets changed while the lock is dropped?

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0wW8UACgkQJNaLcl1U
h9Duwgf8DrFA6rkNbZWAOQolUO3ScHl7ZIFDMYs/c8IslX851jEG59mVl69AFFdx
OOzfKw4BgDoYJX0pIoCnYGkEyTZgI3m1zWOmb3ceu8UPwxDa2fOeXaXvfRT0C9IP
J4sQe88/NyzcipB6TwzYri4MnDI/dC5cmnHGuiOLWRzLtu9JKLdkyqoHynMk8gy8
RbFiatFKpVgxXz1RCVKulsJ/bZuHAUoa827QErIIzH00XVUSeolXp0k1HOZmbtJe
xrUkA+hvKhCw+cJaft/ifJWyO9+AorM7CGBJvJtSYuqjUp4rB5+Bl4T/8IHVNgtX
rl74RJhGjAjgSzIE+HlBKIiOD1DL8A==
=hW06
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
