Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92A2C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 02:08:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A67C6052B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 02:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A67C6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d3szTdxeVjH5ikscH62CGvGzVddkqmFXXDnFGsUkNPo=; b=Dkcs4ywRgHjFj4/UvWWtcKzsQy
	C2pZkhKCc/0LFVuO92x7bZ5TxlajJQm5q1BOMQzevOgSxiaqfko28b2739uJ4k+36U8kA9JcasNdG
	i3/10sqMHEoM4W2NePgFjvRnYmBk3Qt99+1sKdDov0k2nFRZlfYATog38ckF0Xge7/aDN8XiNrQG/
	la0oLCjnV56+J51FaPMRQqs2JMuu3U3A3fyIVrN23p2C57B5fzWXOB/HYzOJSYdcDs2++VnfHouf3
	fwyLbHs1dj92FdHrAtZNm/pb3pYGJrAU3etHmnw8REFQmPHnrmLlfa37RuCHZpf5a9VNYIEDtDW6Z
	+jS1Xbsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUgZJ-009h9L-FQ; Fri, 09 Apr 2021 02:08:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUgZ5-009h71-Cv; Fri, 09 Apr 2021 02:08:11 +0000
X-UUID: ded5424c284345f5ac14a5deb0f8c06f-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+rogcFASd9pTBpq+LlsBw7jxFcrv2gW9OyF12iF+J5o=; 
 b=rMkifikp6yeYGjU+6ErKeEw7/t+OPJL3ncQeqmC9Fh3/T6trPqYq2SZgPkc5E0bNVMQ/d5jEuXAdJcKm9oX9xqR1n5m7pOM7DJofED9zwb8OnZMV05Q8yrWp5k7gW/Iq+cbp8R58Gk6J0WB/wsE6Yu8Bl94yPfQuAyfzjWU977o=;
X-UUID: ded5424c284345f5ac14a5deb0f8c06f-20210408
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593877517; Thu, 08 Apr 2021 19:07:58 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 19:07:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 10:07:50 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 10:07:44 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hanks.chen@mediatek.com>, <wsd_upstream@mediatek.com>, Mason Zhang
 <Mason.Zhang@mediatek.com>
Subject: [PATCH v2 1/1] arm64: dts: mediatek: add MT6779 spi master dts node
Date: Fri, 9 Apr 2021 09:56:52 +0800
Message-ID: <20210409015651.11474-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_030809_697505_12CFFC65 
X-CRM114-Status: UNSURE (   8.67  )
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

This patch add address-cells && size-cells in spi node based on patch v1.

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
