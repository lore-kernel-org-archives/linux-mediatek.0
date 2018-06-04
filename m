From: NeilBrown <neil@brown.name>
Subject: Re: [PATCH 0/7] staging: mt7621-pci: Fix coding style issues
Date: Mon, 04 Jun 2018 10:13:58 +1000
Message-ID: <877enfqugp.fsf@notabene.neil.brown.name>
References: <cover.1528040188.git.abdun.nihaal@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1528040188.git.abdun.nihaal@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: matthias.bgg@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Abdun Nihaal <abdun.nihaal@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 03 2018, Abdun Nihaal wrote:

> This patchset fixes the following set of coding style=20
> issues found using checkpatch.
>
> ERROR: space prohibited after that open parenthesis '('
> ERROR: trailing whitespace
> ERROR: space required before the open parenthesis '('
> ERROR: space required after that ',' (ctx:VxV)
> ERROR: spaces required around that '=3D' (ctx:VxW)
> ERROR: spaces required around that '=3D=3D' (ctx:WxV)
> ERROR: that open brace { should be on the previous line

Hi,
 thanks for contributing these, how ever some of these issues have
 already been address (not all).  I think you must be working from an
 old try.
 When submitting patches to drives/staging, they should be based on
 the staging-next branch of
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git

 Also, I'd suggest leaving linux-arm-kernel and linux-mediatek off the
 cc list.  They are unlikely to be interested until the driver is ready
 to be moved out of drivers/staging.

Thanks,
NeilBrown


>
> Abdun Nihaal (7):
>   staging: mt7621-pci: Remove space after open parenthesis
>   staging: mt7621-pci: remove trailing whitespace
>   staging: mt7621-pci: add space before open parenthesis
>   staging: mt7621-pci: add space after comma symbol
>   staging: mt7621-pci: add spaces around equal symbol
>   staging: mt7621-pci: add space after '=3D=3D' symbol
>   staging: mt7621-pci: fix coding style error
>
>  drivers/staging/mt7621-pci/pci-mt7621.c | 114 ++++++++++++------------
>  1 file changed, 56 insertions(+), 58 deletions(-)
>
> --=20
> 2.17.0

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlsUhEYACgkQOeye3VZi
gbmqeQ//WA32pYuVChludSOQq2pmdfEHZLVBJoxzDx2ew0IVjjXOtSCx3dEig7qI
pcgiQd9ER1zhBBt/9Y4Fxu4iWA20CA8sQcQJqbmfMIz1rf9yJOBag0hilnYH8SgU
ccl9hmi+H1F4KPjB53zxFle5okyfiQPlUPzcdGecLg68MPjsNpQdr/XW2LgFwaMV
J4PqwkjiG9tVWzhHYpNJIkHuW6tk5mgEHkiZFQBTUWW2IX4f0O5Spbju5d1Obc3e
GBjyXap4xcKMI9zzbYPQet6VAb6Nm5XxuORJ5TZM5KzxTwDv3sJ9QYazynocn1zM
h1vke1vueXrFo0RlELfWTn5kuwjVOWEdnzlNZnboKTOVV3F0xtR/QdDZuL9mJzbJ
eds9Jpi2hOtHwTD2jZI1oz10kChWcW9k03kDOWmLUzRLnGGdqofhR8hE0xEj/OcF
kedW54bI11Ol2xRxaOYTKGViu0wEKYH9devxw4qgH+u2mLHsCYNoZWzUnF8RLiIC
k4bI4oKxTOsTiBJk9ZmGSU325wORyydScZQo++lJpU20gteUVXWisMsbcXJAW6y4
1c3VzajAuZH/ipMR4WEiMZX2T9ur9u0YxnQtGnxgpsXkqMeDvqEeQdC/JyuQmHT8
P9SmOV+eTkItLdq7nt13rAVmj2qgWnlkRQLFwMdZe0c6Zu/8sRw=
=ysyz
-----END PGP SIGNATURE-----
--=-=-=--
