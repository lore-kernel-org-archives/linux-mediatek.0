Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BCBC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8dqe35PIjJM4g0zIru+4r9kftuAYVrE3lGfLmI9emw=; b=EdmvNVdW75sUfi1NdP8QWyZ8vz
	+E5m6Kf3X3Ynr/we408SsoQRBO72iOMkc+iEOpY7gLTYIpdBgpYcVAevkKD2K2FY1DrxrFu+xapHO
	LUt3HBBPmybJ/PFReAjZ9HohSpZmHwIMahqTxcdGMARElOL4Sk5loFQSX75dmRXGARuFUFYwX43UC
	/qbQ0KS5B7RAe4PmZz94OH+imE4vxrNyDx1e2bFVwn88BpXcjk+ohOq3+8ZPLj/+edTXN+YFppSGt
	KokGYDvAGVOIzRyna1kcyfUEPy08VVekkdFlxXacy/gVW4+d0G8TbrYp4FahJzUwUKfDl9XTGoEqi
	oAOD1O1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI50S-000AVL-Fc; Wed, 18 Jan 2023 09:45:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI50R-000AUa-3J; Wed, 18 Jan 2023 09:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v8dqe35PIjJM4g0zIru+4r9kftuAYVrE3lGfLmI9emw=; b=VddShD6z04uZCOrBpDCdv7feLD
	2TxKeDntVcu2sBt5zqUfZnWC8Q+VcEbR8q8R29CBm2gAzHd9OkY5sBHJtWKgHwTeW/Z4EkGqmwbhO
	Bzv8sNRgslsgAPojmMlL7ZOhtnLnDoRipIj95ZXOXIdJc/VSRGrGx5cCK4Jqxxn2yGcUMPxwlGN/7
	oT0+0Xkg1XxiTz6wdRolg+WfKzX+B7PqpbpMg4vQLT+xoxZtZyr36uCC4EEoCz9ucPyL6Wxy0RQgx
	ykNsajpSAJKMfwrybmLnlUSKJ4oTAZk2oAP6oSfq917YLkx/s6wnQ++hPmOdG+eDGjMB9MytO0k/u
	f0N/Skrg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI50W-00AXpk-Kz; Wed, 18 Jan 2023 09:45:31 +0000
X-UUID: a1ca6ee6971211edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=v8dqe35PIjJM4g0zIru+4r9kftuAYVrE3lGfLmI9emw=;
	b=WOI3LnKRwLDZhGsLwxLcDmeEWWVAe3gvxEdWLW/4nDoZl4kxwcAvdOlw4zuU/5XrQnWFrzrbelxmyudMUUi/3h78lUH8M0ZcHiKjN8FnnltgYTs20u/O49+f/0BDef22xNnyXILashJkHX5BcpXS/8fa7jxefm1MHESfNqQyPQg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:6604f329-6009-4b41-9691-af5392d46ee9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:5f980055-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a1ca6ee6971211edbbe3f76fe852e059-20230118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 470584982; Wed, 18 Jan 2023 02:29:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 18 Jan 2023 17:18:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:36 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 9/9] arm64: dts: mediatek: mt8186: Add display nodes
Date: Wed, 18 Jan 2023 17:18:29 +0800
Message-ID: <20230118091829.755-10-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_094527_546508_F8B21BB6 
X-CRM114-Status: GOOD (  12.46  )
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

Add display nodes and GCE info for MT8186 SoC. Also, add GCE
(Global Command Engine) properties to the display nodes in order to
enable the usage of the CMDQ (Command Queue), which is required for
operating the display.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 135 +++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 45b9d6777929..90d1b631bc8f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include <dt-bindings/clock/mt8186-clk.h>
+#include <dt-bindings/gce/mt8186-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8186-memory-port.h>
@@ -19,6 +20,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl = &ovl;
+		ovl_2l= &ovl_2l;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -632,6 +640,15 @@
 			clocks = <&clk13m>;
 		};
 
+		gce: mailbox@1022c000 {
+			compatible = "mediatek,mt8186-gce";
+			reg = <0 0X1022c000 0 0x4000>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+			clock-names = "gce";
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8186-scp";
 			reg = <0 0x10500000 0 0x40000>,
@@ -1197,6 +1214,20 @@
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
+
+		mutex: mutex@14001000 {
+			compatible = "mediatek,mt8186-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
+					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
 		smi_common: smi@14002000 {
@@ -1230,6 +1261,49 @@
 			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
+		ovl: ovl@14005000 {
+			compatible = "mediatek,mt8186-disp-ovl",
+				     "mediatek,mt8192-disp-ovl";
+			reg = <0 0x14005000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L0_OVL_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		ovl_2l: ovl@14006000 {
+			compatible = "mediatek,mt8186-disp-ovl-2l",
+				     "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14006000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_OVL_2L_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		rdma0: rdma@14007000 {
+			compatible = "mediatek,mt8186-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_DISP_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		color: color@14009000 {
+			compatible = "mediatek,mt8186-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x14009000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		dpi: dpi@1400a000 {
 			compatible = "mediatek,mt8186-dpi";
 			reg = <0 0x1400a000 0 0x1000>;
@@ -1247,6 +1321,56 @@
 			};
 		};
 
+		ccorr: ccorr@1400b000 {
+			compatible = "mediatek,mt8186-disp-ccorr",
+				     "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		aal: aal@1400c000 {
+			compatible = "mediatek,mt8186-disp-aal",
+				     "mediatek,mt8183-disp-aal";
+			reg = <0 0x1400c000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		gamma: gamma@1400d000 {
+			compatible = "mediatek,mt8186-disp-gamma",
+				     "mediatek,mt8183-disp-gamma";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		postmask: postmask@1400e000 {
+			compatible = "mediatek,mt8186-disp-postmask",
+				     "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1400e000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		dither: dither@1400f000 {
+			compatible = "mediatek,mt8186-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		dsi0: dsi@14013000 {
 			compatible = "mediatek,mt8186-dsi";
 			reg = <0 0x14013000 0 0x1000>;
@@ -1280,6 +1404,17 @@
 			#iommu-cells = <1>;
 		};
 
+		rdma1: rdma@1401f000 {
+			compatible = "mediatek,mt8186-disp-rdma",
+				     "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1401f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_DISP_RDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xf000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		wpesys: clock-controller@14020000 {
 			compatible = "mediatek,mt8186-wpesys";
 			reg = <0 0x14020000 0 0x1000>;
-- 
2.18.0


