Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6857BC48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A17A60FDA
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A17A60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdCLL9dyi/UwDoi5Zg8e2oZg6XRrY6IzlPMt0suQr2g=; b=j+rWZmtK0gOZ0j
	4t98p+HLPon+38Ed76VTkKseVdIxn3ju74ftEiiQe/H6i28+CGccYi8BrQnuKp6//KBmYQq5KNfBo
	VC4DSrwnhAtZ2lOvFlNrFGm20LhzqCWE5uYs91gHpu85mIBkLyW7PHCyrO+uMuKRlr870hvHOZSIi
	NOSr7E9utWi/w61j3ndI07FHtBgdbLgeg+sDNR4aJ4I5vhy0s6O25WJHxGqotDytTh4z4p76XgwOR
	8TlrNtT/8iKFhQ8TkJ6yXdLAa0/9EEGchUQRJLICeDWKNZNW6Oainad89OWu+dAcM61GIVRvcdPeS
	cvmWKQon4JZ/+LzOC8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGTH-00360o-Vg; Tue, 15 Jun 2021 21:19:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvj-001lIP-O5; Tue, 15 Jun 2021 17:32:54 +0000
X-UUID: 543f2f86778847a4937fff91420f27fb-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jP3eA6lvX9NelVBBdD5wO/igBebv75TsYZBWfGSxFLo=; 
 b=rGWzJbZNz8pGffCIDkYj/tJLyeB4rnSpcg3pUEieWrxyYUpDhRod0OCtWfgZjqQL4c2Rm++/MxtiO6lM1x+nlDG+w6tkzh7vzGSCfJ3TAPmWfGemkzCv8I5LI9JYJLbkN+HIOjp/oWcbPAEDebTe5ldXHKjwVvNJ2UJYR1XvE98=;
X-UUID: 543f2f86778847a4937fff91420f27fb-20210615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1846313526; Tue, 15 Jun 2021 10:32:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:43 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH 09/27] arm64: dts: mt8195: add spi controller
Date: Wed, 16 Jun 2021 01:32:15 +0800
Message-ID: <20210615173233.26682-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103251_861959_684EF297 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

From: Leilk Liu <leilk.liu@mediatek.com>

add spi controller node into mt8195 SoC

Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 106 +++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 9b002bb6d344..80a272703879 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -818,6 +818,112 @@
 			#clock-cells = <1>;
 		};
 
+		spi0: spi@1100a000 {
+			compatible = "mediatek,mt8195-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1100a000 0 0x100>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_SPI0>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi1: spi@11010000 {
+			compatible = "mediatek,mt8195-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11010000 0 0x100>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_SPI1>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi2: spi@11012000 {
+			compatible = "mediatek,mt8195-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11012000 0 0x100>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_SPI2>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi3: spi@11013000 {
+			compatible = "mediatek,mt8195-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11013000 0 0x100>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_SPI3>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi4: spi@11018000 {
+			compatible = "mediatek,mt8195-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11018000 0 0x100>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_SPI4>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi5: spi@11019000 {
+			compatible = "mediatek,mt8195-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11019000 0 0x100>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_SPI5>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spis0: spi@1101d000 {
+			compatible = "mediatek,mt8195-spi-slave";
+			reg = <0 0x1101d000 0 0x100>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SPIS0>;
+			clock-names = "spi";
+			assigned-clocks = <&topckgen CLK_TOP_SPIS_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6>;
+			status = "disabled";
+		};
+
+		spis1: spi@1101e000 {
+			compatible = "mediatek,mt8195-spi-slave";
+			reg = <0 0x1101e000 0 0x100>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SPIS1>;
+			clock-names = "spi";
+			assigned-clocks = <&topckgen CLK_TOP_SPIS_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6>;
+			status = "disabled";
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
 			reg = <0 0x11230000 0 0x10000>,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
