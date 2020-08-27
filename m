Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88230C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 04:51:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB812078A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 04:51:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnZp01s3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcfeBqhw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB812078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8j4sC2OyvHBZS87hQV4/YRa/8AYeiM4wlvH/4A6QOc=; b=hnZp01s3DcjhDfjj+LQR85XYxh
	E3IGl9vBgomv4B5iYahNYwAEnsHkHSpj1MOKrD6q5pGLbNDgJnWdW5nT9YLZn41yaQ6BwwatI64id
	fv7qOrPdA/ygXBnFmFQBl36dghBb69f2/6fTn/EwYjW1oEDrSgKVuOTQ6yBeR1YYVZlCXyLGCozh8
	PGQckQFZBMniVc9NgxRvz4B9iVyKOuAQVv6jt0awOMtrPYQi2xCeabv2tfxzM7JtULAkQU8vwM6zo
	bmzH96bsZfiaaFaYjtlyeT1arSlzKxG/BodSY1c+uVI7Su2CzAaYSgWzagW4vcoEAi2qKywXZR/LZ
	NHfaRxYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB9sg-000188-H7; Thu, 27 Aug 2020 04:51:22 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB9sZ-00015e-Uw; Thu, 27 Aug 2020 04:51:17 +0000
Received: by mail-pj1-x1043.google.com with SMTP id mt12so1979370pjb.4;
 Wed, 26 Aug 2020 21:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9BLb5SG/442AGlteVEU+VMTqxtoAM2EGD3L4sUWx4Zo=;
 b=hcfeBqhwso3PEQMOSKQnGbznx2Zu5Md8CulOK5yqqgZBqyz5heBSFefG0VlinCv+uA
 ECxYER5w3Br63TbuQhIhtbrr1O/tGldrxjyuyKme9IH5QcMLm9nmKh8cta7n/jEztb6z
 5s4vAVjZ6UhRMEWiPJ4S1oeHpFUmXYPk7WFvohAWEj1ni/htfTmgy/TzXc1lkOl5AfC8
 pjPjedokPZ+xuaNjtzTVF2UjdPSW02Y1NmBy5CpT5UoCSnWjbPmsI9s0M+7+WIeI4dCT
 k1px2IB3468SwM8BwvT18PtU2ve7B3UUXn2e6DX6Kzvv6YhBndreInmZ4uh8/11vcBQL
 n6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9BLb5SG/442AGlteVEU+VMTqxtoAM2EGD3L4sUWx4Zo=;
 b=aq5ANurujSS4xzsQHwLc59cS1J0j+sqilzeNat9tp8zONekQPoIcWHRyTkRgKyrD0V
 h72XOsNeOx9GYh8pvswRObB0StYRfGv8xN3eMDu1/AKSdVAupb5sAlrRRK7g11wF48g3
 7Um3qODMnbsvNvXHB1cO6+5Um53epJZo6IvW+1wHD/KERd2oIhSgTghcqHapPzR/mkFt
 TtIHBNOEJOWUwkKXS9l8/JaD3/fTNoK7mVF2ZsxxEW6g1VHRN3GBSWo4s62VaV3dBG5G
 /V0id2JA0eQ84Y++msTTnTkyWgNQNd9Q1snxxtE/lYi4nXdFdvD6ZwmSDLQAPbne6YQI
 1UYQ==
X-Gm-Message-State: AOAM531P6XcMSj2YXiAZivhcD4Xs7dhuecf5YQuh+HAUXlDUUgkSKxew
 hJ1Yvzpdsxxyle3pxDLD+Uk=
X-Google-Smtp-Source: ABdhPJxxCQt084vIio/21jn+Y9bOhFFOxb57q/VPZKkCWAHnH38E/WjRkUhTdvB+VkRJsk/e6ZwDsw==
X-Received: by 2002:a17:90a:eb09:: with SMTP id
 j9mr9456782pjz.176.1598503873826; 
 Wed, 26 Aug 2020 21:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:57b:156e:1129:dc1b:b8d8:6430])
 by smtp.gmail.com with ESMTPSA id q11sm927060pfn.170.2020.08.26.21.51.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 21:51:13 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v2 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Thu, 27 Aug 2020 12:50:59 +0800
Message-Id: <1598503859-29620-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
References: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_005116_045302_2E19C4E4 
X-CRM114-Status: GOOD (  15.31  )
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
 .../bindings/usb/mediatek,mt6360-tcpc.yaml         | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
new file mode 100644
index 00000000..9e8ab0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -0,0 +1,73 @@
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
+  interrupts-extended:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: PD_IRQB
+
+patternProperties:
+  "connector":
+    type: object
+    $ref: ../connector/usb-connector.yaml#
+    description:
+      Properties for usb c connector.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts-extended
+  - interrupt-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mt6360@34 {
+            compatible = "mediatek,mt6360";
+            reg = <0x34>;
+
+            tcpc {
+                compatible = "mediatek,mt6360-tcpc";
+                interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+                interrupt-names = "PD_IRQB";
+
+                connector {
+                        compatible = "usb-c-connector";
+                        label = "USB-C";
+                        data-role = "dual";
+                        power-role = "dual";
+                        try-power-role = "sink";
+                        source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+                        sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+                        op-sink-microwatt = <10000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
