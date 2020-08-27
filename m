Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D292BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 11:19:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADE922B40
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 11:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2eeMyIpy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGJQu3Tb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ADE922B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+NOEd3Hh7N+l4HrjVx5LHkIouK3LwD9m2SCx4jE0Ms=; b=2eeMyIpydtuyaPM+1lFeAP0m4Z
	9TXASP2qtqAVL5NUbxNhN9MUm9GnNtp1MA46rjnkpYauunHP1aXJpoD5qj5hPeO5QOt0aghM9KmHU
	zFjYjQNqe8utdNwI44cA1ifcZfuRsBPcplPo7PGv5W2SZTKKfgBZ47EuYYenLvgAq5Y536W6XFJ3j
	w1zrBipzhenqNf1pP20hT0jj0IB1XcMhDLjYSkiCRr25ZAGaXJWBQsEDs4eYaBJWE8KzZbyQY9u92
	VdhMSMDFNovq0aPWJpKy5ENtUZQoPceOizhPWZMIFABuKyJ44Z5p7aE2D0R2XtScEQGiEwEFPmphz
	UDpZmO6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBFwP-0004rY-6d; Thu, 27 Aug 2020 11:19:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBFwH-0004oQ-4X; Thu, 27 Aug 2020 11:19:30 +0000
Received: by mail-pf1-x443.google.com with SMTP id m8so3245562pfh.3;
 Thu, 27 Aug 2020 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A0zpPcYJ1vUHmpV3rQXkBSiNDDj5ItcpLqLQV/ENULo=;
 b=AGJQu3TbjrCnuhhqkqS7j1YaiFtASNUFy2jKDkkrMPsbG74tH+k2AvHvE3Wq3SFUFK
 il9cHaz+IFKfK0oQnZqC7GVn9uztwPz7XrF09MilOdo1c4uyLjnkPy7qHUZ328ce7Qim
 4+rSz1G2nwDriX1NppIqikjH7CHPGsbDohBmB1EO+6vyFcyKtRI5zxP26bovtvOdIqPX
 vIbFygjdpZzEU/AUet9U27Ekk3eAOZKLaGdUCGl5qGiHktb/Tv1pflAza1wFPATgaMxC
 +HSEfAU4sPHHQqf4uqxRE8zCDQYE7VMtWATO6g7O3Mi2I6D18seH689L3mOrHGyERk9l
 t47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A0zpPcYJ1vUHmpV3rQXkBSiNDDj5ItcpLqLQV/ENULo=;
 b=Gh36RA2P8zGSeqS6LYWfS/6inB69h6JLU6XhXgH7L0xO+IYgL8/8rxlsR8gdiVljfd
 DRMO2Vy7dcEM5puHnPOiwIcNa65U6LwFPqV6xaCiXsOcLK1/iLm+64A1XHhNswjOdJVd
 YKyogP8wNFOm5p3kCrNictbOepg7/ORUGmdCMfrrA/OyTi5h+3MdpjC15v+K4SUEUVd4
 m5ov3ucB8HBUorRH186ks/e/yh17ruWXumid7KZIa5HJj8pH12mVN7enPKuNMQuCOWW8
 keXaTbMLQ01OKRqi/T2Di/HDFHj8R1WqWd68DJOr1GSAkOxuZZtY/Q+gEIBkXJJp2qfD
 k1XA==
X-Gm-Message-State: AOAM530PjwDpWO6RkZagUomdCAp/S2H0eUNo+VOTLzppjomZhDL16gCA
 nBI58ppW7vg5NkVAuzGhylg=
X-Google-Smtp-Source: ABdhPJx9BG4IH8NlwPLL49IRWs8UoqHlTHOcA3OYqMJkPAu5ZaZsoK54zswbbH4CKT3oBYuVYRl8QQ==
X-Received: by 2002:a63:2d83:: with SMTP id
 t125mr13734429pgt.441.1598527165079; 
 Thu, 27 Aug 2020 04:19:25 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:c678:1129:dc1b:b8d8:6430])
 by smtp.gmail.com with ESMTPSA id h64sm2411609pfe.201.2020.08.27.04.19.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Aug 2020 04:19:24 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v3 3/3] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Thu, 27 Aug 2020 19:18:57 +0800
Message-Id: <1598527137-6915-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_071929_255506_080A4547 
X-CRM114-Status: GOOD (  16.19  )
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

usb typec: mt6360: Rename DT binding doument from mt6360 to mt636x

Change binding document file name from mt6360 to mt636xfor the
future compatible.
Also change internal description from mt6360 to mt636x.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt636x-tcpc.yaml         | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt636x-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt636x-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt636x-tcpc.yaml
new file mode 100644
index 00000000..e6d2b3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt636x-tcpc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt636x-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT636x Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT636x is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
+  regulators (BUCKs/LDOs), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT636x Type-C Port Switch and Power Delivery controller.
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
