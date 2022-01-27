Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F935C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzFyQv35jVdruiVti9vp84NPvmLzGgf203o9WEDG+30=; b=jkdzQF8Qia7JlQ
	YRZMflPEq1vNBgm7TTWKTaapkAoc5rD5+KT9YzcMmUPuFwrKLLCdl3YDF81vbLRRU3hP9Om+OvdYF
	aVlZBF11bOyo1nDnFkmZVlEGOcPAtjZLANVh2mLoeMNDofnoshkqYf81KlDBHznSgg8ey8A0w/L8a
	2ZbohceEZAlvR+3kM3vOrAiwe02J1GpEx/FxMQpPG64O38YO+Lgqf8tF7cpXzdZH22JLYhE/sOxz4
	Lvb/xb2XC5gTMG4P0+fIkzLHyMXwTuPjQEIRoz57sEYYHsG9yZ8h1BCaITHQ1zC84TfPARJTjBja8
	HzIvyku+scnjUbcSQS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2lT-00FMcj-Gu; Thu, 27 Jan 2022 11:16:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2kk-00FMKJ-Sp
 for linux-mediatek@lists.infradead.org; Thu, 27 Jan 2022 11:15:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id f17so4153798wrx.1
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Jan 2022 03:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Issr/GTHNwZVejNrxQmDGDcXB9G0EQeUTGuqcjSvixA=;
 b=gJMkegCV++HieP031+dMKGWYR0bLuffs1xCsQDp2I/1x4bL13iEe9HP4FVZnQ9slMV
 ZERFDCfG8JIygTjY7SP7Kaw7BiRi3l9uON10ujd9Z0TW+z4wYQFiSmdCSukSJmK+PFpn
 9rns12c1OADrSKaLP4xM6aj4zOdaucyGPBhKdr6Bjijz3gHxISR4qNgK2Ko0radr96dA
 17tbnjrJz+/0OfdUzOnQ3Z6rbM4QR3QwOgl/JKqEstGLB0/VjhVqcgV3xSoKsSGZ3C5C
 ruC2fJTC6Ttqr+8Dv7EeL7/WGu21nqQAMF/hYl9GIHJPys6rQ/xBRu24XEM2u2qJ810c
 I7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Issr/GTHNwZVejNrxQmDGDcXB9G0EQeUTGuqcjSvixA=;
 b=0+c8GKD8yo6mXz2xIWeFJu8pqLyHxziG0Mp/e3oXqiJrenvv4uzOj2Wiv4ROXaQPRe
 uLDuD8u9SXYT7Q797LAPClNbv460p814+2CUbDxDGNu0DXka+jbDqcUl2/QSlQTL7rLa
 ATAgJLM6WlRb31xVMAA/czTrmQBpTwy0hP41hdMbKkhlJ96PheWnTJKhhEqBPTROKNOw
 U7SxrFtKctUFkjwp2M0N8WIn+gKteqBhWPZiOmcUkWMkU3wTe4KaKHJYq0wflj7vguO1
 KMcVUkn1G+19bD+2u7pFpGB2qFAe2y9xd8rvHapQxgRT0Bmga/dQ3vyT0rUzIg0HKJ0T
 pLwg==
X-Gm-Message-State: AOAM53169GubwFWoaJspJaa9mBKbmHNOvzW9w/BfAutT53IuWZ+PrcUU
 mxptznoWTrcaFQl7ACLlot7p3w==
X-Google-Smtp-Source: ABdhPJyYSqmwS3bfJTyGbBTcK2ikaGoPG+ScfYyYq8ahZaWYdOBnBjIifEe/TLLyH8qO3WxEZYsKYQ==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr2523734wrb.678.1643282144969; 
 Thu, 27 Jan 2022 03:15:44 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8b2c:5e00:7d3d:d638:46ec:78dd])
 by smtp.gmail.com with ESMTPSA id r7sm5956311wma.39.2022.01.27.03.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:15:44 -0800 (PST)
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
 linux-kernel@vger.kernel.org
Subject: [PATCH v20 1/3] dt-bindings: input: Add bindings for Mediatek matrix
 keypad
Date: Thu, 27 Jan 2022 12:15:24 +0100
Message-Id: <20220127111526.3716689-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_031546_955190_CE110449 
X-CRM114-Status: GOOD (  14.98  )
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
