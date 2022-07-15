Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A0CCCA481
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=; b=DCq+s/dq9ffoEzcoCFq3hgdtlh
	/KqX+CTAla73c/Jo9UdM+DAksbmYYXCYLllbW4xfLjCyfnLsg8dRjedvHv5+ISt9IDCyqTe3yEzqc
	cKapEfSYLbrfOWcmHxNW8ScbC4gfbfqJUL72ZlXVpQGfsXPXEhtWL/jwn3bpjvoNCXzT/EjkCMY+j
	oGEZTobFNOjuCMBqNuqHw08XKjC2uhCApMTaRo6ajD9A+9VVoxQaQ25tFQZS4732ir673ufqlmFag
	cKxmg843R00werHjWOJXLW9PM6RY6P4fSmQpDciSwFOMVyqUEw/H5Q2q090Xc7Va51RWB4TNCVLKW
	BwjHrIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJT7-006Yo2-80; Fri, 15 Jul 2022 11:26:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJSo-006YdM-1x; Fri, 15 Jul 2022 11:26:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id l124so4407208pfl.8;
        Fri, 15 Jul 2022 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
        b=dM2vJA4m5tndM2YqWNChQvV612aceWv+sz8S5PyiJ4Y5aoTV6LOkaJQWmzUP/xg6ta
         qCYtaPPtLJeMJ0nVjU0teMHZf0hNcD6E3WCpSyk83tUqWoOBINoWz8XUkEGdT66AS4L6
         QXlWza3ewY9p7byKmLDYj/TBoSPbUbX/mIm/OSCEJTlTLDvOfXtvw/j4ABRsY4hVSaWC
         lk2n8k2vG492/R5d2w9R1jLn0KprrlC7YPhxdnDJKjeTqjnUQ6w/ERzXb82a+Kj7h9sx
         b+eDRz6hlDAmmJjkQeq5gytTxbfE0dDujNUpoc9zbwe3YYgZcUThwLqdBYIFaUUwunAe
         LwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EKmNQ8jzp5T9yDlHBcPnxdkBT3bPgsI1Zy7bvplXzhs=;
        b=pJLk2u23xlfl6UUvKM5tnR6MUqeSuvB7jbIdxdOzoAf+U88gcHxzf3vDJeLviXa/qY
         fazBJwQDu0m6x9GnF+LH4c7ebd1YzYACjYgjpTlNzH+3hzaYxxaAuNkF3diw2VYuHQ/U
         gX2ueUtfOhKbhuf6Gesq+eutUnT7gygiPzZglQn/D25kVAp4R0opZIt1oV16jGhkk+nd
         xegqQPww5Ro3+UhLc/9x+U1GrRfYE8+iypucd9rj7q1baI83gwxAZsV2sUGxVjMlrgI3
         aUDd4QdXLR3ptsgGswDdVrkNjQZASqQqkvOqnMEakMYOrDMVP0ZsicBcmtI/hmKnkhIe
         4KNQ==
X-Gm-Message-State: AJIora9fcaWmZD7ihAwKDcTMkgVzxvD0TC5lPL3Sgb7b77fm6yEV6D7b
	Q9Q3sFBrw0U+YjNsKJCE+WE=
X-Google-Smtp-Source: AGRyM1tpynyvAvekOW3RZZP9tybhRUVpPyV/kx5yxMHMHgxsvvYgAcZ4Bsjsnpz63WdQnjk7NScSIg==
X-Received: by 2002:a63:8649:0:b0:419:be28:bc36 with SMTP id x70-20020a638649000000b00419be28bc36mr5791024pgd.549.1657884388311;
        Fri, 15 Jul 2022 04:26:28 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net. [42.72.159.86])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:26:27 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/13] dt-bindings: usb: Add MediaTek MT6370 TCPC
Date: Fri, 15 Jul 2022 19:25:55 +0800
Message-Id: <20220715112607.591-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_042630_126320_8F68E19E 
X-CRM114-Status: GOOD (  10.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml         | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 0000000..72f56cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediatTek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MediaTek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.7.4


