Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCB3C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:12:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877B86121E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 877B86121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mfm/VMaohwmApzA453c51mpQkq9eIU/rpZSA9yrSxLE=; b=Pk8VS8nGZK19Gq
	WT+2zppp7fC35T5QziZre+4vs36efhcAjpqtnhhDbbWaAs7T5B2rfxkeCwtKl+N6JWhOoOfw4wf/M
	LfMS4zhrKZLILt5GLSTWUZRdvQjP6GxvchIP1+Ya8lreb2SZCu2YAm3E04SbadTY14HZMobRYcsEO
	Vn0OyO88MhhTG5RbxD9qlCETJYThlFsXNXT4TbbCovLzrFBr/CcenQ/u+p3uVFK6GvQYb7cXumVcs
	o9SdLaN/4r4zt7mXs+0xhQOQcy2xCxQJN0YRM0mtbIvgUwk+/V3K6QXAq9U6IpgBDSJqjBHtN+QFS
	eXxNAsa4LiJiLfhza7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIhSq-0052Ks-2v; Wed, 25 Aug 2021 01:12:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIhSH-00525R-VN; Wed, 25 Aug 2021 01:11:53 +0000
X-UUID: bf1a169d845c4f3f98d6db21cec26baa-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=I7j5zhlayzEAgDKJ+mWEDPRZhzOWozeF7NRj9eg39p0=; 
 b=fWCen1tddfTgKh4dfo8ZbQvgMIMAO/aIxUzT2m3CXdkOJBbDA/j/lrbGMxUPyynLiqaBzd5knlzjFcVBKyy3F+I5PlSzts/q+XrOMEzT+J2UBaJtYOMo+88B1UWC8dD2nhW2yqjBcLL+qJL61G7WAKXcrnXWCF24RDSIfITho2U=;
X-UUID: bf1a169d845c4f3f98d6db21cec26baa-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1725935634; Tue, 24 Aug 2021 18:11:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:11:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 09:11:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 09:11:43 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v1 3/5] arm64: dts: mediatek: Correct SPI clock of MT8192
Date: Wed, 25 Aug 2021 09:11:18 +0800
Message-ID: <20210825011120.30481-4-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
References: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_181150_094099_F0640D52 
X-CRM114-Status: GOOD (  10.57  )
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

update uart0 ~ 7 clocks to the real ones.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 48 ++++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 31d135e18784..d1c85d3e152b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -355,9 +355,9 @@
 			#size-cells = <0>;
 			reg = <0 0x1100a000 0 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI0>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -369,9 +369,9 @@
 			#size-cells = <0>;
 			reg = <0 0x11010000 0 0x1000>;
 			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI1>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -383,9 +383,9 @@
 			#size-cells = <0>;
 			reg = <0 0x11012000 0 0x1000>;
 			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI2>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -397,9 +397,9 @@
 			#size-cells = <0>;
 			reg = <0 0x11013000 0 0x1000>;
 			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI3>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -411,9 +411,9 @@
 			#size-cells = <0>;
 			reg = <0 0x11018000 0 0x1000>;
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI4>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -425,9 +425,9 @@
 			#size-cells = <0>;
 			reg = <0 0x11019000 0 0x1000>;
 			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI5>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -439,9 +439,9 @@
 			#size-cells = <0>;
 			reg = <0 0x1101d000 0 0x1000>;
 			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI6>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
@@ -453,9 +453,9 @@
 			#size-cells = <0>;
 			reg = <0 0x1101e000 0 0x1000>;
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>,
-				 <&clk26m>,
-				 <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI7>;
 			clock-names = "parent-clk", "sel-clk", "spi-clk";
 			status = "disabled";
 		};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
