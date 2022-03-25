Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB2FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjY1jdGvR1fz8JLBej81YhQgnIcBJsIj2fmxskypAlA=; b=HUr+AoVWdEjmJP
	Vqsyv9JMyYq/v5BjW0l/vRDvfvP8uQ/t4smyrs0rUrNj1Kj8OzAXbqRvgBhfsXzqRzQrU5uGG+Nsd
	mXbJlaOSxAAxcIKwsCTHnITSeoyQ/9B85hdVAiB6T3Jp7pey5+FNkrKPAQBNBCQpu49wwQoXEMi0U
	VCMxVCcflfc9MteSM5SP1pa5C/NkgNAJvX2LWbrN9JL9ODzPI+7XfbGpF6zuojXzrXAOBkKpwg4lc
	S6VIF+0T/NtO8cJuDmxoc73itmy3bSL915TGbs5zz32AkIDzs8n4/Yd4k3hV4xeotQZQhHJ6Wb75n
	SEBBydTglG5fSLw95t7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnZf-002iLh-Lg; Fri, 25 Mar 2022 17:18:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYO-002hPS-R6
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:16:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 i67-20020a1c3b46000000b0038ce25c870dso1295950wma.1
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxLbJh/5GTpyK0sJHkMhIg51PKQ0gujNd33p5sfYd68=;
 b=25A0IRKOTfVWYt6ly9GPt/OjAFv2TMiYasnPsVRIu30KUgeWiS9JPJZ2ysQi5q/owZ
 gHB+w9zhhNcjcDodCfJoh9NgOwHYs2LBFVzaFDaxb4NRJ6BcNMCUqztopNNNVFvXDFYN
 pitmnvmAGxeDAtklO9ssjG3TCvC8r+Dcj7t7qem1dVJlyaKYPxml8dsT7RWQfrWmruvn
 CXPz8Dmj5xVRzL4FuuYLo678DuloDipYM7fmDpdFCmjClMQGhOJDAnnsZlXq+AdSq7I/
 A/1yXarnjisOiWXCApoiac4bOn6ZbtpHIAMqAfXiGn1pqxIw8Qo0pErnPlKaicjzbjGs
 d4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxLbJh/5GTpyK0sJHkMhIg51PKQ0gujNd33p5sfYd68=;
 b=6/0Lp/Sc3dSt+4s5xlUTyqEpBPH+KMPiHuB3g9t3K5RAjudmyqgsAkK/QlHaSOsR6g
 TafQmd3GlzoX9syjTkGuxAhm9ZgzolvKIEhEzsyO0CYD6U216QvloLiEu8nE7YOFTTKa
 wWw1aio3vqii2bs8e6WzvVw0ZuMR/LNaRPGtF7i6cpbOMnEd6eICg8rTr676+eoWzA+u
 0q6XOZCfyBZ7Dy85Nu+31jvqHsJhh1+J9maMQFeXUPqRshsKC9a4OkrDzr4AXtTds90F
 L98M5l9LMl4XZYFFbI1N0iZguCvqxdczl31GlE1vVXzlw3OAZGUo2HX81b3F/3s21BZ6
 jQ6w==
X-Gm-Message-State: AOAM5307zNZzcckHFpSqw82v9M8yaN9B0YXzBgiAz2QFmmpLp4h75yXe
 0CSeWBCsSoCnYBYvv8iYL7GMjQ==
X-Google-Smtp-Source: ABdhPJwNQpIImDscEbLueHTSw+vh13EH8/JtYWdT4NMiTrPeQs+QvSgzCntOpuP2NQR+McLC+CEjAA==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr10820156wms.75.1648228607273; 
 Fri, 25 Mar 2022 10:16:47 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:16:46 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH 02/22] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 25 Mar 2022 18:14:51 +0100
Message-Id: <20220325171511.23493-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101648_949595_302CF5C3 
X-CRM114-Status: GOOD (  13.39  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

This controller is present on several mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible field is added.

The controller can have two forms, as a normal display port and as an
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/mediatek/mediatek,dp.yaml         | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..74db5c4e0f73
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Display Port Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port controller
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-tx
+      - syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: faxi clock
+
+  clock-names:
+    items:
+      - const: faxi
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: dp
+
+  power-domains:
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
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    edp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-dp-tx","syscon";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
+        phys = <&dp_phy>;
+        phy-names = "dp";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                edp_in: endpoint {
+                    remote-endpoint = <&dp_intf0_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                edp_out: endpoint {
+                	remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
