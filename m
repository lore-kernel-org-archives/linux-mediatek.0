Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E19C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 02:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO5xvhLVQhzMCqtvS6hNx0N5unp8zokjIFS9QG53Czc=; b=N+anSzNpTbsiSHcA+mzGor4KSG
	33Y+Cj8MUA3ObreVUgG9uq/0zkbfAa60915h4k3PGQ5Z22ftYe15JF+vqN7LtNlAW/DKR9AoNCfUz
	Bs3VeZstN/8k3R0Kn8i4e/blx2/wGCNT2Mq8hchMnAhMvCN5V70Xb0OKjHudkOVF4k3y+p7iIctRK
	+nJLRi0crJRJrcg6BlekpdSEkpwlZg9JXPQs1Z4+tDkFzSzBQ2cQHSsgoPM2qavgUXHhQ5gfjgD52
	31awbpV2n0dG8Lb5q1xfz/qSGBZ5K6ArH1dECGD62DTGXOgx8hu6O41/JlNbgcF9G0Sf8rgqVcoRq
	f5rtahfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olLPn-009RwM-Kw; Thu, 20 Oct 2022 02:36:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olLPi-009Rvt-2X; Thu, 20 Oct 2022 02:36:10 +0000
X-UUID: 73d2801f87be4f518bfe8c6797324cdf-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VO5xvhLVQhzMCqtvS6hNx0N5unp8zokjIFS9QG53Czc=;
	b=cgtZ90yVJBMD/NNXA2lDVvu8VmY3DDNey99o0ywOVB3jM7h7kyW9ZAu801iaoRGWKDv+fiXiwcTo1NQdFtjrJETmclFy3Xeo+NGSqGNDiyEwEOEnmlTA0xXn8XQpApkM5oaG1LBCbj5EW5XAzxomG5b5S0g0JES6Hm6P/oX+S+4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:187c7a21-82bc-4b9e-8792-a07b2309f3da,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:12495ba3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 73d2801f87be4f518bfe8c6797324cdf-20221019
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 728855442; Wed, 19 Oct 2022 19:36:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 10:05:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 20 Oct 2022 10:05:21 +0800
Message-ID: <d4a6eb562dfd06f616267be6beaf9c37d88cff37.camel@mediatek.com>
Subject: Re: [PATCH v2] arm64: dts: mt8195: Add Ethernet controller
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<macpaul.lin@mediatek.com>
Date: Thu, 20 Oct 2022 10:05:20 +0800
In-Reply-To: <cf0d4a88-16d0-bb10-8402-30d60feafa1b@collabora.com>
References: <20221019091515.21878-1-biao.huang@mediatek.com>
	 <20221019091515.21878-2-biao.huang@mediatek.com>
	 <cf0d4a88-16d0-bb10-8402-30d60feafa1b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_193606_154225_8DFCF7F0 
X-CRM114-Status: GOOD (  17.70  )
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

Dear Angelo,
	Thanks for your comments!

On Wed, 2022-10-19 at 15:57 +0200, AngeloGioacchino Del Regno wrote:
> Il 19/10/22 11:15, Biao Huang ha scritto:
> > Add Ethernet controller node for mt8195.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88
> > ++++++++++++++++++++
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 86
> > +++++++++++++++++++
> >   2 files changed, 174 insertions(+)
> > 
> 
> ..snip..
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 905d1a90b406..7f7d9f8e72ee 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -1042,6 +1042,92 @@ spis1: spi@1101e000 {
> >   			status = "disabled";
> >   		};
> >   
> > +		stmmac_axi_setup: stmmac-axi-config {
> 
> Didn't you get a warning during dtb build for these ones?
> And if you did, why have you ignored it? :-)
I checked some dts, they keep stmmac-axi-config outside ethernet node,
so I keep the similar way with them, maybe that's old style.
> 
> > +			snps,wr_osr_lmt = <0x7>;
> > +			snps,rd_osr_lmt = <0x7>;
> > +			snps,blen = <0 0 0 0 16 8 4>;
> > +		};
> > +
> 
> ..snip..
> 
> > +
> > +		eth: ethernet@11021000 {
> > +			compatible = "mediatek,mt8195-gmac",
> > "snps,dwmac-5.10a";
> > +			reg = <0 0x11021000 0 0x4000>;
> > +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			interrupt-names = "macirq";
> > +			clock-names = "axi",
> > +				      "apb",
> > +				      "mac_cg",
> > +				      "mac_main",
> > +				      "ptp_ref",
> > +				      "rmii_internal";
> > +			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> > +				 <&pericfg_ao
> > CLK_PERI_AO_ETHERNET_BUS>,
> > +				 <&pericfg_ao
> > CLK_PERI_AO_ETHERNET_MAC>,
> > +				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
> > +				 <&topckgen
> > CLK_TOP_SNPS_ETH_62P4M_PTP>,
> > +				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
> > +			assigned-clocks = <&topckgen
> > CLK_TOP_SNPS_ETH_250M>,
> > +					  <&topckgen
> > CLK_TOP_SNPS_ETH_62P4M_PTP>,
> > +					  <&topckgen
> > CLK_TOP_SNPS_ETH_50M_RMII>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_ETHPLL_D2>,
> > +						 <&topckgen
> > CLK_TOP_ETHPLL_D8>,
> > +						 <&topckgen
> > CLK_TOP_ETHPLL_D10>;
> > +			power-domains = <&spm
> > MT8195_POWER_DOMAIN_ETHER>;
> > +			mediatek,pericfg = <&infracfg_ao>;
> > +			snps,axi-config = <&stmmac_axi_setup>;
> > +			snps,mtl-rx-config = <&mtl_rx_setup>;
> > +			snps,mtl-tx-config = <&mtl_tx_setup>;
> > +			snps,txpbl = <16>;
> > +			snps,rxpbl = <16>;
> > +			snps,clk-csr = <0>;
> > +			status = "disabled";
> 
> Please move stmmac-axi-config, rx-queues-config, tx-queues-config
> here as a subnode
> or in the root node, respecting address/size cells being zero.
> Of course adding that here means also specifying {address,size}-cells 
> = <0> in this
> ethernet node.
OK, I'll move them to ethernet node, and add address/size-cells in
thernet node.
> 
> Regards,
> Angelo
Best Regards!
Biao


