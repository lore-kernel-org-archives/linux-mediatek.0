Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE0C25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 06:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REcXFj1jvmxST3/eKnOjNwhd4vCy4lJvRfHqJd6aeOY=; b=Yf3Q2Mu6Oms5seDPrKDHh+xkpj
	kg1tLrUlbK6UxuVh0bPbXGMWNgSmlfIde41TRzxIFmI9Mo7Kdw8GJJx2eGlvMGve9t2Pck9ca89O3
	Gflt2q7OB5iGPLN9qkR4gxStc5LgBF/D/4LGHUa+1f8X0hUaWRiDZD7JT3jmMKK92g4L8ngY5UQxJ
	Gb/DH+42GhmLOXRZ5cEuCx2GTz2smf5NqFL1Hkra3eYmo9p/XLTMiIA6UxTXv4p45lVZOvOxyx3Ol
	XPao70vC8DQ0SHwqGj8sihKniDTB1j53Tw4ZbYx143+XnHzz22MTW7KnVWICpjp2sQrFMucd1lhF9
	ejoVR+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCu0-000000031xF-2Vz5;
	Wed, 29 May 2024 06:35:12 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCtx-000000031vY-3J9w
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 06:35:11 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52b0d25b54eso276715e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 23:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716964506; x=1717569306; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REcXFj1jvmxST3/eKnOjNwhd4vCy4lJvRfHqJd6aeOY=;
        b=MOiXeBxji6jsiySOwGfPlJQginNGmsyEBzh/96mLJOcZJ2o+qEriR/xqdD4YIvS+yn
         VLGgV7x0jeldE8GAncHhKzteZUuSHRFdUW+jY+HzFkwv7bFh7wMJOxINFll5BnAXzV4p
         t5IL/FgasKaSvsdaZo2kDdHY8UKslaYvGGm8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716964506; x=1717569306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REcXFj1jvmxST3/eKnOjNwhd4vCy4lJvRfHqJd6aeOY=;
        b=BbsppAnwyTbd41I5fgbt7uFJeSR+p86Yb+RpIxh2VR+In5WyrB01sp0bqIau08AaXD
         5LQ7e3DZNgv078EK46i1M/eLElO7JAOvQHRvK+rpfxGLwDLOb2wdhX0SSDV/sCF0CARS
         XG00+j+O9dR3RbImYKbBp7qcqr5zUVgPhGnchdFuUCm91mEcjmeXDUCuZcvxeKTQ3GxN
         +njPYfVrGxGaRHG3uMN/tvF2zAv6J7snLBocIJPTA28Xselz+75ebeYBZMjUPotavI8Z
         Nsvy/E9XKiJ1RmBgOnabZbU4vIZnGvFNX2odX4LIp8pUbgoe08ohLSpxFSdD+LQg2KF/
         EVDQ==
X-Gm-Message-State: AOJu0YwDrDvbklr1Noy3grThv7x+8nowsZPqbimfbFQMccTlrcBBOGWR
	VvrIdz+DaHmm4XYtAT4qqpJaTVy/cYcQlnL5Kwkv8iUL2tPtKss4yPErCfb9QigE2HpvKByCiNH
	VjdhHVzcCR/CRHd2cfVBor5izWmg2z+zpKhfv
X-Google-Smtp-Source: AGHT+IHTNNEamwsxVCesbMDxuW/9Vtif5wDyv5vCIh2MQ47+8CNAg2+CXaNaCRrYs3jzJWGhnBhJJu0Kts+lF9cxTRc=
X-Received: by 2002:ac2:454e:0:b0:521:92f6:3d34 with SMTP id
 2adb3069b0e04-5296594cf46mr10050393e87.22.1716964506432; Tue, 28 May 2024
 23:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com> <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 May 2024 14:34:54 +0800
Message-ID: <CAGXv+5EbYBLt84Gx0mhTt9SqH8iMW87Y=_q=R2sHmJ4fygUQnQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8188: Add support for Mali
 GPU on Panfrost
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	mandyjh.liu@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, jpanis@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_233509_888611_F4EED546 
X-CRM114-Status: GOOD (  16.34  )
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

