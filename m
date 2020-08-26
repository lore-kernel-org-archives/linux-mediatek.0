Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E8BC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E380420786
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIYgylEV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTM9eSha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E380420786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8j4sC2OyvHBZS87hQV4/YRa/8AYeiM4wlvH/4A6QOc=; b=mIYgylEVIW4aovalJWerfDl4X0
	/6qEx6NRwDl7/DneQkq7SInIBJSw+ipERBBGGnydnTcRipeeaxjojJQJ1LMpjXj7WNvrn/vz4u8j0
	E8Mmr7XxoTKjJhLpJ4S2xLwOov5vjbsgbBDD00BdRtP7YUVq3r0J960sG3Vq3O8t18a3wC3awVf4M
	I6+16StxNhVVS2KT0M3OF+nJD08RAEcb+p7DHJFk8DH60sJJpOzIJQOPhG7qf1VLweHMjYa0f0Mq0
	YaujLOLf9Vo/eGwLnPBe+9Bz+nnfWPE4HqcXuu+P68I05zgm+UxzDp9F6XkAeAU0q2pFXTZPAq5gC
	XxLCePoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAtQR-0004VH-UZ; Wed, 26 Aug 2020 11:17:07 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAtQJ-0004Sq-T7; Wed, 26 Aug 2020 11:17:01 +0000
Received: by mail-pg1-x542.google.com with SMTP id v15so872890pgh.6;
 Wed, 26 Aug 2020 04:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9BLb5SG/442AGlteVEU+VMTqxtoAM2EGD3L4sUWx4Zo=;
 b=RTM9eShaWBULpfiCRgbWc2dfnQ8mzP3UIe6PD9REcR2jFelRuQgY09d5O441gFQ6VO
 D9oO87xWRZNIVvhOanS8SIn4qAUSIE5hSC0QV9OZr/R1PGgA70tXR1XXT2yxGoDCCVh8
 k9DcqEJCygohr8Tp+SAGy4k6aq/7yODQ+f3HKMYSPE9HNJNCUURn96Zzn/ZEuuJ+HdwN
 lFKP+ic/cFUz/eJIsM3GX3eDZ6Lb2LRk/2cydMrII6CYeh5fuBkansErTfOtBjKTm7lo
 eHN8vdd7HPcLirjZpABpPEhp8zbHXq9ZFgG/ZyN+IW9LrDyM1EGCJXO685nidCgwtov2
 zTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9BLb5SG/442AGlteVEU+VMTqxtoAM2EGD3L4sUWx4Zo=;
 b=jsAaNRvA+hfgsi+mRG4S44j4+yH08ufJbcHe4zZUL/ycIrIY9YT0hGfsu6oakGRBlI
 qlNfQyA67IovV0Jgaim1uvwO7ylXURtkTdWSXRjs9STDpfTILFiw3GWMx5B/jGxfZXfY
 KKGsd9V1d6E51BQQTWJkQCMZRxmARwoGafPpirW5/TGaubxEbfM6R46hYClk0FiH44CJ
 Sj2l9M8GyM/xVKkaKcgll7Ssx4fjDera3C/BvilCCM1cExC+KoOExh0f464m7iSUKns7
 tOFr1JZuLA3RK0qPrTV3brzvzaBNMI11zys1SyLH4Rmdz0MTjlsYtylpTvG41Mcr46zF
 BlSw==
X-Gm-Message-State: AOAM531/aN7RDU2av4qjlz3CwHxnND531DlML1G6I9UbTs859fj/NrOw
 iD0R6L55XNvBJVg7L+SZFcU=
X-Google-Smtp-Source: ABdhPJwxUqjX5J9QraoEj7Vzj2jbbfcOOIZC6fx+JhfutgFaUIROtDcRQOSSk3ooISjmDYHh8woMpA==
X-Received: by 2002:a63:6f02:: with SMTP id k2mr10069642pgc.191.1598440617709; 
 Wed, 26 Aug 2020 04:16:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:464:1646:7076:aae7:15f:eca9])
 by smtp.gmail.com with ESMTPSA id
 g129sm2628872pfb.33.2020.08.26.04.16.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 04:16:57 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Wed, 26 Aug 2020 19:16:42 +0800
Message-Id: <1598440602-8648-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598440602-8648-1-git-send-email-u0084500@gmail.com>
References: <1598440602-8648-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_071659_994211_892B43D1 
X-CRM114-Status: GOOD (  14.98  )
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
