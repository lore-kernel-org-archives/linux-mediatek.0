Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DD5C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 457EC206D9
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 09:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J81NyOoE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVfaQaUj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 457EC206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hlCCBhIqm5zLU4EjErNUhGjjX9OwFt36zh3PbLRor8E=; b=J81NyOoE6DongtRnHAy4RWBZV
	eRXi+7OXFgpQyTrLpy8Iak0FRRhgw4Kt5KnrtLjciAwmEoEEiOD1KuQ5nwQ5y/4s80C6p2f10fTvz
	3SIQdqlAXZxSjj0+AVw4XFaGjfpx6Gmud8uvqQkxJW5NNOsvGUg93po4y7Ln2BOr1iygx4l0GzE9u
	u919PbvqsjdxGP5fM0fgkEVHTMV3GuYGLHnAy8dyuDETUZfT7lCXYo7IU1z3mtNQEkAjiDEy+oryD
	96u2tvMFT1xZG2KdUhgmblf14Tt5HqB6RU11bP5waXOVN9JwYOCJdU78pKmffimN3rokmB0erfBhz
	gK+YIT6eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiZze-0006Iz-CP; Fri, 27 Nov 2020 09:24:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiZzX-00069w-7n; Fri, 27 Nov 2020 09:24:40 +0000
Received: by mail-wr1-x442.google.com with SMTP id e7so4825287wrv.6;
 Fri, 27 Nov 2020 01:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TIHNs2GCeQWtlcPBhiv542SJCg5rhkfjqyPQIpq3Npw=;
 b=UVfaQaUj9uWSxyanGu1u/pnZJZQoqHPxQQgOuOlnOlvl35inf2f7hcADMSvv47L8NP
 HfUTW6x+f8gd8nL6pXs9qkboeM8cR3xUGyABQJe1hADnaiPC6rw4clnY/wEoI4MsldG8
 Mu3ZbjLAo4vsxRsZvOYl4P9ZpxokP5pDEcRzpObA0Ozb8wlBuWRbx/kylEwrWUqFdwra
 wRpNpVe3e63c12PibIkPkKkWrihgFRY7ETBN0FMhOjuiCBZp+cVtiaExezNjIztPPDoM
 E8BXivi2xyFS0Kmx9TFBBnrNcKWsZmLNmSvRrVxaVoTTLkQRknGric0u9aw20voEYgcP
 KT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TIHNs2GCeQWtlcPBhiv542SJCg5rhkfjqyPQIpq3Npw=;
 b=Dk3C0zOuQjQlrtE5LkgAadWzco/qFkibygPMbfnZCbYzHmxuayTwJfD/q3bVZ9S0SY
 dbWbaTJISOM3AXORqe0Chdfw2snKFKxcEjL2VKhk4OYFIldkP3KH1hkadSl19M5Z25AC
 jrYgk1dpNZfA3HVBpVrqcwirBIPIXafPT7ocPPRtkxVh5N1xY4f6C0GoU68yBB2fDgip
 Fg/DcG1s/+8Tm/yCkkUjdUMSS3DJprRId/vWvc31gvatCX8RmK47QDSi4fCNnheLq22l
 i7s8pc3CnQJBqW6ouQJK7b15YQXvm5iwbs4+TMI37aUeB9LvAFk3zjXrc0eQwP43GZ+e
 KA8w==
X-Gm-Message-State: AOAM532RjGjpJ75yR7SQgJcu/HPty7aAgcAiiSx6bqCyRK6ltcjdI+ly
 7J6ZBTFF3J2l6SEJVRQXJb0=
X-Google-Smtp-Source: ABdhPJy3NJTewi3dwihToMgNQNzGTeQNixurlFUPAf6QHtSP04nGO03KdOjfQy1xYkwJ9Eim9WNC4A==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr8857302wrn.190.1606469073543; 
 Fri, 27 Nov 2020 01:24:33 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id a1sm13693423wrv.61.2020.11.27.01.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 01:24:32 -0800 (PST)
Subject: Re: [PATCH v6 1/1] arm64: dts: Add Mediatek SoC MT8192 and evaluation
 board dts and Makefile
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
References: <20201030092207.26488-1-seiya.wang@mediatek.com>
 <20201030092207.26488-2-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d88bfec1-7246-74f5-dfcf-1f2267826c3b@gmail.com>
