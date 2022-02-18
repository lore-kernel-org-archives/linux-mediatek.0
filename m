Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD440C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElUpe2amwEtfCbLHyCW7yyAZAUNO1MskbhASIm+uxsc=; b=YueIvtS8ajodDA
	6rT50ZMBCUImVvQvBs6X6MUWcOIt27jRRWW1Mj2Ewrs/AYl8kMYFkYoQ/JgURJklcfMRdRoh5c1pQ
	BEvdoXIwzOTGYRbSZT3rWZaY3IByrXWPvupuxVkxPseJ2SydGC9Nk1Un0o3+X7sjAPrMchX3LpbJ6
	EHasyVtS/GGVqSBTb5SBSr/6z1qjsv8lBuAiKk2K24t36BRhp26NUcxqPGNRbn9o/fjpC3v9GqiJw
	QyvZwDnO3FFJGDlbo/KRwDByCTrZEsx5MKTjrUbSGx+ZdYV6T/fstoPCDx3l+cypOtmPHT9ZlqpLr
	NUU4BoFtLaFiDrPFSRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4mv-00EwJK-Cv; Fri, 18 Feb 2022 15:03:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4fy-00Ery6-J4
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:07 +0000
Received: by mail-wr1-x441.google.com with SMTP id x5so10179295wrg.13
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8f2hof1aQ6lwVFmupuo9jzO+yiBIvX9J29TbA0gSLWY=;
 b=g5BxrjBH3TULbbsg0hXkjFu7gK33jq2Gb4PAaYmUct5j3CMtMNvfFTKLgLG6VSzQuj
 D1HyPjn8TiRIrUhKIyFVjvj0V7vIvmfBETUGA0X3CKjwlB48bZhPpVY01UQ1YyC35PzH
 fFwja52bRYhdU2AyTxVLM43JlBDYbW4Zc4nCw/hvEMjWUonqPnhJDyHbMlE3BTOLCKr4
 9EvFI186fmfi5et2vXSryQscGWaaf57p2erQolFts798qbDdxny9yql/4pgSjUCl8Gz8
 J3rCMjX8VJSsWGHZyohL1kraDRkPmdM35wmHGfpxQ7xKwmIpLfBdR4E/I6Us4EOb7x0L
 nPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8f2hof1aQ6lwVFmupuo9jzO+yiBIvX9J29TbA0gSLWY=;
 b=Mg4vS/luTg0W9Exlw0gECSUcFyERjV3xvujuKeivd1/PeMUH3/LD4g16PlSDgphvIB
 HHCMti9mdtMqOX9FajMH27vPyCMihFKFNP7rOanX82zHURR5TYCwNpGTxuxI9tLaRSkV
 xyFQeBEYYKio5P7O+jabB5ajuDiOL46urHxo6ucig0NkNDIYy0s6jJfvVE9t+8EkHgvp
 bMUJm6JxQyKbb+sO37qP++qIQMKLm04TtrpcdS7YgwgNZhrV+TnTYmF/ZUaz3WOFBeqb
 jepfeDHuVIl8srfMR8WCEfUMFVg354QjTC0t4qwmgEjfNmq+POBT5Gd9y1r+3syjCTGq
 c+HA==
X-Gm-Message-State: AOAM531T32lfi/66oGZJVIkd2UZq8W/XFNkcD+kB0ArCPV/kwi904bdJ
 rI+mofTIjrEIk/YnPKpzS0hUGCAXeYwEP3hG
X-Google-Smtp-Source: ABdhPJyh9duhvScQ+K+GxiAh+adrwEeS9AEjb/vcfumx/8LoyXD8GON1VKujIsjJufeghUVk9wYrfw==
X-Received: by 2002:adf:e7d1:0:b0:1e6:b9ba:fa1 with SMTP id
 e17-20020adfe7d1000000b001e6b9ba0fa1mr6306132wrn.269.1645196161044; 
 Fri, 18 Feb 2022 06:56:01 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:00 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v8 02/19] dt-bindings: mediatek,dp: Add Display Port binding
Date: Fri, 18 Feb 2022 15:54:20 +0100
Message-Id: <20220218145437.18563-3-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065602_738121_DDFFAE1F 
X-CRM114-Status: GOOD (  12.89  )
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
 .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 0000000000000..068b11d766e21
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,87 @@
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
+        compatible = "mediatek,mt8195-dp-tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
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
