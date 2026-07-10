Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A7AC43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cLlwZEogPH8ppzA7eKtjjQx1kbEb1QU1EG0qOLtAlg=; b=44LYwOr4d7GjrGaF2TJbRDVT2p
	dUjLEgJhLkp2Y8GjgA/q/S5hCIJ5rKKEQOCUpELjPHe5JYEGpAehujZg3+kMbj6PAY9+u5D3M0isY
	mtOSvh6+cGcWAQ5l5ylMB0gbNM4Czf5t0QXi9xV1kwu9emxH8H/iTVsr0z+G36prr+EnuUKwygJVU
	DYR7ZbVb+xWkwxfK/N9Yh40t7uL6Zh9HHdKhTe87RyUWU6IH6GGzuiVERZeSnM35ie2EGFP0wnh6c
	IIjPn3QG2EIJ1Dz9xKxKjoPsNJxAbPkXzQRWAvZPgsezx1mgC54hzk9WCcuDGrucPlGB5GWqfCl3f
	VcMRfFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCpY-000000059gY-2QD4;
	Fri, 10 Jul 2026 15:07:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCpW-000000059gK-2Tg5;
	Fri, 10 Jul 2026 15:07:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11D98404C6;
	Fri, 10 Jul 2026 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4BC1F000E9;
	Fri, 10 Jul 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696072;
	bh=6cLlwZEogPH8ppzA7eKtjjQx1kbEb1QU1EG0qOLtAlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TlV85tcm3GYPMXPMjJ+66ZJISSVznxL5YsvYORoXyMKNfpGO9kEJ+vcYK2O/28Ywq
	 CSwWSdQfw3petnzBz2bOF6kT5V2qZ+Cpq1U/fiXzitL0srT3PG0/XivHvEnZBJlOb5
	 O5HAxKguIrVzr9Qfvk50N8aOO2Fa58+z/SEgvBUj2E4+KTQ/F/geWfwT8oH9EHD5Ch
	 Yo+xiTD/3O9xyKVvM+axr7jlhQBrorsCR8tEuh0tZztoOKTzyTjllMQAgofly6YqiF
	 U/xp32ANtZ8iPq/jFGrQ75f/tkyTL7zfhs+LdQpi6EEg9oLLWVb8CxS2prKGzbSPXI
	 /HEcWg9kRGNLw==
Date: Fri, 10 Jul 2026 16:07:43 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Message-ID: <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
 <20260710050511.14439-23-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDwogXtsq8RsMi6d"
Content-Disposition: inline
In-Reply-To: <20260710050511.14439-23-phucduc.bui@gmail.com>
X-Cookie: Did I say I was a sardine?  Or a bus???
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


--BDwogXtsq8RsMi6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 12:05:09PM +0700, phucduc.bui@gmail.com wrote:

> @@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
>  		return 0;
> =20
>  	if (!slave->unattach_request) {
> -		mutex_lock(&rt712->disable_irq_lock);
> -		if (rt712->disable_irq =3D=3D true) {
> -
> -			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SD=
CA_0);
> -			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SD=
CA_8);
> -			rt712->disable_irq =3D false;
> +		scoped_guard(mutex, &rt712->disable_irq_lock) {
> +			if (rt712->disable_irq) {
> +				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
> +						SDW_SCP_SDCA_INTMASK_SDCA_0);
> +				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
> +						SDW_SCP_SDCA_INTMASK_SDCA_8);
> +				rt712->disable_irq =3D false;
> +			}
>  		}
> -		mutex_unlock(&rt712->disable_irq_lock);
>  	}

This function does also have some goto based unwinding, there's a
similar thing in the rt721 changes.

--BDwogXtsq8RsMi6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRCr4ACgkQJNaLcl1U
h9CpsQf/Zz5nqEo4Z/MJiZGvwJUID88/cEjWwK5VttpBJJMvdsC8J/zRa7/kWLDW
tunq+2S+S/kMBpXjJdL2CCowgGN/5C3YJps7AHBvu+ZZTskmSAPM4Bf83pTKYq9j
ADgruP/KcDzIn0D1ZDbFwOwIFVgLvTIqyTKftrvr+tTsJ8nXttcun+/3IJSoC+Ct
ds2sN+glOg48dkd2cgPn5j1CBirm71zV0iPHMW7yxOhC2nf8YgpvtG6BuTkDHzo9
8MfMTrqIll+jqK0KtkTcA6HEmlJ1AyNe2UJlb7XM+mFucpLmUESb7gCi7cAmsHBE
mXgSotbSmxQ4GmCFa/b0sJMtdgkAKA==
=oChm
-----END PGP SIGNATURE-----

--BDwogXtsq8RsMi6d--

