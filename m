Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3A9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRn6LABOT/rhcTjiJqJNDqz+hc9OdC+ZAqeBStM3osQ=; b=J30byeI3GhvS+Y
	j+EpHNPa0U0MQDc3vbDYFGU3eek1wiVTgjtV0li7pGFS5cXHfvpzWJ0rCfHKWAhy7uBULV06dddi+
	6wA6TDDrdChRxFwDoq5S5BQFhm73gwx512hmOcZqh1ws8I47izQgrKK97b5xUB7fndweSq7WFk6aW
	qcj+DINfYQy2Q/yUGx4RyWa1ZerTgd6ZqeOHukslbm3/6XV7j2rqrAS/3aKjTXymc5Tdyt0fudfeU
	XG221KXP3bb9lzZ93wTLGIVABPu2KgwkPO+y7pTAIIH2qtgo4ITdWFA76/F91EK4+tmyDwS1dMV9h
	wcT/ptdPBts77+zgAWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnnB-006y06-Bw; Thu, 03 Mar 2022 15:55:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnbi-006tv8-B6
 for linux-mediatek@lists.infradead.org; Thu, 03 Mar 2022 15:43:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso3499946wmr.1
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Mar 2022 07:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvgDxfixSnBIC4U2Qx+y1rXDt5KCfDdRN+geS33dt8U=;
 b=LJc5EsSRKwC/y9D83XKQh92YQEPc97j9frFC9tKxEC7VHc8L47EtFEbGsT3Sxd4XY1
 5Z4jMy5Ff16QFqtE3aX01uwhWI6fLiGxl9VXwHyCHI5unMneXInPdmONYuWOEhZ747sN
 COn1suGOQslk19IZgEMRzpqDvWjiQP6BxcXzruD1nvgbLRYrkyQB6bvCvoOoubtJlqAE
 hb+hSY7/o03G5mO3T6wvwkYjUYL+/EYEmMqBQLR0S/HZprBmOlo8lFVpSJ/ayS80sA9O
 3WJTK1K08gLAKX/e95L0ed02Vj2WpB6GNff4Bu8zyHLnvTYGjk61RF5UskHNYTffbKVm
 +tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvgDxfixSnBIC4U2Qx+y1rXDt5KCfDdRN+geS33dt8U=;
 b=rk+GN9oF6P3Hi+AjSqv5kZvap69KJBbPt5rdu8KAapk2gzzsIgrSxH7s7Ht0fCxotF
 eEK6j50Ui9qtcCwD/bq98/EpZ8gFD2JU9CrD044YxA0VOYHUmt9TnJ3/Vk+RAcvOJYll
 hXDmsa8yiwFyIhQWBDiccJBnve98li7zi2bDhqs3y6+I6pM9a5bY0ZFR+MtO8y3cnweO
 LFJFHsEE9pS/4dz9xpk6n1S6FnIFwsRa/nX7I11qCHaPXTy4BVKfPMcPUV7SAJz3sdt4
 RccP6aQ/Ox/vQXLbodyESilaNCYkCGJJkwqAC21IoK71ETMlOzsc2Ie5mL5AhNtU/LQD
 9WDA==
X-Gm-Message-State: AOAM5306/1aepapcgNmKf4MsGzY+HiFwTkwSq9QrYEFvLSPaFwH5/MJH
 TePIKYTexJ+AuesZDYiqFeLAew==
X-Google-Smtp-Source: ABdhPJyKxcIjDMZvDj1Q88hFM1nS7uCRsMbcaWtJ8QIvbD9LrP9UTTU0vAwO2xjUAHNha8wkdlZB5Q==
X-Received: by 2002:a05:600c:3b83:b0:37c:e735:ad87 with SMTP id
 n3-20020a05600c3b8300b0037ce735ad87mr4134101wms.120.1646322188478; 
 Thu, 03 Mar 2022 07:43:08 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8b2c:5e00:e059:ffd7:be1c:ef2c])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm3272452wrx.108.2022.03.03.07.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:43:08 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v21 1/3] dt-bindings: input: Add bindings for Mediatek matrix
 keypad
Date: Thu,  3 Mar 2022 16:43:00 +0100
Message-Id: <20220303154302.252041-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220303154302.252041-1-mkorpershoek@baylibre.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_074310_446066_DB7D83F1 
X-CRM114-Status: GOOD (  14.62  )
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

From: "fengping.yu" <fengping.yu@mediatek.com>

This patch add devicetree bindings for Mediatek matrix keypad driver.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../input/mediatek,mt6779-keypad.yaml         | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
new file mode 100644
index 000000000000..b1770640f94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek's Keypad Controller device tree bindings
+
+maintainers:
+  - Fengping Yu <fengping.yu@mediatek.com>
+
+allOf:
+  - $ref: "/schemas/input/matrix-keymap.yaml#"
+
+description: |
+  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
+  keypad device. The keypad controller supports multiple row and column lines.
+  A key can be placed at each intersection of a unique row and a unique column.
+  The keypad controller can sense a key-press and key-release and report the
+  event using a interrupt to the cpu.
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt6779-keypad
+      - items:
+          - enum:
+              - mediatek,mt6873-keypad
+          - const: mediatek,mt6779-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: kpd
+
+  wakeup-source:
+    description: use any event on keypad as wakeup event
+    type: boolean
+
+  debounce-delay-ms:
+    maximum: 256
+    default: 16
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        keyboard@10010000 {
+          compatible = "mediatek,mt6779-keypad";
+          reg = <0 0x10010000 0 0x1000>;
+          interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+          clocks = <&clk26m>;
+          clock-names = "kpd";
+        };
+    };
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
