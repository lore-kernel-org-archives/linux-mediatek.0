Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194DAC44521
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=; b=PxdvDkWb8F1wtx36d5Hp3igvzt
	PxbV2tXoJLRe+HW/HCJxByYMMcpn/QIroyn2dGtYv+38A7csbu1bD8FwUAhKDMCiFFJ4ksZopvOT/
	zRgoVZvZoBmIx5vekdVoyRp+xsq7MCVs5WiimhyTSAbh5BUu+Ch8oWhW1IiOybYtlMfBYjz1GXT9t
	GwrCt9XLdKZKrrXGPN294ZVI9SdCf7i7d/Bf0FKi7kX9Au9ztTbM2PJHm5pa8fW8w1MiRFcPWUVCd
	a2PtRG95GAvJ+CBtsTYRMhFPCS2JWcgPedP+BwBw+NbJJ3/kvsPSotnpVg3y2sUbt7GVpOk8THWmd
	AKicy01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlirs-0000000696P-2lzX;
	Mon, 20 Jul 2026 07:56:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlirr-0000000695e-1MSV
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=; b=XhJrHAVNJMyV+wrkn9SK36hkpY
	CY4RKzAEdn+MCuKkiYOSklyoE1ph1GbPLBamMMBQrmfb3uh4OdS67XnjaTJcQcoC9ONDqSdyP8Sa0
	G2mOZaMaepzn3sMJMrIT776Ki9GOUqPAQKXPjXRBZmT9ZKnbYGQRRT70dJugt2RRePW+ZYwJHgEwc
	c7TzoYApj11GgPGQJEsxhv71zN1vH1CVuNntFb/cBXoj8qO+yTTXsoWbQVanAvjp3giVpxkehzjtq
	9YhmM+nr+GNsPCzMj8hxZvSuuGGQi2ggSLDRcMHOeKIrrG8VfSXen6Y7Ss44uah1qSA+Oac/eaHi6
	SeQN9mcA==;
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlirm-0000000GMZ1-3jZB
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 07:56:50 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-80e24970f1dso48415387b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 00:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784534204; cv=none;
        d=google.com; s=arc-20260327;
        b=iK42iZtgPcOQYdQChBud6Z5pZr0+ogbIH0d/GMhN2ZStY64+roG6O5mGdKjc8zyroa
         ZValMfTi82p7QnCcsIH/kc9mlJ4iZX2mk+HsgYUSbEtG2heUpVQ88azEuVUQrLV6H+oi
         RazQsotth+ra106AvrBXqf6IEJV8IxjdUZE+AIg6Q94X8kDzcXgMNIqRWNG/9eCVWNH6
         3hwipJjA+vRVmtPSjm1VIE7T7hEDA/OsoT0dz1BqN17hJDEWvGmbXni56p7L1r7GxAXA
         F4arWM0riteTLdK+n00r4tVI1DNZayqn5y7UiPvaPd4X1KqcCFJ3Ds90b826sdSa0LfL
         bu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=;
        fh=IDoEMXsURCsEitYJw/MfyP0rsCktu9y51NdX/ApQSFM=;
        b=o2jra7sVS/A3fio++tZIQOGy7WAyVRnhC5jTmmux0gF/jOB6VaReFksgYzWD5IH3s5
         yabz2JGViMheoqhFP8CVn0mHHIk8u4l8Qjo9Lkn5clzq0OOc8l+Rn2pveVnlLE7TGy0W
         0PXZL/Fyy39XB5aKFv6BExXJjFLyh2tJGTdtAgY4iSwMhjvNbG+1m0zvMCF6rDo37D+Y
         gPv1XKBf+nIC9F6h5SMCopGPszigD/DEBjA9QfdH/t7YAMh+IvQQtSlNiNw1HXjschlt
         YaQ4+5C3pXGoc+YGIW0KS0PX59HBypy9+WTvKIj6zmDBPe1uzkimvDKvQAJhB2HL0YHn
         LDeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784534204; x=1785139004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=;
        b=IJ3Le+CjQdiQxnczQTn17Gy9UjGL6zYeN11ii+XMmDnUmCMcZEyT9lLYw8Pe8LSEfA
         yEFOOj96mc7E0H0Hva+cXedfudt5YoVCxJMAHzbCyFiHMhO9xYj8lMCQy57W9u2KpVmv
         3ybsrBVg3+yVI9dQkQ/JRGbw9O+wQpT0zisus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534204; x=1785139004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOk0UVNRw5/GaLj4qQsKJ3hC+F4oor+v94A2S3FZbFw=;
        b=TrR7xBhx7c2iAFTc/dJyDaLVPdZ/qu1IWmklBpcJDBE4TSTFNaWcez9ZRomcOUoGJE
         fcPmAG8SNmydLC4liYcy/YvCmjRUytaD7KDP4VYGSCIvmBucpujkrBIYeCFUZAY3MnDU
         qR0P/ZT12rwk64cfmhSsIC7ig6GtVSk3sgqvb73AUp1eBHTBzmDYNc5Jhob91TAcArmV
         gUGUzEFytlx3p3wIZvBw+Ilj1FoGfbGK7NOogvZ1Fe+gHyqxW69+pJC8WAIou5/pF4EL
         nDejO5eETV1S/wnj4kkJrKLqZShRtbogdha7ZmPO3cyg2piZDMpHvwE3ZB7HXbKEbVQU
         aUpw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4zTHDhm/lJ/dJEYpNY1KUVAh2FFR6RoV7QyJ/+qrcY1dQfdXWvHYld2Sb2FZJlpdRiA+MO8v8joeX+o7QiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBmwAncxuUvpRWsleY4iZ30CpW054fxkZNZCdMK4EwXveVHKhy
	DwRqkDfqFqx1IcaR8YfvDISLZuHomMgA3aIZeL23CDq3oA6l7wgC9JNdoYPWTVl87+DWodWGRQD
	xZddcBvl/MAi/hYlUuaFIrHh5sXvrWZ3u36bf9tcn
