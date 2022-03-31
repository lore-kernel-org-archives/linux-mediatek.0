Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC23DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wJ5iiCEQaa1AX9QvDiljKgjoUYcjGkavt6ManLSo5Q=; b=jKhg2oJJcuW7hv
	C27mB8MOwHQ3i+ZDOToDZBuFtGi3DQFN49D4Cd7Pi00+6x8Rwp5B2x5IyxrGBnXXXNxVVHm7JT2Kr
	0XEaOj9c0O4vwRnp6seBTC7a1ObDV2h+5Hy9bjE2cT8WYjMyxEpNdcBRKEp1KMwyJqh8T9KBPf3zv
	Rh1RSNYE+pH2/2gNNV0a0ZM3FSZ1tbFvAaqhEE/plDGKCRgokJ5srbviyhnSnfJTLaMChmgec8pyq
	wqas9COm2MIOHOsQpG8b/G+L1YEywlHsehGHqBZ410E1uztggwEXf+w+P7SX7+wlXJcdpROYOwRn/
	bNZ/TwpVG5BVc0feJ1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZuEK-002HFz-3C; Thu, 31 Mar 2022 12:48:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZuDw-002H7u-Ht; Thu, 31 Mar 2022 12:48:26 +0000
X-UUID: fca16ec350974432be82d18419f055aa-20220331
X-UUID: fca16ec350974432be82d18419f055aa-20220331
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998971507; Thu, 31 Mar 2022 05:48:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 05:48:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 20:48:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 20:48:17 +0800
Message-ID: <ccd28405c8f2c420354f3355fc9d4ef1dd7ea35d.camel@mediatek.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: mt8192: Add mmc device nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Thu, 31 Mar 2022 20:48:17 +0800
In-Reply-To: <4cd1c5fa-0982-0355-d5b6-7025b82174a4@gmail.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
 <20220330133816.30806-3-allen-kh.cheng@mediatek.com>
 <4cd1c5fa-0982-0355-d5b6-7025b82174a4@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_054824_695763_CDAE8F74 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Matthias,

On Thu, 2022-03-31 at 14:02 +0200, Matthias Brugger wrote:
> 
> On 30/03/2022 15:38, Allen-KH Cheng wrote:
> > Add mmc nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> You forgot to disable the msdc clock node, which I understood we
> agreed on in in 
> v4. I would consider this change as an substantial one, so in this
> case please 
> delete the reviewed-by tags.
> 
> Regards,
> Matthias
> 

Is it ok I send a new patch for this instead of a series?

Best regards,
Allen

> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 32
> > ++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 69e8d1934d53..c1057878e2c6 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -991,6 +991,38 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > +		mmc0: mmc@11f60000 {
> > +			compatible = "mediatek,mt8192-mmc",
> > "mediatek,mt8183-mmc";
> > +			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0
> > 0x1000>;
> > +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> > +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
> > +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
> > +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> > +				 <&msdc_top
> > CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "pclk_cg", "axi_cg", "ahb_cg";
> > +			status = "disabled";
> > +		};
> > +
> > +		mmc1: mmc@11f70000 {
> > +			compatible = "mediatek,mt8192-mmc",
> > "mediatek,mt8183-mmc";
> > +			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0
> > 0x1000>;
> > +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> > +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
> > +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
> > +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> > +				 <&msdc_top
> > CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "pclk_cg", "axi_cg", "ahb_cg";
> > +			status = "disabled";
> > +		};
> > +
> >   		mfgcfg: clock-controller@13fbf000 {
> >   			compatible = "mediatek,mt8192-mfgcfg";
> >   			reg = <0 0x13fbf000 0 0x1000>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
