Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62899C7EE22
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 22:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNyR7OLsMII+GjkdN8H5Iwoswm+bYvk7L6cIbHeev4w=; b=VpyJ1c/H856DL6Qx94SdqqxtHU
	3Mr/L4ZOGqXtGs5lYwBO5MsJfjs2gFkFBXjgcsdv6AhxSDuR4/ijpKAhbFERroBGp3hGeGfmEXpaJ
	kEHhXQ087qRrL2NR3p1QxKz1CUU6ZMdiQNfjgW0yMJK5H+C7WuPb4yHLxaCCqH7rXVoyoRmgUS4z/
	YfcrWmhVI0gKG++F8OYFagQYqiBu4ZOZ3Hllf4lf9cTVmksp3BFIzKhJV9LG+FxC8uOlheOhdKUNL
	yQGd6X0tEiIvlOJkEKQLJf2QTOskPs+nuoDx/M7NLsjRQwzOeBoGwptb074F5YwlXXXU6mrVR89ks
	9dE6I84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyh0q-003h1w-0C;
	Mon, 15 May 2023 22:49:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyh0l-003h0K-1u;
	Mon, 15 May 2023 22:49:50 +0000
Received: from mercury (unknown [185.209.196.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B75E66031CE;
	Mon, 15 May 2023 23:49:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684190979;
	bh=cUOBGtMqBnVICL8/rpjyNFDo++WGvSZAvBD6cIIiFlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjiCURQP1mfWIQDOB/fRLYu4w7+Ua4kBADtbxrD8tIByakm+d+7t+2s6DKZwtgt6z
	 tVUlIK63NOU0iBt7hidcy91ZlbotjS4zw/DouMOlX9fvH0/ZTpnSE4H4hF3hYFKln/
	 iyrvNJSol6ZogyZwG7tFQZVfpIfyJ23fawEuj9djT+Bh91/sf0XivBXGL5eNeEVzfl
	 InEjaNSkZkT1L5zJjiDRXlZN1Dr5igPvNdipiLnQwAaOq8x81iSaGoigZyUGkCbU8Z
	 zQU1q2f4VlNwzDabf5njUPDGtDcDOIXqfS+zYDyGwOSFCWdam5d+vVU4hhca/aJooU
	 UZJUqQbP/dltg==
Received: by mercury (Postfix, from userid 1000)
	id A09FF1060F7F; Tue, 16 May 2023 00:49:36 +0200 (CEST)
Date: Tue, 16 May 2023 00:49:36 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: void0red <void0red@gmail.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] power: supply: mt6360: add a check of
 devm_work_autocancel in mt6360_charger_probe
Message-ID: <20230515224936.kbb275kre6ulasmm@mercury.elektranox.org>
References: <20230227031410.893593-1-void0red@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5qewv2dhagmv6xn"
Content-Disposition: inline
In-Reply-To: <20230227031410.893593-1-void0red@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_154947_783863_26F618FC 
X-CRM114-Status: GOOD (  17.74  )
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


--e5qewv2dhagmv6xn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 27, 2023 at 11:14:10AM +0800, void0red wrote:
> From: Kang Chen <void0red@gmail.com>
>=20
> devm_work_autocancel may fails, add a check and return early.
>=20
> Signed-off-by: Kang Chen <void0red@gmail.com>
> ---

Thanks, queued to my fixes branch with Fixes tag added.

-- Sebastian

>  drivers/power/supply/mt6360_charger.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply=
/mt6360_charger.c
> index 92e48e3a4..1305cba61 100644
> --- a/drivers/power/supply/mt6360_charger.c
> +++ b/drivers/power/supply/mt6360_charger.c
> @@ -796,7 +796,9 @@ static int mt6360_charger_probe(struct platform_devic=
e *pdev)
>  	mci->vinovp =3D 6500000;
>  	mutex_init(&mci->chgdet_lock);
>  	platform_set_drvdata(pdev, mci);
> -	devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
> +	ret =3D devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrd=
et_work);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
> =20
>  	ret =3D device_property_read_u32(&pdev->dev, "richtek,vinovp-microvolt"=
, &mci->vinovp);
>  	if (ret)
> --=20
> 2.34.1
>=20

--e5qewv2dhagmv6xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmRitwAACgkQ2O7X88g7
+pr/GQ//R5PP1j4DGfjnPOhBcBq5rCmy5rRw4mYwN8f7ldkAFNm327FtA1IBvGQk
q4doC1b1DPb2INU0HfNmd2f5bw69hJQBLdYaZLnALELcvKhg1Rx+R/s+9Vx/wDP1
+8I5EO61l9kzzw5CR8iPo3pIYC8VS5qoW8O8D2KF75L5pKYYgsvtAL1EbrpARR7X
xS2BATKDf8o+cnyX6+/uNyhm7Kwv2HJfmVH1/SqOxMxcW/VQPkf8dcJDwSCfodga
CQgS9Ex4Mnj5Tf0STRYBseHgH/bxdzueS3G0zlXsuBPo02ADfi/5b2WnNmzNgke3
Q5eRnCFIwaKTjI8x7TBYD1jcNc1x799/c26fUSb8qS1vQpDvw+g3P26yf+JjR5+R
GMwrp7pTsWjeoq8B2T0vnp9HEmk7q1Axwn2fZYQg+CCROnn692JiUGvTjgSWZPay
euw+yZXVje5JdCtOBQABHYb53xCUwMudzHyO4GbT3B5Iy0bkhJNhHAMp2mkozXFi
vMRwwAbTplG9mRYT7GLXQxrhxMN6yjWTfQq1sBQ19SqDowA6tShuTd8/kwP54xG1
DIC7bafpGgxU7acFPftdnZb8ifVIm6opZHdEXecqK9FQH49k/XDmc6LTOPaKhoDU
vLLCTvT3o55DDxYzL8t0psZxZR0psAtMQXyIMoMpcs0zDMbTLj8=
=uuij
-----END PGP SIGNATURE-----

--e5qewv2dhagmv6xn--

