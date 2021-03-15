Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA94FC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:51:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D25261606
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D25261606
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQD53t/qaB32Za9KyeE5jQYBdCSB1j/J3QEle8kLVVQ=; b=L43lDSqCVwAq6qn3ISso5vmm2
	yF/tpaPe1GYz0eo7KAFAF/GDmVZ0netW1SzOcGYc8vmVoQC4rrTimFr3AH1m6B3Lb0qHOOA6mAl3Q
	UcadNbxD6s4J1YIVgSUPekn68Pc9lLZ5WXXW48OqjCXj9Qm2/bM8PWnns07/8vsxTC/OAjbFCsKEE
	d9xE1GkvHx5ijX6coszTCdVabYP7pzmcJMf8501UUMLY+/j+qbYxkP53I+bXZTBt/ppnqBfQS5N2s
	caRVPZqOBhzgB710zovgaWkBruPyIxyDut3xY6TOYiBMILbBkKlMgb8VSOu2UbxdpGTnzJGzbAFcw
	QdTraEJ0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLndJ-00Fzwp-Ch; Mon, 15 Mar 2021 13:51:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLncx-00FzcG-Iu; Mon, 15 Mar 2021 13:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=buOI73Ym9jYkYCSX63y0MRZ/ryxxoxkOcOrmRhxYKbM=; b=EdTiYq+eKX+Q1VW1iAAbaxZYCD
 uakmCm6L3MVSoV4yOWv8xSolH4tv3mW3kJFmWVe/5ItXPI49EXaOVQ9/I4UTgDiHqad5WbceLlJUr
 tkXK8kXMP43B5W3IgjIu29G9LGYY9BnWbyz+/5FkOIqiWNaSGuxtkSHX393bWzs4tKGlw6XK7gmO+
 2CPoj93nCQjvj5LD6pw5XNUVD02b/3FJKwZ8Cq+LYS8fQ249GPPfB1v480LG28myvXwgwMkX//mv1
 73hkldrE2pyM6rU3aEJ0bL2Z6vqz6sXMFDyUTUp5odBFRTRWhyK0DlEcVqPp6O2SWhS4Ah67SRXxD
 EaiEEUDg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnT5-000FSY-Uc; Mon, 15 Mar 2021 13:41:21 +0000
X-UUID: 952b52cf55554430833ff55008400668-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=buOI73Ym9jYkYCSX63y0MRZ/ryxxoxkOcOrmRhxYKbM=; 
 b=A0XLQ3y7pnCNKOy0/inCSG1qaheIOQ+0tVBLXCcQj7+ne3EJhD2jQDb/8hcfmpLlIhrdnR5iHZFjIJV+19Hw0uZf2yWuPapBpWjOiGCSgedvuEDs9VEQhHgVNC7/BeYhnJNQT3n3kIouOGaceYv+Jr/PaeQ60b0PLaa6mVnyanM=;
X-UUID: 952b52cf55554430833ff55008400668-20210315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1745837029; Mon, 15 Mar 2021 05:40:48 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 06:30:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 21:30:43 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 21:30:43 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
Date: Mon, 15 Mar 2021 21:30:12 +0800
Message-ID: <20210315133018.4976-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210315133018.4976-1-roger.lu@mediatek.com>
References: <20210315133018.4976-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 66AB2E5492AF4D95F41A3A968D75D36CEACA0955999A5CEC4867AD9258A86FA62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_134112_665450_6B35CD19 
X-CRM114-Status: GOOD (  11.85  )
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
---
 .../bindings/soc/mediatek/mtk-svs.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
new file mode 100644
index 000000000000..0d8d12f927de
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mtk-svs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Smart Voltage Scaling (SVS) Device Tree Bindings
+
+maintainers:
+  - Roger Lu <roger.lu@mediatek.com>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+  - Kevin Hilman <khilman@kernel.org>
+  - Nishanth Menon <nm@ti.com>
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
+  clocks:
+    maxItems: 1
+    description: Main clock for MTK SVS controller to work.
+
+  clock-names:
+    const: main
+
+  nvmem-cells:
+    maxItems: 2
+    description: |
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
