Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF158C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NByq/XY7HNN+63nhDG51R6BPfJBoFfuF4DdIi+B0zY=; b=18rp/ZEbrS62ep36fFioNEf5PP
	GKrKRAJGe+tFm7x2vMYXFa0pN/L3/4fD0RvTGnwBYq+jMyvnqEFIw0DL+xWQD6l+VQaC8/2rvGOpK
	WlUFnXNIJY0xQHR7aBjgbjMKwH6fDSdyqzPqOwZyF3nmYN5P0SsK9wQb4LI5tzpTo+7x73YRLqume
	7CitPurMbuYUV/8vLAv+JjwHko01edlDovqsp5qZ/yMCUcqtsYmycyjq5J8mdX7ig7nq3JlJ482aI
	VOWdhtKAPExQ2Fq39/TVO0j3XFN4K038VoB56lbDU8UgNOZZCFnfbcZrWfwVP+xolEI3jZV6ZNu/c
	p0Hguyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmueD-005xN3-2r;
	Thu, 13 Apr 2023 10:57:49 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmue8-005xMZ-39;
	Thu, 13 Apr 2023 10:57:46 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 630691C0AB3; Thu, 13 Apr 2023 12:57:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1681383463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4NByq/XY7HNN+63nhDG51R6BPfJBoFfuF4DdIi+B0zY=;
	b=OP3tJO10uxFNoGrUo7ycg/BUI2a8hZh8nfufufdzLLCLR3BjSpaw9r6HMVfMvJss4+gjLV
	V4LqulcOsKUUTKiBlkMr+UU00sKW3jXOVKI9SRYKlK1ERYSC4fssK8xttApr5JPMoKSckf
	zzYq7RSNix6B3gIu0LQS/RsFyZOKzAk=
Date: Thu, 13 Apr 2023 12:57:42 +0200
From: Pavel Machek <pavel@ucw.cz>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 3/7] leds: leds-mt6323: Specify registers and specs in
 platform data
Message-ID: <ZDfgJltWqKOVmYx+@duo.ucw.cz>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SZIsd6A40MlVknhE"
Content-Disposition: inline
In-Reply-To: <20230412153310.241046-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_035745_484976_A6E935FD 
X-CRM114-Status: GOOD (  17.91  )
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


--SZIsd6A40MlVknhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> In order to enhance the flexibility of this driver and let it support
> more than just one MediaTek LEDs IP for more than just one PMIC,
> add platform data structure specifying the register offsets and
> data that commonly varies between different IPs.
>=20
> This commit brings no functional changes.

> @@ -63,12 +61,9 @@
>  #define MT6323_ISINK_CH_EN_MASK(i)	BIT(i)
>  #define MT6323_ISINK_CH_EN(i)		BIT(i)
> =20
> -#define MT6323_MAX_PERIOD		10000
> -#define MT6323_MAX_LEDS			4
> -#define MT6323_MAX_BRIGHTNESS		6
> -#define MT6323_UNIT_DUTY		3125
> -#define MT6323_CAL_HW_DUTY(o, p)	DIV_ROUND_CLOSEST((o) * 100000ul,\
> -					(p) * MT6323_UNIT_DUTY)
> +#define MAX_SUPPORTED_LEDS		8
> +#define MT6323_CAL_HW_DUTY(o, p, u)	DIV_ROUND_CLOSEST((o) * 100000ul,\
> +					(p) * (u))
>

You increase number of supported leds from 4 to 8. That's ok, but I'd
not call it "no functional changes".

> +/**
> + * struct mt6323_regs - register spec for the LED device
> + * @top_ckpdn:		Offset to ISINK_CKPDN[0..x] registers
> + * @num_top_ckpdn:	Number of ISINK_CKPDN registers
> + * @top_ckcon:		Offset to ISINK_CKCON[0..x] registers
> + * @num_top_ckcon:	Number of ISINK_CKCON registers
> + * @isink_con:		Offset to ISINKx_CON[0..x] registers
> + * @num_isink_con:	Number of ISINKx_CON registers
> + * @isink_max_regs:	Number of ISINK[0..x] registers
> + * @isink_en_ctrl:	Offset to ISINK_EN_CTRL register
> + */
> +struct mt6323_regs {
> +	const u16 *top_ckpdn;
> +	u8 num_top_ckpdn;
> +	const u16 *top_ckcon;
> +	u8 num_top_ckcon;
> +	const u16 *isink_con;
> +	u8 num_isink_con;
> +	u8 isink_max_regs;
> +	u16 isink_en_ctrl;
> +};

I'd use ints here. Should get similar memory usage and maybe less code
size. But ... no need to resubmit just for this.

> @@ -469,8 +525,31 @@ static int mt6323_led_remove(struct platform_device =
*pdev)
>  	return 0;
>  }
> =20
> +static const struct mt6323_regs mt6323_registers =3D {
> +	.top_ckpdn =3D (const u16[]){ 0x102, 0x106, 0x10e },
> +	.num_top_ckpdn =3D 3,
> +	.top_ckcon =3D (const u16[]){ 0x120, 0x126 },
> +	.num_top_ckcon =3D 2,
> +	.isink_con =3D (const u16[]){ 0x330, 0x332, 0x334 },
> +	.num_isink_con =3D 3,
> +	.isink_max_regs =3D 4, /* ISINK[0..3] */
> +	.isink_en_ctrl =3D 0x356,
> +};
> +
> +static const struct mt6323_hwspec mt6323_spec =3D {
> +	.max_period =3D 10000,
> +	.max_leds =3D 4,
> +	.max_brightness =3D 6,
> +	.unit_duty =3D 3125,
> +};
> +
> +static const struct mt6323_data mt6323_pdata =3D {
> +	.regs =3D &mt6323_registers,
> +	.spec =3D &mt6323_spec,
> +};
> +

Acked-by: Pavel Machek <pavel@ucw.cz>

BR,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--SZIsd6A40MlVknhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZDfgJgAKCRAw5/Bqldv6
8gd5AJ4+DJSgpNKCU9EGNbQJ/CtP2l2oOACfbymovEDM04/2OKqt7Pm4An2jDcs=
=Yx0v
-----END PGP SIGNATURE-----

--SZIsd6A40MlVknhE--

