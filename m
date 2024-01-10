Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00070C4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuFDvSADQtGDFtauNpgCupae53N/r/mrPBZ1wNJIP/4=; b=jlFHWyDvf+/UnRlkkmV+0A/CNm
	95kNG6H4iMrshwqqDyjq+B74Umh+urvXt7ux61qUklKEb4v/rjH5Xnw/3bh77c+ucd0yjUBTLhEbM
	r01N1b+KtZDOzLk3qyUJsBVUKFTzEDWxwEhq8cgWRruRWiaG4ja5pG4fEOW4stDmTc8O7K+T7vlw1
	QGSQYiqsQoB1ZLuySVsuIUXrcdqiSmX6Q9jvGevCifFm561QOIuDiyT0kC0KVrUPhZxnnmEKhm1YH
	xW5XdZq0QK1QUoGIqE7GPljHJ5YiCFwlL6eSPjtUW3zfg2V5LHyhv/7dm14PStKzU9oaRWbMJQX2T
	0p9rTbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZMD-00CF3X-1z;
	Wed, 10 Jan 2024 14:15:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZM7-00CEwo-1a
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 14:14:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40e4d515c9aso28381335e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jan 2024 06:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704896092; x=1705500892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuFDvSADQtGDFtauNpgCupae53N/r/mrPBZ1wNJIP/4=;
        b=xQ8n6A1CROAxF1I3HyN3hfWYXnweyyn4l5Kyig68NmfPbpZyh4zil6nuBTFGfy3tmM
         RVhlNqjnqvrc6nkPxI4w18lZ2ZPoarHEfo4g9YctBp/yaywU0O+mxgZ1C6NvIY3Kvhpk
         jVv+YzIHKUT/aPAsjJKGN0PZZnsSIO1fKxCNtyaFiF9tQIfTxyskdzjvdrDsH4mQ1IbS
         l1rwNgbGOviUNL3GQQN3Aq8ujQJd1QQBAem3lqKUm6KrlavHa+e12SeQQsctVegvSBb3
         skL8i7x0PGF+g18IpFH9GWz6xx41i9BsnzmpY5LilG69j11z4VJAeom/1Rl4iNlyvsey
         pvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896092; x=1705500892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuFDvSADQtGDFtauNpgCupae53N/r/mrPBZ1wNJIP/4=;
        b=QAu2bwVGlHzvAt/giPWIYmj8Ime3+NMg2BfjWhpkpyjjLXu4KUuWfebsTqxUy72lXx
         VJTI1Bz29XFpPNla4OEnatW5YZIkC+Yx5RH36RaRXnElElZLp+7gG3X/m+wxx/HnYeXH
         rkLuspASG0ctrxQlGM4XVmty1+CytTF2rDDkCvV7HtcaNc8GwiiBgx+G8wJTAJY5Jqbm
         zd/1XIoHmEPiuTdvOIjBZN2bUre7Ww+/6pjoQOHDWAZagge59SH2DrPuUUoZ6CZ+BzU/
         w5bFugjdtYNn4IgYo+5OD/ZZR2BIbh6un92jlO33lVR1udfLaJcjyuT5HfA81xbAlyhB
         jDPQ==
X-Gm-Message-State: AOJu0Yxr8Boq5gcM0zBoI1qECrlcLECA3YeU9d/hYBHVGmKZ3wWjdeTj
	DmdhDiJZwIcci9TSLrdNyqrWiaHq0+VsuA==
X-Google-Smtp-Source: AGHT+IHZolr5WggqPbXLxR47q9yPpF3T42AXvS0/DfzP512YbRVeysQflzhKSgg+c6y2x25aCBirKw==
X-Received: by 2002:a1c:7c02:0:b0:40e:42b5:a19b with SMTP id x2-20020a1c7c02000000b0040e42b5a19bmr668080wmc.154.1704896092186;
        Wed, 10 Jan 2024 06:14:52 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c1c1100b0040c46719966sm2363890wms.25.2024.01.10.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:14:51 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Wed, 10 Jan 2024 15:14:39 +0100
Message-ID: <20240110141443.364655-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110141443.364655-1-jstephan@baylibre.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_061455_700805_5C13EB8D 
X-CRM114-Status: GOOD (  16.36  )
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

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This adds the bindings, for the ISP3.0 camsv module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
---
 .../bindings/media/mediatek,mt8365-camsv.yaml | 109 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..097b1ab6bc72
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSV 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
+  receivers. The number of CAMSVs depend on the SoC model.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-camsv
+
+  reg:
+    items:
+      - description: camsv base
+      - description: img0 base
+      - description: tg base
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: cam clock
+      - description: camtg clock
+      - description: camsv clock
+
+  clock-names:
+    items:
+      - const: cam
+      - const: camtg
+      - const: camsv
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv0
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camsv1: camsv@15050000 {
+            compatible = "mediatek,mt8365-camsv";
+            reg = <0 0x15050000 0 0x0040>,
+                  <0 0x15050208 0 0x0020>,
+                  <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+                     <&camsys CLK_CAMTG>,
+                     <&camsys CLK_CAMSV0>;
+            clock-names = "cam", "camtg", "camsv";
+            iommus = <&iommu M4U_PORT_CAM_IMGO>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    camsv1_endpoint: endpoint {
+                        remote-endpoint = <&seninf_camsv1_endpoint>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4444e719cf8e..3ea2158864e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13616,6 +13616,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER
-- 
2.43.0


