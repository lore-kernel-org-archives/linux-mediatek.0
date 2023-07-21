Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01E9EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajxKOtFrl9zTvCiguKQkVQbiQlUvF2Tj5V0pLBV1IZ0=; b=Au38K6pgz4ElaNrO2q/2GDND5Z
	G/YYlkRP2mR//yU4KoX6qS3ojBNp8z5baNspWQVnV5I7cvV/tpivoX24vg7+WGdo9BbgukeeE2CxQ
	ydUWSe5R2r9toEVKCClBCygbLYUsQK5fHGayHHBBtjGpQaForelKlnGUJZ5QXHZekFbGMQXZ1HvRD
	e6THjI46RBXVtLJ32yILqxN7r8ysWlm2vC2PXKZNVQkz3iylN0xqvZypwkyt0iPUNgqqSj5NUPwO+
	T7tMuUW3gD3XtTLswxJa4NFAA8DcMJTPBqEvV7186cTOzNoKgfz8BGMx90bHWxzYtRGOnpwpo1Es/
	PzZl0xww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlVE-00DN2l-1Q;
	Fri, 21 Jul 2023 08:28:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlV5-00DMwE-2D;
	Fri, 21 Jul 2023 08:28:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B8546607099;
	Fri, 21 Jul 2023 09:28:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689928110;
	bh=SeHdv9Ddp8uN+TPdT0ZnU4kCN3tmwQtk6+0gsvGQVhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CapJPY+2IRzKi/Z1La/ffQJcYMkp2Z5XSt5d2nH7TM8cjd5VyPe5kuc94dbxyDL8e
	 bXKiUU6bOj69ofTxLljkO7MKnOCcDPEk5D43iHvnRPjOFS+WUDM4sWmzh3Gi0luWSr
	 rtxlhWgtOkauWefI+W50LRtFa0VJqEV7LMQVS1JtejoqtWBJsN909LceADYMVQwJZc
	 h/KLMWPDNhBnmPevwTQXUHMyo6hNq8M7ABR5WfDNiEHHrCTREdMOGNTelGqBKOz2iW
	 F3QtGBJcBfPjJlK80hF4/DS1ncAv0eeAc5mSPhEJOCy/o66rQxdmcAXu/GKX/384tR
	 uDGsFFOp9Zhag==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 1/3] arm64: dts: mediatek: mt6795: Add support for display blocks and DPI/DSI
Date: Fri, 21 Jul 2023 10:28:20 +0200
Message-ID: <20230721082822.680010-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
References: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012836_021866_5E632F98 
X-CRM114-Status: GOOD (  11.00  )
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

Introduce all nodes for all of the display blocks in the MediaTek Helio
X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
left disabled as usage is board specific.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 251 +++++++++++++++++++++++
 1 file changed, 251 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 597bce2fed72..3485a2a9a19e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2015 MediaTek Inc.
+ * Copyright (C) 2023 Collabora Ltd.
  * Author: Mars.C <mars.cheng@mediatek.com>
+ *         AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -19,6 +21,23 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl0 = &ovl0;
+		ovl1 = &ovl1;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		rdma2 = &rdma2;
+		wdma0 = &wdma0;
+		wdma1 = &wdma1;
+		color0 = &color0;
+		color1 = &color1;
+		split0 = &split0;
+		split1 = &split1;
+		dpi0 = &dpi0;
+		dsi0 = &dsi0;
+		dsi1 = &dsi1;
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
@@ -434,6 +453,26 @@ gce: mailbox@10212000 {
 			#mbox-cells = <2>;
 		};
 
