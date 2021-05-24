Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48924C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 17:29:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF50613BF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 17:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF50613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/Rc8Z+NpCF3ASFGu1Ot7rg/leh9wu7TztPu1+pgf04=; b=D1MIAxrtANoYmK
	8fJ4SyA9MRRQ2jMbNuuQkwvm+BOF3C38BkYErmGJu7SMYWAxDw4GvlzqCRT2WSU9vVI1ONAhHBzhJ
	OqfvWmWmhFlGBQOQGEdQGByp7Hpj2T5ex1AcYvglxpSOc5OIKpSmyz268MB95UnOu/aNbmqrKUsPQ
	s+SlSws221cID491SCKqiaM6HgP9/R+D6EK2Scg80okVv+uxKj8TVjxVwvcwbHpcbLSjHl+Rnb8M4
	wbd6uoWsE+QRXZmxSeNhpPcwtyxkcZh+3z3AuXZY8NEnu80ijuxSSaYJGjx9ne2+VH3rqdA64iMwz
	i2TmcuNZciFhwEaCTDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEOe-001HNC-Gs; Mon, 24 May 2021 17:29:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llCRq-0012Pn-5W; Mon, 24 May 2021 15:24:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id u7so6217583plq.4;
 Mon, 24 May 2021 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzzcXIffejAkWyzdFpgb0HO7sS9re1Oy9rLKP31iBDE=;
 b=MLxtYKaaVll8pWz5+nbVi/IfMBRtx4DyjzB8VCy8RDUkUMw+tKWP6lE/Qy9mjynuQK
 O3wgJcW/kIlEFNVnkXSwNPmVujBx99MMssFDcafUx8NvWKRjC0hSPXAagZ9KyVdSEPan
 GuH58Ty4fRkBNK6t0pGXJuzRly51HjreFOwL6wyoQirzCZqqQM7E7jTLKTMKWCWeGPCV
 KU5BDOhhBlVgRoQwDUaMjHYi9Wniecjyz3oIso2LBlBeJCQGWockHSY39kEWgl5gGEYW
 JdsXVY5R8CORXyd2TCKXaOGNz3tpbo+o2UvbDzcFHONA6DljIlfdJSeKeh7my14N6Qwv
 IACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzzcXIffejAkWyzdFpgb0HO7sS9re1Oy9rLKP31iBDE=;
 b=Wt5QgVvszf4TRzaXjhfJdT8A6Yw4ovNY4mRYPuL7k3YEaOmWeOXXtRZG3H/+4KD/vI
 gQz2BZQTlW1QF8C8HSgQvlTl8D0qeeQOgAh9WYZJ6ujRaq24nkr/5nbQDUTqpc4Flkab
 D4vlKuzzUmjaxtLPORe2q3a1GoN3IhkS5zqG2MnpF4jcNJeNvbdME+lI2Mbo79lFl5mu
 dmV13EmSUY8k7Hf5lTxwSXBltg1YB+bp6FzCtNRaXC6yDPaFOaGeOKWK4ta4XX6e/R57
 +Be8jOZp75boJd9eBVV3idhEok7xmu6QuJxh+5Iqjf8fGTbD0V95k0Wkr6a4O/aJHzFl
 atwg==
X-Gm-Message-State: AOAM530gdEnZgl0iNra94GWNLpniGrZK8stI4PeYN9NQF4wP7HDs34S7
 bgjFRTW5ekHq/RhEX3Jca6U=
X-Google-Smtp-Source: ABdhPJwTr/Qpj2lQO22nca5tCgF7+O0qzNIiGrZITrSnMb5xGM0u5fQPJNms44pcBnVIi+ouIu6Xxg==
X-Received: by 2002:a17:902:bd90:b029:f2:c88c:5b2c with SMTP id
 q16-20020a170902bd90b02900f2c88c5b2cmr25951360pls.8.1621869893326; 
 Mon, 24 May 2021 08:24:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:b4c4:1464:a4f2:334c:afaf])
 by smtp.gmail.com with ESMTPSA id a15sm10821597pff.128.2021.05.24.08.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 08:24:53 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com,
	pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date: Mon, 24 May 2021 23:24:26 +0800
Message-Id: <20210524152427.123856-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_082454_236432_C1E75C37 
X-CRM114-Status: GOOD (  13.45  )
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

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 000000000000..235315531d3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6360 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  This module is part of the MT6360 MFD device.
+  see Documentation/devicetree/bindings/mfd/mt6360.yaml
+  Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
+  and 4-channel RGB LED support Register/Flash/Breath Mode
+
+properties:
+  compatible:
+    const: mediatek,mt6360-led
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^(multi-)?led@[0-5]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINKML
+          - 4 # LED output FLASH1
+          - 5 # LED output FLASH2
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/leds/common.h>
+   led-controller {
+     compatible = "mediatek,mt6360-led";
+     #address-cells = <1>;
+     #size-cells = <0>;
+
+     multi-led@0 {
+       reg = <0>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RGB>;
+       led-max-microamp = <24000>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+       led@0 {
+         reg = <0>;
+         color = <LED_COLOR_ID_RED>;
+       };
+       led@1 {
+         reg = <1>;
+         color = <LED_COLOR_ID_GREEN>;
+       };
+       led@2 {
+         reg = <2>;
+         color = <LED_COLOR_ID_BLUE>;
+       };
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_WHITE>;
+       led-max-microamp = <150000>;
+     };
+     led@4 {
+       reg = <4>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@5 {
+       reg = <5>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <2>;
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+   };
+
+  - |
+
+   led-controller {
+     compatible = "mediatek,mt6360-led";
+     #address-cells = <1>;
+     #size-cells = <0>;
+
+     led@0 {
+       reg = <0>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RED>;
+       led-max-microamp = <24000>;
+     };
+     led@1 {
+       reg = <1>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_GREEN>;
+       led-max-microamp = <24000>;
+     };
+     led@2 {
+       reg = <2>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_BLUE>;
+       led-max-microamp = <24000>;
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_MOONLIGHT;
+       color = <LED_COLOR_ID_WHITE>;
+       led-max-microamp = <150000>;
+     };
+     led@4 {
+       reg = <4>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@5 {
+       reg = <5>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <2>;
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+   };
+...
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
