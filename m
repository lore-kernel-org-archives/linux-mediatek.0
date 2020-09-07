Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE108C2BB84
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:28:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D77A205CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wZAe3u8P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1OBEVDY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D77A205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+5+ZYFQngADxZk2WBfqpLbsAbjEVyk250WZtSCNHnA=; b=wZAe3u8PflWrZVkY5w6nTffBl1
	1fKrsB62JvVZy7649i29xGtIEMRonzo/zhy1yn0AWZgd4KuxyOXAFWW72Q1ycHDgYfHR90QeuqRKt
	j5EqYgYMJKUsMk1qJADp0uEnvsE5mbEMz9b38Z9ngxVAp5yppQo1ezQGdMfa/QN0/hRqMDD63/bvI
	HT/4tDVbTPr8WRxArr9UDmO9Xz6t6WOyVpXp+xN8x+ONQkO+IuoAAWIcsAZrk4L73JSRuNDVx3Ttg
	1UvQUlMjknKXGUMAho1JM/tqmwqKZZHLliou+g5YEPEIjRHdfaMMdegUv28CXzaAXMAMaIg+wzZCy
	ys6a5wcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFEO3-0004do-AI; Mon, 07 Sep 2020 10:28:35 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFENs-0004XR-EU; Mon, 07 Sep 2020 10:28:25 +0000
Received: by mail-pj1-x1043.google.com with SMTP id u3so3063783pjr.3;
 Mon, 07 Sep 2020 03:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ITcGcXtzItjOscmK8N5fYW//0H9STvyX68vCXrrZF4w=;
 b=A1OBEVDY4me2Wvsvyy2MUi/A8XkKv6ZdMG8s6KSj7lXomVYrF0aPZnCWGOfomJgwn/
 ymT0CzWAuEP4wsFsOOm/VJ75BKHE0FJD5avQGluDjO0d6q/fxlhHKgvGJhRzIcF06X2a
 lpwHBzJbUmfDHK0XWbYIM8yQZu+8MtML6lz6L4buDz0iJkV8BASxBkVE0EQzm1c8ULT6
 88ZWckezYoRCBGPHL5a5RrS8KZGC6Q2wFuzD0J4vXfhdyAauqtvsCr1GZQPPSuFVL1gV
 akwocGz2xp3FUrfLCOqDziTMJrVZwYZYnOfey2tzzVS/atgebz5zcgb+UHwxx8c3CMee
 Ffsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ITcGcXtzItjOscmK8N5fYW//0H9STvyX68vCXrrZF4w=;
 b=qF65FN9w9kOc0E+7iN5xcwOa45fLhbG5mnmYIoiRnd7hBxpsBJpMP5/6VXl2mVudKu
 mG/BjlkjfPc3cVFvkIEiqLWS1ufTLI4lm54QfBs2MZo3U9qCTYkjfMHutMP2dDDApLQl
 +BeC95HNHubbiwZNVNiXtYxXSiFHHmP2aEQwafi4idsvgn1NaPgb1F1TJ8AekWEkEYaX
 CXKM4v7AZI+2aqDMJveEJ6BUaVXUJYa5HmF3yvl2oYFr31kUkI2eFfVGurtVTGh/Lans
 xkHpiAIg1tnYYr3jvAMZKx9cyw3MJ2BSXuOnKdHI7qBPHTrFrNawL+85lI7/EmGgVJGN
 093A==
X-Gm-Message-State: AOAM531z72tKZK2994/7SoE6o4YkyBDEPINJCTklD8TdEtBXtY/Bna/7
 vW20Pvd8J6BFYpXbb+DU4tw=
X-Google-Smtp-Source: ABdhPJzh/5Ux08+E14zJum33L6vE0PTkNwSCLe9N4YM97WfgrNu5gy8gxWZNLimdh6e9D2KnG+RpYw==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr20983093pjb.117.1599474502574; 
 Mon, 07 Sep 2020 03:28:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:81bf:545f:f984:753e:4bcc])
 by smtp.gmail.com with ESMTPSA id q193sm15009717pfq.127.2020.09.07.03.28.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 03:28:22 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v3 2/2] dt-bindings: leds: Add bindings for MT6360 LED
Date: Mon,  7 Sep 2020 18:27:39 +0800
Message-Id: <1599474459-20853-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_062824_560936_AE785F85 
X-CRM114-Status: GOOD (  16.25  )
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
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..72914c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,105 @@
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
+  The LED controller is represented as a sub-node of the PMIC node on
+  the device tree.
+  This device has six current sinks.
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
+  "^led@[0-5]$":
+    type: object
+    description: |
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output INDICATOR1
+          - 1 # LED output INDICATOR2
+          - 2 # LED output INDICATOR3
+          - 3 # LED output INDICATOR4
+          - 4 # LED output FLED1
+          - 5 # LED output FLED2
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
+     led@0 {
+       reg = <0>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RED>;
+       default-state = "off";
+     };
+     led@1 {
+       reg = <1>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_GREEN>;
+       default-state = "off";
+     };
+     led@2 {
+       reg = <2>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_BLUE>;
+       default-state = "off";
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_AMBER>;
+       default-state = "off";
+     };
+     led@4 {
+       reg = <4>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       default-state = "off";
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@5 {
+       reg = <5>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <2>;
+       default-state = "off";
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
