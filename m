Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FEAC4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:51:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A0A2396D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7xy9v+F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbhh2YTP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A0A2396D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vazsy/mxMTzLxGdbrF3ZpdJLSbEwgPVoN3WEXHztv1c=; b=f7xy9v+F6RzNNarq9uBMMSiTVH
	NfV0IgktF8MIoFlApAyKl+tujIrqE55c8r8m+rf5WK6BcEYqSJTeiUZGSfuUvSgWeaW4GyN+i1SWy
	X38PpIT6PeA/xaMFPgfBRZEF6I9nPHhWlkDxtfopI8L9lZJAHoCWbYczih3MCIDfRjnCcqNtPmRUw
	40DKRZieE81ndhCIn5chkZT/gotby64coZ3SPsP6U+yeAVTQs/JNiyc1jUZomeqUx/EnUtzW9fiI4
	fAiiuz0bN+A0QtZoCpsQxeXMZ7iTBzX/Z5mnunbblZFwyPzr2+hzpWSDaj82EteCOXIxzfYx+dgwN
	phSXOa9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKhlq-0000eV-Ht; Tue, 22 Sep 2020 12:51:46 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKhlW-0000WN-EM; Tue, 22 Sep 2020 12:51:27 +0000
Received: by mail-pg1-x543.google.com with SMTP id o25so6920391pgm.0;
 Tue, 22 Sep 2020 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cI5BHwp+MlxCTXFP/uAUll4x2qI1gUgr+gdLHHRNN+8=;
 b=dbhh2YTP65ilBwuzIUG81L5iMBu5AqRJHerUVn8gUQjr8ROkC9fqfxIe5q2deRvuoB
 Fu7pSH2QO4qvvNgmifzhXwaoVE4U9R6jOkipLPIM5T5msnN/R1xX1oWpB1UeEmo2YVYw
 2BsUDMv/PlR0Frz12xTyk7bfqfnd9u72U2dfRe8HRZREwo/74JZSXNr4xrWyBcAPI7Lo
 Rkt5l3Oi/YKJI6qHv6ANbLHhnqF25WJnCsuPgu75gK2e1dHOlwmygOk2JYhT06gcwChD
 UgPyiC4DikJdbovTB7kWa4sQf/b7cYM5xIyS2dgGk20p0/vaIRiippWCuAAsLmJx2YpM
 rImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cI5BHwp+MlxCTXFP/uAUll4x2qI1gUgr+gdLHHRNN+8=;
 b=LB2XzjyznykRh1kSz4+7v3xbd5orqkaAsEWRizkWCiGiiRyuZ6mSxcJ+4v+soqQy+I
 VIZHGjN/mse/6frp5L7NKAMaAMFI72AjtP5HtJES0f2XBwNtj+NDTuYHTVTovGsGmJ8s
 chQmUKgBy2ieVeROYwDueyG/bWGl/AJFQq42+4ZfuFauP7Fj3xZhsbM+ncwYfwbAda7H
 fRlPr3+KA3qD1ca+e4auQ8/fV7hu3F0RnAptwmPpn4kCD4iLAhqY1jPXz4HGy2uEA7c0
 fTTnl633JeT7Dt6ewXvK8Y4rWM2PUQE/YOOQGNROVYBn0xFrzadKKeptt5ANpmTXemjH
 +DCQ==
X-Gm-Message-State: AOAM533IS6SqJ62y+tTdboLq+6vyNychqg/N8/uAZ0BnPnmkDbCh2sQk
 z/18PLg5xbsVE2lDoQ1dNlY=
X-Google-Smtp-Source: ABdhPJxPK8PwS9/shyDrmbHkK2oHrafpMjY15tyWe8z65rQrgT36bn2rpzwEPSNK+qHxB2gJIj0dZw==
X-Received: by 2002:a63:ce17:: with SMTP id y23mr3447908pgf.447.1600779084478; 
 Tue, 22 Sep 2020 05:51:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id b18sm14995695pfr.4.2020.09.22.05.51.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 05:51:24 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date: Wed, 23 Sep 2020 20:50:51 +0800
Message-Id: <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_085126_549759_517A85D4 
X-CRM114-Status: GOOD (  14.56  )
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
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..a356a1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,107 @@
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
+  "^led@[0-5]$":
+    type: object
+    $ref: common.yaml#
+    description:
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
