Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D50DC5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:52:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D7920678
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bT1jf+tD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxMlVoo3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D7920678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Emd/1YbJWNgmiTUKPx3sEYDTDJxKAjDlIiNSSf66A2o=; b=bT1jf+tDYzmybl2q5y+3F5V3Ys
	iumXMRlUylo2MToJFCSUu1nOez/unS/Sh48G+MDjt+D0gDAWw1+I8BYVIBsmdzwtN2yD20j89EmLG
	x5CdNIGl+XlMmAya+YzWMs5QJP4/9goTJaDswCQXGkSCV7Y4Yq55bbTDNIxQIvUdpl1N2L7som8qk
	qu9sOxSgH4SrccvCXOfUlkFnn4kmybl6h7EXmGYbCTJKLeAj496H2RqV4UZZ1kEZ2lRnE9xlSSq7s
	9H9z/rprFNiNuaXMlNbIFUqXbvcefxtUgAFcmO1tlrK+8NTo7bdpnNDL9TNe3RkNYZIbMT9TAM52J
	7DTJ6/Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsPZ-00049h-Ps; Wed, 25 Nov 2020 10:52:33 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsOn-0003nV-Ay; Wed, 25 Nov 2020 10:51:46 +0000
Received: by mail-pf1-x442.google.com with SMTP id t8so1932991pfg.8;
 Wed, 25 Nov 2020 02:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
 b=mxMlVoo36yXqSwZ5A1co9g3vx20sd6nPfiuI/Cb7gXx2y2ulmsQw1WKDpoNbWMH0KB
 1Fs2YPS8rxFNb7RY28iL1h1CYKsEt+SuRQmiAHneGJOGiN675oFs7fw9loGY5RxO9KGw
 GNkaasug5aNMaDhzfIeVIaAlp+Ypu9A/CE83OhTsVUU6D+O6Jan8k2/Pcap9Yvw0t/tt
 SlO8arLT9wumJm5NOv1tgAyqhdkQDGCCxt8FUh9Rs3xhJUSp6PTp9pGI15fLQxoGLHVM
 WVreF+oUyEyLX+Zv/QMJQJLXad5raBeSU6z2stCQcLCiJ49AltB1NmVPT9uXXm+4XaXr
 /2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
 b=Q8a+z0GPhDMnEe+raYHH2MwVmyeksZcxL8djHxn3yWaHtnq5nAL2fQhVsc+TsljMqf
 OazGyL5dJiwIlatRFCX1p8DM+26vXB9B3MyqRfZ7mEoid5Wy4DogQdCHivB9yaZutLY0
 5y2WZFemfg8pzc3BYVSulpZNsJGJ6PZeGroBs5/C7cDuG0J+qNRP4Wbt6yGn2jjCVwTa
 3wCRaWzC6q7FY0b6/1aK8kHtv03ii+IK/eRVCDoTfCImw9v+FZAKD4wBp14hz8+bphWl
 mM8X1hBXQsZAu2+dXRmvTaDpy9sB9PmEpibxsHr4ZqJgAkXawUcZ27M3W6CQIET3Ftiy
 3GUw==
X-Gm-Message-State: AOAM5334FnUIkdhMT6HRfqSEBHFyUQ6vbf15P5lc2Ryj+UlApUIk66lG
 SCSeyi6+zxFtylnYtqRAR20=
X-Google-Smtp-Source: ABdhPJyxMfLBuGP17F6Yut6oaqlrlz8elJSBm7PHigoQka3qrqDybmPN8HBzK+ygUDO2IKJUe7FZ+Q==
X-Received: by 2002:aa7:8c47:0:b029:197:de59:cfec with SMTP id
 e7-20020aa78c470000b0290197de59cfecmr2030433pfd.0.1606301503406; 
 Wed, 25 Nov 2020 02:51:43 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
 by smtp.gmail.com with ESMTPSA id
 j10sm2049520pgc.85.2020.11.25.02.51.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 02:51:43 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v8 5/6] dt-bindings: leds: Add bindings for MT6360 LED
Date: Wed, 25 Nov 2020 18:51:14 +0800
Message-Id: <1606301475-7030-6-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_055145_451457_222D2422 
X-CRM114-Status: GOOD (  14.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..b2ffbc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,164 @@
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
+  "^led@[0-6]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output INDICATOR1_RED
+          - 1 # LED output INDICATOR1_GREEN
+          - 2 # LED output INDICATOR1_BLUE
+          - 3 # LED output INDICATOR2_ML
+          - 4 # LED output FLED1
+          - 5 # LED output FLED2
+          - 6 # LED output MULTICOLOR
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
+ - |
+   #include <dt-bindings/leds/common.h>
+   led-controller {
+     compatible = "mediatek,mt6360-led";
+     #address-cells = <1>;
+     #size-cells = <0>;
+
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
+     led@6 {
+       reg = <6>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RGB>;
+       led-max-microamp = <24000>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       led@0 {
+         reg = <0>;
+         function = LED_FUNCTION_INDICATOR;
+         color = <LED_COLOR_ID_RED>;
+       };
+       led@1 {
+         reg = <1>;
+         function = LED_FUNCTION_INDICATOR;
+         color = <LED_COLOR_ID_GREEN>;
+       };
+       led@2 {
+         reg = <2>;
+         function = LED_FUNCTION_INDICATOR;
+         color = <LED_COLOR_ID_BLUE>;
+       };
+     };
+   };
+
+ - |
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
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
