Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA85C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:26:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B3B21741
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 03:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyMnqfFK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjjYCWWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B3B21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8j4sC2OyvHBZS87hQV4/YRa/8AYeiM4wlvH/4A6QOc=; b=kyMnqfFKWKRN5kQGCNIvAhZbLM
	475NPXGcJQDM+djNOZkA6Ls3FS7Zegmr+JQ5ovZgI6WLkwgKW8TwdZcjqQ4E+5W1kj2Q7rd8pwUCg
	2Nq8C5sMh/4J2NLyZn/QFgV85TUkDi7X5N7UDJGCRnviAt4QYG5LLevU+wfEAqPxCxX5Xd7FTnGNy
	oz+iHvAEwz21oK8IEVJT2g6b/QvgqXQt+VjMHfEIsaRYRvxAyoE25keZXovEKEzMMF8+3nMLCghTi
	H1fUFhoyTCxg1ONptqB1K3cnVRYQhcDNnGc6x6alqh0Ny1Y90amMXTV/GmFAMSJGCs5hrj3YK06Qa
	hn3Flm0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB8YH-000396-39; Thu, 27 Aug 2020 03:26:13 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB8YB-00037d-7r; Thu, 27 Aug 2020 03:26:08 +0000
Received: by mail-pg1-x543.google.com with SMTP id m34so2317643pgl.11;
 Wed, 26 Aug 2020 20:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9BLb5SG/442AGlteVEU+VMTqxtoAM2EGD3L4sUWx4Zo=;
 b=CjjYCWWooFK0EHgHSecto1ocZEzgllCZ6bs5diPkpf5KyxPD/2P8ma/JoTJrC/I9kg
 IrZ8+T8EjNNw5L4HIuw8fdnnF7fHtKv7eleB9/ryEWChUMheH7av2zhsM4pVpbOvUzB9
 bndcr9i7J6qk72NPvxT5Pj0VuVCc6JwM47s8q06EI5Xl+EMY7qG4QjzCQbDl6CJYyAFN
 hCueWm2YbBNWGs19NIorW/WjzSeDn44oax4oZ1gBtppkmpCNYSnseFKrirnw7Nu5EnOO
 WRvdQZP5BAg9jjMrW+LZh8am0Qh/PFgLe+Ba3L50V+L2q5iIkRCJyatZPqi3T5mi5w1D
 axpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9BLb5SG/442AGlteVEU+VMTqxtoAM2EGD3L4sUWx4Zo=;
 b=H0Vgv5QZ8uJaR3a3jEbi1NRkhFXuwM2z9TMuotGo8drcp8gh94qvMPZ4UHRQCdjg2I
 4jcKz9uXTw6Ld9f37Tv13wWIG2Kkg/pARvfPwE2QUuglJyNqppzaH2Dsxi3MuShwv5Uc
 2NKStbVsLywOXDEoefQVOat2mk9S4sx1YBX0sRd4EYPx0LG6VXag1vRRLrTe0yb6NESU
 TXxz4SxQqHW0LTShe3cSN6IjwKdAMhGOU6I3ziyvS6R9HqVBc9HDXGkdIsR6xyvEt81O
 QlQ6p6s301Ii+esElKKKdKNcyb8hbUxLKVptQT48uzdSdR7pjYMvrDdamStyktUFh2dA
 ZP9g==
X-Gm-Message-State: AOAM532ccGSpEU+/Fl8s3PjuinZkbgsKXNeQ8vlUmYnj1LL5JRCwzPMt
 uEKyh2sF8EckmRxnUO1V33o=
X-Google-Smtp-Source: ABdhPJxlJIglwtNYpMjmJH4S3OB5DwjsuyaIuykvQ+ZOQ/mqrYP2KbU2xeXAzeBV0qrWumABBG0xHw==
X-Received: by 2002:a63:4955:: with SMTP id y21mr12686551pgk.180.1598498764661; 
 Wed, 26 Aug 2020 20:26:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:57b:156e:1129:dc1b:b8d8:6430])
 by smtp.gmail.com with ESMTPSA id 70sm676982pfu.107.2020.08.26.20.25.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 20:26:03 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v2 2/3] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Thu, 27 Aug 2020 11:25:31 +0800
Message-Id: <1598498732-25194-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598498732-25194-1-git-send-email-u0084500@gmail.com>
References: <1598498732-25194-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_232607_626068_969DB08C 
X-CRM114-Status: GOOD (  15.22  )
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
