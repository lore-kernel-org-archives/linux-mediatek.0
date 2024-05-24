Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6FBC25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQZpMrThUEGea1BAHMIcPc3cDr9uYVqQvvK108Ir1AU=; b=Pw8Q3nNRs3mbkcudgRlXy6+9dj
	fagXG/Gm0ExdzoYcRzXzLZUM6LCoNTQC8ZNGf/VHEtfq2cZHRRF3WjVT7Rg+5nAzvFLny2pl4ULWP
	dnJWMBwxtdAFvt+9+xOlNlxYk/7tnFnaRZA/kDCDF/I+OhI+moquCNG0AblUwvsehMhe4i2FJbnTi
	wm55J69DwC8GgixZAG5f6CqEG44plnLEZzupgntAd1+rEgOkwdjrV8oHLO+9Hkql4JZ+WChVEnYb+
	Pzc7Lffj7cOnUaAEoQmkURU1m8M4ZEHn6r5Z9CgduyfoI1sSwLDib2SwE3ecnEGPmyY7SyIK4dvOj
	0SR3Y2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZbC-00000009Yr0-36Tk;
	Fri, 24 May 2024 18:25:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZb8-00000009Yok-12aa;
	Fri, 24 May 2024 18:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 461E4CE1902;
	Fri, 24 May 2024 18:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73617C2BBFC;
	Fri, 24 May 2024 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716575092;
	bh=dQAvYzPorRE89EfGzh8i8K3dM861qHxxGaH5yINN8yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RODCe2RfnalsYZlh1raT+J+hlOnLKlOLEFrU7ogy/+lfPkotL0bgKTRXyLc2FoP3r
	 KCJc47bVnKinr+kCpFO8Mtxpgq/dfHFHQGW16zuKMfWb8sbwrp0g4wq0lG0PpdBDiQ
	 K4coGuPcmP6wvWvTBwI+r40PcDOSAlPp9ypel1extK4lbio6uzHn+rs2hjY2TYsaOv
	 HrrfQczEa9KWhAf8JDDCSIYucYKGdawj5OM0BBE82WFtta3pCGxkRJkBQLKYTURsAe
	 MzaloccbeQboBAUqo3q8PkfLkwrikEf/qgyYa2QhAOADreidlipc1uTLUGJHDnpTF1
	 yqGpHAB2pOwbQ==
Date: Fri, 24 May 2024 19:24:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal
 zone definitions for MT8186 and MT8188
Message-ID: <20240524-concerned-fritter-262f5e16293e@spud>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nUnx8yrvH8DVkbj0"
Content-Disposition: inline
In-Reply-To: <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_112458_738571_B4B25FEC 
X-CRM114-Status: GOOD (  16.01  )
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


--nUnx8yrvH8DVkbj0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:04:34AM +0200, Julien Panis wrote:
> Use thermal zone names that make more sense.
>=20
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Removing the defines is an ABI break. If these are all the same devices,
but with more accurate naming, then keep the old defines and add new
ones. However, the GPU1 define changes in the course of this patch which
is more problematic.

Why do these names even make more sense? Where did the old names come
=66rom and where do the new?

Thanks,
Conor.

> ---
>  include/dt-bindings/thermal/mediatek,lvts-thermal.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/includ=
e/dt-bindings/thermal/mediatek,lvts-thermal.h
> index bf95309d2525..ddc7302a510a 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -24,7 +24,7 @@
>  #define MT8186_BIG_CPU1	5
>  #define MT8186_NNA		6
>  #define MT8186_ADSP		7
> -#define MT8186_MFG		8
> +#define MT8186_GPU		8
> =20
>  #define MT8188_MCU_LITTLE_CPU0	0
>  #define MT8188_MCU_LITTLE_CPU1	1
> @@ -34,11 +34,11 @@
>  #define MT8188_MCU_BIG_CPU1	5
> =20
>  #define MT8188_AP_APU		0
> -#define MT8188_AP_GPU1		1
> -#define MT8188_AP_GPU2		2
> -#define MT8188_AP_SOC1		3
> -#define MT8188_AP_SOC2		4
> -#define MT8188_AP_SOC3		5
> +#define MT8188_AP_GPU0		1
> +#define MT8188_AP_GPU1		2
> +#define MT8188_AP_ADSP		3
> +#define MT8188_AP_VDO		4
> +#define MT8188_AP_INFRA		5
>  #define MT8188_AP_CAM1		6
>  #define MT8188_AP_CAM2		7
> =20
>=20
> --=20
> 2.37.3
>=20

--nUnx8yrvH8DVkbj0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlDbbwAKCRB4tDGHoIJi
0pUoAP0dmBcOmsdDvQ5P4PIIeZXUssG4s57m1H3nSypoY8IHtwEA2+8PySEExvRJ
l+6ydH0nKFhDmkLEJ9IJUVAyimv5tAU=
=ozOf
-----END PGP SIGNATURE-----

--nUnx8yrvH8DVkbj0--

