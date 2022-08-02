Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832D6C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOi0e26t1qGVGjFJ101uHk1DcJq5p7uMHf4xmBp8HUg=; b=3xt2S0oPvdBKgbPLxu/XZ01Y4k
	2GvCUaackTda1xrCLNQjxssoxEFlB+fY2RDHtTMp6BbIJlBQ6B5WvBva5XCNTTp6muRLDb4uKVJS4
	cL6vxdttOQGP8FRdsCUaunYHscVf2G+aV+ku/fKkjTtimx4l+7c6/zsPQ+U0Aag6AuRhZV8hFUB1y
	Tv6whU/MkLhwqV97S22W0U1xBeG9JWI0GX7NF6Lvc+dChoI0V6HXrdjffdV+bLS885eNJtL2+B2yF
	lcgY8AxUk5qaw6TqBw/3HmQUYywJaaH05vpgOxtF5yjYEf657aaag3FQdAcajQ1+05LdpzFq0xRgZ
	PV2f4dYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInYc-00Bzo1-Nx; Tue, 02 Aug 2022 08:47:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oInYW-00BzjM-8y; Tue, 02 Aug 2022 08:47:15 +0000
X-UUID: d82fe260c7f74161bfe47468b2bac018-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:4835f9b7-347f-401c-b041-9a0c59093900,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:683c0925-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d82fe260c7f74161bfe47468b2bac018-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1939307011; Tue, 02 Aug 2022 01:47:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 16:06:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 16:06:31 +0800
Message-ID: <2e221c97699fa540ac416518d730b13c83e12da8.camel@mediatek.com>
Subject: Re: [PATCH v12 1/1] arm64: dts: Add MediaTek MT8186 dts and
 evaluation board and Makefile
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, <hsinyi@chromium.org>
Date: Tue, 2 Aug 2022 16:06:31 +0800
In-Reply-To: <20220801220136.4lll2wifc7muocuc@notapiano>
References: <20220801123952.18932-1-allen-kh.cheng@mediatek.com>
	 <20220801123952.18932-2-allen-kh.cheng@mediatek.com>
	 <20220801220136.4lll2wifc7muocuc@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_014713_792887_705BA104 
X-CRM114-Status: GOOD (  25.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

HI Nícolas,

Thanks for your reminder.

On Mon, 2022-08-01 at 18:01 -0400, Nícolas F. R. A. Prado wrote:
> Hi Allen,
> 
> On Mon, Aug 01, 2022 at 08:39:52PM +0800, Allen-KH Cheng wrote:
> > Add basic chip support for MediaTek MT8186.
> > 
> > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8186-evb.dts | 238 ++++++
> >  arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 874
> > ++++++++++++++++++++
> >  3 files changed, 1113 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > 
> 
> [..]
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > new file mode 100644
> > index 000000000000..7d4a64ab95e4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> 
> [..]
> > +&pio {
> > +	i2c0_pins: i2c0-default-pins {
> > +		pins-bus {
> > +			pinmux = <PINMUX_GPIO128__FUNC_SDA0>,
> > +				 <PINMUX_GPIO127__FUNC_SCL0>;
> > +			bias-disable;
> > +			drive-strength-microamp = <1000>;
> > +			drive-strength = <4>;
> 
> You can't use both drive-strength-microamp and drive-strength. You
> only want the
> microamp one here (and for the others below), since these are i2c
> pins.
> 

I will remove drive-strength for i2c pins.

> > +			input-enable;
> > +		};
> > +	};
> 
> [..]
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > new file mode 100644
> > index 000000000000..38f9466eea42
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > @@ -0,0 +1,874 @@
> 
> [..]
> > +		pio: pinctrl@10005000 {
> > +			compatible = "mediatek,mt8186-pinctrl";
> > +			reg = <0 0x10005000 0 0x1000>,
> > +			      <0 0x10002000 0 0x0200>,
> > +			      <0 0x10002200 0 0x0200>,
> > +			      <0 0x10002400 0 0x0200>,
> > +			      <0 0x10002600 0 0x0200>,
> > +			      <0 0x10002A00 0 0x0200>,
> > +			      <0 0x10002C00 0 0x0200>,
> > +			      <0 0x1000B000 0 0x1000>;
> 
> Please use lowercase hex for addresses.
> 

ok.

> > +			reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> > "iocfg_br",
> > +				    "iocfg_lm", "iocfg_rb", "iocfg_tl",
> > "eint";
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			gpio-ranges = <&pio 0 0 185>;
> > +			interrupt-controller;
> > +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			#interrupt-cells = <2>;
> > +		};
> 
> [..]
> > +		xhci0: usb@11200000 {
> > +			compatible = "mediatek,mt8186-xhci",
> > +				     "mediatek,mtk-xhci";
> > +			reg = <0 0x11200000 0 0x1000>,
> > +			      <0 0x11203e00 0 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			phys = <&u2port0 PHY_TYPE_USB2>;
> > +			clocks = <&topckgen CLK_TOP_USB_TOP>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_XHCI>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_HCLK>,
> > +				 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_REF>;
> > +			clock-names = "sys_ck", "ref_ck", "mcu_ck",
> > "dma_ck", "xhci_ck";
> 
> The clocks and clock-names don't match, can you confirm whether
> they're right?
> (But keep this clock order, see the comment on xhci1 below)
> 

The clocks of ref_ck and xhci_ck are not correct. I will update in next
version.

> > +			mediatek,syscon-wakeup = <&pericfg 0x420 2>;
> > +			wakeup-source;
> > +			status = "disabled";
> > +		};
> 
> [..]
> > +		xhci1: usb@11280000 {
> > +			compatible = "mediatek,mt8186-xhci",
> > +				     "mediatek,mtk-xhci";
> > +			reg = <0 0x11280000 0 0x1000>,
> > +			      <0 0x11283e00 0 0x0100>;
> > +			reg-names = "mac", "ippc";
> > +			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			phys = <&u2port1 PHY_TYPE_USB2>,
> > +			       <&u3port1 PHY_TYPE_USB3>;
> > +			clocks = <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
> > +				 <&infracfg_ao
> > CLK_INFRA_AO_SSUSB_TOP_P1_REF>;
> > +			clock-names = "sys_ck", "ref_ck", "mcu_ck",
> > "xhci_ck";
> 
> The xhci dt-binding enforces this clock order:
> 
> 	sys_ck, ref_ck, mcu_ck, dma_ck, xhci_ck
> 
> You can't skip dma_ck, otherwise you'll see a dtbs_check warning. So
> if this
> hardware block has a fixed clock connected to the dma_ck slot (ie it
> isn't
> controllable), then just add a fixed clock entry for it (eg
> <&clk26m>).
> 
> The clock names also look switched here, please double-check.
> 
> Thanks,
> Nícolas
> 

The hw does not control this. I will add fixed clock for dma_ck.

Thanks,
Allen


> > +			mediatek,syscon-wakeup = <&pericfg 0x424 2>;
> > +			wakeup-source;
> > +			status = "disabled";
> > +		};


