Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38310C48BCF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 06:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB01611CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 06:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB01611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=URwRPU3HDTIGqSIYMSMESeFYIPR4v751A8j4e/z4u2k=; b=BW9NEioW8o3Yk4
	4XBRF5zOyxhjYVHbdKQXU1Dbrbg2601KU8rz26uoYBFGg8genM6Ea0VybvdklIqAhdhkxJ/igkegn
	2ybd8Jthyol5kvD0XqUkk3ImslsxMLdQKyhX3Z+VMLIK8ExpnOY+Zx1Ckj0mLUn+plsQ3nZ1oYnV3
	/haisASElSFA7GlhPmT8+Yxp/DO8YRXSB4Qs91DgFV2eGP1WCmhJixwoRNc5twe5JPCdxOu6PwNmT
	I7f5MDdCAuNRfMt9lsjZ9IZNeesBi4C9Mk1qJuxCkVsFYHM6Q5bU2VG8N5/qvsTn1TXkKs4hz6ni9
	/xURtU6T9zCVLPYzBH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsJKZ-009mqm-8N; Sun, 13 Jun 2021 06:10:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsJKM-009mq9-Kh; Sun, 13 Jun 2021 06:10:37 +0000
X-UUID: 16c168334468455f8808fd751e731e18-20210612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+dP0lF1MqHc4d/D3DVKON5unIj7sATG7uGXhoFthy4Q=; 
 b=GXXSJzWLvP2FEW5O03ttccSDz6byfWGHPrxfKhbXZXftrJFTgFdsdJoHQYPL9H00NZAczKy4Rh9fNaRc9RTsVKfS2+0JEvGFKe2Wa9ccksRl+9lXutiD7rpSXAFGHf9gXfGvkfJ4nip5fFnBmolC/l7qlpQ2kFrZYhqsfPqsl+Q=;
X-UUID: 16c168334468455f8808fd751e731e18-20210612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1562795792; Sat, 12 Jun 2021 23:10:30 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Jun 2021 23:10:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Jun 2021 14:10:09 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Jun 2021 14:10:08 +0800
From: Mason Zhang <mason.zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, <hanks.chen@mediatek.com>,
 <mason.zhang@mediatek.com>, Mason Zhang <Mason.Zhang@mediatek.com>
Subject: [PATCH v3 1/1] arm64: dts: mediatek: add MT6779 spi master dts node
Date: Sun, 13 Jun 2021 13:54:59 +0800
Message-ID: <20210613055458.6073-1-mason.zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_231036_108877_EFE4F350 
X-CRM114-Status: UNSURE (   8.70  )
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

From: Mason Zhang <Mason.Zhang@mediatek.com>

This patch add spi master dts node for MT6779 SOC.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 112 +++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 370f309d32de..c81e76865d1b 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -219,6 +219,118 @@
 			status = "disabled";
 		};
 
+		spi0: spi0@1100a000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x1100a000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				<&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI0>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi1: spi1@11010000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11010000 0 0x1000>;
+			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				<&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI1>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi2: spi2@11012000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11012000 0 0x1000>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI2>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi3: spi3@11013000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11013000 0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI3>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi4: spi4@11018000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11018000 0 0x1000>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI4>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi5: spi5@11019000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x11019000 0 0x1000>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				<&topckgen CLK_TOP_SPI>,
+				<&infracfg_ao CLK_INFRA_SPI5>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi6: spi6@1101d000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x1101d000 0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI6>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
+		spi7: spi7@1101e000 {
+			compatible = "mediatek,mt6779-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,pad-select = <0>;
+			reg = <0 0x1101e000 0 0x1000>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+				 <&topckgen CLK_TOP_SPI>,
+				 <&infracfg_ao CLK_INFRA_SPI7>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+		};
+
 		audio: clock-controller@11210000 {
 			compatible = "mediatek,mt6779-audio", "syscon";
 			reg = <0 0x11210000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
