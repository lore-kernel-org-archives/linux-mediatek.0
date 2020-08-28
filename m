Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A496C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 09:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24905208CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 09:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfwq21ml";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjYvfiUH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24905208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22TmyOdbAhMo6amuqY/fJLQai86YdhkJlzUgkYq6U4Q=; b=kfwq21ml9rocMirKiN/WHZJKRT
	+ABllYVMDcWxi9Vt8xwvhudMQbmGpgNKQAzMD7wLeumC8LSXx01qZGMLRwwK6wADGoS2FpbS6ETEl
	S3MEzoiJ+s2tB8nzncCpHcSK7oARVMnBgEWvVh4fbteiIxVexWAaG37ozYgy+tpYpdzmNA5GoUB+G
	A8z/XHv3foyUMNLb5ewKzW+lMGw9hgTvOgDwkQECUlFZhLLxSMwaAbF10NwOO9xn8bHfHWIwYlRK3
	Gr6s12l+DIC4eOW5382UhTf4T5ZfdhZVSKeH1sseayZvi1vsIYfGvKh8lRcusGA+ZhGKJKqVDXpYN
	+htBHgaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBad8-0003fQ-SD; Fri, 28 Aug 2020 09:25:06 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBact-0003YP-7K; Fri, 28 Aug 2020 09:24:52 +0000
Received: by mail-pl1-x643.google.com with SMTP id p15so202854pli.6;
 Fri, 28 Aug 2020 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=htXOCVPrq8HdJeur07eO9bXCbnwDHC4OtbEI9rP9Tn4=;
 b=ZjYvfiUHWn6qehl41HAVN9MqkMLYMd1N1f2XYzRGEsH4Fm4wlkCNW0vbRL7jFh0pRC
 3EVL2pLNlBbx1ES7doz+uRkg63ku2FJvNDTRZy2bJcGWm51jN4SM2KJ1NlMoylEBA0tw
 4Q0W4DDa4aji4Qy0KWMM1l0F9VzH7KiAkeuZqmX7+6yNKAUA5tH9mOqXPLUBcR+RLPRs
 d+3Z4fFh5wLml/0GwHJualYTyRME93NCPdJARqL58hG3iXWgGltsHyLMDsgfrPDOi1oe
 uQE6MCXJ8+Zvlmq/XCmNNRwAmSO0Ufja96aovK6Y3Sy8YZ/l6g4d772FZ+kwzvW8ZIkk
 XKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=htXOCVPrq8HdJeur07eO9bXCbnwDHC4OtbEI9rP9Tn4=;
 b=C0lMSPMPbbL2efwvqBMEptEJv8y8kLS7HHZNznFVBUnUkhjoh0fU3x2Oqu0fMLuTwp
 6ZfQaFBmU0/mYcV7Vm5UCIrCbuFXQ/C4CQfBy6jT++2fLxsLee3W1fmwAIvpJBwu2K9s
 u5uYoq4BdASZ9Fldv6e/QtLVGVkYLWdTLjw0U9fRdbT4b8rsnJLN/00Wzr058wsIo42Q
 zOhzAZ6fxuaAi2k0/B8vbL+KzEu6I4C5A4qeY+b494l4Zlv5xPMwdnuw9PYNXy6NGBqs
 eX7EKNRyyj8y8FZpPhmIcg8HKYgOEboOEv/boSljOO0CjKhZc94raD0WqRJt7dxhC152
 0HNQ==
X-Gm-Message-State: AOAM530hzP6nDFRhZKN7QtRvAJSUJ9EEhPZiyCUMkfx1Ql3wp0Vn0ZMK
 1V9YkpaS9ArOyQxRuAgXdu8=
X-Google-Smtp-Source: ABdhPJwmM74/2Z6OmFics2+KVisBB1kXdKlLOQYV835VuXBGe2zlkLUneUWcyioQm8nI52NOwQVmhw==
X-Received: by 2002:a17:90a:1992:: with SMTP id
 18mr441099pji.135.1598606689274; 
 Fri, 28 Aug 2020 02:24:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:912:593d:4bfb:3bf8:35e0])
 by smtp.gmail.com with ESMTPSA id
 n68sm813563pfn.145.2020.08.28.02.24.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Aug 2020 02:24:48 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com
Subject: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
Date: Fri, 28 Aug 2020 17:24:34 +0800
Message-Id: <1598606674-32326-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598606674-32326-1-git-send-email-u0084500@gmail.com>
References: <1598606674-32326-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_052451_376009_DEAE032C 
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

usb typec: mt6360: Rename DT binding doument from mt6360 to mt636x

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
