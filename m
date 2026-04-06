Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADBEEF4EDE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcGAKRKucLdLbdKDW9WJn6mHdjkP87HOfgBbtaXqFY4=; b=bRu7Hzg+9s7bUtSZzf0euvkLd1
	ymJ1q0vbkZFoy4RD5t6U1rMjU6W6qETfI0nx0KDYuBzzT/Jf9yQnJgeMhS2MkNufYC4agPkT5w4j+
	1qZdzPlmrP55p1PcEDIQVNv+lWp8B8LVjjuuFCmaG6sYI0Z9XonSk8S70K84Dk2RyfCC7ZmDFt6Gm
	IAMFylzwf8a6VY6c2xNfO71LRZ/v9E87xrsh5Ik4cbbS4cvTFFdFG7A/3WhptR2RWjMtbvlgVycOo
	TZ9A4R/53w4Z+IOoRgrPzWqd5ZXJubB+ieCahCUZ3WQUFAHTsz44iv5h7MJBiBxEa7bfmpreulqMh
	kjOKUqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jWP-0000000584R-3BKq;
	Mon, 06 Apr 2026 12:57:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jWO-00000005846-0afw
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Apr 2026 12:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A834440B6;
	Mon,  6 Apr 2026 12:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E2DC4CEF7;
	Mon,  6 Apr 2026 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775480259;
	bh=/63zqptNwRV7sSH1uVLlmWAqfO2Zy4yCBu8PXI146XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVIad+WzF6lAkJGqDEBaIj4cc4sbm+oUxe7vsOwUD5hXSQ5ORx6JKW6Ycl1Ti5tpl
	 /jVFwynsIXAILxeJUsFWTlZntfav3EGYzgxmxhSPIXd5pTeHsWSLl6ELAUMWZ2P3BD
	 UV2QsWq1Q/oKb4Fv0c5WxKpaxvXT5/rUfjFTKdn/BOVinE1QXm1p3L1kSZ+veGWjMi
	 ZXeIH17LWVkmmxF+eHmflOQhj3W2q5NqJ8NmVRd8HOPZTi0qO969XXQUV4RANZEsNT
	 OqJ5eaRCF9InComEqMsZJ0eYN7t25xjIqD9jSliUJms22V2SQnmtq0e158z9tz62SX
	 9Gafbdj9gTJJg==
Date: Mon, 6 Apr 2026 13:57:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>, Michal Simek <michal.simek@amd.com>
Cc: gch981213@gmail.com, linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/4] spi: zynq-qspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <7e854ccb-fc2b-466b-a93d-458bf452c048@sirena.org.uk>
References: <cover.1775273351.git.xiaopei01@kylinos.cn>
 <358f3d25bfbba9f552f287711e0fba746ca13246.1775273351.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35WJibCW7tBcydft"
Content-Disposition: inline
In-Reply-To: <358f3d25bfbba9f552f287711e0fba746ca13246.1775273351.git.xiaopei01@kylinos.cn>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_055740_221514_A48FA8ED 
X-CRM114-Status: GOOD (  22.01  )
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


--35WJibCW7tBcydft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2026 at 11:45:00AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "pclk" and "ref_clk". This removes
> the need for explicit clock enable and disable calls, as the managed
> API automatically disables the clocks on device removal or probe
> failure.

Copying the driver maintainer.

