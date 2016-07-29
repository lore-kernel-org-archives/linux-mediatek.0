From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/3] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Fri, 29 Jul 2016 16:45:02 +0200
Message-ID: <20160729144502.GC3864@ulmo.ba.sec>
References: <1469608292-6106-1-git-send-email-bibby.hsieh@mediatek.com>
 <1469608292-6106-4-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1277905305=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1469608292-6106-4-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


--===============1277905305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 04:31:32PM +0800, Bibby Hsieh wrote:
> From: Junzhi Zhao <junzhi.zhao@mediatek.com>
>=20
> Pixel clock should be 297MHz when resolution is 4K.
>=20
> Signed-off-by: Junzhi Zhao <junzhi.zhao@mediatek.com>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c |  149 +++++++++++++++++++++++-------=
------
>  1 file changed, 96 insertions(+), 53 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index d05ca79..fa390e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -60,14 +60,25 @@ enum mtk_dpi_out_color_format {
>  	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
>  };
> =20
> +enum mtk_dpi_clk_id {
> +	MTK_DPI_CLK_DPI_ENGINE,
> +	MTK_DPI_CLK_DPI_PIXEL,
> +	MTK_DPI_CLK_TVD_PLL,
> +	MTK_DPI_CLK_COUNT,
> +};
> +
> +static const char * const mtk_dpi_clk_names[MTK_DPI_CLK_COUNT] =3D {
> +	[MTK_DPI_CLK_DPI_ENGINE] =3D "engine",
> +	[MTK_DPI_CLK_DPI_PIXEL] =3D "pixel",
> +	[MTK_DPI_CLK_TVD_PLL] =3D "pll",
> +};
> +
>  struct mtk_dpi {
>  	struct mtk_ddp_comp ddp_comp;
>  	struct drm_encoder encoder;
>  	void __iomem *regs;
>  	struct device *dev;
> -	struct clk *engine_clk;
> -	struct clk *pixel_clk;
> -	struct clk *tvd_clk;
> +	struct clk *clk[MTK_DPI_CLK_COUNT];

This looks to me like a step backwards. All accesses to these clocks are
now very clumsy and I don't see any advantage in using this array rather
than individually named clocks.

Also, that change seems completely unrelated to the description in the
commit message.

>  	int irq;
>  	struct drm_display_mode mode;
>  	enum mtk_dpi_out_color_format color_format;
> @@ -76,6 +87,7 @@ struct mtk_dpi {
>  	enum mtk_dpi_out_channel_swap channel_swap;
>  	bool power_sta;
>  	u8 power_ctl;
> +	void *data;

This should probably be const. It's a bad idea to cast away the const
=66rom the of_device_id.data that this is assigned from.

> +static const struct of_device_id mtk_dpi_of_ids[] =3D {
> +	{ .compatible =3D "mediatek,mt8173-dpi",
> +		.data =3D &mt8173_conf,
> +	},

Please align this in some standard way. It all fits on one line, so the
most obvious choice would've been:

	{ .compatible =3D "mediatek,mt8173-dpi", .data =3D &mt8173_conf },

> +	{}
> +};
> +
>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct mtk_dpi *dpi;
>  	struct resource *mem;
> +	struct device_node *np =3D dev->of_node;
>  	struct device_node *ep, *bridge_node =3D NULL;
>  	int comp_id;
> +	const struct of_device_id *match;
> +	struct mtk_dpi_conf *conf;
>  	int ret;
> =20
> +	match =3D of_match_node(mtk_dpi_of_ids, dev->of_node);
> +	if (!match)
> +		return -ENODEV;

You introduce a variable np =3D dev->of_node above, but then you add code
that uses dev->of_node directly?

That said, you should use of_device_get_match_data() anyway, so that you
can omit...

> +
>  	dpi =3D devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
>  	if (!dpi)
>  		return -ENOMEM;
> =20
>  	dpi->dev =3D dev;
> +	dpi->data =3D (void *)match->data;
> +	conf =3D (struct mtk_dpi_conf *)match->data;

=2E.. the dereferences here. Also, like I said before you should make
dpi->data and conf both const to avoid casting away the constness of the
data. If you do that you can even drop the casts because you'd be
casting from a const void * to a const foo *, which gets casted
automatically.

> @@ -754,11 +802,6 @@ static int mtk_dpi_remove(struct platform_device *pd=
ev)
>  	return 0;
>  }
> =20
> -static const struct of_device_id mtk_dpi_of_ids[] =3D {
> -	{ .compatible =3D "mediatek,mt8173-dpi", },
> -	{}
> -};

Another advantage of using of_device_get_match_data() is that it doesn't
need direct access to the of_device_id table (it'll obtain it via an
indirect dev->driver->of_match_table), so you don't have to move this
around and make this patch overall less churn.

Thierry

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXm2vsAAoJEN0jrNd/PrOhgtkP/i+eM1cko2tlYKtp0jusm3wB
+cYDrL4prw0cQwJuEsGVMHN/aR/wLHUZajxpb+nSKYgfajNNYTASnFhiY7wMPRIi
VS/naMJQdmwFSErAysOTdoG7/xOA77hIaj25XRrmv3Mb218ikdg9Sd625JZsfxKM
u4rtl/vqpFJDmQI61mch1br/qGrRZWeg28m3NxpphWBbpzPHAXj6ORS/u89dlmoI
nmQ30GSZmrHpL2QeFyOfQ/YGZ7ysJxGUbUgaW3lkq9IMNSERxzVEuDygzP9xhmA8
AyRnHTL1BKyYQtgWSM+pxLTPjC7gBopnk+dnWancGvS2qP6tsSEkM32w9i7AExuA
fhqCpel5TojuFb/FKGcs+KR1264YSucMWEZv58/NrdC4zaHaiUY6UVqzcIaDB9Ll
W67rq/IU6gexwOEy1Q2cuOFkrEAFO+nVS1A+KfTeQJE4rDpcVfcY+2evYyxUSFqm
v6ibwpo5yqVNJyX+P7nY4aM60rLzkZiIf9FANsIFd4gNYD8IaKn6ufgzCiIrgTd3
3cj1IJm/4gztN5Bm3uWykbsadjZXpMWDZgDflQxKE9lLdx9qVyxc5In3xrk48Q/n
EQPW6RWKvaOSBB+5ek7TctXH5lGCGFb+MIlHtOloROjSsQPXh+VWdRyhaTv1YzbP
kUziBFFJBxaWEktSRYDz
=I1Yi
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--

--===============1277905305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1277905305==--
