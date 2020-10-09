Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1A9C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4906522284
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uoLsYgop";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asqqtzCC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4906522284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nWWot/UNSOdU7j5Ky/zlR8GdfAWT/y1UX76uPXShihI=; b=uoLsYgopMiKEPoydKwJkYUAE4
	Vzd9pQKJs4V79pqkxQjPWKyKGffdtXNXgQAQe0xvHEnzp9f3OVouHy8SB694uMBodP5V/PkiYh/h9
	efhazFjqkoA0qD3vDGJGnwW7N2YPaKiKd5tIQCMl65jnC2TvH/O+8LNLhJ0YdnKPZxFagcjQ8eid4
	5eK8lG+6pXTd96rcoHx7gIbicqVeZm0q+q40oX2bUkebmugQITaHGyuJhNTamvXcsHn5dHFV8Mxt0
	2gpLMiqXYfE6myD+AE4FPLhoTLNiimnGCwo0fhyzpgPkTib10iattpw1EjB1mk8PRVgG84Fu3FL33
	bqEJvgFWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQrXl-0000ak-QE; Fri, 09 Oct 2020 12:30:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQrXk-0000ZQ-Dc; Fri, 09 Oct 2020 12:30:41 +0000
Received: by mail-wm1-x344.google.com with SMTP id d3so9682850wma.4;
 Fri, 09 Oct 2020 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AjmLoetTBObgHXL/i47jeS5ZhvM7sMIdDP4emaMus2g=;
 b=asqqtzCCpWEdFlVVTjiylkeSMp0o1bvIQI1aTOejkiv0XRQUikw9PJN/MKjI6asZC4
 hyDbAFwnS6XAJQ3fc6MoHgDFbSvoAj+NcMiv5Fe4ouKyQlqIBrSwYJGfN9Ul1lFjtXf5
 hdgDBdtiNoR7+IPO7RZprzb+AJjnUNVmzomWZxxs+P/xd5trJwWgez1D1n1tUry9rWpy
 cGcrPblqZzSIcDgG1WIC22eOQndILpt41GaWZGVB9NKz9Wi7Ye8+zFFb48a/pTV38eb8
 Yf5+zkNxaNa2dF7rDlLNTamuoBL7Z/oY9vzJWillNUZHzbglT98WHy3qhWab7KRXPsI3
 Ti/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AjmLoetTBObgHXL/i47jeS5ZhvM7sMIdDP4emaMus2g=;
 b=RAhwTYqG5lDhqBmriw+5z9ML2LVCIBpp/nI9v3T0uW1ixviWpJt3ylKGdaOy8qGk2t
 IbYPxiW0S5qsFkuKPPl4mvHSqOEB6Bg0NzZvoXoCowp6H7Gazpi1tT3uTu8JcIguiiJf
 znRsUKNHsEP3UGc4LGkdJHvPItFQA1p7/sf7WBEtTCSvG10Lr56ABHkKmg5ZmN4Etlfe
 Viho19Wd4bRM90cIQle3jK7lmRZprykOaBZpl8KdW8rEpEU7OoW3GECfpAzk9OjEXs2Q
 sjUKZRNq9GaKWa2E8VmdszlYfp2iIVR5xJHXk1VW434CDooA6rQolPWTus+mOzq5anGD
 FjCA==
X-Gm-Message-State: AOAM531HKPzKhINraVP+75cbTDfVFHXUmgGAdHb6PREsrHwhM5HWxull
 wYOuQC7vj82/l2BavFCzH5/faAWEghIWjg==
X-Google-Smtp-Source: ABdhPJw2Lo8s/yFUlcr8c49/Uewddu9hg079ybrqHjIVWx/YC2AQC7mQhXGMF07QF5gYM3+VLdtnQw==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr1120408wme.116.1602246637515; 
 Fri, 09 Oct 2020 05:30:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id t124sm12301997wmg.31.2020.10.09.05.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 05:30:36 -0700 (PDT)
