Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DBC7EE24
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWRIv7ahwL+JVt40YGh2V+e+QRGkb/3rzTT1hhmniWo=; b=L23U/kzJmxmMvvU+h0yXqkCiXa
	PJIhBqjSXhWvOARIGkvmqSC+iwfQ1t3Rn4di/7xBLNj1gLOrjlgr7jY+C8aeR6i4zSzwIPqGlFlUK
	xPS8OxXnSBx3NYEL6asTZZCY91RFy8R56+pIVnPNcg0WUKt//RVJVPEWU1ShQ+HR+t4IaYt8Grwcw
	98d9bxZ+vmFmGktCWj376g/qsiOaJkrnlCf0IcsEt0rMFw2hDzR3ONofnoIcMJdfEubCYTVORbwlG
	bL2oXR3scVh12PHxsz50o9GsEXnMYUhBrRwnRWara8+6xMcHLNQyXZPV+9sgL8ajbCm9L1qgnYPL+
	Zd0kVSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GWJ-00GUnL-0m;
	Wed, 31 May 2023 07:45:23 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GWF-00GUle-2s
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 07:45:22 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7872d7b79e1so877747241.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 00:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685519118; x=1688111118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWRIv7ahwL+JVt40YGh2V+e+QRGkb/3rzTT1hhmniWo=;
        b=JHcGb3jqfdzeEPXj3RBeei+OqeOA4cy537d2XrfvMglw1E//7aPkV7C1Rf57VQrraV
         Fr6FBCsz3VhF3QiR3PaMMHxq0WrBrXuD0DQqmMqwWMr3NJZw76ILzOPXRpeYanlPBzoG
         bEw/PQDaQQiGd9H4j7jbuT61Dg49CyT/34Qwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519118; x=1688111118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWRIv7ahwL+JVt40YGh2V+e+QRGkb/3rzTT1hhmniWo=;
        b=ZWBf7bnjF+V2L2gJWFo/dtOCsF2bqYZl6iQMgbOMYqRLQGI8rO3Yo1xcQh/nY1W2Ln
         uBO3Ao5AiEVHs86NE95gAGLxw7/Ga90G8TG3SgyRImNEKwKuoEhCaYSl1Jvm2lvYE3WQ
         6SfKqn6F4/rVFKnIaAT7/oO5Fyx7+829lDUV/acpVVISwdrAy4gxYjaFmeUMGur87YMq
         XZD551Oy8aWPBB5f9mGfUyrv9SaSKq4vdepmbGyC0c/sDHNMZhpXbGHvbQ/YhNU1os8u
         uXfVsh8GSWrfC4awLSJlPxnSipxnxQduNqOP6B5Kii4UHp+/GlOM9AnRuMPuMzloHUp4
         ezXw==
X-Gm-Message-State: AC+VfDx46H4SVnEbiGydnfsgEQ2C4jQ/dRa1r1Cih+BKnrCgOx7c/adS
	/Os62bZyOH6fHuEHAnsnxp5NrcyUbox2IJhbXJIwlg==
X-Google-Smtp-Source: ACHHUZ6yCTtFZ55WQ/KfJtVO0V1vLqGmehSeEHzWpEOQlxEK0cS7uF4ewxo8rtL7EZyMT4ejaOmPFCtP8oonb1HbHCo=
X-Received: by 2002:a05:6102:3015:b0:437:df4f:ac81 with SMTP id
 s21-20020a056102301500b00437df4fac81mr1624221vsa.29.1685519118389; Wed, 31
 May 2023 00:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230530195132.2286163-1-bero@baylibre.com> <20230530195132.2286163-5-bero@baylibre.com>
In-Reply-To: <20230530195132.2286163-5-bero@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 31 May 2023 15:45:07 +0800
Message-ID: <CAGXv+5H5uqy362Ums3Se-bwgdDvHsfiZUUOW1g4i1-krKLaq0A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: mediatek: mt8192: Add thermal nodes
 and thermal zones
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com, 
	nfraprado@collabora.com, abailon@baylibre.com, amergnat@baylibre.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_004519_930059_BF3A6717 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, May 31, 2023 at 3:51=E2=80=AFAM Bernhard Rosenkr=C3=A4nzer <bero@ba=
ylibre.com> wrote:
>
> From: Balsam CHIHI <bchihi@baylibre.com>
>
> Add thermal nodes and thermal zones for the mt8192.
> The mt8192 SoC has several hotspots around the CPUs.
> Specify the targeted temperature threshold to apply the mitigation
> and define the associated cooling devices.
>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> [bero@baylibre.com: cosmetic changes, reduce lvts_ap size]
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 454 +++++++++++++++++++++++
>  1 file changed, 454 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index 65bc8b4046211..82d6629e38c26 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -14,6 +14,8 @@
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8192-power.h>
>  #include <dt-bindings/reset/mt8192-resets.h>
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
>
>  / {
>         compatible =3D "mediatek,mt8192";
> @@ -71,6 +73,7 @@ cpu0: cpu@0 {
>                         d-cache-sets =3D <128>;
>                         next-level-cache =3D <&l2_0>;
>                         capacity-dmips-mhz =3D <530>;
> +                       #cooling-cells =3D <2>;

FYI these changes (for all the CPU cores) will conflict with the cpufreq
patch that Matthias just merged.

ChenYu

