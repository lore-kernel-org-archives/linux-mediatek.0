Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C75DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 04:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUiJoiZ7UqsxslcccpxM3SMHd3NLaXBrCt8vS+Yb9L0=; b=pjuqvyhSwU6eHm3vdZlAFYbnWN
	g5Ap3uiU7Z6p5T92OneFlQWg7LS1/pnI2g2t2835uH8Sqv2mgaf1vtSOcV7+O6hIS/3hhtIDqKscg
	krRz+sKAtql25Y0ri+gEq9Nvi57jTknt0vXP03EfZ8TlkTEfaDC3jbqJUCTRJh7I8YmivPp5aWFqw
	aQCMq7wiqhTydM83VsEVpOX02GuuJVEVHOkw9FagJ+5gQt6JtSJH5zp94thyVu0k2SBqd5DtB0IWO
	57uUGreerneQPJ07TcIXsx/1GdDxY4wpxSUvA9Alxi/DI8dRawJo1qIEC5u05qiTaKh/FCGN2tbcF
	aiJFSeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8x2l-005vwz-37; Wed, 06 Jul 2022 04:53:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8x2a-005vtV-Jy; Wed, 06 Jul 2022 04:53:34 +0000
X-UUID: 9d0afaceeca74c6a8d72cedef2e12154-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:fbb401bd-b08a-4b14-b97f-7eab90f673ad,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:331eaa86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9d0afaceeca74c6a8d72cedef2e12154-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 133292420; Tue, 05 Jul 2022 21:53:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 6 Jul 2022 12:02:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 6 Jul 2022 12:02:52 +0800
Message-ID: <2a6619e4e93f09dfae32d33aae968adcad0cf482.camel@mediatek.com>
Subject: Re: [PATCH v1 16/16] arm64: dts: mt8195: Add display node for
 vdosys0
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Weiyi Lu
	<weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Date: Wed, 6 Jul 2022 12:02:52 +0800
In-Reply-To: <27c8f7b1-c308-89c2-54be-2d6c1a5527b8@linaro.org>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
	 <20220704100028.19932-17-tinghan.shen@mediatek.com>
	 <27c8f7b1-c308-89c2-54be-2d6c1a5527b8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_215332_713392_EC0A02F6 
X-CRM114-Status: GOOD (  17.08  )
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

On Mon, 2022-07-04 at 14:39 +0200, Krzysztof Kozlowski wrote:
> On 04/07/2022 12:00, Tinghan Shen wrote:
> > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > 
> > Add display node for vdosys0 of mt8195.
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 109 +++++++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 724c6ca837b6..faea8ef33e5a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1961,6 +1961,7 @@
> >  		vdosys0: syscon@1c01a000 {
> >  			compatible = "mediatek,mt8195-mmsys", "syscon";
> >  			reg = <0 0x1c01a000 0 0x1000>;
> > +			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
> >  			#clock-cells = <1>;
> >  		};
> >  
> > @@ -1976,6 +1977,114 @@
> >  			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
> >  		};
> >  
> > +		ovl0: ovl@1c000000 {
> > +			compatible = "mediatek,mt8195-disp-ovl",
> > +				     "mediatek,mt8183-disp-ovl";
> > +			reg = <0 0x1c000000 0 0x1000>;
> > +			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
> > +			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
> > +		};
> > +
> > +		rdma0: rdma@1c002000 {
> > +			compatible = "mediatek,mt8195-disp-rdma";
> > +			reg = <0 0x1c002000 0 0x1000>;
> > +			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
> > +			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
> > +		};
> > +
> > +		color0: color@1c003000 {
> > +			compatible = "mediatek,mt8195-disp-color",
> > +				     "mediatek,mt8173-disp-color";
> > +			reg = <0 0x1c003000 0 0x1000>;
> > +			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
> > +		};
> > +
> > +		ccorr0: ccorr@1c004000 {
> > +			compatible = "mediatek,mt8195-disp-ccorr",
> > +				     "mediatek,mt8192-disp-ccorr";
> > +			reg = <0 0x1c004000 0 0x1000>;
> > +			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
> > +		};
> > +
> > +		aal0: aal@1c005000 {
> > +			compatible = "mediatek,mt8195-disp-aal",
> > +				     "mediatek,mt8183-disp-aal";
> > +			reg = <0 0x1c005000 0 0x1000>;
> > +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
> > +		};
> > +
> > +		gamma0: gamma@1c006000 {
> > +			compatible = "mediatek,mt8195-disp-gamma",
> > +				     "mediatek,mt8183-disp-gamma";
> > +			reg = <0 0x1c006000 0 0x1000>;
> > +			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
> > +		};
> > +
> > +		dither0: dither@1c007000 {
> > +			compatible = "mediatek,mt8195-disp-dither",
> > +				     "mediatek,mt8183-disp-dither";
> > +			reg = <0 0x1c007000 0 0x1000>;
> > +			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
> > +		};
> > +
> > +		dsc0: dsc@1c009000 {
> > +			compatible = "mediatek,mt8195-disp-dsc";
> > +			reg = <0 0x1c009000 0 0x1000>;
> > +			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c00XXXX 0x9000 0x1000>;
> > +		};
> > +
> > +		merge0: merge0@1c014000 {
> 
> Generic node name.
> 
> > +			compatible = "mediatek,mt8195-disp-merge";
> > +			reg = <0 0x1c014000 0 0x1000>;
> > +			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
> > +			mediatek,gce-client-reg =
> > +				 <&gce0 SUBSYS_1c01XXXX 0x4000 0x1000>;
> > +		};
> > +
> > +		mutex: mutex0@1c016000 {
> 
> Generic node name.
> 
> > +			compatible = "mediatek,mt8195-disp-mutex";
> > +			reg = <0 0x1c016000 0 0x1000>;
> > +			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
> > +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> > +			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
> > +			mediatek,gce-events =
> > +				 <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
> > +		};
> > +
> >  		larb0: larb@1c018000 {
> >  			compatible = "mediatek,mt8195-smi-larb";
> >  			reg = <0 0x1c018000 0 0x1000>;
> 
> 
> Best regards,
> Krzysztof

Ok, I'll update in the next version.

Thanks,
TingHan


