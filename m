Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2gv+r2XFAIaAcx1wLQPcwMCM5KEIVQdd5KbrMP2cUk=; b=00zwUqC2nox639
	TPbREZvx6NY6lKMSmv/8FvIdNDS6aTL+CMtCRX7qJutk3T/Jwk4P+SaNuQZwU6V8Ql6Z1HH8UdcgA
	DHVILm4mV1m3eNJzo6intqWA0C7sTw0WzCN25NCCSGdYNJTRKHX9X6pdkcK1flw/dd3kJQVk+WXKj
	fAherBStPVgMJuytTlWM0jc/MnkHBfdbBy8VPcJYk8ms5oLPDkxdQgjXEpwd7lSXpDEu2leQ5blpN
	2QDcoVOy/kOs6arNWOOkib5h7fdLA2zMINksxmGcgarKLMqwVbkIrQ2bf7JxHpvT/C8WdUADwDgdd
	RlAFEMx2Tl8VKdWN9cuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5JP5-00GHm3-Ff; Thu, 06 Jan 2022 03:25:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5JOE-00GHVx-HB; Thu, 06 Jan 2022 03:24:36 +0000
X-UUID: 9a28c709cb894700bfec55af2e28baf9-20220105
X-UUID: 9a28c709cb894700bfec55af2e28baf9-20220105
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1808823826; Wed, 05 Jan 2022 20:24:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 19:24:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 11:24:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 11:24:24 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 4/5] arm64: dts: mediatek: Correct I2C clock of MT8192
Date: Thu, 6 Jan 2022 11:24:19 +0800
Message-ID: <20220106032420.11544-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220106032420.11544-1-allen-kh.cheng@mediatek.com>
References: <20220106032420.11544-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_192434_614765_DBB7E24F 
X-CRM114-Status: GOOD (  11.66  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

When the initial devicetree for mt8192 was added in 48489980e27e ("arm64:
dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"), the
clock driver for mt8192 was not yet upstream, so the clock property nodes
were set to the clk26m clock as a placeholder.

Given that the clock driver has since been added through 710573dee31b ("clk:
mediatek: Add MT8192 basic clocks support"), as well as its dt-bindings
through f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks") and
devicetree nodes through 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192
clock controllers"), fix the I2C clock property to point to the actual

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 30 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 8584a20440c5..1eb5874c09a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -486,7 +486,8 @@
 			reg = <0 0x11cb0000 0 0x1000>,
 			      <0 0x10217300 0 0x80>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_e CLK_IMP_IIC_WRAP_E_I2C3>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -505,7 +506,8 @@
 			reg = <0 0x11d00000 0 0x1000>,
 			      <0 0x10217600 0 0x180>;
 			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C7>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -518,7 +520,8 @@
 			reg = <0 0x11d01000 0 0x1000>,
 			      <0 0x10217780 0 0x180>;
 			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C8>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -531,7 +534,8 @@
 			reg = <0 0x11d02000 0 0x1000>,
 			      <0 0x10217900 0 0x180>;
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C9>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -550,7 +554,8 @@
 			reg = <0 0x11d20000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C1>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -563,7 +568,8 @@
 			reg = <0 0x11d21000 0 0x1000>,
 			      <0 0x10217180 0 0x180>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C2>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -576,7 +582,8 @@
 			reg = <0 0x11d22000 0 0x1000>,
 			      <0 0x10217380 0 0x180>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_ws CLK_IMP_IIC_WRAP_WS_I2C4>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -595,7 +602,8 @@
 			reg = <0 0x11e00000 0 0x1000>,
 			      <0 0x10217500 0 0x80>;
 			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C5>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -614,7 +622,8 @@
 			reg = <0 0x11f00000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C0>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
@@ -627,7 +636,8 @@
 			reg = <0 0x11f01000 0 0x1000>,
 			      <0 0x10217580 0 0x80>;
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&imp_iic_wrap_n CLK_IMP_IIC_WRAP_N_I2C6>,
+				 <&infracfg CLK_INFRA_AP_DMA>;
 			clock-names = "main", "dma";
 			clock-div = <1>;
 			#address-cells = <1>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