> Remove the now-unnecessary clk_disable_unprepare() calls from the
> probe error paths and the remove callback. Simplify error handling
> by jumping directly to the remove_ctlr label.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/spi/spi-zynq-qspi.c | 31 ++++++-------------------------
>  1 file changed, 6 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> index 5232483c4a3a..8c3975030d0a 100644
> --- a/drivers/spi/spi-zynq-qspi.c
> +++ b/drivers/spi/spi-zynq-qspi.c
> @@ -661,7 +661,7 @@ static int zynq_qspi_probe(struct platform_device *pd=
ev)
>  		goto remove_ctlr;
>  	}
> =20
> -	xqspi->pclk =3D devm_clk_get(&pdev->dev, "pclk");
> +	xqspi->pclk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(xqspi->pclk)) {
>  		dev_err(&pdev->dev, "pclk clock not found.\n");
>  		ret =3D PTR_ERR(xqspi->pclk);
> @@ -670,36 +670,24 @@ static int zynq_qspi_probe(struct platform_device *=
pdev)
> =20
>  	init_completion(&xqspi->data_completion);
> =20
> -	xqspi->refclk =3D devm_clk_get(&pdev->dev, "ref_clk");
> +	xqspi->refclk =3D devm_clk_get_enabled(&pdev->dev, "ref_clk");
>  	if (IS_ERR(xqspi->refclk)) {
>  		dev_err(&pdev->dev, "ref_clk clock not found.\n");
>  		ret =3D PTR_ERR(xqspi->refclk);
>  		goto remove_ctlr;
>  	}
> =20
> -	ret =3D clk_prepare_enable(xqspi->pclk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Unable to enable APB clock.\n");
> -		goto remove_ctlr;
> -	}
> -
> -	ret =3D clk_prepare_enable(xqspi->refclk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Unable to enable device clock.\n");
> -		goto clk_dis_pclk;
> -	}
> -
>  	xqspi->irq =3D platform_get_irq(pdev, 0);
>  	if (xqspi->irq < 0) {
>  		ret =3D xqspi->irq;
> -		goto clk_dis_all;
> +		goto remove_ctlr;
>  	}
>  	ret =3D devm_request_irq(&pdev->dev, xqspi->irq, zynq_qspi_irq,
>  			       0, pdev->name, xqspi);
>  	if (ret !=3D 0) {
>  		ret =3D -ENXIO;
>  		dev_err(&pdev->dev, "request_irq failed\n");
> -		goto clk_dis_all;
> +		goto remove_ctlr;
>  	}
> =20
>  	ret =3D of_property_read_u32(np, "num-cs",
> @@ -709,7 +697,7 @@ static int zynq_qspi_probe(struct platform_device *pd=
ev)
>  	} else if (num_cs > ZYNQ_QSPI_MAX_NUM_CS) {
>  		ret =3D -EINVAL;
>  		dev_err(&pdev->dev, "only 2 chip selects are available\n");
> -		goto clk_dis_all;
> +		goto remove_ctlr;
>  	} else {
>  		ctlr->num_chipselect =3D num_cs;
>  	}
> @@ -728,15 +716,11 @@ static int zynq_qspi_probe(struct platform_device *=
pdev)
>  	ret =3D devm_spi_register_controller(&pdev->dev, ctlr);
>  	if (ret) {
>  		dev_err(&pdev->dev, "devm_spi_register_controller failed\n");
> -		goto clk_dis_all;
> +		goto remove_ctlr;
>  	}
> =20
>  	return ret;
> =20
> -clk_dis_all:
> -	clk_disable_unprepare(xqspi->refclk);
> -clk_dis_pclk:
> -	clk_disable_unprepare(xqspi->pclk);
>  remove_ctlr:
>  	spi_controller_put(ctlr);
> =20
> @@ -758,9 +742,6 @@ static void zynq_qspi_remove(struct platform_device *=
pdev)
>  	struct zynq_qspi *xqspi =3D platform_get_drvdata(pdev);
> =20
>  	zynq_qspi_write(xqspi, ZYNQ_QSPI_ENABLE_OFFSET, 0);
> -
> -	clk_disable_unprepare(xqspi->refclk);
> -	clk_disable_unprepare(xqspi->pclk);
>  }
> =20
>  static const struct of_device_id zynq_qspi_of_match[] =3D {
> --=20
> 2.25.1
>=20

--35WJibCW7tBcydft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTrb4ACgkQJNaLcl1U
h9AlSwf/RnM0yKZqf2bGptr7W3WxL/963wc5phlj6S0zdZ+jf/dcZBZBbFNyCpMv
oK++BnvkjBm5Ky0Dbqjc55SWw9+dFa16NcAM6uAhKCh7bCZrKbGQJtavZB1F/gLp
1sERRjhEsrn0Yue4kbduLJRVksqC4AKoBABcRMAmnZXe9shlOrSFb5gERsa4ryOX
s4kznUVyf6l2ODKlKUFAzwxtTh2D9COrLJLb0fWi0m+KbcN28xOwSJIN75t49Z7m
Itdfnr8asqfXQBAOSA48DWy+GEpkq+m9LHWzEeVQRfc2GPguF6Qfp6ljK+wHtFPS
I6COuWCvzi0eFcxEYXu1nD8dTpP2xg==
=m8YY
-----END PGP SIGNATURE-----

--35WJibCW7tBcydft--

