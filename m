Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB93C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYSZRwLx8gsE3exlMtB6Y5HtervW5hLb9MshZrCy1p4=; b=vs1IxuPP6qLWUg
	H0TIzXzOAuAp8/Qp9AtWPKk0BMePuj6Iyd1ZD//jV8r8PF5AKPUKuXhVl+UHM36aoQwoXWMTrzMhj
	Xf0QXit0BZKBQk7RLkzMRbJiom411UsbAsWvJzQFkVgO0mhfPJIDoSq5QQHg88uUtiufJ/d7Uhwsl
	eWMoCcMuvIUP543OXpg3V204NQ91H53oppsQvmvjlqEXmo0MASXN0OQmEQKuuLFDBXBMznNQSjXty
	tf+dAFEhrlVRyIhq7QHzncBdbFoo8r3Y9aY9m1Q+D2zAuMyj+ID6hUBwlQDgTQ3Rev5CjZWf3/VGd
	LA2dMPgus5TH1w+ImUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQS0-00BZYV-Lc; Thu, 07 Apr 2022 11:37:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQRv-00BZWs-EB; Thu, 07 Apr 2022 11:37:16 +0000
X-UUID: b4d2cbea56694bc9a99d361a6bf657c9-20220407
X-UUID: b4d2cbea56694bc9a99d361a6bf657c9-20220407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 213618935; Thu, 07 Apr 2022 04:37:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 04:37:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 19:37:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Apr 2022 19:37:06 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 1/1] arm64: dts: mt8192: Add mmc device nodes
Date: Thu, 7 Apr 2022 19:37:03 +0800
Message-ID: <20220407113703.26423-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220407113703.26423-1-allen-kh.cheng@mediatek.com>
References: <20220407113703.26423-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_043715_535735_AC205270 
X-CRM114-Status: GOOD (  11.09  )
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

In mt8192 SoC, mmc driver dose not use the MSDC module to control
clock. It will read/write register to enable/disable clock. Also
there is no other device of mt8192 using MSDC controller.

We add mmc nodes for mt8192 SoC and remove the clock-controller in
dts for avoid a duplicate unit-address(11f60000) warning.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index a6da7b04b9d4..18a58239d6f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -985,10 +985,36 @@
 			#clock-cells = <1>;
 		};
 
-		msdc: clock-controller@11f60000 {
-			compatible = "mediatek,mt8192-msdc";
-			reg = <0 0x11f60000 0 0x1000>;
-			#clock-cells = <1>;
+		mmc0: mmc@11f60000 {
+			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
+				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
+				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
+				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
+				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
+				 <&msdc_top CLK_MSDC_TOP_AXI>,
+				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
+			clock-names = "source", "hclk", "source_cg", "sys_cg",
+				      "pclk_cg", "axi_cg", "ahb_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11f70000 {
+			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0 0x1000>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
+				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
+				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
+				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
+				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
+				 <&msdc_top CLK_MSDC_TOP_AXI>,
+				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
+			clock-names = "source", "hclk", "source_cg", "sys_cg",
+				      "pclk_cg", "axi_cg", "ahb_cg";
+			status = "disabled";
 		};
 
 		mfgcfg: clock-controller@13fbf000 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
