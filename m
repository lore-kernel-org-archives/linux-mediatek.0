Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDC5ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 05:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK3zv2X4SEvxbtBXVU/SS8Fp1ynU3qEQSwzWGO+YrBI=; b=BHYKNi7Yqpj5XjPPl/S2NyoHB9
	zXSBUZlpHlNwXdXEqIC5KpbNwGIMp9eIF6AMhtZMU2lIZ1qJgbsFP3m/9LWQ9q8Zf8fzWVFIkwOg2
	1rrL/352Q7SoXirVqDFbkj6c2aE2HhGJOhAlGxBSA7ynslGEcrv8cwb2yOt4JU5g/cUnSQCxGvx4b
	YSlGp16nzWCaMDrtHYd+eV1du09Ok/z8LbY1kdT7/D+6KPzlbBdSuT4PrSa1zooLZp/H2aCCq/jCH
	S/GtA5zeZlpDf8o+b0r6fQEw6XmwFBwPP0LoTT1mDKJkr73J2e1lejzRYJLW9m/vOY6S/8zvS+gaA
	9xvO3NwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcey-009n65-3H; Thu, 01 Sep 2022 05:22:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTceu-009n4S-Lk; Thu, 01 Sep 2022 05:22:34 +0000
X-UUID: c2f4f378f8cb43738ca9a79dace1c9f6-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vK3zv2X4SEvxbtBXVU/SS8Fp1ynU3qEQSwzWGO+YrBI=;
	b=I2wSE8RnDUfmoEMu1AgBfUYNjQQ6xQTCQ0gBdd7+mMbQq3b98S20DbUzUHdJPi322ncAumcqOlp8929VBiAGVL61WMQzbf1IavgZpccCToJ+GvOnBhSh5B3L0p3YEmhMAokK3N3ZwiW4EdTkMfJevQH8FTQ9wm7KtPlu5lPpCQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:39fc272b-c157-4242-90f9-0275491c2cc9,OB:0,L
	OB:0,IP:0,URL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Relea
	se_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:0e203d56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c2f4f378f8cb43738ca9a79dace1c9f6-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 987345946; Wed, 31 Aug 2022 22:22:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Sep 2022 12:41:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 12:41:51 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v17 01/10] dt-bindings: mediatek,dp: Add Display Port binding
Date: Thu, 1 Sep 2022 12:41:40 +0800
Message-ID: <20220901044149.16782-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_222232_719744_CDEA8F34 
X-CRM114-Status: GOOD (  16.45  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/mediatek/mediatek,dp.yaml         | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..ff781f2174a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port Controller
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  MediaTek DP and eDP are different hardwares and there are some features
+  which are not supported for eDP. For example, audio is not supported for
+  eDP. Therefore, we need to use two different compatibles to describe them.
+  In addition, We just need to enable the power domain of DP, so the clock
+  of DP is generated by itself and we are not using other PLL to generate
+  clocks.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-tx
+      - mediatek,mt8195-edp-tx
+
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    maxItems: 1
+    description: efuse data for display port calibration
+
+  nvmem-cell-names:
+    const: dp_calibration_data
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the controller, usually dp_intf
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output endpoint of the controller
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                description: |
+                  number of lanes supported by the hardware.
+                  The possible values:
+                  0       - For 1 lane enabled in IP.
+                  0 1     - For 2 lanes enabled in IP.
+                  0 1 2 3 - For 4 lanes enabled in IP.
+                minItems: 1
+                maxItems: 4
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+  max-linkrate-mhz:
+    enum: [ 1620, 2700, 5400, 8100 ]
+    description: maximum link rate supported by the hardware.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+  - max-linkrate-mhz
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    dptx@1c600000 {
+        compatible = "mediatek,mt8195-dp-tx";
+        reg = <0x1c600000 0x8000>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
+        interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+        max-linkrate-mhz = <8100>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dptx_in: endpoint {
+                    remote-endpoint = <&dp_intf0_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                dptx_out: endpoint {
+                    data-lanes = <0 1 2 3>;
+                };
+            };
+        };
+    };
-- 
2.18.0


