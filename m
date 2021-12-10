Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 06:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYb4pB8ISQ0tZH2rsBDVo4OW4nhuLHMqW21FG/RmQ2s=; b=Os15YR/SbSDIYd
	mf5/i4m5fyvX8mp0Gw6MbwzUFRU3S41hA8PmcePIvUhjaZqVr8ywAHFjlz+M9WMHNIttc0LFtj2ee
	Sv786YYSbrh5Ir4bQjutS/jnwaRrNyytbtacl/f3EK/9tDAb7ExRRETofPuRHwbASnV6L4Gt/wlQp
	GG+LHfLh8/BeP8jx9xqh4d+KHXchmeq+rGXOtu5IGv9zRqV7HKYxTchaIBjSM/8oCEBkkwdx0a3vn
	gMY/ybGu2xo1oqOnLlfi0nhj6dmFxgzPfzj8mwFxLSaa3Gq8L/3avCUoOcn6ovqYe8UxO6KRVIAsR
	iQ+WYqMlwE09nTy3xyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvZTu-000sZq-04; Fri, 10 Dec 2021 06:34:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvZTh-000sWx-U5; Fri, 10 Dec 2021 06:33:59 +0000
X-UUID: fd2724929e7447c9898f302e74bbe693-20211209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jW0E6lxQlKNybU5i7eEBZvTV8TnrOogj/3xvDI7n6g4=; 
 b=DBIBiTr5cACndjBusUBRBsqrdWEy/R4ZCPcFytVS4v1qe/SP1TtMcvA+kLeUSSAJ3nDW7sXb8HxWXRZj+JvBhXygF9iqL9XJ7Mfx3LN1AUMZD6/29/SL9kvJ5hwXa8hAPsNHIyOBkHjP6bIR/b6R960gOvJ6WAjIlEjpHZFZdno=;
X-UUID: fd2724929e7447c9898f302e74bbe693-20211209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 737458122; Thu, 09 Dec 2021 23:33:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Dec 2021 22:33:49 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 10 Dec 2021 14:33:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Dec 2021 14:33:47 +0800
Message-ID: <d363d5ca3b0059d7085fe1790b7f57bff80147ff.camel@mediatek.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: Add USB xHCI controller for
 mt8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 10 Dec 2021 14:33:48 +0800
In-Reply-To: <9db3cb96-ac67-151d-5674-b56c5abbe348@collabora.com>
References: <20211102060049.1843-1-chunfeng.yun@mediatek.com>
 <20211102060049.1843-3-chunfeng.yun@mediatek.com>
 <9db3cb96-ac67-151d-5674-b56c5abbe348@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_223358_001691_EE9D9514 
X-CRM114-Status: GOOD (  18.35  )
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

