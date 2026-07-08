Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35485C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 06:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=; b=33dIg9EEfSF44AV0Yi65zsFCYG
	5HMN6NhydWMi7tP9w9MO0Ltef/IzfkYPeJ36u9ldT1j89c+XBA2hmo6p2P+ocYLmendmgZMHQvp7M
	QFmaaVMLej9EiyJtE36I2EGyo5O5s9NZD+n6oEIGQD6a/ncx8zZvmkfZD+FWw3vwyiwlf2OxR55d9
	X+SJYA2tLhWkzAzHvETanr26QQx7CiT67fhnHQM/9FoGuNHi/rsd7pao+M7R8cL4dVALbhl3SPpOg
	FFVCeljmzNl4EG29cRAwF7ZK1AAmtuBnqseemCtHv269QhxEhF2dpVloDIqCObbda0Ob7EJJN11zX
	nTLWD2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLfk-0000000GOyE-4350;
	Wed, 08 Jul 2026 06:22:16 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLfh-0000000GOxX-39K4
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 06:22:15 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-664bb15d05dso349141d50.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 23:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783491732; cv=none;
        d=google.com; s=arc-20260327;
        b=Yh5GMrRTlX3Yfd+fb5I317HPU7OXDCsrYBw8RogJyCzgsH9QyokEf/BXP38/RYxu3D
         +jD/TXgi1df+HfPsXyZneUyeXJtFjwvVHOsTP/L9Th8nnA3di1/XN+OW6Vm1iCICVXqY
         ixOaPeFv8w/iCG+b/qosfDvQGzTSaQ455DiEM2gRGDGyQWO5R6mQrSYqu1FDEmJq0Z1T
         NlojOfj9f1IjJqo7LS1r42AdUnO8HjWxq4h5prQebVDw7S5+l2maB1593wPwXpIkYcH7
         fkK2CpT1I1UglmPlYd1tAPttoo6w4/OOB6/Ledn69iAbT7dh2kbLVWoPnMDj0+ogtUMG
         QUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        fh=w9gFdoPHGrsg2ApZ338c3sZ1DF8m2vMmAouMi1mKjJc=;
        b=BoyB0XbS1CxpBuHbVmMdg1CLA1z6jSRYLRaIzHTvt8tV5Zv97UW3KBHchcSCiAFQyO
         doyVuF6Niwxu93xsbRsWYq10ymL+aVDL+pvcRnJscAu8/hd5wBODaXa7leCHwV2fat7s
         7JJeBoTD8K7waIxVO1R2vn3OS5lY6OzCXhFmYhyMuCwdISP46QZmquBoWGiuAgTbkj3G
         rLldYRkNXnbCRAhbOUb3jXsJF4jl2PzlHsXDnJTZBHQwifYgjnDFzR+n5Z/E5M8xwECX
         1uq+FXQoZknfrzE0Qduppqmv2oKRJ2GEVUpf3NY1uw6YmIDclXIxdxdAQ+vhLjEjWekK
         y7Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783491732; x=1784096532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        b=UTmMs2FLc2EBrUotfblVDsMIZDXJi4BejbxUTd5MOCo2V3+0ux1hRhjVRd2XJvUvfs
         /wxXZMJMdsBs08Vcp2fx3nK4zB6mwAC63+Irv4XID4YOLECtnqThWo4ZWuP3kHXiDtlj
         IYJlgbR4SNg4Xg6c81PJcW4VMc+cj7MLc5pWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491732; x=1784096532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        b=Hsh5qbUAf0mBZUe8bjVIRHaQnwXNp8yftZphKWyM64WScCd+9KCSpNj2rknfJb55cD
         DPVs5ihiQhyNWsLGmxMMnGCjR0TGcXV7QxiqwVUWydIkeKveA/8qsw/zs5GD3fEqzJ6/
         1L+ppFnBfTwBAtDC1CYawbTmyTXdadKWUgaiwBizZxcP6XLPt40jiIN7V9AHzbDO185a
         A+9xdLGuCQq2E60tkWJxTFVXS4tLuOmaDBpI9/UyTJqFANOUEbaDYHcdD4IG+X7UdnFc
         UXgUR22EHeD7kHaaZrUQxkK9obiLkhGT882TrEGqSD2FfoZVExkE4Lfb+21ma177hrY4
         ukCg==
X-Forwarded-Encrypted: i=1; AHgh+Rrz+un/7XkIkwq5mgcbzzTWDUNVMPiXTfu+oNT2I92kkhlx/1AmGV9v1VJsm05fGywIi4VrIQqdscX0SPRJ6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3aKKCsPxLqFybHrEJlrPYCceMkOr83dXYioZ8Oyewnwnlyc72
	oWtkkQPrVTpZc8YxqOH7BXwAD9oCmkOP4gSUQIJ14wk2/mG1a6i2u9Q3D835hBh92pv+0QxNyKR
	fUK9ugSKN6ha5eClcPu5BQWIfP8EtICFIXn3Ta+xX
X-Gm-Gg: AfdE7ckiVudM8H9nkLmz+PDZSnb79GdRsPb9NNI7a8toQHyhK8JV0r5iEUZKIybaZbZ
	48EGCcAQ7lfr+ODyI8f4Wo1miSV+DaMafNpqbVIMNe9Zm3bFGUmjOVTFZaxEW0rD0z2D4zF7S9N
	0CGnTr7yV7iIGSXXR/ICyG3rK9AiXnilVK3uFCk0Dd0fCWBMnurCXg2EbrPPNQe/ZPQ0UCtXNq1
	tjaULNxAQqqIixuXby+pS5TDq5Z9DQday/qI8uywRB6o6bIE1YJAW5aI6pnxl6eL4U441yEoWwu
	+LjtyJbV2m+cp663ozXYYvB7jgQ=