On Mon, May 27, 2024 at 5:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the necessary OPP table for the GPU and also add a GPU node
> to enable support for the Valhall-JM G57 MC3 found on this SoC,
> using the Panfrost driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 123 +++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index 0bca6c9f15fe..29d012d28edb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -294,6 +294,112 @@ clk32k: oscillator-32k {
>                 clock-output-names =3D "clk32k";
>         };
>
> +       gpu_opp_table: opp-table-gpu {
> +               compatible =3D "operating-points-v2";
> +               opp-shared;
> +
> +               opp-390000000 {
> +                       opp-hz =3D /bits/ 64 <390000000>;
> +                       opp-microvolt =3D <575000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-431000000 {
> +                       opp-hz =3D /bits/ 64 <431000000>;
> +                       opp-microvolt =3D <587500>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-473000000 {
> +                       opp-hz =3D /bits/ 64 <473000000>;
> +                       opp-microvolt =3D <600000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-515000000 {
> +                       opp-hz =3D /bits/ 64 <515000000>;
> +                       opp-microvolt =3D <612500>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-556000000 {
> +                       opp-hz =3D /bits/ 64 <556000000>;
> +                       opp-microvolt =3D <625000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-598000000 {
> +                       opp-hz =3D /bits/ 64 <598000000>;
> +                       opp-microvolt =3D <637500>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-640000000 {
> +                       opp-hz =3D /bits/ 64 <640000000>;
> +                       opp-microvolt =3D <650000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-670000000 {
> +                       opp-hz =3D /bits/ 64 <670000000>;
> +                       opp-microvolt =3D <662500>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-700000000 {
> +                       opp-hz =3D /bits/ 64 <700000000>;
> +                       opp-microvolt =3D <675000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-730000000 {
> +                       opp-hz =3D /bits/ 64 <730000000>;
> +                       opp-microvolt =3D <687500>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-760000000 {
> +                       opp-hz =3D /bits/ 64 <760000000>;
> +                       opp-microvolt =3D <700000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-790000000 {
> +                       opp-hz =3D /bits/ 64 <790000000>;
> +                       opp-microvolt =3D <712500>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-835000000 {
> +                       opp-hz =3D /bits/ 64 <835000000>;
> +                       opp-microvolt =3D <731250>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-880000000 {
> +                       opp-hz =3D /bits/ 64 <880000000>;
> +                       opp-microvolt =3D <750000>;
> +                       opp-supported-hw =3D <0xff>;
> +               };
> +               opp-915000000 {
> +                       opp-hz =3D /bits/ 64 <915000000>;
> +                       opp-microvolt =3D <775000>;
> +                       opp-supported-hw =3D <0x8f>;
> +               };
> +               opp-915000000-5 {
> +                       opp-hz =3D /bits/ 64 <915000000>;
> +                       opp-microvolt =3D <762500>;
> +                       opp-supported-hw =3D <0x30>;
> +               };
> +               opp-915000000-6 {
> +                       opp-hz =3D /bits/ 64 <915000000>;
> +                       opp-microvolt =3D <750000>;
> +                       opp-supported-hw =3D <0x70>;
> +               };
> +               opp-950000000 {
> +                       opp-hz =3D /bits/ 64 <950000000>;
> +                       opp-microvolt =3D <800000>;
> +                       opp-supported-hw =3D <0x8f>;
> +               };
> +               opp-950000000-5 {
> +                       opp-hz =3D /bits/ 64 <950000000>;
> +                       opp-microvolt =3D <775000>;
> +                       opp-supported-hw =3D <0x30>;
> +               };
> +               opp-950000000-6 {
> +                       opp-hz =3D /bits/ 64 <950000000>;
> +                       opp-microvolt =3D <750000>;
> +                       opp-supported-hw =3D <0x70>;
> +               };
> +       };
> +
>         pmu-a55 {
>                 compatible =3D "arm,cortex-a55-pmu";
>                 interrupt-parent =3D <&gic>;
> @@ -1167,6 +1273,23 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
>                         #clock-cells =3D <1>;
>                 };
>
> +               gpu: gpu@13000000 {
> +                       compatible =3D "mediatek,mt8188-mali", "arm,mali-=
valhall-jm";
> +                       reg =3D <0 0x13000000 0 0x4000>;
> +
> +                       clocks =3D <&mfgcfg CLK_MFGCFG_BG3D>;
> +                       interrupts =3D <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0=
>,
> +                                    <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       interrupt-names =3D "job", "mmu", "gpu";
> +                       operating-points-v2 =3D <&gpu_opp_table>;
> +                       power-domains =3D <&spm MT8188_POWER_DOMAIN_MFG2>=
,
> +                                       <&spm MT8188_POWER_DOMAIN_MFG3>,
> +                                       <&spm MT8188_POWER_DOMAIN_MFG4>;
> +                       power-domain-names =3D "core0", "core1", "core2";
> +                       status =3D "disabled";
> +               };
> +

This block no longer applies cleanly on the MTK tree because of
"arm64: dts: mediatek: mt8188: add lvts definitions" being applied.

ChenYu

>                 mfgcfg: clock-controller@13fbf000 {
>                         compatible =3D "mediatek,mt8188-mfgcfg";
>                         reg =3D <0 0x13fbf000 0 0x1000>;
> --
> 2.45.1
>
>

