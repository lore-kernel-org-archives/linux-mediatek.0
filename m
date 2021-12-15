Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF50AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WbTQhDVLBZlgidk5ynNNfywoecvGn7nOTMoqq/OecE=; b=sVgXg3th/sJzVx
	x1lUDBFozBsjlHwu+DFfgAr8rXUpAQhPJMe8JgEn4inMFPpObVtb+kK/DNCnsJa8rD2zMSIEbmbSB
	AM5ndjtUWZWi3lSu3WfKWesad6dbLCofovWqWb9TTFDQvmCp3+ZjVr1Cc3+xeH3UxExdQ44Phu5vx
	yLdQsFrEyKfIjmmJDJM63hoCLeu2P9KNGjOUtq+NARCr71h+ahh12HMje2v6PX8sHP8zlRNekDQ3r
	T8ybq+XqoJmvKMxfIqx9JECXvq6Y9DTQM+8Jm4U8XHlmKaFV4rlj5uaTn0tF1PX0nfXe0I7mk+Oi2
	S6asaMRKzNPaQeFWI3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZzb-002PvO-KZ; Wed, 15 Dec 2021 19:31:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZzP-002Pse-9O; Wed, 15 Dec 2021 19:31:01 +0000
Received: by mail-wr1-x434.google.com with SMTP id e5so6582149wrc.5;
 Wed, 15 Dec 2021 11:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y4KYZYbmHmOnFAGiPJsnb/ToH7SegH1Iwoa7ADMxpfw=;
 b=FYtYiM9oyvpPmWHENImMI3pw3mwC0F0efmMKLKouZACetLXHkw1XeSDfAj/OmizJ4b
 XW+lxdwNl0kQe7hYp17Tck/EBCOm5+jnzpbgICjSA0okX16MYe25UBBlS+lZxyRUpahL
 Meyag30sUR8gWfnMtKcv67W9qUkWQC2FpM4SZuFkprrhC7UgWJ3yof777/IVUGSC2dBO
 4X8b04+lDVHeVKYFshCNt2xb/Yjc2PPHUHD5ABhPt6P2sNZEsC6qHq3+ka6O54pWtg9b
 6m7MabQl8gECdoxTxiHYBSE1e3A6uhS9d++mHV5+EuKEA+zaIGp4GK2hYj2VQTE1BcJu
 fhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y4KYZYbmHmOnFAGiPJsnb/ToH7SegH1Iwoa7ADMxpfw=;
 b=ndHXUoApZX1+gSBD+nQ9WZ8QyDTVnmBk1vxcZERbHYDylZdeAnkygLqUhL7LopnUa7
 FvYnjjez4gRp2fZz6ev3C42/ITEbXpRPjg1P2OIUfBdcNXY4OG2x0et/pv9+OXnAewmL
 8NAtE9IoSoPbMUaAdCcKa9lyG9RRWvT22PJR/VwIglto4qdc3PRwz6MNqgTZRvuJ8xkj
 MXAjHzx5PbmQ1VZGh4dj17EiQgaYiyTrnEXwaGiwnVwKme8jeG8qhFaKkITX1U1lokTT
 VVOqDGsPOxiBqbngoOOP8vqvrNlg1w40LD0vR3HLdCDqht0DvMlAdzEWJSTmS593Jz05
 28hw==
X-Gm-Message-State: AOAM532S4C38pKfeQfywcy08lBPfacEMhMRByCMxRyWiLDf40LrYjhxX
 XE7Jj6qOcw3CtWjbwSpZOnA=
X-Google-Smtp-Source: ABdhPJyEek4ofghq1j1jzRaQfwQ9jMNIMvRSegM3Lv8m7+3vrwCSh83lUg1yJBVvl6CoA2lcnZgcSg==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr5587022wrt.689.1639596657651; 
 Wed, 15 Dec 2021 11:30:57 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id d16sm2891177wrv.111.2021.12.15.11.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 11:30:57 -0800 (PST)
Message-ID: <4ba7d0ff-3715-8ec1-91c7-26da23ea1709@gmail.com>
Date: Wed, 15 Dec 2021 20:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 2/2] arm64: dts: mediatek: add basic mt7986 support
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20211122123222.8016-1-sam.shih@mediatek.com>
 <20211122123222.8016-3-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211122123222.8016-3-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_113059_378172_F587B50E 
X-CRM114-Status: GOOD (  19.21  )
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



On 22/11/2021 13:32, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986, include
> basic uart nodes, rng node and watchdog node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 

Applied to v5.16-next/dts64

Thanks!

> ---
> v8: removed debug bootargs
> v7: added memory node back to dts
> v6: removed clock and pinctrl node, to separate basic part into a single
>      patch series
> 
> Original thread:
> https://lore.kernel.org/all/20211004124155.1404-1-sam.shih@mediatek.com/
> 
> v5: follow reviewr's comment: removed clock freqency node in timer due to
>      we have set CNTFRQ_EL0 in ATF firmware, and also corrected GICD range
> v4: added missing gic register bases, and fixed range of GICR
> v3: used the stdout-path instead of console=ttyS0
> v2: modified clock and uart node due to clock driver updated
> ---
>   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  37 +++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 148 +++++++++++++++++++
>   3 files changed, 186 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 4f68ebed2e31..e6c3a73b9e4a 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> new file mode 100644
> index 000000000000..6911862390d7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include "mt7986a.dtsi"
> +
> +/ {
> +	model = "MediaTek MT7986a RFB";
> +	compatible = "mediatek,mt7986a-rfb";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory {
> +		reg = <0 0x40000000 0 0x40000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> new file mode 100644
> index 000000000000..77906839cc85
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -0,0 +1,148 @@
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