Subject: Re: [PATCH v10 2/3] arm64: dts: add dts nodes for MT6779
To: Hanks Chen <hanks.chen@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <847f64e2-8ed6-2e09-5343-2aa70d5937fa@gmail.com>
Date: Fri, 9 Oct 2020 14:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_083040_466577_8D44B0B1 
X-CRM114-Status: GOOD (  23.10  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Loda Chou <loda.chou@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/07/2020 15:30, Hanks Chen wrote:
> this adds initial MT6779 dts settings for board support,
> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a57af9da9f5c..4d1b0f9d8d1c 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> new file mode 100644
> index 000000000000..164f5cbb3821
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + */
> +
> +/dts-v1/;
> +#include "mt6779.dtsi"
> +
> +/ {
> +	model = "MediaTek MT6779 EVB";
> +	compatible = "mediatek,mt6779-evb", "mediatek,mt6779";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x1e800000>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> new file mode 100644
> index 000000000000..370f309d32de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/mt6779-clk.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/mt6779-pinfunc.h>
> +
> +/ {
> +	compatible = "mediatek,mt6779";
> +	interrupt-parent = <&sysirq>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x000>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x100>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x200>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x300>;
> +		};
> +
> +		cpu4: cpu@4 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x400>;
> +		};
> +
> +		cpu5: cpu@5 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x500>;
> +		};
> +
> +		cpu6: cpu@6 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75";
> +			enable-method = "psci";
> +			reg = <0x600>;
> +		};
> +
> +		cpu7: cpu@7 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75";
> +			enable-method = "psci";
> +			reg = <0x700>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
> +	};
> +
> +	clk26m: oscillator@0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <26000000>;
> +		clock-output-names = "clk26m";
> +	};
> +
> +	clk32k: oscillator@1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "clk32k";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@0c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <4>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
> +			      <0 0x0c040000 0 0x200000>; /* GICR */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 \
> +						&cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +
> +		};
> +
> +		sysirq: intpol-controller@0c53a650 {
> +			compatible = "mediatek,mt6779-sysirq",
> +				     "mediatek,mt6577-sysirq";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			reg = <0 0x0c53a650 0 0x50>;

This looks a bit suspicious to me. Unfortunately I'm not able to find any 
reference in the datasheets.

Anyway, patch now applied to v5.10-tmp/dts64

Thanks!
Matthias

> +		};
> +
> +		topckgen: clock-controller@10000000 {
> +			compatible = "mediatek,mt6779-topckgen", "syscon";
> +			reg = <0 0x10000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		infracfg_ao: clock-controller@10001000 {
> +			compatible = "mediatek,mt6779-infracfg_ao", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pio: pinctrl@10005000 {
> +			compatible = "mediatek,mt6779-pinctrl", "syscon";
> +			reg = <0 0x10005000 0 0x1000>,
> +			      <0 0x11c20000 0 0x1000>,
> +			      <0 0x11d10000 0 0x1000>,
> +			      <0 0x11e20000 0 0x1000>,
> +			      <0 0x11e70000 0 0x1000>,
> +			      <0 0x11ea0000 0 0x1000>,
> +			      <0 0x11f20000 0 0x1000>,
> +			      <0 0x11f30000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "gpio", "iocfg_rm",
> +				    "iocfg_br", "iocfg_lm",
> +				    "iocfg_lb", "iocfg_rt",
> +				    "iocfg_lt", "iocfg_tl",
> +				    "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 210>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		apmixed: clock-controller@1000c000 {
> +			compatible = "mediatek,mt6779-apmixed", "syscon";
> +			reg = <0 0x1000c000 0 0xe00>;
> +			#clock-cells = <1>;
> +		};
> +
> +		uart0: serial@11002000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11002000 0 0x400>;
> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11003000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11003000 0 0x400>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		audio: clock-controller@11210000 {
> +			compatible = "mediatek,mt6779-audio", "syscon";
> +			reg = <0 0x11210000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: clock-controller@13fbf000 {
> +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt6779-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: clock-controller@15020000 {
> +			compatible = "mediatek,mt6779-imgsys", "syscon";
> +			reg = <0 0x15020000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: clock-controller@16000000 {
> +			compatible = "mediatek,mt6779-vdecsys", "syscon";
> +			reg = <0 0x16000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: clock-controller@17000000 {
> +			compatible = "mediatek,mt6779-vencsys", "syscon";
> +			reg = <0 0x17000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: clock-controller@1a000000 {
> +			compatible = "mediatek,mt6779-camsys", "syscon";
> +			reg = <0 0x1a000000 0 0x10000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: clock-controller@1b000000 {
> +			compatible = "mediatek,mt6779-ipesys", "syscon";
> +			reg = <0 0x1b000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +	};
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
