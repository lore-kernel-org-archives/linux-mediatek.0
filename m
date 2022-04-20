Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Vgd3aN1z2jnHyqv2hIkJOWRSY1UlDmRhuI1A6uKMCs=; b=gN/tybgycYB41y
	qSjzj1nESmOXhQrhG+Is7xF7WnBmS5uTxfUaaHalzm8aHeQ58POEpi/nA11u1EzKZP0cAYg8XuUYI
	xRdf9V51bgzQsdZlRgNZ591bGPk1+0KnbsQLxAJqHyDvJsrQ+eNqFy37Lewlsgkun+Rd6jstWgz0m
	wlWyA3T2lSHvv9Qh06sVbXRtyQwEEro/CM688NF3D39qnDbrdJvflFBW/A1K+Ud/cWV7mLK6zR+WO
	+HQIdvdiSwQGMHx7INexigYEhnLCzTKovfI/Q51INPrdNNhMTcQr9LoEzToVv4NikdoLUAr5FpiSS
	eadb2+KZIVB4fGvRZ1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7Sg-008X4W-Fi; Wed, 20 Apr 2022 10:21:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7SG-008WlK-J4; Wed, 20 Apr 2022 10:21:03 +0000
X-UUID: aef75638d8b9406cbd44e47f93c2660e-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fa48d14f-a445-4855-8c2d-e3f4c83182bb, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:086659f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: aef75638d8b9406cbd44e47f93c2660e-20220420
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2043862913; Wed, 20 Apr 2022 03:20:51 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 03:20:50 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 18:20:48 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Apr 2022 18:20:48 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland
 <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: [PATCH v24 1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
Date: Wed, 20 Apr 2022 18:20:38 +0800
Message-ID: <20220420102044.10832-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220420102044.10832-1-roger.lu@mediatek.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_032100_665683_F6605035 
X-CRM114-Status: GOOD (  13.81  )
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

Document the binding for enabling mtk svs on MediaTek SoC.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/soc/mediatek/mtk-svs.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
new file mode 100644
index 000000000000..1e51e5f562d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mtk-svs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Smart Voltage Scaling (SVS) Device Tree Bindings
+
+maintainers:
+  - Roger Lu <roger.lu@mediatek.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Kevin Hilman <khilman@kernel.org>
+
+description: |+
+  The SVS engine is a piece of hardware which has several
+  controllers(banks) for calculating suitable voltage to
+  different power domains(CPU/GPU/CCI) according to
+  chip process corner, temperatures and other factors. Then DVFS
+  driver could apply SVS bank voltage to PMIC/Buck.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-svs
+
+  reg:
+    maxItems: 1
+    description: Address range of the MTK SVS controller.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Main clock for MTK SVS controller to work.
+
+  clock-names:
+    const: main
+
+  nvmem-cells:
+    minItems: 1
+    description:
+      Phandle to the calibration data provided by a nvmem device.
+    items:
+      - description: SVS efuse for SVS controller
+      - description: Thermal efuse for SVS controller
+
+  nvmem-cell-names:
+    items:
+      - const: svs-calibration-data
+      - const: t-calibration-data
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        svs@1100b000 {
+            compatible = "mediatek,mt8183-svs";
+            reg = <0 0x1100b000 0 0x1000>;
+            interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&infracfg CLK_INFRA_THERM>;
+            clock-names = "main";
+            nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
+            nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+        };
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