On Fri, 2021-11-26 at 11:36 +0100, AngeloGioacchino Del Regno wrote:
> Il 02/11/21 07:00, Chunfeng Yun ha scritto:
> > Add all four USB xHCI controllers for MT8195
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 79
> > ++++++++++++++++++++++++
> >   1 file changed, 79 insertions(+)
> > 
> 
> Hello!
> Thanks for the patch! However, there is something to improve...
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index a59c0e9d1fc2..263eebfd2ea1 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -8,6 +8,7 @@
> >   #include <dt-bindings/clock/mt8195-clk.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/phy/phy.h>
> >   #include <dt-bindings/power/mt8195-power.h>
> >   
> >   / {
> > @@ -823,6 +824,26 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		xhci0: usb@11200000 {
> > +			compatible = "mediatek,mt8195-xhci",
> > "mediatek,mtk-xhci";
> > +			reg = <0 0x11200000 0 0x1000>, <0 0x11203e00 0
> > 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> 
> Here, and on the other xhci nodes (from what I know, xhci{0,1,3}),
> you should use
> interrupts-extended and declare the wakeup interrupt on pio.
> 
> 			interrupts-extended = <&gic GIC_SPI 129
> IRQ_TYPE_LEVEL_HIGH 0>,
> 
> 					      <&pio 219
> IRQ_TYPE_LEVEL_LOW>;
> 
> 			interrupt-names = "host", "wakeup";
Ok, this patch doesn't support runtime suspend, will add it in next
version, thanks a lot

> 
> 
> > +			phys = <&u2port0 PHY_TYPE_USB2>, <&u3port0
> > PHY_TYPE_USB3>;
> > +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
> > +					  <&topckgen
> > CLK_TOP_SSUSB_XHCI>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>,
> > +						 <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>;
> > +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_XHCI>,
> > +				 <&topckgen CLK_TOP_SSUSB_REF>,
> > +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
> > +			clock-names = "sys_ck", "xhci_ck", "ref_ck",
> > "mcu_ck";
> > +			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
> > +			wakeup-source;
> > +			status = "disabled";
> > +		};
> > +
> >   		mmc0: mmc@11230000 {
> >   			compatible = "mediatek,mt8195-mmc",
> > "mediatek,mt8192-mmc";
> >   			reg = <0 0x11230000 0 0x10000>,
> > @@ -843,6 +864,64 @@
> >   			status = "disabled";
> >   		};
> >   
> > +		xhci1: usb@11290000 {
> > +			compatible = "mediatek,mt8195-xhci",
> > "mediatek,mtk-xhci";
> > +			reg = <0 0x11290000 0 0x1000>, <0 0x11293e00 0
> > 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> 
> 			interrupts-extended = <&gic GIC_SPI 530
> IRQ_TYPE_LEVEL_HIGH 0>,
> 
> 					      <&pio 218
> IRQ_TYPE_LEVEL_LOW>;
> 
> > +			phys = <&u2port1 PHY_TYPE_USB2>;
> > +			assigned-clocks = <&topckgen
> > CLK_TOP_USB_TOP_1P>,
> > +					  <&topckgen
> > CLK_TOP_SSUSB_XHCI_1P>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>,
> > +						 <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>;
> > +			clocks = <&pericfg_ao
> > CLK_PERI_AO_SSUSB_1P_BUS>,
> > +				 <&pericfg_ao
> > CLK_PERI_AO_SSUSB_1P_XHCI>,
> > +				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
> > +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
> > +			clock-names = "sys_ck", "xhci_ck", "ref_ck",
> > "mcu_ck";
> > +			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
> > +			wakeup-source;
> > +			status = "disabled";
> > +		};
> > +
> > +		xhci2: usb@112a0000 {
> > +			compatible = "mediatek,mt8195-xhci",
> > "mediatek,mtk-xhci";
> > +			reg = <0 0x112a0000 0 0x1000>, <0 0x112a3e00 0
> > 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			phys = <&u2port2 PHY_TYPE_USB2>;
> > +			assigned-clocks = <&topckgen
> > CLK_TOP_USB_TOP_2P>,
> > +					  <&topckgen
> > CLK_TOP_SSUSB_XHCI_2P>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>,
> > +						 <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>;
> > +			clocks = <&pericfg_ao
> > CLK_PERI_AO_SSUSB_2P_BUS>,
> > +				 <&pericfg_ao
> > CLK_PERI_AO_SSUSB_2P_XHCI>,
> > +				 <&topckgen CLK_TOP_SSUSB_P2_REF>;
> > +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> > +			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
> > +			status = "disabled";
> > +		};
> > +
> > +		xhci3: usb@112b0000 {
> > +			compatible = "mediatek,mt8195-xhci",
> > "mediatek,mtk-xhci";
> > +			reg = <0 0x112b0000 0 0x1000>, <0 0x112b3e00 0
> > 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> 
> 			interrupts-extended = <&gic GIC_SPI 536
> IRQ_TYPE_LEVEL_HIGH 0>,
> 
> 					      <&pio 221
> IRQ_TYPE_LEVEL_LOW>;
> 
> 			interrupts-names = "host", "wakeup";
> 
> > +			phys = <&u2port3 PHY_TYPE_USB2>;
> > +			assigned-clocks = <&topckgen
> > CLK_TOP_USB_TOP_3P>,
> > +					  <&topckgen
> > CLK_TOP_SSUSB_XHCI_3P>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>,
> > +						 <&topckgen
> > CLK_TOP_UNIVPLL_D5_D4>;
> > +			clocks = <&pericfg_ao
> > CLK_PERI_AO_SSUSB_3P_BUS>,
> > +				 <&pericfg_ao
> > CLK_PERI_AO_SSUSB_3P_XHCI>,
> > +				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
> > +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
> > +			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
> > +			wakeup-source;
> > +			usb2-lpm-disable;
> > +			status = "disabled";
> > +		};
> > +
> >   		nor_flash: nor@1132c000 {
> >   			compatible = "mediatek,mt8195-nor",
> > "mediatek,mt8173-nor";
> >   			reg = <0 0x1132c000 0 0x1000>;
> > 
> 
> Regards,
> - Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
