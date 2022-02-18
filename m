Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96758C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlPmEvNzwfmlS9SmapSf8SnxASJbEd7YTgSr+G/34Qw=; b=F8P8XKRm0CX8Re
	BxAghFNq2cAuwnpmX4QI7sBla8f/oU4ipOqB47d+vm/W4wWlgrir1UW3jsVdZQYA9t/zvnHH4u9+5
	Meno3ClYTNfPgboQ2SyjL/L0cvMBhecGtvwxjOb6bRu3YGylB1VM9ugcTTswKmQQ125RJsS+ZIN3P
	GflaJpf2dQ2aCA2052aTvZKQoufhfisgeR3HAHcs+xspIRjx6oK2nP+u4VRIgVDEV2kCEEKO/gxFZ
	01PU7XTztpLcKzPdZB0Yr6SK61hUTXwdhui9R3TB9hoAipGfqmwsOMR8fHadiFmMxaKVrHmtH5qXE
	piGM3Vbp8B/H+dXiE3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzPF-00DRiM-Cg; Fri, 18 Feb 2022 09:18:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzNt-00DQkh-Ef; Fri, 18 Feb 2022 09:17:03 +0000
X-UUID: 41ab9f12460e43d5965a8f26a09e3f5f-20220218
X-UUID: 41ab9f12460e43d5965a8f26a09e3f5f-20220218
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1993427730; Fri, 18 Feb 2022 02:17:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 01:16:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Feb 2022 17:16:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Feb 2022 17:16:56 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 22/23] arm64: dts: mt8192: Add gce info for display nodes
Date: Fri, 18 Feb 2022 17:16:32 +0800
Message-ID: <20220218091633.9368-23-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_011701_524626_7DC3DFFA 
X-CRM114-Status: UNSURE (   9.14  )
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

Add gce info for display nodes.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 1f1555fd18f5..df884c48669e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1226,6 +1226,9 @@
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8192-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
@@ -1234,6 +1237,8 @@
 			reg = <0 0x14001000 0 0x1000>;
 			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
+			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
+					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
 		};
 
 		smi_common: smi@14002000 {
@@ -1275,6 +1280,7 @@
 			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
 				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
 		};
 
 		ovl_2l0: ovl@14006000 {
@@ -1285,6 +1291,7 @@
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
 				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
 		};
 
 		rdma0: rdma@14007000 {
@@ -1296,6 +1303,7 @@
 			mediatek,larb = <&larb0>;
 			mediatek,rdma-fifo-size = <5120>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
 		};
 
 		color0: color@14009000 {
@@ -1305,6 +1313,7 @@
 			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
 		};
 
 		ccorr0: ccorr@1400a000 {
@@ -1313,6 +1322,7 @@
 			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
 		};
 
 		aal0: aal@1400b000 {
@@ -1321,6 +1331,7 @@
 			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
 
 		gamma0: gamma@1400c000 {
@@ -1330,6 +1341,7 @@
 			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
 		postmask0: postmask@1400d000 {
@@ -1339,6 +1351,7 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
 			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
 		};
 
 		dither0: dither@1400e000 {
@@ -1348,6 +1361,7 @@
 			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
 		};
 
 		dsi0: dsi@14010000 {
@@ -1371,6 +1385,7 @@
 			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
 			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
 				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
 		};
 
 		rdma4: rdma@14015000 {
@@ -1381,6 +1396,7 @@
 			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
 			iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
 			mediatek,rdma-fifo-size = <2048>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
 		};
 
 		dpi0: dpi@14016000 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
