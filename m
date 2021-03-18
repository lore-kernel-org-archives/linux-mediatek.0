Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C77FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:14:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7098764F04
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7098764F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cGiUDEmBm3J1C0WdzTNHR3zp099ay708uMP04zm9vjU=; b=pebTzLwr6RKWx1pHJdUxWQrSd
	qZjwcBFmXx7MogcptCrPXZ+AV6z1NcPnkPj19jo3ooKqtZUiUt0O05lgLijMnIli6ZMyqHFIDo/Lu
	xWhZzIJxdXby1oOwW43k9mWRgr7TuG1vBTmW1owCgQcSqImOkc4cjtpY+L23WDoGBYw1Yw3Ql5OsT
	H2e994AsvQPPdtVGI6sYlXKjWnHVAtWQaQmNlqTuNGdypuU67BqiVRqT3sPb4Mx0KQwPXDfYoiREx
	GQZ/NrjmQpETBDOcWX7DCgeKIX1MoApj/CVg9zBzFw2Q7rZmaT9VMEcrBeXx8ix9+6yvsNtSHJwPv
	dwrGzpRMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlvA-004bDn-6A; Thu, 18 Mar 2021 06:14:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMluv-004bBF-Ql; Thu, 18 Mar 2021 06:14:02 +0000
X-UUID: e2c2414cccb84090bce5273cc075df46-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uQSiOMXDhmEHV9qxsBXHJ8UvwmwJKYtttU3s4BkgnZ4=; 
 b=gjiMSnYRF3Rhp4H/KcVX1fzmTXstXSe2HRdTWAh/V5qHtsNZqBYEVel6ryNmpvIXdw3dn4x7gCDwV7o2ZkodOfbFy8yYMlZ1qtQxlvZ0WNKrlTUgyS1uWvRr6iAOc+801Huzz1sOaTQMw52rgUZtFFWNqW3ZSOagWRg35IzLOm4=;
X-UUID: e2c2414cccb84090bce5273cc075df46-20210317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1514864258; Wed, 17 Mar 2021 22:13:46 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 23:03:44 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 14:03:43 +0800
Message-ID: <1616047423.29855.3.camel@mtksdccf07>
Subject: Re: [PATCH 10/10] arm64: dts: Add Mediatek SoC MT8195 and
 evaluation board dts and Makefile
From: Seiya Wang <seiya.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, "Lars-Peter
 Clausen" <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, "Fabien Parent" <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, "Zhiyong Tao" <zhiyong.tao@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, "Chuanhong Guo" <gch981213@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Thu, 18 Mar 2021 14:03:43 +0800
In-Reply-To: <1616036277.25733.33.camel@mhfsdcap03>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-11-seiya.wang@mediatek.com>
 <1616036277.25733.33.camel@mhfsdcap03>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_061358_614781_CBDF4BFC 
X-CRM114-Status: GOOD (  28.56  )
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

On Thu, 2021-03-18 at 10:57 +0800, Chunfeng Yun wrote:
> On Tue, 2021-03-16 at 19:14 +0800, Seiya Wang wrote:
> > Add basic chip support for Mediatek MT8195
> > 
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  29 ++
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 477 ++++++++++++++++++++++++++++
> >  3 files changed, 507 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index deba27ab7657..aee4b9715d2f 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -16,4 +16,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > new file mode 100644
> > index 000000000000..82bb10e9a531
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Seiya Wang <seiya.wang@mediatek.com>
> > + */
> > +/dts-v1/;
> > +#include "mt8195.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT8195 evaluation board";
> > +	compatible = "mediatek,mt8195-evb", "mediatek,mt8195";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:921600n8";
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x80000000>;
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > new file mode 100644
> > index 000000000000..356583fe4f03
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -0,0 +1,477 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: Seiya Wang <seiya.wang@mediatek.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	compatible = "mediatek,mt8195";
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	clocks {
> > +		clk26m: oscillator0 {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <26000000>;
> > +			clock-output-names = "clk26m";
> > +		};
> > +
> > +		clk32k: oscillator1 {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <32768>;
> > +			clock-output-names = "clk32k";
> > +		};
> > +	};
> [...]
> > +
> > +		nor_flash: nor@1132c000 {
> > +			compatible = "mediatek,mt8195-nor", "mediatek,mt8173-nor";
> > +			reg = <0 0x1132c000 0 0x1000>;
> > +			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			clocks = <&clk26m>, <&clk26m>;
> > +			clock-names = "spi", "sf";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "disabled";
> > +		};
> > +
> > +		u3phy2: usb-phy2@11c40000 {
> use t-phy instead of usb-phy2
> 
> It's better to run dtbs_check for this patch
> 
> > +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> > +			clocks = <&clk26m>;
> > +			clock-names = "u3phya_ref";
> No need clocks for v2
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0 0 0x11c40000 0x700>;
> > +			status = "disabled";
> > +
> > +			u2port2: usb2-phy2@0 {
> use usb-phy instead of usb2-phy2
> 
> > +				reg = <0x0 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "disabled";
> I think no need disable it
> it's parent node is already disabled. if enable parent node,
> we also want to enable all children at the same time.
> 
> > +			};
> > +		};
> > +
> > +		u3phy3: usb-phy3@11c50000 {
> t-phy@...
> > +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> > +			clocks = <&clk26m>;
> > +			clock-names = "u3phya_ref";
> No need clocks
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0 0 0x11c50000 0x700>;
> > +			status = "disabled";
> > +
> > +			u2port3: usb2-phy3@0 {
> use usb-phy
> > +				reg = <0x0 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "disabled";
> remove status
> > +			};
> > +		};
> > +
> > +		u3phy1: usb-phy1@11e30000 {
> t-phy
> > +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> > +			clocks = <&clk26m>;
> > +			clock-names = "u3phya_ref";
> remove clocks*
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0 0 0x11e30000 0xe00>;
> > +			status = "disabled";
> > +
> > +			u2port1: usb2-phy1@0 {
> usb-phy
> > +				reg = <0x0 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "disabled";
> remove status
> > +			};
> > +
> > +			u3port1: usb3-phy1@700 {
> usb-phy
> > +				reg = <0x700 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "disabled";
> remove status
> > +			};
> > +		};
> > +
> > +		u3phy0: usb-phy0@11e40000 {
> t-phy
> > +			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
> > +			clocks = <&clk26m>;
> > +			clock-names = "u3phya_ref";
> remove clocks*
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0 0 0x11e40000 0xe00>;
> > +			status = "disabled";
> > +
> > +			u2port0: usb2-phy0@0 {
> usb-phy
> > +				reg = <0x0 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "disabled";
> remove status
> > +			};
> > +
> > +			u3port0: usb3-phy0@700 {
> usb-phy
> > +				reg = <0x700 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				status = "disabled";
> remove status
> > +			};
> > +		};
> > +
> > +		ufsphy: phy@11fa0000 {
> usf-phy instead of phy
> > +			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
> > +			reg = <0 0x11fa0000 0 0xc000>;
> > +			clocks = <&clk26m>, <&clk26m>;
> > +			clock-names = "unipro", "mp";
> > +			#phy-cells = <0>;
> disabled?
> 
> Thanks a lot

I will update the patch after a new linux-next tag available.
Thank you very much.

> > +		};
> > +	};
> > +};
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