X-Gm-Gg: AR+sD13n17jAT2jDFr+oBVYMXztOJATIuW3n+GkSvgjZvf/8yRvvqlJjDJUNWjABRH0
	5U+YifhpIzPF0MDigPcP/csmegr00bgtbV8lAUArcU7wTapH1Lms+eZR1dn5dsai2Wbt+92l4ww
	GPiAQtgwasZmdQ5+QLFL/u+xY3XO2/AGQRFNm7NhL/hVrk6sj2YoJePX3mLAhkcmZqiFUA7bMLj
	nm+x7JSEVkR1MbMr5RZ3SgNxFGDS4yppoVRm43QWP311Nh8VEwz4AVfABHfKaazP9Z5fTfH7Utl
	1p+dtlpD+MGe8fq7
X-Received: by 2002:a05:690c:22c3:b0:7db:a109:f12f with SMTP id
 00721157ae682-81ef22c8c66mr39077937b3.1.1784534204236; Mon, 20 Jul 2026
 00:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
In-Reply-To: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jul 2026 15:56:33 +0800
X-Gm-Features: AUfX_mzig1MDLgHbJy7nor9Z4O8-sZf9ZnQXEm-6mq0XRTnwakXA39D5hmxWyiY
Message-ID: <CAGXv+5GpGfA+hBADn69eNEetP_zR+Xmt3fMhyapK3SsaEa=DFQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6358: use regmap helper to read fixed LDO calibration
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_085647_126638_1FF6FA15 
X-CRM114-Status: GOOD (  20.47  )
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

On Sat, Jul 18, 2026 at 9:06=E2=80=AFAM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> The "fixed" LDOs with output voltage calibration use
> mt6358_get_buck_voltage_sel as their get_voltage_sel op, but the
> MT6358_REG_FIXED and MT6366_REG_FIXED entries do not populate
> da_vsel_reg/da_vsel_mask. The op therefore reads register 0x0 with a
> zero mask and shifts the result by ffs(0) - 1 =3D -1, which is undefined
> behaviour and gets flagged by UBSAN on every boot on MT6366 boards:
>
>   UBSAN: shift-out-of-bounds in drivers/regulator/mt6358-regulator.c:384:=
38
>   shift exponent -1 is negative
>   Call trace:
>    mt6358_get_buck_voltage_sel+0xc8/0x120
>    regulator_get_voltage_rdev+0x70/0x170
>    set_machine_constraints+0x504/0xc38
>    regulator_register+0x324/0xc68
>
> Besides the undefined shift, the returned selector is always 0, so the
> actual calibration offset programmed in <reg>_ANA_CON0 is never
> reported.
>
> The descriptor already carries the correct vsel_reg/vsel_mask (the
> ANA_CON0 calibration field), matching the regulator_set_voltage_sel_regma=
p
> op already in use. Read the selector back through
> regulator_get_voltage_sel_regmap instead.
>
> Fixes: cf08fa74c716 ("regulator: mt6358: Add output voltage fine tuning t=
o fixed regulators")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Chen-Yu Tsai <wens@kernel.org>

I guess I wasn't looking hard enough when I did the original patch.
I can confirm that after this patch, the fixed LDOs like vxo22 on
Juniper reads out as 2.24V instead of 2.2V (and then gets corrected
down to 2.2V by the kernel).

> ---
>  drivers/regulator/mt6358-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6=
358-regulator.c
> index f2bb3c1523ca..d6a0ec406b07 100644
> --- a/drivers/regulator/mt6358-regulator.c
> +++ b/drivers/regulator/mt6358-regulator.c
> @@ -492,7 +492,7 @@ static const struct regulator_ops mt6358_volt_fixed_o=
ps =3D {
>         .list_voltage =3D regulator_list_voltage_linear,
>         .map_voltage =3D regulator_map_voltage_linear,
>         .set_voltage_sel =3D regulator_set_voltage_sel_regmap,
> -       .get_voltage_sel =3D mt6358_get_buck_voltage_sel,
> +       .get_voltage_sel =3D regulator_get_voltage_sel_regmap,
>         .set_voltage_time_sel =3D regulator_set_voltage_time_sel,
>         .enable =3D regulator_enable_regmap,
>         .disable =3D regulator_disable_regmap,
> --
> 2.55.0

