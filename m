Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTQ5xbyS1Nl7OoUZ7pi1ukiBci5TiaFFmoJD6emNv3A=; b=QhG8dDWHZ7AMSl
	xQPcQiv/mYsiNDGBJstxHbyRTYiu0/iudC9y2K2kmHub63RLDWoAVHpXu09HRYn3MvUiSrGjf5R+h
	w6ni9VKBmDIB7NA2DKGL9tBETYM8hXhFwkRUZ4iyLK7FEx+UYg2Q2yLjgdylPdKDJ+SVnoDizCSpx
	f2wmqndQecQi7L94xSViPqeXkjZO1UT8mTowI7x+g2a5h/6m0XID2VE7hjpp8lb/4GX9iKzDbUmQ4
	Cv/atwBJel3fFIkP6HI+yI5/SjyjwKRbT+Susq4IzsnKUPNOls9Jrn8uanQRDC8K9a4ImnOQSO4Ip
	6wufGL62hhy0OlSfwozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0hAq-00E2Yy-Cs; Fri, 24 Dec 2021 09:47:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0hAW-00E2Wf-C8; Fri, 24 Dec 2021 09:47:21 +0000
X-UUID: 948ad3d8c0a342cd8b4ed4030060f486-20211224
X-UUID: 948ad3d8c0a342cd8b4ed4030060f486-20211224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1333196286; Fri, 24 Dec 2021 02:47:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Dec 2021 01:42:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Dec 2021 17:42:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Dec 2021 17:42:25 +0800
Message-ID: <60ecf997de03e7426e0e54fc3eb937f95902419c.camel@mediatek.com>
Subject: Re: [PATCH v16 6/7] arm64: dts: mt8192: add svs device information
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 24 Dec 2021 17:42:25 +0800
In-Reply-To: <855e004b-b128-70f7-b1d2-9fe957c94e08@somainline.org>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-7-roger.lu@mediatek.com>
 <855e004b-b128-70f7-b1d2-9fe957c94e08@somainline.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_014720_468961_6FBD1175 
X-CRM114-Status: GOOD (  22.85  )
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

Sorry for the late reply.

On Wed, 2021-10-20 at 17:16 +0200, AngeloGioacchino Del Regno wrote:
> Il 28/04/21 08:54, Roger Lu ha scritto:
> > add compitable/reg/irq/clock/efuse/reset setting in svs node
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 ++++++++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> > 
> 
> Hello Roger,
> thanks for this series! However, there is an issue with this patch:
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index fe24cc66ff7a..e9816a56d87b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -270,6 +270,14 @@
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
> 
> You are using macros here, which are defined in dt-bindings/reset/ti-syscon.h
> hovever, you are not including this header in this devicetree, so it's not
> compiling.
> 
> Please fix it.

Sure, I'll fix it. Thanks for the heads-up.

> 
> > +				>;
> > +			};
> >   		};
> >   
> >   		pericfg: syscon@10003000 {
> > @@ -564,6 +572,20 @@
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
> > @@ -681,6 +703,18 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		efuse: efuse@11c10000 {
> > +			compatible = "mediatek,efuse";
> > +			reg = <0 0x11c10000 0 0x1000>;
> > +
> 
> arch/arm64/boot/dts/mediatek/mt8192.dtsi:510.5-24: Warning (reg_format): 
> /soc/efuse@11c10000/data1:reg: property has invalid length (8 bytes) 
> (#address-cells == 2, #size-cells == 1)
> 
> arch/arm64/boot/dts/mediatek/mt8192.dtsi:513.5-24: Warning (reg_format): 
> /soc/efuse@11c10000/calib@580:reg: property has invalid length (8 bytes) 
> (#address-cells == 2, #size-cells == 1)
> 
> 
> In short, you should add here:
> 			#address-cells = <1>;
> 			#size-cells = <1>;

Thanks for the example code and I will add them in the latest patch.

> 
> > +			lvts_e_data1: data1 {
> > +				reg = <0x1C0 0x58>;
> > +			};
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
> Regards,
> - Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
