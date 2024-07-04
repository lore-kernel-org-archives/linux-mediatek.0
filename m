Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F6C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYPMoH4bkrCa+3pw12nCoA9Tah8I9q1IjZ3LY8Md8Pc=; b=V1PGug5cm9jwYX1YZAbC98hcuA
	5pS0cvAF021Em/K0VuDERmDvd91B00d62uScFJ8VPe0D9cCfCTpsoE5yY7BKfYEJiWaO1x1I/4VZL
	TqTvyO/0ENU7ExdnRhLnVj4NI6+pSgDHJeMRNsTbdNUtyDApTwkoIzSfJhglAIYAQtzn2DCTej/Nv
	JnxcDe/wFimFeIWICauFxhTqjGnHmJurZeWBpeEtn+N1O+t3DxSFzw3CkVyGaAfG4s721cuTJhB5c
	eyt086tZ1QumDn1IhiedBwrDVT5N707hIqfMjWR7ErJLc65R31JVUFYdWKGu9B8a7LjrPBdBU8tZ8
	LQcoO/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMeA-0000000DIxw-145x;
	Thu, 04 Jul 2024 13:37:14 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMdi-0000000DIlA-0XhA
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 13:36:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52e96d4986bso650930e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jul 2024 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100204; x=1720705004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYPMoH4bkrCa+3pw12nCoA9Tah8I9q1IjZ3LY8Md8Pc=;
        b=Aqu/3foYazwpj9jkLDsNaXpXgR7V5gHwNv3M421U0B0JVQ5m0hx1QJrpFVoCf4FbPH
         XzqcDLqAM/daetRzidtP9HZSCOel4s18I5RFWWLNALaIgDqQobZqe06wlzvLfEpRjmND
         WvsFudJE1KI3fM7l8Kgu+Sn5iCYbUQCLVQj3TQ9MyI766Ih5B+rWLhtY5XEUNPs9lUMb
         Huj2RajltcTTf071WmOtlA/btyJSrqoN2HT1NDRyluneDi2lgcW69/vjhVJ2HKMWpXLa
         yxW9iqCty4dkEBtGC259UKnMk+VEUsXzffPYrvZIlaq7clhTbIsOyrqr8p3xjJqd8e1C
         XceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100204; x=1720705004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYPMoH4bkrCa+3pw12nCoA9Tah8I9q1IjZ3LY8Md8Pc=;
        b=esHHrbwXBfDMUY5ASbzry1Xd/uEm7AOxsWjNgn6U9aQNgxoKSzqoy4Uo4nnDA61UJn
         VdeH92wjseHnQtFH88ZP4reYMybMimY+3N6WNXxv92wGuSm3NEp2hH3WH+HxxswWNtIJ
         iFF/dCat4+NeOpskkJS+pQPlthh5UhSAuUMv5nteyGgwKZxvVp8Qz+t30ShfGB21R07a
         uD0NMLfv7ELqf542/Epe+xoBL9UpyyrIOiyPIVQQGThOY2NCFjRe79scym4Q/L4P21QM
         d7letb0yPwmvosuUxgclHdc1c1JqanfOsQOdcsgTiAOQM6kPuMf5E9u0q6CP0b3vCTZv
         nVbw==
X-Forwarded-Encrypted: i=1; AJvYcCXTjyP5+japzho/3VyzRl1v5GG9O0Wsd3dECyFmuZ6mnMBpG/u1FHNtc0Tsc2dbRvC2lQVONaElw+JbtGDtUL6yqeA7VNvEBCi9mYAJqyyeMQmE
X-Gm-Message-State: AOJu0YyUWb9SnnS9Qqh2b7k92K40wjNPbAU3/XLBf0C0q9AAC7EjtPMZ
	iJePA+STAeFkhYWszbayJKfFshf34lw4j6SlVFp4LyVkNC3BWfgcKs0bCvZpVuA=
X-Google-Smtp-Source: AGHT+IEhWbShkVQDJ7LiqZTQQVwiHASOCjjIiWgwIddLZs/YqTU94+mV1Q1k51ht0YvrQI4O1pNBPA==
X-Received: by 2002:a19:f51a:0:b0:52e:9762:2ba4 with SMTP id 2adb3069b0e04-52ea063a4a8mr1093804e87.25.1720100204178;
        Thu, 04 Jul 2024 06:36:44 -0700 (PDT)
Received: from [192.168.42.0] ([2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5d5sm25382025e9.30.2024.07.04.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 06:36:43 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 04 Jul 2024 15:36:41 +0200
Subject: [PATCH v5 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
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
X-CRM114-CacheID: sfid-20240704_063646_226813_FBC04B06 
X-CRM114-Status: GOOD (  15.71  )
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
Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..850231e8e6c3
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


