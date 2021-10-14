Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B74C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 15:33:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7949960ED4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 15:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7949960ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7bLsn+faXe0zxnW2vRGE5PhfI66nYpWwk4BQ3+jSI8=; b=lJdjC9X1cptAQU
	n9LUduM5MUt70MMXgcAgrdFxbP3A6ZVkQgqHOsZ0q/6YwpqGTEyjni40meO9umfaYnXNanrdkF9r1
	DkcAZBECjtEHtqPu8XLo3nG3FBtDQcl9FtCqZ94PcGn46N1BPGqoR2TWqjRuQxMyMtfQZsCZSCuPk
	aGm/zWyxYzBzMrO1jrhOGIB6o2abQ6czREgwIeUITaUSRo3A9O9bdLWCdEpjQ98zcHpXD/7qYGaou
	zpOAP7UTGu1GDqvW8/cHO/uEOFeefCTm+PUuBRGzMCKhja2ldbeYw+hmlIH7pxv0YaXgYy07nooUk
	OqNQcGftrHQRm3ojLxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb2j0-003gJM-7y; Thu, 14 Oct 2021 15:32:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb2ii-003gEB-R3; Thu, 14 Oct 2021 15:32:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id y3so20870542wrl.1;
 Thu, 14 Oct 2021 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iE/MtUVPAfoMVFLe0BXKKnnsIlilqyTpauMIjvCAd0A=;
 b=QuoKls4ob5V7G/zDS4y5xc0zYlQmDCZKj9bYDfrblv4udCW8q1yts8pi/Jjm1dO3Fu
 E5U1GUDm4ra3ewyBLuu+0D4rwAEKG68Mmb/IGY7LhAE0IZiWbRDC8wVq+LRT6dn5f1On
 1bvC3inOUu5YFtD/GcwyELXzb9aLiExswCnVsSMXoZ4ELaVi794vso5ZVd47IjM4i3Bf
 ILXWW+lPl3P/SSOI2OmLq/5ZWohImz1VmkFIW11WyWo9048EnNAW0x/rztf5A92ZLmW5
 chk6xTwEYJUQHLFL9/MZ2mAxB7VN/v80RdrJlYd+Q+N+a3NKV9rqqfzGffSpQPQNhmx5
 2fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iE/MtUVPAfoMVFLe0BXKKnnsIlilqyTpauMIjvCAd0A=;
 b=EuuLyhcZDxf8hwNTyzlLWour2cuGmASkVuaj5HQTFX6ZV3DSSzQO+HHvj7aZmJy2pK
 1ecT5oJoCjJPp2JBdbSo/vYwflOjzgHV57xgIpgNPlClk6uez3TcMA9t4DVoNOXEyfGR
 H+TRBXbHdICTzSFHQ891KM7tsCiVQ9jAdaEgioWRjvMKybm8f3eLFJkA/CVI2y18g4Ap
 zv3wMoa7BIiwtxWPrTVrsyAyofJ2P0oIQ/ItcCIibaJfj9xfhZDtXF75L3Ha0TpXVAoh
 Ma0DP9+yrVr8aeK1WjRg0FmptqgF5n2EQWjZmhy8v9upWtDzPCMiKh+WRPnyrkqAhVfr
 5Huw==
X-Gm-Message-State: AOAM532Do6bZjtxm54UY7o1HWTO9So3pRbDP7SvVR3lBMUtMN7KhFjxH
 nEH+mKQnvOLsV0qk7f4gbqc=
X-Google-Smtp-Source: ABdhPJyOk2ECVUNy43amtlSABt9O2pdQxjs72C1Nu7v3KW3Eul1e5U1a0tGmGLCVF7PRiLVRQHk9iw==
X-Received: by 2002:a1c:a712:: with SMTP id q18mr6520597wme.23.1634225555417; 
 Thu, 14 Oct 2021 08:32:35 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com.
 [2001:67c:2178:4000::1111])
 by smtp.gmail.com with ESMTPSA id m4sm3005600wrz.45.2021.10.14.08.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:32:35 -0700 (PDT)
Message-ID: <632e8d11-269c-d329-abf4-5d462aac4df4@gmail.com>
Date: Thu, 14 Oct 2021 17:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v6 3/3] arm64: dts: mediatek: add basic mt7986b support
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20211014074403.17346-1-sam.shih@mediatek.com>
 <20211014074403.17346-4-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211014074403.17346-4-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_083236_964298_A1EBC7C4 
X-CRM114-Status: GOOD (  20.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/10/2021 09:44, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986b, include
> basic uart nodes, rng node and watchdog node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v6: separate basic part into a single patch series
> v5: follow reviewr's comment: removed clock freqency node in timer due to
>      we have set CNTFRQ_EL0 in ATF firmware, and also corrected GICD range
> v4: added missing gic register bases, and fixed range of GICR
> v3: used the stdout-path instead of console=ttyS0
> v2: modified clock and uart node due to clock driver updated
> ---
>   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  26 ++++
>   arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 149 +++++++++++++++++++
>   3 files changed, 176 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index e6c3a73b9e4a..d555e43d1ccc 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> new file mode 100644
> index 000000000000..95a202505bb2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include "mt7986b.dtsi"
> +
> +/ {
> +	model = "MediaTek MT7986b RFB";
> +	compatible = "mediatek,mt7986b-rfb";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon=uart8250,mmio32,0x11002000 swiotlb=512";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};

We are missing a memory node here. I wonder how the board was able to boot 
without memory. Did you test this series?

Regards,
Matthias

> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> new file mode 100644
> index 000000000000..2b8e0a382398
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "mediatek,mt7986b";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	system_clk: dummy40m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <40000000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x1>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x2>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			#cooling-cells = <2>;
> +		};
> +	};
> +
> +	psci {
> +		compatible  = "arm,psci-0.2";
> +		method      = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon_reserved: secmon@43000000 {
> +			reg = <0 0x43000000 0 0x30000>;
> +			no-map;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x10000>,  /* GICD */
> +			      <0 0x0c080000 0 0x80000>,  /* GICR */
> +			      <0 0x0c400000 0 0x2000>,   /* GICC */
> +			      <0 0x0c410000 0 0x1000>,   /* GICH */
> +			      <0 0x0c420000 0 0x2000>;   /* GICV */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		watchdog: watchdog@1001c000 {
> +			compatible = "mediatek,mt7986-wdt",
> +				     "mediatek,mt6589-wdt";
> +			reg = <0 0x1001c000 0 0x1000>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			#reset-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		trng: trng@1020f000 {
> +			compatible = "mediatek,mt7986-rng",
> +				     "mediatek,mt7623-rng";
> +			reg = <0 0x1020f000 0 0x100>;
> +			clocks = <&system_clk>;
> +			clock-names = "rng";
> +			status = "disabled";
> +		};
> +
> +		uart0: serial@11002000 {
> +			compatible = "mediatek,mt7986-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11002000 0 0x400>;
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&system_clk>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11003000 {
> +			compatible = "mediatek,mt7986-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11003000 0 0x400>;
> +			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&system_clk>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt7986-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&system_clk>;
> +			status = "disabled";
> +		};
> +
> +	};
> +
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
