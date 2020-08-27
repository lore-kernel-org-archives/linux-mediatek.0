Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD299C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:20:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF8620738
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 08:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtoenEsL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDvv88ye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DF8620738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qh2Bpt14KfcwSRgIgzt8t4i3vC05ESAMRsq9U0YhuA0=; b=rtoenEsL72nxbIGSls5wavlqi
	pibmMGM57/8dEQS1km80V2G8H27e6beoHVYzRM16l/xCzQDsyHTaIGz9DAWfTZeFD290qXc+hXJzk
	5mNzkQNwRe0zW+dr15OTYrrUR3jRJiSPzHTZx4q1wkpvgerYA2vztQ5qv25igMqdg0a96q3lkOqcq
	9i7Wcc6qKxYeB/GN33Ed/xKNmeLagAYaNUhb5NgZhTlbBnzbfiFtPdh+05W22/kjhkIEFApixQSki
	6hdmdDPsoWjHXSr+l2O2/oQq2uClJzVadE3QiI2OU07y1/K5AW+KMV7RnL13ec0GngdicudR2Z5gk
	KjxLORiLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBD8u-0000mb-A3; Thu, 27 Aug 2020 08:20:20 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBD8r-0000lg-FA; Thu, 27 Aug 2020 08:20:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id f7so4477382wrw.1;
 Thu, 27 Aug 2020 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I8aoxgojlTAwesb6xOwCww2FI/7WLwpEkMEc06OSWRE=;
 b=sDvv88yea+EJLlaSJOOLGx4Um5zqEyzuDBsxny1K9ssukhB8MUVgkSnJG+fhUlCKMC
 DefIK69r39cusRTbSpd4APY6/D824GEFUs3nMjhVrUnP9nKFTjj2X5WoO5SobHH0zJgB
 epxZJfzNF+sVrsmONg++N/nk2/HQoelX5boy1LXcvcwrelxwkzk2yB/yZMxWiK2fNQxZ
 wfWIlsOa6K/ctkmkOmtviGgH07FqkP+TnJ0TZCvPeMY1m87EqvrcaCHkdj8bpbu6E19U
 BUxKlNtIlyVxDg3wZ+iFQag0oOwSdfK1pz5WY2e1RXc0KSzBKQuT8T0IZ5XagcGEJlzc
 /fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I8aoxgojlTAwesb6xOwCww2FI/7WLwpEkMEc06OSWRE=;
 b=kU85kZz4JDomxsZJVB/eFE45nQTsx0FT+aA7OnbIRFFB9Wr7gYLcfdM04DuPHyuJv+
 S5wJWw2VGL2cPPrWIfpMJ7BBCe8+CqI4iK5dcAx8DBTaSPjUptv0C5uHBd/cOB/OlJ2g
 op4AFhwjVd6gquWU8Lsfm7YzbbfLLuBS6b5LDy+xxZCiiRGSH7xwOPXTbCUvyuRMYkO6
 Ht5y9Cyp14wRZjoHVelxQEScxY8CekagFXOnlS9yp2Di8XnPHGK7pU0UbqDWEffKVc9f
 7qJr5N43vkb3eqWDsvvZCG5Vc1oGJYfTooiS7V1DwAG5/SWcGws4bWUrI4YNzUa4Wltb
 5Ong==
X-Gm-Message-State: AOAM531ql0goJrIL6NfmeaLnWx2x74uK8cpAbHJhTqqEHl3gT6cccrCR
 3qFa35ixFaunBHAzRy5Kskw=
X-Google-Smtp-Source: ABdhPJxTVv1Fg9DxwDaUW8EJK7csYimWudLT8js8kA6xgwFRevYUn0zc8J3j7OuxHEOKVrLp8bbP5g==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr18321117wrv.47.1598516416121; 
 Thu, 27 Aug 2020 01:20:16 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id f17sm4777078wru.13.2020.08.27.01.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 01:20:15 -0700 (PDT)
Subject: Re: [PATCH v10 2/3] arm64: dts: add dts nodes for MT6779
To: Hanks Chen <hanks.chen@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
 <1596594249.11014.1.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3648b63d-7521-fdfd-831e-6851fe555ca5@gmail.com>