X-Received: by 2002:a05:690e:4841:b0:666:2480:2b0a with SMTP id
 956f58d0204a3-6679f201176mr697881d50.50.1783491732443; Tue, 07 Jul 2026
 23:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 14:22:01 +0800
X-Gm-Features: AVVi8CeA6CFM4kR5Bt4fLtWwaGoE3MK5l8ZS1mrdHaGZI7ndDG_5d5ZiXOKEMvU
Message-ID: <CAGXv+5F9RPzKWTH1heDEUmWgE2k9mnvdj_uLO9MS5aKqN+3cDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: add Genio 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_232213_840117_F7BA1448 
X-CRM114-Status: GOOD (  22.25  )
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

On Thu, Jul 2, 2026 at 12:36=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Add support for MediaTek MT8189 SoC and its variants, and a devicetree
> for the basic hardware enablement of the Genio 720-EVK board, based on
> MT8391 SoC.
>
> MT8391 SoC is a variant of MT8189 SoC with a difference for the Arm
> Cortex-A78 CPU core maximum frequency (2.6 Ghz for MT8391, 3 Ghz for
> MT8189). MT8391 hardware register maps are identical to MT8189.
>
> The Genio 720-EVK board has following features:
>   - MT8391 SoC
>   - MT6365 PMIC
>   - MT6319 Buck IC
>   - MT6375 Charger IC
>   - 8GB LPDDR5 RAM
>   - 64GB eMMC 5.1
>   - 128GB UFS
>   - 20V DC Jack
>   - USB Type-C Power Adapter
>   - Micro SD card slot
>   - Push Button x 4 (Power, Reset, Download and Home Key)
>   - LED x 3 (System Power, Reset, DC-IN Power)
>   - USB Type-C Connector (USB 3.2) x 2
>   - USB Type-C Connector (USB 2.0) x 1
>   - 3.5mm Earphone Jack x 1 (with Microphone Input)
>   - 3.5mm Line Out Audio Jack x 1
>   - Analog Microphone x 1
>   - Digital Microphone x 2
>   - Gigabit Ethernet with RJ45 connector
>   - DP x 1 (Mode over USB Type-C)
>   - LVDS port x 1
>   - eDP port x 1
>   - UART x2 with serial-to-usb converters and USB Type-C connectors
>   - UART Port x 2 on Pin Header
>   - M.2 Slot x 2
>   - I2C Capacitive Touch Pad
>   - 4-Lane DSI x 1
>   - 4-Data Lane CSI x 2
>   - I2S Pin header
>   - 40-Pin 2.54mm Pin Header x 1
>   - CAN Bus x 1 (RS232 Connector)
>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
>  arch/arm64/boot/dts/mediatek/mt8189.dtsi           | 920 +++++++++++++++=
++++++
>  .../boot/dts/mediatek/mt8391-genio-720-evk.dts     |  27 +
>  .../boot/dts/mediatek/mt8391-genio-common.dtsi     | 673 +++++++++++++++
>  4 files changed, 1621 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/=
mediatek/Makefile
> index a86fb313b1a9..5c75ea1ef09a 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -173,6 +173,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-genio-1200-ev=
k-ufs.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-genio-700-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-grinn-genio-700-sbc.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-tungsten-smarc.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8391-genio-720-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-kontron-3-5-sbc-i1200.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8189.dtsi
> new file mode 100644
> index 000000000000..272b1b34c953
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
> @@ -0,0 +1,920 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <dt-bindings/clock/mediatek,mt8189-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/power/mediatek,mt8189-power.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +/ {

[...]

> +       soc {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +               dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
> +
> +               performance: performance-controller@108d78 {
> +                       compatible =3D "mediatek,cpufreq-hw";
> +                       reg =3D <0 0x00108d78 0 0x120>, <0 0x00108e98 0 0=
x120>;
> +                       #performance-domain-cells =3D <1>;
> +               };
> +
> +               gic: interrupt-controller@c000000 {
> +                       compatible =3D "arm,gic-v3";
> +                       reg =3D <0 0xc000000 0 0x40000>, /* distributor *=
/
> +                             <0 0xc040000 0 0x200000>; /* redistributor =
*/
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
> +                       #redistributor-regions =3D <1>;
> +
> +                       ppi-partitions {
> +                               ppi_cluster0: interrupt-partition-0 {
> +                                       affinity =3D <&cpu0 &cpu1 &cpu2 &=
cpu3 &cpu4 &cpu5>;
> +                               };
> +
> +                               ppi_cluster1: interrupt-partition-1 {
> +                                       affinity =3D <&cpu6 &cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               apdma: dma-controller@11300b00 {
> +                       compatible =3D "mediatek,mt8189-uart-dma", "media=
tek,mt6985-uart-dma";
> +                       reg =3D <0 0x11300b00 0 0x80>,
> +                             <0 0x11300b80 0 0x80>,
> +                             <0 0x11300c00 0 0x80>,
> +                             <0 0x11300c80 0 0x80>,
> +                             <0 0x11300d00 0 0x80>,
> +                             <0 0x11300d80 0 0x80>,
> +                             <0 0x11300e00 0 0x80>,
> +                             <0 0x11300e80 0 0x80>;
> +                       interrupts =3D <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0=
>,
> +                                    <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks =3D <&peri_ao CLK_PERAO_DMA_B>;
> +                       clock-names =3D "apdma";
> +                       dma-requests =3D <8>;
> +                       #dma-cells =3D <1>;
> +               };
> +
> +               auxadc: adc@11019000 {

The .dtsi file's device nodes should be sorted by base address.
This file's device node order is inconsistent.


ChenYu

