Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B5DC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiRxof4+y8SOmnlRNZqpBGO16GgrWx8YOI9oR2aJs+c=; b=Q5u13IrmgeD9wHfq362JRDAhDo
	wXBZFPprR6fboYFPmcVQCoc9q/SyUb9lqC/C5yF70gxNfWRqB1P1boIv5ut4pEbH6aloK/W8+uZAI
	lDxbWtZQY+i/0u6mgX73WBV0ckpInhtikx3gbRzMm5GIxvGoTRdRpyXG6Tb5LUA90wc2OdkiNib/Q
	nNB5XndFTt15sQAzZ6pYXssWfjPe4Ve8HATc3y4zzCRjC5jaGyr1oOmvu+wIuRL3lI25kuOFbT42K
	iK0fWgE6jXgaVx9Cfvinp1VYqW330Fg2gM8cvFboGiQn1gInrT7uVNUSGrvRERv/iQPovq/WN7dfs
	046IfFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaMd-000bLc-30; Mon, 28 Nov 2022 09:23:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaLL-000akA-1o; Mon, 28 Nov 2022 09:22:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2ED796602A89;
	Mon, 28 Nov 2022 09:22:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669627342;
	bh=8E9V/iMHvBxjB98xrLavQ6uGlM/JoXxCkUogZXNGwB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUrC4WjzwumMeYZvcEh7NGbHTOaZphbCWSXFLGRsIXSbnFWikcmqvT0cncOmZxOxd
	 KWD9siIn7IGBhe/BJUs7Lksl9o3KiHXGIaFB/0S/oQi6LKQwtBUj2mF0Hzetf5D9h7
	 4b7UG72zgRceULxQ+sqcKSMD2XYb58J7fg5m3SDNDRATU75JJVBMKu6IAOKw3rqjDP
	 pPNPl/tnaoVRDUxLgiGO/47WCEQ8NYU4uh5aOiCURwxMoM6HktbXLHUtPpWOUPH5Oe
	 rqc9VMbwGIYbyqm9CYc61MH6uVqJpcxgbNl8uvKQeESXUQOjXeH7/VLH4xG+1x/clw
	 iQGaRLJ/Fg5SA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	youlin.pei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: interrupt-controller: mediatek,cirq: Migrate to dt schema
Date: Mon, 28 Nov 2022 10:22:14 +0100
Message-Id: <20221128092217.36552-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128092217.36552-1-angelogioacchino.delregno@collabora.com>
References: <20221128092217.36552-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_012227_377700_1523CB21 
X-CRM114-Status: GOOD (  17.98  )
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

Migrate mediatek,cirq.txt to dt schema as mediatek,mtk-cirq.yaml.
While at it, I've also fixed some typos that were present in the
original txt binding, as it was suggesting that the compatible
string would have "mediatek,cirq" as compatible but, in reality,
that's supposed to be "mediatek,mtk-cirq" instead.

Little rewording on property descriptions also happened for
them to be more concise.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../interrupt-controller/mediatek,cirq.txt    | 33 ---------
 .../mediatek,mtk-cirq.yaml                    | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
deleted file mode 100644
index 5865f4f2c69d..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,cirq.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Mediatek 27xx cirq
-
-In Mediatek SOCs, the CIRQ is a low power interrupt controller designed to
-work outside MCUSYS which comprises with Cortex-Ax cores,CCI and GIC.
-The external interrupts (outside MCUSYS) will feed through CIRQ and connect
-to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
-interrupts and generate a pulse signal to parent interrupt controller when
-flush command is executed. With CIRQ, MCUSYS can be completely turned off
-to improve the system power consumption without losing interrupts.
-
-Required properties:
-- compatible: should be one of
-  - "mediatek,mt2701-cirq" for mt2701 CIRQ
-  - "mediatek,mt8135-cirq" for mt8135 CIRQ
-  - "mediatek,mt8173-cirq" for mt8173 CIRQ
-  and "mediatek,cirq" as a fallback.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
-- reg: Physical base address of the cirq registers and length of memory
-  mapped region.
-- mediatek,ext-irq-range: Identifies external irq number range in different
-  SOCs.
-
-Example:
-	cirq: interrupt-controller@10204000 {
-		compatible = "mediatek,mt2701-cirq",
-			     "mediatek,mtk-cirq";
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		interrupt-parent = <&sysirq>;
-		reg = <0 0x10204000 0 0x400>;
-		mediatek,ext-irq-start = <32 200>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
new file mode 100644
index 000000000000..4f1132c077ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mediatek,mtk-cirq.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Interrupt Controller
+
+maintainers:
+  - Youlin Pei <youlin.pei@mediatek.com>
+
+description:
+  In MediaTek SoCs, the CIRQ is a low power interrupt controller designed to
+  work outside of MCUSYS which comprises with Cortex-Ax cores, CCI and GIC.
+  The external interrupts (outside MCUSYS) will feed through CIRQ and connect
+  to GIC in MCUSYS. When CIRQ is enabled, it will record the edge-sensitive
+  interrupts and generate a pulse signal to parent interrupt controller when
+  flush command is executed. With CIRQ, MCUSYS can be completely turned off
+  to improve the system power consumption without losing interrupts.
+
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2701-cirq
+          - mediatek,mt8135-cirq
+          - mediatek,mt8173-cirq
+      - const: mediatek,mtk-cirq
+
+  reg:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 3
+
+  interrupt-controller: true
+
+  mediatek,ext-irq-range:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: First CIRQ interrupt
+      - description: Last CIRQ interrupt
+    description:
+      Identifies the range of external interrupts in different SoCs
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupt-controller
+  - mediatek,ext-irq-range
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cirq: interrupt-controller@10204000 {
+        compatible = "mediatek,mt2701-cirq", "mediatek,mtk-cirq";
+        reg = <0x10204000 0x400>;
+        #interrupt-cells = <3>;
+        interrupt-controller;
+        interrupt-parent = <&sysirq>;
+        mediatek,ext-irq-range = <32 200>;
+    };
-- 
2.38.1


