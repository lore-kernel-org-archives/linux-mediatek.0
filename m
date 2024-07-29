Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9457C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El6+JDl0XXF4OJ/yktsnr1UYCyb9C9pq8a3SoWQOeX0=; b=ef2kw7t+sMejaqX499BvmS8xCS
	ataZaEkmqU0WdYrO0FAn1zWfiUmKHDIu7cPAkLx5WW1m8den81XTy2pepWlP66Qzi13VgNwjirtA0
	2z1OPExo2lYNJ0nPoX/iXfcYE7h4nfoWutlJqqqbLYyujqsSjebyKVAt4hcS/qQVKdXg2SVUIv8xs
	r73WragVrR7qukSJ37l4OICkeoEo0QYOGywogPi5E/0KOdhZwaLzB7bQqrcNIY9W6uKm+33x8HMPk
	XxmdFHRuAIPhrsTvMzIhwqx+N8novdRRpQc58XoWPDRQO+jWWtxVR7b1YI/dOmmB3RIzvqYp4XNsF
	zLDrcQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRnd-0000000BlS7-0sMB;
	Mon, 29 Jul 2024 14:56:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRfY-0000000BiyS-3OH7
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 14:48:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so11404005e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722264491; x=1722869291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El6+JDl0XXF4OJ/yktsnr1UYCyb9C9pq8a3SoWQOeX0=;
        b=wBhMBOCVYb3o+Pg/j4SyHGeVBOGXWjMlXsg1MaeBmLraWcD33Wwuo9D8tZSOpnHvLo
         /hwxFAC1iso0OEJjhtr0UXCXX7OpI7YT8OodP59RWo/7MiOCwZYe+1xBH2sTte8Bv3s+
         S7bPPDIG6PDsQSqguZykxUopcHtQHaR+DGDxeiu+RmssuWo8ghEv8I4xafFh97Fu9Z0F
         23HgB54YLp336e2jjBaIhSy3Hgs6vnIPWsOQAWim2T84Pmv8Styfk3uhsZ56ZdV2verL
         Povhv397h8QAGyPtBQrk6ha0ih9hWy8ZT16Bj3Uy3DAR7GPHnEZUuCi5hiXbAGwuWSxG
         6DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264491; x=1722869291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=El6+JDl0XXF4OJ/yktsnr1UYCyb9C9pq8a3SoWQOeX0=;
        b=cU138zGVo/HTq+SWxbnlMdEZNr6o7iXcPKkHmx9V4CctrveCUijaEvalAAwiz1XT2J
         iaJCKV7uA0X3bqoIMnEbLWLSvhj+2JKiMLQSDfm03Dxcwxtpx7yRiKqTNkxeHt9hDNgF
         hNSu1DFrh8eSRJqcyYhbdj6gCX4nMjYne3TIOfphGWs+H1kyCTtk3ixfoD6A7ARbETNl
         VvwDvkHJ5MhMPnbikrBn92qTCWcR4IucYr3PY5VztEGS+AeVFQ0n+Oajci0xmqsaaetF
         Qouzvcd/8wbVfLtKYJhGsbV7c02ShzAfl2jAru0REmZcD8VwbPzGGqsxdPCPjPEsed9x
         RdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEmCPo4aPKOwRdwcWGr7rmhlz61QaaNE67BxikcVtwq7FxLJzIz3TTeMIVxvKpfyVYTFoE7s1W7FTGfvXwWi3iVeNaD7AOTZ50SPTQm3XU0GK+
X-Gm-Message-State: AOJu0Yw7oZifGScetk4ep+VMeeWid2ScK+HxvBNSKuA7EzBlumthDFPM
	IQUVP8dIxRzPA/k7F+RKoVuZTiZZ08Bzhq+Brth5CAh/Vv8KXDlEAgfyDg6vu3vetVJ/ioh7GIw
	Fb3A=
X-Google-Smtp-Source: AGHT+IE8FVDrhc0tNwR4hZ5qn7fS2WRYXbujGagJOFKa+MBwNXzPpEShlqQ/xLV7SOrzYFG6J3nGKg==
X-Received: by 2002:a05:600c:a4b:b0:424:8dbe:817d with SMTP id 5b1f17b1804b1-42811e6ab12mr55428045e9.10.1722264491016;
        Mon, 29 Jul 2024 07:48:11 -0700 (PDT)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b645dsm180091705e9.43.2024.07.29.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:48:10 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 29 Jul 2024 16:48:01 +0200
Subject: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Phi-bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_074812_894615_1F0E11A2 
X-CRM114-Status: GOOD (  16.02  )
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
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..fdd076756459
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
+  The CAMSV is a video capture device that includes a DMA engine connected to
+  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
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
+        description: Connection to the SENINF output
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
+        camsv@15050000 {
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
index 6bd7df1c3e08..9ac8c08ba692 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER

-- 
2.45.1


