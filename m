Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55210C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 01:43:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB2B207EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 01:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZ71Qqhy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYm8yoZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB2B207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIqHhGdSdxcyBxJLD9HuBw1b93a+KE39J24Sa4+G8nI=; b=lZ71QqhypqB4NadfBzsoIbnxmf
	Jfm8tHDedcT2BbIFf3F0r2p+oHzCw997x1ctjB6BtC6Rbo180JkVGjAVPOZ/WBgObeIWWkXL1xIF2
	vmPWMGfYEKykgPpiTJibvPHUoFdmMm/jCAL1t3Ym+kBoDFGH7xT7DhsibT4Fa15NNwFnOnA+kxyCE
	U5kF7Mf9Yuzb8h2J241UQJswVSvEbkViU3xH7OALIjwzj3XJQEX98ovu+ShyAvFruzpZDQWGPdOVD
	XvtrHkB86OUvZMWSf30awTtYS1gX8sjzL9zhCnl3uilhzIAwJPKqkwy7UITCpAbX4xHidan77ioif
	Im2I1HKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPyU2-0002Bp-1V; Wed, 07 Oct 2020 01:43:10 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPyTv-0002AC-Sy; Wed, 07 Oct 2020 01:43:05 +0000
Received: by mail-pg1-x541.google.com with SMTP id 7so354121pgm.11;
 Tue, 06 Oct 2020 18:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QOazEkwt2I/0csuiwBLL8ll1GjbM8fWDAADr2I807qA=;
 b=HYm8yoZYFKgCKGEyGT5FGaGt3IkTrnUluDI7tVdyBF9zD4Vndc1zTJv2hrU6rxb7BY
 HvNtURL8x5qT0G1zkmWSv7kURxtLIKoh3wS9WWZ7KDTWPWYx+s7GKG2mC3uczwONoXyx
 oBDBLti74gRsDfn1lYFqi6AAt/89tnly2XIrNaZezBI3pKptZpK5tmcxTbtE3uyK2jtX
 0MEfw6aBxdmThdL2xsXHHU2FO0uNPh1ml9uUX+uZ/uvf5ghjMN275eViRYb9LTAaGqe2
 wWza6wTWeArtEGnITUPaMeapEHqbhD33hgGgytdUFY3kaylezb3Vp8cTZxWS0HVzX/Pv
 3MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QOazEkwt2I/0csuiwBLL8ll1GjbM8fWDAADr2I807qA=;
 b=O4KcnpKIF+125B6sCqsOgZUSrXuvRXtZQxJTJOToXkJaEIb2npppal9queCrkWffCx
 Xn+6KDZ6L1xpQNxlElS2fAxzRLOQsXyTKBTQFvvE03F1i5ro4RpbYvwF1tMDMzvhqZk7
 s6PnZY/uFVFunPwq7DQ/6oRyUJ/8ELfm10C4RBR+L+1dO7T/SpwFnwCxL89biw+/q4ia
 WFN5ue/E5LTek6hdpncssfiZB+PJYu8CqSHeYu9jMvxKqArhkeV8y8NaWuD/tB1GuF53
 q0zEznpl4UNhJVyD9dufMB8SmuQvSWYWjckd3ypl9Mbhv//4v0HWC/U908WTMzRbEMnp
 LDTQ==
X-Gm-Message-State: AOAM533+2sGjSZQayRjF2zNJVYSgKxp/4MF8wvs6FP72J/qVszquZU/a
 I2pR0vSHqa0GoVklVtPQzMw=
X-Google-Smtp-Source: ABdhPJzG3B+dHZZuwOsql6xHs1utQat0dBLhS7uutJaG6I4U8bvkOGeNvWI63LKz1/d1BJXC5f/DzQ==
X-Received: by 2002:a63:f90a:: with SMTP id h10mr841792pgi.361.1602034981851; 
 Tue, 06 Oct 2020 18:43:01 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:dc67:6c85:26f7:3457:384d])
 by smtp.gmail.com with ESMTPSA id a185sm485863pgc.46.2020.10.06.18.42.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 18:43:01 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v5 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date: Wed,  7 Oct 2020 09:42:45 +0800
Message-Id: <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_214304_005136_EB712F5F 
X-CRM114-Status: GOOD (  15.06  )
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
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..2fa636f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,95 @@
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
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output INDICATOR1_RGB
+          - 1 # LED output INDICATOR2
+          - 2 # LED output FLED1
+          - 3 # LED output FLED2
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
+     led@0 {
+       reg = <0>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RGB>;
+       led-max-microamp = <24000>;
+     };
+     led@1 {
+       reg = <1>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_AMBER>;
+       default-state = "off";
+       led-max-microamp = <150000>;
+     };
+     led@2 {
+       reg = <2>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       default-state = "off";
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@3 {
+       reg = <3>;
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