Date: Thu, 27 Aug 2020 10:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596594249.11014.1.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042017_575778_75605936 
X-CRM114-Status: GOOD (  22.77  )
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
 Stephen Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Loda Chou <loda.chou@mediatek.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 05/08/2020 04:24, Hanks Chen wrote:
> Hi Matthias and all,
> 
> Gentle ping on this patch.
> 

I'm fine with the patch. I'm waiting on the clk part to be accepted, then I'll 
take this one.

Regards,
Matthias

> Thanks
> 
> 
> Hanks Chen
> 
> On Thu, 2020-07-30 at 21:30 +0800, Hanks Chen wrote:
>> this adds initial MT6779 dts settings for board support,
>> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
>>
>> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>>   3 files changed, 303 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>> index a57af9da9f5c..4d1b0f9d8d1c 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>> new file mode 100644
>> index 000000000000..164f5cbb3821
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>> @@ -0,0 +1,31 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (c) 2019 MediaTek Inc.
>> + * Author: Mars.C <mars.cheng@mediatek.com>
>> + *
>> + */
>> +
>> +/dts-v1/;
>> +#include "mt6779.dtsi"
>> +
>> +/ {
>> +	model = "MediaTek MT6779 EVB";
>> +	compatible = "mediatek,mt6779-evb", "mediatek,mt6779";
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type = "memory";
>> +		reg = <0 0x40000000 0 0x1e800000>;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:921600n8";
>> +	};
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
>> new file mode 100644
>> index 000000000000..370f309d32de
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
>> @@ -0,0 +1,271 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (c) 2019 MediaTek Inc.
>> + * Author: Mars.C <mars.cheng@mediatek.com>
>> + *
>> + */
>> +
>> +#include <dt-bindings/clock/mt6779-clk.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/pinctrl/mt6779-pinfunc.h>
>> +
>> +/ {
>> +	compatible = "mediatek,mt6779";
>> +	interrupt-parent = <&sysirq>;
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	psci {
>> +		compatible = "arm,psci-0.2";
>> +		method = "smc";
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x000>;
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x100>;
>> +		};
>> +
>> +		cpu2: cpu@2 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x200>;
>> +		};
>> +
>> +		cpu3: cpu@3 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x300>;
>> +		};
>> +
>> +		cpu4: cpu@4 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x400>;
>> +		};
>> +
>> +		cpu5: cpu@5 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a55";
>> +			enable-method = "psci";
>> +			reg = <0x500>;
>> +		};
>> +
>> +		cpu6: cpu@6 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a75";
>> +			enable-method = "psci";
>> +			reg = <0x600>;
>> +		};
>> +
>> +		cpu7: cpu@7 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a75";
>> +			enable-method = "psci";
>> +			reg = <0x700>;
>> +		};
>> +	};
>> +
>> +	pmu {
>> +		compatible = "arm,armv8-pmuv3";
>> +		interrupt-parent = <&gic>;
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
>> +	};
>> +
>> +	clk26m: oscillator@0 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <26000000>;
>> +		clock-output-names = "clk26m";
>> +	};
>> +
>> +	clk32k: oscillator@1 {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <32768>;
>> +		clock-output-names = "clk32k";
>> +	};
>> +
>> +	timer {
>> +		compatible = "arm,armv8-timer";
>> +		interrupt-parent = <&gic>;
>> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
>> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
>> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
>> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
>> +	};
>> +
>> +	soc {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		compatible = "simple-bus";
>> +		ranges;
>> +
>> +		gic: interrupt-controller@0c000000 {
>> +			compatible = "arm,gic-v3";
>> +			#interrupt-cells = <4>;
>> +			interrupt-parent = <&gic>;
>> +			interrupt-controller;
>> +			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
>> +			      <0 0x0c040000 0 0x200000>; /* GICR */
>> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
>> +
>> +			ppi-partitions {
>> +				ppi_cluster0: interrupt-partition-0 {
>> +					affinity = <&cpu0 &cpu1 \
>> +						&cpu2 &cpu3 &cpu4 &cpu5>;
>> +				};
>> +				ppi_cluster1: interrupt-partition-1 {
>> +					affinity = <&cpu6 &cpu7>;
>> +				};
>> +			};
>> +
>> +		};
>> +
>> +		sysirq: intpol-controller@0c53a650 {
>> +			compatible = "mediatek,mt6779-sysirq",
>> +				     "mediatek,mt6577-sysirq";
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +			interrupt-parent = <&gic>;
>> +			reg = <0 0x0c53a650 0 0x50>;
>> +		};
>> +
>> +		topckgen: clock-controller@10000000 {
>> +			compatible = "mediatek,mt6779-topckgen", "syscon";
>> +			reg = <0 0x10000000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		infracfg_ao: clock-controller@10001000 {
>> +			compatible = "mediatek,mt6779-infracfg_ao", "syscon";
>> +			reg = <0 0x10001000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		pio: pinctrl@10005000 {
>> +			compatible = "mediatek,mt6779-pinctrl", "syscon";
>> +			reg = <0 0x10005000 0 0x1000>,
>> +			      <0 0x11c20000 0 0x1000>,
>> +			      <0 0x11d10000 0 0x1000>,
>> +			      <0 0x11e20000 0 0x1000>,
>> +			      <0 0x11e70000 0 0x1000>,
>> +			      <0 0x11ea0000 0 0x1000>,
>> +			      <0 0x11f20000 0 0x1000>,
>> +			      <0 0x11f30000 0 0x1000>,
>> +			      <0 0x1000b000 0 0x1000>;
>> +			reg-names = "gpio", "iocfg_rm",
>> +				    "iocfg_br", "iocfg_lm",
>> +				    "iocfg_lb", "iocfg_rt",
>> +				    "iocfg_lt", "iocfg_tl",
>> +				    "eint";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			gpio-ranges = <&pio 0 0 210>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		apmixed: clock-controller@1000c000 {
>> +			compatible = "mediatek,mt6779-apmixed", "syscon";
>> +			reg = <0 0x1000c000 0 0xe00>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		uart0: serial@11002000 {
>> +			compatible = "mediatek,mt6779-uart",
>> +				     "mediatek,mt6577-uart";
>> +			reg = <0 0x11002000 0 0x400>;
>> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
>> +			clock-names = "baud", "bus";
>> +			status = "disabled";
>> +		};
>> +
>> +		uart1: serial@11003000 {
>> +			compatible = "mediatek,mt6779-uart",
>> +				     "mediatek,mt6577-uart";
>> +			reg = <0 0x11003000 0 0x400>;
>> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
>> +			clock-names = "baud", "bus";
>> +			status = "disabled";
>> +		};
>> +
>> +		uart2: serial@11004000 {
>> +			compatible = "mediatek,mt6779-uart",
>> +				     "mediatek,mt6577-uart";
>> +			reg = <0 0x11004000 0 0x400>;
>> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
>> +			clock-names = "baud", "bus";
>> +			status = "disabled";
>> +		};
>> +
>> +		audio: clock-controller@11210000 {
>> +			compatible = "mediatek,mt6779-audio", "syscon";
>> +			reg = <0 0x11210000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		mfgcfg: clock-controller@13fbf000 {
>> +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
>> +			reg = <0 0x13fbf000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		mmsys: syscon@14000000 {
>> +			compatible = "mediatek,mt6779-mmsys", "syscon";
>> +			reg = <0 0x14000000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		imgsys: clock-controller@15020000 {
>> +			compatible = "mediatek,mt6779-imgsys", "syscon";
>> +			reg = <0 0x15020000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		vdecsys: clock-controller@16000000 {
>> +			compatible = "mediatek,mt6779-vdecsys", "syscon";
>> +			reg = <0 0x16000000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		vencsys: clock-controller@17000000 {
>> +			compatible = "mediatek,mt6779-vencsys", "syscon";
>> +			reg = <0 0x17000000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		camsys: clock-controller@1a000000 {
>> +			compatible = "mediatek,mt6779-camsys", "syscon";
>> +			reg = <0 0x1a000000 0 0x10000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +		ipesys: clock-controller@1b000000 {
>> +			compatible = "mediatek,mt6779-ipesys", "syscon";
>> +			reg = <0 0x1b000000 0 0x1000>;
>> +			#clock-cells = <1>;
>> +		};
>> +
>> +	};
>> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
