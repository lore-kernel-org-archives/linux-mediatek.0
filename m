Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120BDC44501
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmuaA7CQM5kfF4R4D41P2/uj/fuqD+WZUHUX9nM+Eok=; b=3+cp2XaBqpzN8D/jJzBopdzxOW
	1aHjtbMBZ5wkxy7x5GVdpj2skuwrKzzQKwyZGI65ksgNSwv/7WEzH2BeueWRWc+c7I5VzSNGHMDgY
	FhIJFk2eHMOzvxlkg5XYfDhx2QgMHhnh0JR6CWJdWZhY72SOC1aowxmtF2Aq8ZIL9yDcl4BR85NRF
	Nv3xdpdo0fGua0V2lVZ4coOy0bpgT2k0FWPqnRP0eN+IfEhpvRAdkSwztiv/+d5/Rwdvv8bzg9XeK
	3kBaAe/9msh0KYuzwxlHXg8ZW+oSeXJq/gNvPklSV513BcT7VUFf7fH+vHJXczeQPEr4NTOHgPpRk
	LQTOyp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbaf-0000000Bl6h-2zyd;
	Tue, 14 Jul 2026 11:46:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZT-0000000Bj2W-26hW;
	Tue, 14 Jul 2026 11:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029505;
	bh=ClA51ehGfc+53HAJ14Zi2DCaC4jJzbm7j/qEgbaleK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SMTxAIg4TttPeg76L1HyXJUrBbOnTgm1ZiPp4bpqjhOVEtHAGGLU0ad7pYNE4fdV/
	 H9CSbve4KLMkrWmBvJyN5j6YMhfnSAfrBYA/H2R2l4P4/2RqBKcKveepWBhTmd+ky1
	 VSqhE3ImXUiZ2PrnCspCjoyXtTUCZEfDSRaE0Cdcs5MZEQAUJFdGG8oytrQEJpherq
	 c591TMZWzKjHf9/AuzxbhnuGOIwSBErw5sOLQIDNR9hGKfdJDlWJIFOEhAe7bRxl4m
	 uoFKhCEgDzHXQqZSJC8jQA3i01/Tm4TM3IkfFeVPo/ld9fJUx7FzS1l5ptsdo9Neh9
	 vDNPlb5Z1YaFw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94EA617E0857;
	Tue, 14 Jul 2026 13:45:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 27/46] dt-bindings: display: mediatek: Introduce Digital Video Output HW
Date: Tue, 14 Jul 2026 13:43:55 +0200
Message-ID: <20260714114414.184512-28-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044509_890525_5E00CFF7 
X-CRM114-Status: GOOD (  12.57  )
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

Add documentation for the Digital Video Output (DVO) IP found in
the newer generation SoCs MT8196, MT8189 and their variants.

This is effectively a more capable block replacing the DisplayPort
Interface (DPI/DP_INTF) one found in older SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,mt8196-dvo.yaml | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
new file mode 100644
index 000000000000..b38960327ca1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-dvo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Digital Video Output (DVO) Controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek Digital Video Output (DVO) hardware provides 120-bits (4P) data,
+  video timing and info data for the Embedded DisplayPort, hardware-abstracting
+  the previous generation Display Port Interface (DPI/DP_INTF) blocks, other
+  than providing new capabilities.
+  This hardware block supports 1/2/4 pixels per iteration in both its input and
+  output and provides 8/10-bit RGB, YUV422 and YUV444 data formats in output,
+  other than supporting input/output video window cropping and padding.
+  Digital Video Output also provides Panel Self Refresh (PSR) and Multi-SST
+  Operation (MSO) features for eDP 1.3/1.4.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8189-dp-dvo
+      - mediatek,mt8189-edp-dvo
+      - mediatek,mt8196-edp-dvo
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Pixel Clock
+      - description: Engine Clock
+      - description: DVO PLL
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: engine
+      - const: pll
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: sleep
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Digital Video Output's input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: DVO output to an HDMI, LVDS or DisplayPort encoder input
+
+    required:
+      - port@0
+      - port@1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: dvo
+
+  trigger-sources:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
+    #include <dt-bindings/power/mediatek,mt8196-power.h>
+
+    dvo@324c0000 {
+        compatible = "mediatek,mt8196-edp-dvo";
+        reg = <0x324c0000 0x1000>;
+        interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&dispsys1 CLK_MM1_DISP_DVO0>,
+                 <&dispsys1 CLK_MM1_MOD6>,
+                 <&apmixedsys_gp2 CLK_APMIXED2_TVDPLL3>;
+        clock-names = "pixel", "engine", "pll";
+        power-domains = <&hpm_hwv MT8196_POWER_DOMAIN_DIS0_DORMANT>;
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&dvo_pins_default>;
+        pinctrl-1 = <&dvo_pin_sleep>;
+        trigger-sources = <&disp1_mutex 29>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&directlink_output>;
+                };
+            };
+
+            port@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&displayport_input>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.54.0


