Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CA5C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqFHy1xe5YqFmgQ/GgNRtOR0JMnEzFxt/51kgPUMKZ0=; b=EbIwhcvMlkeIlkouVizaR03i5e
	gG2SgtpnXImghoBrsqt9ZyLZSTbZAEJKPvc9OjMYOhvNzDStBdAk+buIJbUcwxyhg5PW/4HK57EtS
	BuCIXvKSvHwbyXUm+gy4jwtNwe26zjMXtSZ29hKHLdHIzDV882+B1hOn5VgUIi7ougmD0mEO9XiDf
	UdpA+5XS0uAOVwgdS9ALOZsfTzMgeMJ83xDZP1klaNHNxEoCExxrw+ocmNaEqlEHidfxGKMseGG6r
	N9zHJ/Osq43Zk2pYNrmledDUl1dt2rURjFz1ayCqGD6W9Nh2w0Bqv3tHV3U0HEL7hv8Vm4HfJIAfm
	iRQ1K19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmuu-006b46-2t;
	Wed, 10 May 2023 16:43:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmuq-006b2F-34
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 16:43:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pwmuc-0006yl-CH; Wed, 10 May 2023 18:43:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pwmuY-002XCA-O2; Wed, 10 May 2023 18:43:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pwmuY-003ALi-5f; Wed, 10 May 2023 18:43:30 +0200
Date: Wed, 10 May 2023 18:43:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fei Shao <fshao@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw
 platform remove callback
Message-ID: <20230510164330.z2ygkl7vws6fci75@pengutronix.de>
References: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q7mthi6fgfcgjjj5"
Content-Disposition: inline
In-Reply-To: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_094348_991040_6A0D29AB 
X-CRM114-Status: GOOD (  23.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--q7mthi6fgfcgjjj5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[expanding the audience a bit for more expertise]

Hello,

On Wed, May 10, 2023 at 11:31:35PM +0800, Fei Shao wrote:
> This aligns with [1] and converts the platform remove callback to
> .remove_new(), which returns void.
>=20
> [1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
>      platform remove callback returning void")
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>
>=20
> ---
>=20
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b=
/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> index b753bf54ebd9..bd5743723da6 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> @@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_device=
 *pdev)
>  	return ret;
>  }
> =20
> -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> +static void mtk_vdec_hw_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
> =20
>  static struct platform_driver mtk_vdec_driver =3D {
>  	.probe	=3D mtk_vdec_hw_probe,
> -	.remove =3D mtk_vdec_hw_remove,
> +	.remove_new =3D mtk_vdec_hw_remove,
>  	.driver	=3D {
>  		.name	=3D "mtk-vdec-comp",
>  		.of_match_table =3D mtk_vdec_hw_match,

While the patch looks fine, I wonder if having a remove callback just to
do pm_runtime_disable() is worth keeping it. Doesn't the core care for
things like that? I grepped a bit around, device_unbind_cleanup() is
called after device_remove() which calls pm_runtime_reinit(). Does that
mean calling pm_runtime_disable in .remove() is useless? In that case,
you could just drop the .remove() callback.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--q7mthi6fgfcgjjj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRbybEACgkQj4D7WH0S
/k7BlggAtOk4RsuBv4L9tAsMlhTGVIueKXhZIiBT1IZ0G0tp9SBTwlWNxwIay133
Q1RFJRhgq7GTusiGx3dw62EeiF9Wxaqa7W+uB9GrAfPs5k8qRyiU/LC27sAfjg9x
eS4MkSR3dw7iN7wB1DSEiitHVOYXdq+zZ5aqhNNzQZE3DymxwR91cxuK+gG1k/ax
c4Izpg74XIDk8Q1CrUo1A1N5CQ0qKS1NRRlfZy/7/DjIYzG+tjrhSoUO/h4AQOtR
lxTcA9knL0vx0NPs7o18g9ZngmMUTtQWgADLgJfFlPcyWs5CABUAnF3Nkafa9nNS
nLsTffuOpkHKy4mmgrnT0qEGFaGqRA==
=gg+q
-----END PGP SIGNATURE-----

--q7mthi6fgfcgjjj5--

