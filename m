Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MISfpdI0l8xmb5nrskcJBiDxUvDtW14CwHLwsyPxDog=; b=AE3uzAL/B86zHz
	yvZz/w3UvUuftvl9H6f/G4/3Tz5rukl/EZfwrLRNHt3lBUs1T1ETyPQtkGdCF9rnmV6Y2EkrSOKCC
	3kDN1FodewAwEe3X2u7cOc/We8W2lO96uDnl0pD48Y2W05JJ4LXfs7Zrz2qQVYpUcEpFQsxyiKuOl
	N/UchN8+CY22E/laXzedTr8gJUq02DkUKTOF0ifI87Iqfk1MRqYKFOJPvTScnNUYnGlkWbvW5FSyy
	SeypVN56HbdJgrPfFV0Yd22xVRUDAyjYlwtZ6Rk6IGOfLr4do0l1SO6GIKqehrufYCVg7kmsZcujC
	nFw9rj74h892bqAZeCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmbFy-00FyTo-Hr; Thu, 05 May 2022 13:10:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmbFn-00FyOy-7w; Thu, 05 May 2022 13:10:48 +0000
X-UUID: 6c80c9a873d5475481c6be9a743496a5-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ac56d7f3-bc4f-43b5-8699-2f17c8915942, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:bc4c5316-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6c80c9a873d5475481c6be9a743496a5-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 247572012; Thu, 05 May 2022 06:10:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 06:10:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 21:10:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 5 May 2022 21:10:36 +0800
Message-ID: <2e9a4f5446c99e5e573168bfbdc1786ba73734b4.camel@mediatek.com>
Subject: Re: [PATCH v8 2/2] arm64: dts: Add MediaTek SoC MT8186 dts and
 evaluation board and Makefile
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 <hsinyi@chromium.org>
Date: Thu, 5 May 2022 21:10:36 +0800
In-Reply-To: <c60bf00a-340d-e1de-cabc-87535470c472@collabora.com>
References: <20220428061717.11197-1-allen-kh.cheng@mediatek.com>
 <20220428061717.11197-3-allen-kh.cheng@mediatek.com>
 <c60bf00a-340d-e1de-cabc-87535470c472@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_061047_337091_2CA96FBF 
X-CRM114-Status: GOOD (  25.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

On Thu, 2022-04-28 at 15:32 +0200, AngeloGioacchino Del Regno wrote:
> Il 28/04/22 08:17, Allen-KH Cheng ha scritto:
> > Add basic chip support for MediaTek MT8186.
> > 
> > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >   arch/arm64/boot/dts/mediatek/mt8186-evb.dts | 232 +++++
> >   arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 949
> > ++++++++++++++++++++
> >   3 files changed, 1182 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > b/arch/arm64/boot/dts/mediatek/Makefile
> > index c7d4636a2cb7..50a2c58c5f56 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -37,6 +37,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-
> > kodama-sku32.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > new file mode 100644
> > index 000000000000..6bf5b81e3e6b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > @@ -0,0 +1,232 @@
> 
> ..snip..
> 
> > +
> > +&pio {
> > +	i2c0_pins: i2c0{
> > +		pins_bus {
> 
> No underscores please!
> 
> Either name this "pins-bus" or, more appropriately, I would give it a
> more
> descriptive name, like "pins-sda-scl".

ok, pins-sda-scl is great, I will change name.

> 
> > +			pinmux = <PINMUX_GPIO128__FUNC_SDA0>,
> > +				 <PINMUX_GPIO127__FUNC_SCL0>;
> > +			bias-disable;
> > +			mediatek,drive-strength-adv =<0>;
> > +			drive-strength = <MTK_DRIVE_4mA>;
> > +			input-enable;
> > +		};
> > +	};
> 
> ..snip..
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > new file mode 100644
> > index 000000000000..9e3d45f3e5de
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > @@ -0,0 +1,949 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + * Author: Allen-KH Cheng <allenn-kh.cheng@mediatek.com>
> 
> Uhm, you typoed your email address! :-)
> 

will correct.

> > + */
> > +/dts-v1/;
> > +#include <dt-bindings/clock/mt8186-clk.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/pinctrl/mt8186-pinfunc.h>
> > +#include <dt-bindings/power/mt8186-power.h>
> > +#include <dt-bindings/phy/phy.h>
> > +#include <dt-bindings/reset/mt8186-resets.h>
> > +
> > +/ {
> > +	compatible = "mediatek,mt8186";
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55";
> > +			reg = <0x000>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> 
> No capacity-dmips-mhz for the CPUs?!
> 

oh I will add this.

> > +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> 
> ..snip..
> 
> > +	soc { 
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		compatible = "simple-bus";
> > +		ranges;
> > +
> > +		gic: interrupt-controller@c000000 {
> > +			compatible = "arm,gic-v3";
> > +			#interrupt-cells = <3>;
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			#redistributor-regions = <1>;
> > +			interrupt-parent = <&gic>;
> > +			interrupt-controller;
> > +			reg = <0 0x0c000000 0 0x40000>,
> > +			      <0 0x0c040000 0 0x200000>;
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> 
> Are there no ppi-partitions for this interrupt controller?
> 

I will check this and update in next version.

> > +		};
> > +
> 
> ..snip..
> 
> > +
> > +		scpsys: syscon@10006000 {
> > +			compatible = "syscon", "simple-mfd";
> > +			reg = <0 0x10006000 0 0x1000>;
> > +			#power-domain-cells = <1>;
> > +
> > +			/* System Power Manager */
> > +			spm: power-controller {
> > +				compatible = "mediatek,mt8186-power-
> > controller";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				#power-domain-cells = <1>;
> > +
> > +				/* power domain of the SoC */
> > +				mfg0: mfg0@MT8186_POWER_DOMAIN_MFG0 {
> 
> This should be, for consistency with other mtk devicetrees:
>      mfg0: power-domain@MT8186_POWER_DOMAIN_MFG0 {
> 

ok

> > +					reg =
> > <MT8186_POWER_DOMAIN_MFG0>;
> > +					clocks = <&topckgen
> > CLK_TOP_MFG>;
> > +					clock-names= "mfg00";
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +					#power-domain-cells = <1>;
> > +
> > +					mfg1@MT8186_POWER_DOMAIN_MFG1 {
> 
> power-domain@MT8186_POWER_DOMAIN_MFG1
> 
> ....and the same for all of the other occurrences.
> 

ok

> > +						reg =
> > <MT8186_POWER_DOMAIN_MFG1>;
> > +						mediatek,infracfg =
> > <&infracfg_ao>;
> > +						#address-cells = <1>;
> > +						#size-cells = <0>;
> > +						#power-domain-cells =
> > <1>;
> 
> ..snip..
> 
> > +
> > +		scp: scp@10500000 {
> > +			compatible = "mediatek,mt8186-scp";
> > +			reg = <0 0x10500000 0 0x40000>,
> > +			      <0 0x105c0000 0 0x19080>;
> > +			reg-names = "sram", "cfg";
> > +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> > +			status = "okay";
> 
> `status = "okay"` can be omitted here: all the nodes are enabled by
> default.
> 

will remove

thanks,
Allen

> > +		};
> > +
> 
> Cheers,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
