Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F17C27C5E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywP6rIrGOeEe11/fIk9ADlVPXZtmenXfI95hJHdK5sU=; b=V5gEPXQ1OkpuZkvIGZBIDKl7qc
	+cXOGCsmAUejGGCorhCkY9caUdhufKwdzipx5HOETK16Oqkzasngrgpho5y4MIJiKRzZGqtr2onHb
	0CgnjXKOVXPbowfWvo76md5YixkThuLtMVAcnf+NhOEMiM18qdDmLuZm8IxYd/BjgHM0b01oV2ZNg
	X1dgYX6P+FUp29yD+jPCYagEuXQV2iGNlDgC5fMHvwQnsPe2e5Gzc+bBPQRI9XwkzfR/gIHZ22+q/
	aPbX4/kMWIPfvKD6mTKg94MlQL34sODWcm4RH+TCN7xryz5RkcGZzqOez+AgsA6SMLJIKiol/m+f1
	Q1c0nkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGz7Y-00000008XU5-42nr;
	Tue, 11 Jun 2024 10:52:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGz7S-00000008XTC-0Lcx;
	Tue, 11 Jun 2024 10:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7B8060C2A;
	Tue, 11 Jun 2024 10:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91A1C32786;
	Tue, 11 Jun 2024 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718103168;
	bh=SPGCvg8oBcYG36Y3k+TqNNr972Be3vD+h4h2HMX0I+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1Mmx+6LI3tk0HEjNzIWO+vEfjmp/DZPYSQcOZI7tx2yZfoJqmZ6wKRkgd38O6e7r
	 HEttIG0vIBXdIGA/fDvEjgeLkpx3Klp9wvgq19w3wUXleABJZ8xXWL+DAFuzdSB3id
	 453SozEM6s9m+dQHHq9YObW62o1hid0EXxkU8Dg/gf23lVTP9tZqolYBRjS4TcmgWZ
	 FgUxYvko7qKsDm1pXWL+msrl447F7WTfnv4nTd/PLZ/uPHNO8Y/1s+3TBKEv01xRBb
	 MtWvPK/elrOqJ7grP5KlooTl6loyozwUciL5FqfYyRmj8sGtNcGGSTWbQ6wVUlHFSm
	 Kt5jpwCXl+Xkw==
Date: Tue, 11 Jun 2024 11:52:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com, maso.huang@mediatek.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] ASoC:  support machine driver with TAS2781
Message-ID: <Zmgsfafmfedd9_MV@finisterre.sirena.org.uk>
References: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K85sZsmQcdfrCDzv"
Content-Disposition: inline
In-Reply-To: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_035250_209987_C7FD0219 
X-CRM114-Status: GOOD (  15.37  )
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


--K85sZsmQcdfrCDzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 10:22:27AM +0800, Rui Zhou wrote:
> Support amp TAS2781 for mt8188 platform
>=20
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> ---
>  sound/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a8476e1ecca..07f67f96c889 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -233,6 +233,7 @@ config SND_SOC_MT8188_MT6359
>  	select SND_SOC_HDMI_CODEC
>  	select SND_SOC_DMIC
>  	select SND_SOC_MAX98390
> +	select SND_SOC_TAS2781_I2C
>  	select SND_SOC_NAU8315
>  	select SND_SOC_NAU8825

Ideally this would be sorted to avoid spurious merge conficts.  Also do
we really have dependencies here or should these just be being enabled
by users - these drivers are all pretty generic now?  Not that this
change in itself makes a huge difference to the existing state.

--K85sZsmQcdfrCDzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoLHwACgkQJNaLcl1U
h9AAVgf/TWEQisVxEaf1frM1/D3qcobxJ6efWsgIv3IU+Pg4hw/ZG/TRDwKrGkj3
htAD+n9XXY85OzGfILsjRExZ+WDaULAYnvBoJpml5QqvJPQJ3hdFVeAP+oyZ3uwa
ueaNc253irzMPAtO6FUe4KrJSLXGWTWfiliOS3p6ntj8HuuLO0IaXw2r/9Qedf2l
HLVobEfd4G0nC68K75qt0El0Dl+8vJMKa4NHL75A1Zdj0WHBNC5pbCB1q1SNIKWB
xpWuo7HPpof5ewkH4wE/ej3Ug25R0yw6UbMUSl2GVkAqY4n7nF2GKoO7O3uZ+yvG
HGdLYOln52AYmZDRc1mkwDvKazuvwA==
=rSC4
-----END PGP SIGNATURE-----

--K85sZsmQcdfrCDzv--

