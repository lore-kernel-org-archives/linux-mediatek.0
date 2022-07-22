Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCF3CCA47F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekeWjhe/vPlnrj6pxUuMZnIHCtjnr0IEqSQkbPzm4zM=; b=0R4pnvd3CwLs+bZGt+g8yqasoF
	DShcIal0jvkLvcVDX/9oqjMABfRA9L+ANhuz9HGPQj69Qo0e4gpJ7CkyA0gMlnpB4JMuHp8t4EDrS
	kQDmDfl2yv4n8g/U00rSUkok7GeRTVyayjlZzejRFuxYqrX51+cNpXSY6QAVt7o2QFeNoR3F1Sdcy
	jUtRg6SHI22GibIjy+VEE89NlZF0xSdjCRRPU3AIRLmVP646Wx126LbYQSSjGSFOgD8Z9TxIIuU7C
	elffFwWzxtQ10L3KtYR9uurguH1EW8ICOEvjzCrE49pclLLZ3mB66V1dVHYC0RVzbzxCG/fH+Basz
	3DhaKJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpra-002eok-C5; Fri, 22 Jul 2022 10:26:30 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEppr-002dEZ-RG; Fri, 22 Jul 2022 10:24:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id r186so4097584pgr.2;
        Fri, 22 Jul 2022 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ekeWjhe/vPlnrj6pxUuMZnIHCtjnr0IEqSQkbPzm4zM=;
        b=RH7X2NIbX5C5sI3T8aekKbPZ0/NIAzMUdJdSJRLokbHjPB0oviakIsJpWXt1wJdedt
         ePMqrqSsYipgX7yTBRz9wfWhCOeC4cES/ZNO5j7CiHLg+7LGpJaPkLLjs2TvvE8Aatmj
         xuJ6qkIZC0FIttjNritzdnY9ZpAXgKtL/P6+GUeiaqh/oK1Qa5RI4npwHZlC8QMrd9s3
         ouF2FQyimpkIgT40neCOIHwrG9IIHLxLLEw3oha+qUQ6pX/ECwcQw9ybzLcT2MZX9/6h
         pr/vJqYQbMOPwMsmJypD9RYFFoXuxeh3dbT8Nt49y/s7HnBmnJlIhGIlPSxGu7i3nKzY
         9iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ekeWjhe/vPlnrj6pxUuMZnIHCtjnr0IEqSQkbPzm4zM=;
        b=hgx/tYMLYBXj3JLdRwOfhVtzrWf/sKHJ1cdufpLHrmpYN4malQFDwrTtEZ0zXFtjNS
         x5GMUbTFJN/GdYnDrCZRTyKvepjnJ6Gk/UypujgI54+ntNMPBs0Ld+IX8dmLuJn4x40J
         M5YT1osO9Yt93Klxn42Wh5A8PIdp8srru9e6A7ukgjdZRMJ3bS17AUmzhNlZCI8tAO08
         jTgv1a7b3wh1F0jSuVVnHfVaiMDOpStF1iVHuwegVznsyOSlZaO163lOFaIef4P1gPoJ
         y6L9KArYKXOXe3NhGlxl5Oy2J9Ozc5XzZnvgby2JZ5xA01n63JQHuI96MQADDkgr2O4x
         xIpw==
X-Gm-Message-State: AJIora+xWkpNhJCa3PeyGRKY2eYiR7kpg0CX2f9nNdO6BUk9CnPn3FBK
	O0MYgDopqvoBnw0zOwvfulw=
X-Google-Smtp-Source: AGRyM1uemeXZnT3uHoO82fOsUMvcRsClMKdWf1rGpgn2xGzw/Mm4P6q511HqEiot5ye8kMmcfxP3/Q==
X-Received: by 2002:a05:6a00:1d18:b0:52a:c350:6538 with SMTP id a24-20020a056a001d1800b0052ac3506538mr2831187pfx.7.1658485480028;
        Fri, 22 Jul 2022 03:24:40 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-82-239.emome-ip.hinet.net. [42.73.82.239])
        by smtp.gmail.com with ESMTPSA id h189-20020a6283c6000000b00528d620eb58sm3614551pfe.17.2022.07.22.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 03:24:39 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de,
	andy.shevchenko@gmail.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 03/13] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Fri, 22 Jul 2022 18:23:57 +0800
Message-Id: <20220722102407.2205-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722102407.2205-1-peterwu.pub@gmail.com>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_032443_960147_6CAC9AE5 
X-CRM114-Status: GOOD (  10.97  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v6
- Add 'reg' property of led of multi-led to prevent checking error.
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..204b103
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4


