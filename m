Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07B6C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 08:36:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B284921775
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 08:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="27D+7yyq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlW911ZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B284921775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rpwVVNxYVgZV92g5k90cN5wt+gQJZD3NuzuSf4D8NqY=; b=27D+7yyqnGi1Fex1/7ZJXTiLqM
	gcnMe4svIS78MzE7USlkQHm54wthwt008XJtkPvxId+PLNDLhTX/qIoAli0pr+aLWH09W4aT0IYZw
	5FlgsrzKJKPOV7ZMH7MhpjNAn//EAdZZD5ezyRzgIhfH/Qch7lVEdBLfFF4h1cfx8dKWugIyAeVof
	GsfkKLN4aHdvuGOYUb/jusPhXSnWNYD7EHXBbWmk6BY71xwtfEJ7SJhZSquuRRVkgoqfsENBGtmmB
	h7m34vSqhTNmCblzW1UIpTaeRZfcrsXG0EqWMASD/TuxXZslnZ9NyJMEoeN4wieuzZzxcJOWcBC9R
	oT/dVuEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8g3b-0000cp-Hz; Thu, 20 Aug 2020 08:36:23 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8g3W-0000bi-UM; Thu, 20 Aug 2020 08:36:20 +0000
Received: by mail-pl1-x642.google.com with SMTP id y10so596724plr.11;
 Thu, 20 Aug 2020 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mrDhicMEzi6ypjXQ+lHgViYNy1XmglXxxOBXI3pmGZg=;
 b=XlW911ZV7fx3iRAfW45F7OJJj47Ts4kuM75hG+XUQ8h7WgejYPhagyKwmpz9Op8KLW
 /4mozTBX9+gRK+/C/Gif7OsJZ8hfcMsNUtRcCS6nFUnxZaE03sb9Ir+cjzR0uuxnrUhR
 OZd9lLtNKIJnz1Dcv79w7fWSdjonYsEjWersOx8W7MsDABuOJiZwRN5NLZ638fEKDcoT
 Ng4LrT4kZbJP1ECuBOLb8VIejLKAXdhsLy4SkWfqbDp4C5a/aV/284a87Bk7qd15yRHq
 KIKffmVPXA8CC57QZX3+LiI4auvlwEK9AHcVUlQHmysuVCASd/+AopIzXVSlgz9Borkg
 HaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mrDhicMEzi6ypjXQ+lHgViYNy1XmglXxxOBXI3pmGZg=;
 b=pMEhN1qJygFFJ5W+H2H3wpK7yRsMMLuhSYPLlkms76TmmmMHgpphhnKLxXbKzqCvA5
 8JuoFydvKKZUjV272E9O2SoL3Ozt8W0USHf5dkQm99zqCCjqIVtXO/yEfIsX8VXtERAy
 5DHVoTLACbpXZ5gPssR+K3d5pX3VNO40+NHdhKKcLpwjQAkiUL6gX6TO9CX0mlvH1y94
 6iNnGIcuZEdfmHsBzjbDJouKdz0Vl2WqttLZSDgzTAUUG72FeqHQx4vcrgtEG9Xa6k1d
 u7ga8xnSjxfJWgohB+SeyGjGdWkcvXWsHZOq0A6qDg2sdjJ4+qlM4/MmdUpGxpqqOoGe
 aeZA==
X-Gm-Message-State: AOAM53106UmQpquMyMwNAoDNAyXfnYUbpkGWu2JJ4Way2vAMTr/8BEdH
 HI2WMrHIFgbTCRIHfeLY3+A=
X-Google-Smtp-Source: ABdhPJzYa0qNWcybovZD6zvwZkMtD3wDMkD2dvdTNELV61zeYzKi5ndT9d47ZiO2WLg8lSB3NJI1jA==
X-Received: by 2002:a17:90a:c201:: with SMTP id
 e1mr1684156pjt.142.1597912577051; 
 Thu, 20 Aug 2020 01:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:41e:201d:7f1a:5526:baf8:a1ae])
 by smtp.gmail.com with ESMTPSA id f13sm1762760pfd.215.2020.08.20.01.36.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 01:36:16 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH] dt-bindings: mfd: mediatek: Add bindings for MT6360 PMIC
Date: Thu, 20 Aug 2020 16:35:30 +0800
Message-Id: <1597912530-5374-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_043619_028372_F271FCE7 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: gene_chen@richtek.com, Wilma.Wu@mediatek.com, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings for MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/mfd/mt6360.yaml | 142 ++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mt6360.yaml b/Documentation/devicetree/bindings/mfd/mt6360.yaml
new file mode 100644
index 0000000..5ad1afd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mt6360.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6360 PMIC from MediaTek Integrated
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  MT6360 is a PMIC device with the following sub modules.
+  It is interfaced to host controller using I2C interface.
+
+  This document describes the binding for PMIC device and its sub module.
+
+properties:
+  compatible:
+    const: mediatek,mt6360
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+      enum:
+        - IRQB
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The first cell is the IRQ number.
+
+  regulator:
+    $ref: ../regulator/mt6360-regulator.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mt6360@34 {
+            compatible = "mediatek,mt6360";
+            reg = <0x34>;
+            wakeup-source;
+            interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "IRQB";
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            regulator {
+                compatible = "mediatek,mt6360-regulator";
+                LDO_VIN3-supply = <&BUCK2>;
+                buck1 {
+                    regulator-compatible = "BUCK1";
+                    regulator-name = "mt6360,buck1";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP
+                                               MT6360_OPMODE_ULP>;
+                };
+                BUCK2: buck2 {
+                regulator-compatible = "BUCK2";
+                    regulator-name = "mt6360,buck2";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP
+                                               MT6360_OPMODE_ULP>;
+                };
+                ldo6 {
+                    regulator-compatible = "LDO6";
+                    regulator-name = "mt6360,ldo6";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2100000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP>;
+                };
+                ldo7 {
+                    regulator-compatible = "LDO7";
+                    regulator-name = "mt6360,ldo7";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2100000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP>;
+                };
+                ldo1 {
+                    regulator-compatible = "LDO1";
+                    regulator-name = "mt6360,ldo1";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP>;
+                };
+                ldo2 {
+                    regulator-compatible = "LDO2";
+                    regulator-name = "mt6360,ldo2";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP>;
+                };
+                ldo3 {
+                    regulator-compatible = "LDO3";
+                    regulator-name = "mt6360,ldo3";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP>;
+                };
+                ldo5 {
+                    regulator-compatible = "LDO5";
+                    regulator-name = "mt6360,ldo5";
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                                               MT6360_OPMODE_LP>;
+                };
+            };
+        };
+    };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