Date: Fri, 27 Nov 2020 10:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201030092207.26488-2-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_042438_003557_173AB48C 
X-CRM114-Status: GOOD (  21.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/10/2020 10:22, Seiya Wang wrote:
> Add basic chip support for Mediatek MT8192
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  29 ++
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 512 ++++++++++++++++++++++++++++
>   3 files changed, 542 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi

Applied to v5.10-next/dts64

Thanks!

> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 3ee682c266cc..b431ee2d6cac 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -12,4 +12,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> new file mode 100644
> index 000000000000..0205837fa698
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + * Author: Seiya Wang <seiya.wang@mediatek.com>
> + */
> +/dts-v1/;
> +#include "mt8192.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8192 evaluation board";
> +	compatible = "mediatek,mt8192-evb", "mediatek,mt8192";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x80000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> new file mode 100644
> index 000000000000..e12e024de122
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -0,0 +1,512 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + * Author: Seiya Wang <seiya.wang@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +
> +/ {
> +	compatible = "mediatek,mt8192";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clk26m: oscillator0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <26000000>;
> +		clock-output-names = "clk26m";
> +	};
> +
> +	clk32k: oscillator1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "clk32k";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x000>;
> +			enable-method = "psci";
> +			clock-frequency = <1701000000>;
> +			next-level-cache = <&l2_0>;
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			clock-frequency = <1701000000>;
> +			next-level-cache = <&l2_0>;
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			clock-frequency = <1701000000>;
> +			next-level-cache = <&l2_0>;
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			clock-frequency = <1701000000>;
> +			next-level-cache = <&l2_0>;
> +			capacity-dmips-mhz = <530>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a76";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +			clock-frequency = <2171000000>;
> +			next-level-cache = <&l2_1>;
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a76";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +			clock-frequency = <2171000000>;
> +			next-level-cache = <&l2_1>;
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a76";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +			clock-frequency = <2171000000>;
> +			next-level-cache = <&l2_1>;
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a76";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +			clock-frequency = <2171000000>;
> +			next-level-cache = <&l2_1>;
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +				core2 {
> +					cpu = <&cpu6>;
> +				};
> +				core3 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		l2_0: l2-cache0 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l2_1: l2-cache1 {
> +			compatible = "cache";
> +			next-level-cache = <&l3_0>;
> +		};
> +
> +		l3_0: l3-cache {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
> +	};
> +
> +	pmu-a76 {
> +		compatible = "arm,cortex-a76-pmu";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clock-frequency = <13000000>;
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
> +			#interrupt-cells = <4>;
> +			#redistributor-regions = <1>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,
> +			      <0 0x0c040000 0 0x200000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
> +				};
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		pio: pinctrl@10005000 {
> +			compatible = "mediatek,mt8192-pinctrl";
> +			reg = <0 0x10005000 0 0x1000>,
> +			      <0 0x11c20000 0 0x1000>,
> +			      <0 0x11d10000 0 0x1000>,
> +			      <0 0x11d30000 0 0x1000>,
> +			      <0 0x11d40000 0 0x1000>,
> +			      <0 0x11e20000 0 0x1000>,
> +			      <0 0x11e70000 0 0x1000>,
> +			      <0 0x11ea0000 0 0x1000>,
> +			      <0 0x11f20000 0 0x1000>,
> +			      <0 0x11f30000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
> +				    "iocfg_bl", "iocfg_br", "iocfg_lm",
> +				    "iocfg_lb", "iocfg_rt", "iocfg_lt",
> +				    "iocfg_tl", "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 220>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		systimer: timer@10017000 {
> +			compatible = "mediatek,mt8192-timer",
> +				     "mediatek,mt6765-timer";
> +			reg = <0 0x10017000 0 0x1000>;
> +			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>;
> +			clock-names = "clk13m";
> +		};
> +
> +		uart0: serial@11002000 {
> +			compatible = "mediatek,mt8192-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11002000 0 0x1000>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11003000 {
> +			compatible = "mediatek,mt8192-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11003000 0 0x1000>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		spi0: spi@1100a000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x1100a000 0 0x1000>;
> +			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@11010000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11010000 0 0x1000>;
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi2: spi@11012000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11012000 0 0x1000>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi3: spi@11013000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11013000 0 0x1000>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi4: spi@11018000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11018000 0 0x1000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi5: spi@11019000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11019000 0 0x1000>;
> +			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi6: spi@1101d000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x1101d000 0 0x1000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi7: spi@1101e000 {
> +			compatible = "mediatek,mt8192-spi",
> +				     "mediatek,mt6765-spi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x1101e000 0 0x1000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c3@11cb0000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11cb0000 0 0x1000>,
> +			      <0 0x10217300 0 0x80>;
> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c7@11d00000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11d00000 0 0x1000>,
> +			      <0 0x10217600 0 0x180>;
> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c8@11d01000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11d01000 0 0x1000>,
> +			      <0 0x10217780 0 0x180>;
> +			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c9: i2c9@11d02000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11d02000 0 0x1000>,
> +			      <0 0x10217900 0 0x180>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c1@11d20000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11d20000 0 0x1000>,
> +			      <0 0x10217100 0 0x80>;
> +			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c2@11d21000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11d21000 0 0x1000>,
> +			      <0 0x10217180 0 0x180>;
> +			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c4@11d22000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11d22000 0 0x1000>,
> +			      <0 0x10217380 0 0x180>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c5@11e00000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11e00000 0 0x1000>,
> +			      <0 0x10217500 0 0x80>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c0: i2c0@11f00000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11f00000 0 0x1000>,
> +			      <0 0x10217080 0 0x80>;
> +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c6@11f01000 {
> +			compatible = "mediatek,mt8192-i2c";
> +			reg = <0 0x11f01000 0 0x1000>,
> +			      <0 0x10217580 0 0x80>;
> +			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;
> +			clock-names = "main", "dma";
> +			clock-div = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +	};
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
