Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMJF8iWVnVPXuoh9e1xvvwMgxlq7zOz/3SZAooO3iIA=; b=dZJtU7RIhEfmZW
	70/EZRDEdjPZ5j/MEVSosTm+zO7fwSAg/KWKtN23l8dZaYQmZ1bwuCeqP/ZD1BSD52w5UU+Qbc58b
	98b9gvYcIRlwqO0LMvvpGZcACij8s+6LMpnJorc8oZBPf2Lfu4p+3/3nyIHo6hp1snU7yfwscuVwy
	r1lIszrQnDbQ4tGIBdSsunpOGxotE/VNzd94Nyt0zwmW5l2CBufHUFKEArNns9ixTb+cFeXkNKaXB
	Bdwe6PGoCudrm7c2e8BXNVpmqCblFL9TppeT22rjvUSOJE5NtKzRcazaNaynnAYvXKvWGOCj9/yHm
	XO3HeHTPUJ3NN5h6SCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVE39-0027He-Vt; Fri, 18 Mar 2022 14:57:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVE1D-0026Ty-J5; Fri, 18 Mar 2022 14:55:57 +0000
X-UUID: adba7191103b4875b562118ce773e35e-20220318
X-UUID: adba7191103b4875b562118ce773e35e-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1540854173; Fri, 18 Mar 2022 07:55:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 07:46:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 22:45:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Mar 2022 22:45:58 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 21/22] arm64: dts: mt8192: Add gce info for display nodes
Date: Fri, 18 Mar 2022 22:45:33 +0800
Message-ID: <20220318144534.17996-22-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_075555_680595_4A75932C 
X-CRM114-Status: UNSURE (   9.70  )
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

Add gce info for display nodes
- It's required to get drivers' CMDQ support

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 08e0dd2483d1..f0f0f067c023 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1203,6 +1203,9 @@
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8192-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
@@ -1212,6 +1215,8 @@
 			reg = <0 0x14001000 0 0x1000>;
 			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
+			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
+					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
 		};
 
 		smi_common: smi@14002000 {
@@ -1253,6 +1258,7 @@
 			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
 				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
 		};
 
 		ovl_2l0: ovl@14006000 {
@@ -1263,6 +1269,7 @@
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
 				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
 		};
 
 		rdma0: rdma@14007000 {
@@ -1274,6 +1281,7 @@
 			mediatek,larb = <&larb0>;
 			mediatek,rdma-fifo-size = <5120>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
 		};
 
 		color0: color@14009000 {
@@ -1283,6 +1291,7 @@
 			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
 		};
 
 		ccorr0: ccorr@1400a000 {
@@ -1291,6 +1300,7 @@
 			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
 		};
 
 		aal0: aal@1400b000 {
@@ -1300,6 +1310,7 @@
 			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
 
 		gamma0: gamma@1400c000 {
@@ -1309,6 +1320,7 @@
 			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
 		postmask0: postmask@1400d000 {
@@ -1318,6 +1330,7 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
 			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
 		};
 
 		dither0: dither@1400e000 {
@@ -1327,6 +1340,7 @@
 			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
 		};
 
 		dsi0: dsi@14010000 {
@@ -1351,6 +1365,7 @@
 			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
 			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
 				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
 		};
 
 		rdma4: rdma@14015000 {
@@ -1361,6 +1376,7 @@
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
