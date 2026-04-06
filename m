Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF59EF4ED4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2026 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k414SbYrqYZakLzoL/vTXD0xnj6NhUnMOGJfGQAaH4w=; b=vUkdg1hbG2EvcJvmm5QezZ2TI7
	jQyMUfJMHyv1RvxdRGenr40y9TaLIoFNe9W2hZ3ZkOieRZwba6I3pArk4JFmmbcktb10WMI59fu+v
	FZ0+0dpy2bdQaQGHSjOv5JKiTR66xCTzjA2QCOIdvOiO5XiwrMmBbfcCH+JbOPb6lf+N2oZZBVNb2
	NvBRoS1wPJClldKomz9ER3uMVfub31PWK7xPwaoNBlN12ELGWc+Bssl2ugLp8jRDgWPctSk1aFzJ9
	hUJSk/xm4V7f8ql1zOw6uKP93kQR1SlkQ/7Ji3/fNHfX1/78t7wIZhBlITo5r8DB4E1ZnnXk2e6lH
	gSyOLwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jVY-0000000580i-1Crt;
	Mon, 06 Apr 2026 12:56:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jVX-0000000580W-0yAf
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Apr 2026 12:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F9AA600AD;
	Mon,  6 Apr 2026 12:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A59C4CEF7;
	Mon,  6 Apr 2026 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775480206;
	bh=GP2G3/1fvLQfORsXx6ZjCUCk5zUdzQ+VSvtg2MvhzeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiXtjd4yNGY6+gzZ+Ou7a5NyY1pngNWyGPbSRoTLms8GgovfUd09xLVPbUZRfa3ou
	 zDSlUPj3V4eTGXl+4j3JSDDEPAILyd2ImRSci9X3+wGUL5erQUXyDQZET/M9fiQIfk
	 udwMk9w83jW7iEmo3CLeHdkkYnBvkfeegazdX8x8BsQ987Z37aaWMZI6xNT7dVTAt+
	 TgBJLbbUS/6RFAS4/qTbKkbJ5Kksa9CuUuMeJximduGQLzrJvlbApO2LgMCEb8JWLT
	 pV0QMyMN2c+oPxJ82vL9wDbY2iysR+uA65eL2HNqIVEtW9sNVliSqTcvvhMAHU7Vc1
	 MqvjGLe25RQlw==
Date: Mon, 6 Apr 2026 13:56:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: gch981213@gmail.com, linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] spi: uniphier: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <b78ec8d7-feb9-4588-b51a-ced8d8a35a23@sirena.org.uk>
References: <cover.1775273351.git.xiaopei01@kylinos.cn>
 <ceacbce51039b10e13ec9317cd46ed2fb0354952.1775273351.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4STaxXf5xtBgLcU"
Content-Disposition: inline
In-Reply-To: <ceacbce51039b10e13ec9317cd46ed2fb0354952.1775273351.git.xiaopei01@kylinos.cn>
X-Cookie: Does not include installation.
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


--u4STaxXf5xtBgLcU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2026 at 11:44:59AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.

Copying in the maintainers for the driver, you should generally copy
maintainers when posting patches (and to avoid large CC lists it's often
better to send patches per driver unless the series is actually related,
this one isn't).

> Remove the now-unnecessary clk_disable_unprepare() calls from the probe
> error path and the remove callback. Adjust error labels accordingly.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/spi/spi-uniphier.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
> index 9e1d364a6198..1b815ee2ed1b 100644
> --- a/drivers/spi/spi-uniphier.c
> +++ b/drivers/spi/spi-uniphier.c
> @@ -666,28 +666,24 @@ static int uniphier_spi_probe(struct platform_devic=
e *pdev)
>  	}
>  	priv->base_dma_addr =3D res->start;
> =20
> -	priv->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	priv->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		dev_err(&pdev->dev, "failed to get clock\n");
>  		ret =3D PTR_ERR(priv->clk);
>  		goto out_host_put;
>  	}
> =20
> -	ret =3D clk_prepare_enable(priv->clk);
> -	if (ret)
> -		goto out_host_put;
> -
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		ret =3D irq;
> -		goto out_disable_clk;
> +		goto out_host_put;
>  	}
> =20
>  	ret =3D devm_request_irq(&pdev->dev, irq, uniphier_spi_handler,
>  			       0, "uniphier-spi", priv);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request IRQ\n");
> -		goto out_disable_clk;
> +		goto out_host_put;
>  	}
> =20
>  	init_completion(&priv->xfer_done);
> @@ -716,7 +712,7 @@ static int uniphier_spi_probe(struct platform_device =
*pdev)
>  	if (IS_ERR_OR_NULL(host->dma_tx)) {
>  		if (PTR_ERR(host->dma_tx) =3D=3D -EPROBE_DEFER) {
>  			ret =3D -EPROBE_DEFER;
> -			goto out_disable_clk;
> +			goto out_host_put;
>  		}
>  		host->dma_tx =3D NULL;
>  		dma_tx_burst =3D INT_MAX;
> @@ -766,9 +762,6 @@ static int uniphier_spi_probe(struct platform_device =
*pdev)
>  		host->dma_tx =3D NULL;
>  	}
> =20
> -out_disable_clk:
> -	clk_disable_unprepare(priv->clk);
> -
>  out_host_put:
>  	spi_controller_put(host);
>  	return ret;
> @@ -777,14 +770,11 @@ static int uniphier_spi_probe(struct platform_devic=
e *pdev)
>  static void uniphier_spi_remove(struct platform_device *pdev)
>  {
>  	struct spi_controller *host =3D platform_get_drvdata(pdev);
> -	struct uniphier_spi_priv *priv =3D spi_controller_get_devdata(host);
> =20
>  	if (host->dma_tx)
>  		dma_release_channel(host->dma_tx);
>  	if (host->dma_rx)
>  		dma_release_channel(host->dma_rx);
> -
> -	clk_disable_unprepare(priv->clk);
>  }
> =20
>  static const struct of_device_id uniphier_spi_match[] =3D {
> --=20
> 2.25.1
>=20

--u4STaxXf5xtBgLcU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTrYkACgkQJNaLcl1U
h9BANAf/dGJNmZSLngxXkP5KrH7SAaqgzVoQ8E7caLpgNcnt7eQ/XEPybZJXhU0k
FemXsGHiNndHMYJPmHlv459ASIGN4xCXLMhWW0pBXLgHJL/KMpLFPhgsd8jn6P+2
gmNCmv6+TKuIIatosm2lE5hxuIXSfcUMmy9ADjzwgqq6poQa1L+wzIDMUBs70V1O
bVIlMufK5Y0dZ+yFqqoYIvg8QH7100bphzKLsVwucjJGB41xg66giiSwz3AAztv8
wc6x0F22Zn6CJoNtr8KSnloNTgKc6/RDCx8eqgI9XbWrBgfBId3Ah2fdNbs5lOGp
aFMmpfwFV0RmuFWkF6+xOKUdl/N4qg==
=ndBj
-----END PGP SIGNATURE-----

--u4STaxXf5xtBgLcU--

