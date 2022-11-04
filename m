Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5055DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0q8teUzKNgtMplj7gJB0893Qj4aOvidpeEgoISBJV9A=; b=M9rEHXMi1GCa0OFsvZf2E/kAmY
	EgvDd2fboLYgNImotJs0GITTiAJZKP7N0njTvsW+Pd0txLeqoSzxo0twbaxvQxqB9mzhqqVaOlXrY
	936RF9xMtAUSPX2tONyM+dOUYF/bXAcrbBVo0xv35L1YUaL9SiMOm1SuV5FoP2v1Wf6EJy0DNRwEN
	vTU5j+uIgS2d2f3LwOoEefDvpy5J8KFgb98TjP/SzaL1LoVHi++HDrHmrDpuUpwkfSJJKL5QKgIto
	M7FUTWREXaJ/3nxMfNdNsIvO3N1xxmSrYh7LTr0sL2xGnUCdOM3ZIynnWcaVz6zD+HslQkDEvUioA
	0lwdgTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyQa-0049Q3-2g; Fri, 04 Nov 2022 15:16:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxSW-003skQ-GI
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 14:14:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id r186-20020a1c44c3000000b003cf4d389c41so5501457wma.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0q8teUzKNgtMplj7gJB0893Qj4aOvidpeEgoISBJV9A=;
        b=HbgG0kEc9BSFFor9gq+tpXzxHNCwNuoUwyoRQJS3dAQ/YrwqgnlWsZBAByoQIqb6Vk
         gJUPZDgjUPBPg3+T6MBSV8PQfXTUSUIM4CzjU4SHkU+3GE1u//QcHRVHosAe2JRaXwP+
         hcLANi0iFlOZvFthWT/YobhcxIdk0I58sahY3LRXxAA2wYCEkbgMNWrDjQxfpSgNWqW1
         oQoJC8ZDz3YWbOvGZSJphyP82fyRKeqv/Hb5X/umrnOUImlxScHuYt6sVZQYgDXsJ0BT
         /ZrTVbzpBluQ7aJRYR0vxYqgDnD2XuC6leAqlmiD+dE3AJMxlcvNyByDHdrI1KETPNdT
         13zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0q8teUzKNgtMplj7gJB0893Qj4aOvidpeEgoISBJV9A=;
        b=bvj25ccJ9hDbgtBUcKixc/L6mmV3aCk/sk2p909IMabPGhy04Z9DwUNL6qQiPnJSBA
         VVdhuY5ofb0KDa7untvxBXAMd+edu/gIfwmZc0DuLKQZOLBxkcznzbq+P8x/5FylCCQe
         xJezavVfhdGJhbRt0cpv3F9loB9T8BhjHbnpS/MX+pmSG8qXP0Q2PnWjTycQjx5Azpip
         5XMAFRRt78pZ0muvPITwvhs2HiRwmtAZBSNvFT8EHvXqn2dtQ48Epd2qH/cJ+qrfkUSt
         JF8IJqnmDcO0gCckMinjLak8GqvomvJbsHTXI55nmYT+ckJkQvE9wZc/PvH7aQag5Hmq
         kLOQ==
X-Gm-Message-State: ACrzQf2yLgTnJ+pF8VsKyyMo5NXBuLfUmHeGDO+58di/7LNfPdHx/bYX
	tidSOjGjeXza/sAsphZTM3fDPg==
X-Google-Smtp-Source: AMsMyM7kxdfrCh9pAcyAISWlhEGYBRt8NTBSUUXcJr54mIhTbztE0AxpM7P3yDFdZcFqth3QR8k8OA==
X-Received: by 2002:a05:600c:384f:b0:3c6:fb0d:4369 with SMTP id s15-20020a05600c384f00b003c6fb0d4369mr23498820wmr.18.1667571250782;
        Fri, 04 Nov 2022 07:14:10 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6440:7fff:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:14:10 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:48 +0100
Subject: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-2-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, mac.shen@mediatek.com,
 linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_071413_193529_0B7F6AD0 
X-CRM114-Status: GOOD (  13.30  )
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

Add mt8195 SoC bindings for hdmi and hdmi-ddc

On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
specific register range, power domain or interrupt, making it simpler
than its the legacy "mediatek,hdmi-ddc" binding.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,hdmi.yaml   | 61 ++++++++++++++++++----
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++++
 2 files changed, 101 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index bdaf0b51e68c..9710b7b6e9bf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt7623-hdmi
       - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
+      - mediatek,mt8195-hdmi
 
   reg:
     maxItems: 1
@@ -29,18 +30,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Pixel Clock
-      - description: HDMI PLL
-      - description: Bit Clock
-      - description: S/PDIF Clock
+    minItems: 4
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: pixel
-      - const: pll
-      - const: bclk
-      - const: spdif
+    minItems: 4
+    maxItems: 4
 
   phys:
     maxItems: 1
@@ -58,6 +53,9 @@ properties:
     description: |
       phandle link and register offset to the system configuration registers.
 
+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -86,9 +84,50 @@ required:
   - clock-names
   - phys
   - phy-names
-  - mediatek,syscon-hdmi
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-hdmi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: APB
+            - description: HDCP
+            - description: HDCP 24M
+            - description: Split HDMI
+        clock-names:
+          items:
+            - const: hdmi_apb_sel
+            - const: hdcp_sel
+            - const: hdcp24_sel
+            - const: split_hdmi
+
+      required:
+        - power-domains
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Pixel Clock
+            - description: HDMI PLL
+            - description: Bit Clock
+            - description: S/PDIF Clock
+
+        clock-names:
+          items:
+            - const: pixel
+            - const: pll
+            - const: bclk
+            - const: spdif
+
+      required:
+        - mediatek,syscon-hdmi
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..2dc273689584
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek HDMI DDC for mt8195
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ddc
+
+  mediatek,hdmi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the mt8195 hdmi controller
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    hdmiddc0: i2c {
+      compatible = "mediatek,mt8195-hdmi-ddc";
+      mediatek,hdmi = <&hdmi0>;
+      clocks = <&clk26m>;
+      clock-names = "ddc";
+    };
+
+...

-- 
b4 0.11.0-dev

