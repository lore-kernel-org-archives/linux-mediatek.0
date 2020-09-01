Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3D0C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 02:41:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A5620719
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 02:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Odj+f6wR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjuHh/3C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A5620719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C647SDCDH68WFxYoOPCSd3xX0hEhIe4vY/kSD4s1fYM=; b=Odj+f6wRSYpaeAlcS+9R+H/oGR
	A2Ed33gMyCG5EpzbrlBAfC43ZB3QtBqaIAYvZZzXP3u0EITZVf08ZNlBjIHS7abX8Kz2J1lUZa3ni
	RcB2RY9zGLiO1ufmDFx7mHuBeaKXDjkDJmaWH/HyMSlst3EwlWVxMfYFlrimHb8L42SrvNSjwIRQ7
	fBNZfNowsZgRVEe/rbGLh0oCm0lnnPk60m1OKv7C8UWs+HPSvOgB0LFaPJh0lLe9m6zARCavm5T4B
	iyQBRxvpe/LkooNPf4WS7pPlzRq3rU7x1dD4mO2ZcBPWQlyPVb3DZNMj4erZ49//n+eZlXsD5il9f
	oUw2Khfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCwES-0005IX-Mp; Tue, 01 Sep 2020 02:41:12 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCwEI-0005Fi-8Z; Tue, 01 Sep 2020 02:41:03 +0000
Received: by mail-pg1-x543.google.com with SMTP id 7so1824080pgm.11;
 Mon, 31 Aug 2020 19:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mpQRzRezfXU62e+8TDK+z83E5tTJuYg+gT1MoPG0gVY=;
 b=jjuHh/3CNZSy7dvGLvUmAbOXdMQ2I3W1R677A+eeozOOjWRmiz1ReDPkuODw50ytKV
 I7jAkkDBMuoemdQjizD79fOkLMy2QNycJfemfOhNA89BL+25in69H9JiU7teOSvMDKgF
 rjPCwpUo/sO6Ozf6kNfzFE6TOLJlxQSY36uI3IfS1y26Nlkl3Esbx8AEaP2LrbEED3th
 BcfDG3m6UHUACeOVgo5JkqF6HefbTzkjTJYQXAu8S3xv5iqMmw82C3gzr+pACvps0+v9
 kwcXuKzof8h11ugpFHUpQl8qpUm8VBH3akJGaZ5DHunDa9lzf1wgDdhcxh/NHhznleLx
 tBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mpQRzRezfXU62e+8TDK+z83E5tTJuYg+gT1MoPG0gVY=;
 b=A4yUNn0T8Wu5tP5oW6K2gAeyaISBa7Hyu20KQjaLLph7VFOwa2X4PBbWfLNYpQA03Y
 ZS7CR2PDqBpMTfUII4aG769h1eYnL8zpUWKqvPI4DsW4z3AJf6ItIjJFo6lHrM/HoTL8
 KBDMckMSzZGReQ4RANEhJnArhEq3IWS2JlSmfa4luzVt641q2vDtKz3D1zo2q4TDaRbV
 PlAnTnUGxaDu8gWNG/VqBSydPYaWBQEldivEK7PUEM8iTnC3n0QhjDmDyjN0QAiD+gJ0
 F4mpHzrJyyb236rW7Jr18s7hsBot56FiWCi70n4B1fYvUM3RJgLwC5rOU+U4UIZ1YJMC
 VtIA==
X-Gm-Message-State: AOAM533cAzYbwyaWMT1dDiOml6P/5gUrjUGDSsf7yhcJhmbTbJID8BdS
 a904lW/5rfyvVzOiuCCgo23GVVEdTCP32g==
X-Google-Smtp-Source: ABdhPJz1exJ6TSG9FtABDIklkVB98Roi4JYSCOUPc6GzPAFpHNU5NhAle/okUZGBBC3SzyLrZWZPog==
X-Received: by 2002:a63:dc4a:: with SMTP id f10mr3533240pgj.394.1598928058419; 
 Mon, 31 Aug 2020 19:40:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:587:32f7:442c:d2ca:adcb:b859])
 by smtp.gmail.com with ESMTPSA id u2sm933743pjj.57.2020.08.31.19.40.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 19:40:57 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v5 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Tue,  1 Sep 2020 10:40:42 +0800
Message-Id: <1598928042-22115-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
References: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_224102_388282_DEF6A970 
X-CRM114-Status: GOOD (  15.30  )
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add a devicetree binding documentation for the MT6360 Type-C driver.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6360-tcpc.yaml         | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
new file mode 100644
index 00000000..1e8e1c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6360 Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6360 is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
+  regulators (BUCKs/LDOs), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6360 Type-C Port Switch and Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6360-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: PD_IRQB
+
+  connector:
+    type: object
+    $ref: ../connector/usb-connector.yaml#
+    description:
+      Properties for usb c connector.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mt6360@34 {
+        compatible = "mediatek,mt6360";
+        reg = <0x34>;
+        tcpc {
+          compatible = "mediatek,mt6360-tcpc";
+          interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+          interrupt-names = "PD_IRQB";
+
+          connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            data-role = "dual";
+            power-role = "dual";
+            try-power-role = "sink";
+            source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            op-sink-microwatt = <10000000>;
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                endpoint {
+                  remote-endpoint = <&usb_hs>;
+                };
+              };
+              port@1 {
+                reg = <1>;
+                endpoint {
+                  remote-endpoint = <&usb_ss>;
+                };
+              };
+              port@2 {
+                reg = <2>;
+                endpoint {
+                  remote-endpoint = <&dp_aux>;
+                };
+              };
+            };
+          };
+        };
+      };
+    };
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
