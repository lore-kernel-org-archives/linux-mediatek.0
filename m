Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D29C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Phd1GCPDABVSY59RbXBa9n2lmQO1OKxPdDFExbbzh8=; b=V5nMAgEHxyksdI
	iy9V51FPZbV8YBMYLZkFVvPgVW/Cmb+uQmbHlr7nVa5cwum8vwPB+VFP+q2GGbJEFSfc1PSSZHQBs
	MAJbBR6f271HjjHAJQbT0swTOa/ZcqMZ1K5teA8BpPQKwvaB2fe04PPxKw6vywq96U8jvVAlcVQo+
	LBRY+fZGfVSHk0kc+hdthJeuJs6Ko9iCTEnNZyHWAbnBj/DTekrGexmLHsW8xdnhzjzIJt/8UzNRe
	eYKhPaQKSCPpa58XVz1cBnC4V3LM/hZ5hQuMSqOXnzMZMIOy8t1syqgmDpPpf6LKkRgg5KcuCKOGC
	DeozCNXHkeNTmfXkmFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6EG-003hfO-M5; Mon, 23 May 2022 11:28:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5dl-003PYa-2n
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:50:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so812888wmb.5
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RBdwv8C2zWSCXm9kFqdZLTYTeRupN3jSjblct2gox8s=;
 b=Z/xyqPorLXxjtX45nJY9HoVzJk17XbNfLYrKQzUC5oUtkKMtSoV+kWJ/W9h2UwUdlN
 1izRYQ+g5TLX3hghia4MPgYalf8vdyabNOS2DaGlsAhoEGt/s+/KnelQ0vZbZtihbBMg
 21Pyw395K/H6hYe1NjG4mAI/mc+ABytCuV7klYgDvq9vZJ7hsPVtmwjWKYUbF/bp/EcC
 Oilliy3/kq69ohuRdHDHt1sN0WqllfmeBK0PA3bmOt33PYByl5DZkyGxt3aG8JeVrdma
 MXLeIGVJyxZJTBpjD3ztKpUSnkvsiwIvClmunyObwRYCXJLItn7H8y/fT/NKL+YLfjaE
 ppkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RBdwv8C2zWSCXm9kFqdZLTYTeRupN3jSjblct2gox8s=;
 b=x61flOJsewGnkho+2yiqttB8NbpjdHvxTvJtfSEuZ7MH5glGLSR5zvrzs7MQPLJ6/T
 566+I6g4Zzi3hGGi1L89z6rTOZub9c5k0EkE2KSUYMwxxbV3oYOoGyzkLcEo6ENn5cuN
 irybBAWx/033Z+tk/4Xbc8t4IZCM8L9uqq1+oJNVQKuXTZPY4lRVBafcaY9pWAYoJ2gu
 GQH+ji1OJRcDBnVYghJRF/8iXP0uNiOYEGQIpq+Las07fSSzn880mbMm6QJSKP12tRTK
 wiz2fIEE5bko5usy1smnWRpvOOmOZSDBlul0sbWTo4qsP8yaXdZY22wrnBusuP/vD0r9
 GGUw==
X-Gm-Message-State: AOAM530wLaNg+5gQsXC41ryZBX2Ne+EJf6COfvL/+69w/bYEICtvG97O
 1JoTRBHajW/UWZ5MSxxjHo+HbA==
X-Google-Smtp-Source: ABdhPJxU86O9OrfPSwDpzF5vc+DzPzD1gUymNmku2eiSYHqSUNEzJviyarRmUCu72kW//QWtrovSTg==
X-Received: by 2002:a05:600c:42d3:b0:397:47ae:188c with SMTP id
 j19-20020a05600c42d300b0039747ae188cmr6376412wme.150.1653303018361; 
 Mon, 23 May 2022 03:50:18 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v10 02/21] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon, 23 May 2022 12:47:35 +0200
Message-Id: <20220523104758.29531-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035021_223145_4337BEEB 
X-CRM114-Status: GOOD (  15.22  )
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
---
 .../display/mediatek/mediatek,dp.yaml         | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..36ae0a6df299
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the MediaTek (embedded) Display Port controller
+  present on some MediaTek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-tx
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
+  max-lanes:
+    maxItems: 1
+    description: maximum number of lanes supported by the hardware
+
+  max-linkrate:
+    maxItems: 1
+    description: maximum link rate supported by the hardware
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+  - max-lanes
+  - max-linkrate
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    edp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-dp-tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
+        max-lanes = /bits/ 8 <4>;
+        max-linkrate = /bits/ 8 <0x1e>;
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
