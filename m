Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBCDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8PrdyMSSe7aKQm0IQ4SFX7DxcmM65VpEdFhRaWuI+c=; b=e5zqkN7bklFMCl
	FDvEihEIGR1q+xOUXznJjs/0wAOl/ocQCWcXwlaBjNDJMPscWZkQyVw2BpWhumZm06omUOniEweY8
	ekLqtmKVnDAWNX3WjL/JnZ+g6XzM4A51HR59zteW2mBd25MbRsbAxH96YQp/SDMinHclCELeyVHlP
	fz78HCcIHCZLZ7EJ+Hchf4WSNtY00FJsvgY7v4d7WCamjwnPVg+2dETkjApd5bESprAyDDoKty6cJ
	r9pLBGHLPyEOa026KmSZ9cpqisjKGJ2ysMX4yLGP4FTsmkoHn5gdZldop2MopjZmOw2k9gm7AlTjz
	x2wGln66sm7yFE89+Dog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBwtq-0031KZ-Hd; Mon, 24 Jan 2022 10:48:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBwte-0031Ix-Mi; Mon, 24 Jan 2022 10:48:28 +0000
X-UUID: 91295b3457144c19a3a639d59293a6cb-20220124
X-UUID: 91295b3457144c19a3a639d59293a6cb-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1119612895; Mon, 24 Jan 2022 03:48:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 02:48:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 24 Jan 2022 18:48:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 18:48:08 +0800
Message-ID: <3d3518ff5c332129af5d10766477b9776bbbf55e.camel@mediatek.com>
Subject: Re: [PATCH v21 7/8] arm64: dts: mt8192: add svs device information
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Mon, 24 Jan 2022 18:48:08 +0800
In-Reply-To: <010f9b6a-d6bf-b27a-cb2d-c5fd181c3ac7@collabora.com>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-8-roger.lu@mediatek.com>
 <010f9b6a-d6bf-b27a-cb2d-c5fd181c3ac7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_024826_780841_ADDBF372 
X-CRM114-Status: GOOD (  20.67  )
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

Hi AngeloGioacchino,

On Fri, 2022-01-07 at 15:33 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/01/22 10:51, Roger Lu ha scritto:
> > Add compitable/reg/irq/clock/efuse/reset setting in svs node.
> 
> Typo: compitable => compatible
> .. also, you're not only adding the svs node, but also efuse: please add that
> information in the commit description.
> 
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> 
> This patch seems to not apply on top of the current linux-next, can you please
> rebase it? That would resolve issues with this series and would be picked
> sooner.
> 
> Apart from that...

Sorry to make you confuse. After having discussion internally, we'll submit
another complete mt8192.dtsi patch including this svs node. Therefore, I'll drop
this path from svs patchset in order not to make the reviewer confuse. Thanks
for the comments a lot.

> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 39 ++++++++++++++++++++++++
> >   1 file changed, 39 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index c7c7d4e017ae..c111e26489dd 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -9,6 +9,8 @@
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> > +#include <dt-bindings/reset/ti-syscon.h>
> > +
> >   
> >   / {
> >   	compatible = "mediatek,mt8192";
> > @@ -268,6 +270,14 @@
> >   			compatible = "mediatek,mt8192-infracfg", "syscon";
> >   			reg = <0 0x10001000 0 0x1000>;
> >   			#clock-cells = <1>;
> > +
> > +			infracfg_rst: reset-controller {
> > +				compatible = "mediatek,infra-reset", "ti,syscon-
> > reset";
> > +				#reset-cells = <1>;
> > +				ti,reset-bits = <
> > +					0x150 5 0x154 5 0 0     (ASSERT_SET |
> > DEASSERT_SET | STATUS_NONE) /* 0: svs */
> > +				>;
> > +			};
> >   		};
> >   
> >   		pericfg: syscon@10003000 {
> > @@ -362,6 +372,20 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		svs: svs@1100b000 {
> > +			compatible = "mediatek,mt8192-svs";
> > +			reg = <0 0x1100b000 0 0x1000>;
> > +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			clocks = <&infracfg CLK_INFRA_THERM>;
> > +			clock-names = "main";
> > +			nvmem-cells = <&svs_calibration>,
> > +				      <&lvts_e_data1>;
> > +			nvmem-cell-names = "svs-calibration-data",
> > +					   "t-calibration-data";
> > +			resets = <&infracfg_rst 0>;
> > +			reset-names = "svs_rst";
> > +		};
> > +
> >   		spi1: spi@11010000 {
> >   			compatible = "mediatek,mt8192-spi",
> >   				     "mediatek,mt6765-spi";
> > @@ -479,6 +503,21 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		efuse: efuse@11c10000 {
> > +			compatible = "mediatek,efuse";
> > +			reg = <0 0x11c10000 0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +
> > +			lvts_e_data1: data1@1c0 {
> > +				reg = <0x1c0 0x58>;
> > +			};
> > +
> > +			svs_calibration: calib@580 {
> > +				reg = <0x580 0x68>;
> > +			};
> > +		};
> > +
> >   		i2c3: i2c3@11cb0000 {
> >   			compatible = "mediatek,mt8192-i2c";
> >   			reg = <0 0x11cb0000 0 0x1000>,
> > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
