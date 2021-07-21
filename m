Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA137C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 07:44:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6671260241
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 07:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6671260241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBi1Lvs+C5V3flsxBpDweW8CNsVGRCH+IXl/JcBr030=; b=SlYvqAZHdtDWg5
	AUTfCjHho78UL7NKHk57DBFIaaovIk4bq4HBACugR89GnvKLI7lakgTDRmHz6b5gosDoTx/31Hd1r
	vKTs0ZvLCWTT36imJ29DCcjDXr5kaeWf/5+hdQn5kjKs5nfyi8XyK/Xr2iU0go/anNHozQ7uYoF9c
	/3DLmlk0IC995ccL09hKvdXKcgnaEFm6ChUiDNK7rWRtOy4LWHIAkoC2JKKThL2Yk+aRiOg1Yemr8
	mwxXsGQ8r5FI+QuhOE75eT8/SkQZDE1peEcBSZ6zKVxoGSneMChHCfB5Kvhr0FZIVGBC10JZuBLTv
	a4TIMaKDo/70zqB1nTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m66ta-00Ek3Y-8L; Wed, 21 Jul 2021 07:43:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m66sl-00Ejgb-PA; Wed, 21 Jul 2021 07:43:09 +0000
X-UUID: 9a857d105efd4ae2854d183979b8b2f9-20210721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fj4vv7ZOvppbF++JOtpzDzNxksfEbL62GBpi431CYzs=; 
 b=k5AkTrjdSdHA/wJxjrQk+xOu/yKyxkoaEd3+qAGDiCt0Wwj+pNGer7hFBrKWaxrR9s4YEiCopoHWiRK26NUFX3qshVLrLJMeIBsk8lDs+GQIVo7N69qfxlryiAUy+U0NPea9nUSMGv1saZ1uAuKonJ4RpUN1ulhPWRAJJN4TAG0=;
X-UUID: 9a857d105efd4ae2854d183979b8b2f9-20210721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 144468953; Wed, 21 Jul 2021 00:43:05 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 00:39:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 15:09:05 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 21 Jul 2021 15:09:05 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH v20 1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
Date: Wed, 21 Jul 2021 15:08:58 +0800
Message-ID: <20210721070904.15636-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210721070904.15636-1-roger.lu@mediatek.com>
References: <20210721070904.15636-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_004307_863863_42E51CF9 
X-CRM114-Status: GOOD (  14.80  )
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
---
 .../bindings/soc/mediatek/mtk-svs.yaml        | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
new file mode 100644
index 000000000000..a855ced410f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -0,0 +1,84 @@
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
+    maxItems: 2
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