+		mipi_tx0: dsi-phy@10215000 {
+			compatible = "mediatek,mt8173-mipi-tx";
+			reg = <0 0x10215000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		mipi_tx1: dsi-phy@10216000 {
+			compatible = "mediatek,mt8173-mipi-tx";
+			reg = <0 0x10216000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx1_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -690,6 +729,211 @@ mmsys: syscon@14000000 {
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		ovl0: ovl@1400c000 {
+			compatible = "mediatek,mt6795-disp-ovl", "mediatek,mt8173-disp-ovl";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+		};
+
+		ovl1: ovl@1400d000 {
+			compatible = "mediatek,mt6795-disp-ovl", "mediatek,mt8173-disp-ovl";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1>;
+			iommus = <&iommu M4U_PORT_DISP_OVL1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+		};
+
+		rdma0: rdma@1400e000 {
+			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+		};
+
+		rdma1: rdma@1400f000 {
+			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+		};
+
+		rdma2: rdma@14010000 {
+			compatible = "mediatek,mt6795-disp-rdma", "mediatek,mt8173-disp-rdma";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
+		};
+
+		wdma0: wdma@14011000 {
+			compatible = "mediatek,mt6795-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+		};
+
+		wdma1: wdma@14012000 {
+			compatible = "mediatek,mt6795-disp-wdma", "mediatek,mt8173-disp-wdma";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+		};
+
+		color0: color@14013000 {
+			compatible = "mediatek,mt6795-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x14013000 0 0x1000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+		};
+
+		color1: color@14014000 {
+			compatible = "mediatek,mt6795-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x14014000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
+		};
+
+		aal@14015000 {
+			compatible = "mediatek,mt6795-disp-aal", "mediatek,mt8173-disp-aal";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+		};
+
+		gamma@14016000 {
+			compatible = "mediatek,mt6795-disp-gamma", "mediatek,mt8173-disp-gamma";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+		};
+
+		merge@14017000 {
+			compatible = "mediatek,mt6795-disp-merge", "mediatek,mt8173-disp-merge";
+			reg = <0 0x14017000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_MERGE>;
+		};
+
+		split0: split@14018000 {
+			compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";
+			reg = <0 0x14018000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+		};
+
+		split1: split@14019000 {
+			compatible = "mediatek,mt6795-disp-split", "mediatek,mt8173-disp-split";
+			reg = <0 0x14019000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_SPLIT1>;
+		};
+
+		ufoe@1401a000 {
+			compatible = "mediatek,mt6795-disp-ufoe", "mediatek,mt8173-disp-ufoe";
+			reg = <0 0x1401a000 0 0x1000>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_UFOE>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
+		};
+
+		dsi0: dsi@1401b000 {
+			compatible = "mediatek,mt6795-dsi", "mediatek,mt8173-dsi";
+			reg = <0 0x1401b000 0 0x1000>;
+			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI0_ENGINE>,
+				 <&mmsys CLK_MM_DSI0_DIGITAL>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		dsi1: dsi@1401c000 {
+			compatible = "mediatek,mt6795-dsi", "mediatek,mt8173-dsi";
+			reg = <0 0x1401c000 0 0x1000>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI1_ENGINE>,
+				 <&mmsys CLK_MM_DSI1_DIGITAL>,
+				 <&mipi_tx1>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx1>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		dpi0: dpi@1401d000 {
+			compatible = "mediatek,mt6795-dpi", "mediatek,mt8183-dpi";
+			reg = <0 0x1401d000 0 0x1000>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DPI_PIXEL>,
+				 <&mmsys CLK_MM_DPI_ENGINE>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+			status = "disabled";
+		};
+
+		pwm0: pwm@1401e000 {
+			compatible = "mediatek,mt6795-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1401e000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&mmsys CLK_MM_DISP_PWM026M>, <&mmsys CLK_MM_DISP_PWM0MM>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
+		pwm1: pwm@1401f000 {
+			compatible = "mediatek,mt6795-disp-pwm", "mediatek,mt8173-disp-pwm";
+			reg = <0 0x1401f000 0 0x1000>;
+			#pwm-cells = <2>;
+			clocks = <&mmsys CLK_MM_DISP_PWM126M>, <&mmsys CLK_MM_DISP_PWM1MM>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
+		mutex: mutex@14020000 {
+			compatible = "mediatek,mt8173-disp-mutex";
+			reg = <0 0x14020000 0 0x1000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_MUTEX_32K>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
+		};
+
 		larb0: larb@14021000 {
 			compatible = "mediatek,mt6795-smi-larb";
 			reg = <0 0x14021000 0 0x1000>;
@@ -708,6 +952,13 @@ smi_common: smi@14022000 {
 			clock-names = "apb", "smi";
 		};
 
+		od@14023000 {
+			compatible = "mediatek,mt6795-disp-od", "mediatek,mt8173-disp-od";
+			reg = <0 0x14023000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OD>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
+		};
+
 		larb2: larb@15001000 {
 			compatible = "mediatek,mt6795-smi-larb";
 			reg = <0 0x15001000 0 0x1000>;
-- 
2.41.0


