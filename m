Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DBEC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oWbW7U8hDbK7k3dW8cQqnctME3Rpq10CqBR82g551s=; b=TzmkoQeG/qFS1UGgZlaoPYG+f6
	BKdlT+jvmm0WtJvx6YobJYLHC9YEZYUWNW2DcF73EqPAzWtQYYUMHY5Q2mP4VDpTVZIkbXKAeLTUu
	G/Tg5aRUYsXncCZfQLzWHp6tgBLX719ctWX+v8Ml6lhy/Zl/QV4rLXHwOVvgx0FgpHrtmfzOB9WYh
	56ZZEbAX8ZNB5C+wAe1Ad1cPn4Elp8QiCYa2vhdurWHOvwYFZVm6hn8KUYxTyupOoF2lTseZgng1W
	y03ygh4NXngtzwBvQGo8nITsODIKiD+vIesLXH+9jsbNFHwsoujxTI59iBXmXNFikGAQpvkDvH4wV
	Onaa4h2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lT-00CRtU-2D;
	Mon, 20 Nov 2023 15:00:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gY-00CBmm-04;
	Mon, 20 Nov 2023 13:52:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4079ed65471so17419085e9.1;
        Mon, 20 Nov 2023 05:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488291; x=1701093091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oWbW7U8hDbK7k3dW8cQqnctME3Rpq10CqBR82g551s=;
        b=ZeRZOIJ3Jt/3IXVUmdqkD5VTbGY1WpZvRDBykrFe2wLgx1I16NBRu2ATt5Volb9prS
         iVTB7MEYtZd/DPlX/vJ2uUvJceRK7VgqVe3exmWf9WwUMb6hIZSsT8z0PU6BRSIHDqi5
         O+iIQjVBqHJ6ksSHNx/9xNFJYDa+uNm1NeLXgtjEr/J5qt4h66XUqzvE5obfbqrqYjNB
         JqPXLBGLmSeD7w9qcmFLjRkNb0oGs12JbuvlVfOU0AbgVjHxD8G8EW7VR3JbJ9EVJr8D
         0GvyNB8OPUbcHcPRuCDXf3zz3/C9W5814prLOdO0+PjuUxfETa46cGxydpfF0ksmHDN6
         iC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488291; x=1701093091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oWbW7U8hDbK7k3dW8cQqnctME3Rpq10CqBR82g551s=;
        b=IHyPrGKFcmtw+APbb9FZ4dvcnSRHYh7O0f3na3mZ4X+wtlOR1cza7XPfEWxS2x4ahX
         owiNxL+G9kde10H77Bp87qP3OMff2WTsiJnLAN+YYM0t88ztXf/vluaNkhkDnFsQYBcH
         BXCtEg3xUml0gwjxuSxWc8GKlXgoO8ESX4vsYZO9NA33VsAUn7ZQkxtZaW2qO3fKB09D
         f8vcu4/iUDPwYK/kY1yxasBkeiPCdvnYjnYSOZTeyfgaF+vU5VlZ1v1pJ7M9WHHU4RZV
         VAKa9fE7Q3jUUPLJQQTZYaC+0EDptPKro++rsgZF7t9kT4oEX7PzlV80GprZnOuNTbA2
         gClA==
X-Gm-Message-State: AOJu0Yzbl8CuNM88wjbCiSIPTLze69XJ/vBjhK3/XohZzU6Lly7ji5xM
	eIDu+FYgNz2C1gZiQit70K8=
X-Google-Smtp-Source: AGHT+IGXDhVPZ/LrxiUSncChlDmbdW69CX3+FivEfcaF6fIFK68I+CV58V07sZTeNeA90QyJl9UMSg==
X-Received: by 2002:a05:600c:4ed2:b0:405:4a78:a890 with SMTP id g18-20020a05600c4ed200b004054a78a890mr5843086wmq.8.1700488291376;
        Mon, 20 Nov 2023 05:51:31 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:31 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 12/14] dt-bindings: net: Document Qcom QCA807x PHY package
Date: Mon, 20 Nov 2023 14:50:39 +0100
Message-Id: <20231120135041.15259-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055134_444591_A1A34A80 
X-CRM114-Status: GOOD (  16.68  )
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

Document Qcom QCA807x PHY package.

Qualcomm QCA807X Ethernet PHY is PHY package of 2 or 5
IEEE 802.3 clause 22 compliant 10BASE-Te, 100BASE-TX and
1000BASE-T PHY-s.

Document the required property to make the PHY package correctly
configure and work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/net/qcom,qca807x.yaml | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
new file mode 100644
index 000000000000..c2d59068d015
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,qca807x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCA807X Ethernet PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  Qualcomm QCA807X Ethernet PHY is PHY package of 2 or 5
+  IEEE 802.3 clause 22 compliant 10BASE-Te, 100BASE-TX and
+  1000BASE-T PHY-s.
+
+  They feature 2 SerDes, one for PSGMII or QSGMII connection with
+  MAC, while second one is SGMII for connection to MAC or fiber.
+
+  Both models have a combo port that supports 1000BASE-X and
+  100BASE-FX fiber.
+
+  Each PHY inside of QCA807x series has 4 digitally controlled
+  output only pins that natively drive LED-s for up to 2 attached
+  LEDs. Some vendor also use these 4 output for GPIO usage without
+  attaching LEDs.
+
+  Note that output pins can be set to drive LEDs OR GPIO, mixed
+  definition are not accepted.
+
+allOf:
+  - $ref: ethernet-phy-package.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-package
+  patternProperties:
+    ^ethernet-phy(@[a-f0-9]+)?$:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ethernet-phy-id004d.d0b2
+              - ethernet-phy-id004d.d0b1
+  required:
+    - compatible
+
+properties:
+  global-phys:
+    maxItems: 2
+
+  global-phy-names:
+    items:
+      - const: combo
+      - const: pqsgmii
+
+  phy-connection-type:
+    enum:
+      - qsgmii
+      - psgmii
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: /schemas/net/ethernet-phy.yaml#
+
+    properties:
+      gpio-controller:
+        description: set the output lines as GPIO instead of LEDs
+        type: boolean
+
+      '#gpio-cells':
+        description: number of GPIO cells for the PHY
+        const: 2
+
+    dependencies:
+      gpio-controller: ['#gpio-cells']
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package {
+            compatible = "ethernet-phy-package";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            global-phys = <&qca8075_4>, <&qca8075_psgmii>;
+            global-phy-names = "combo", "pqsgmii";
+
+            qca8075_1: ethernet-phy@1 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <1>;
+
+                leds {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                        reg = <0>;
+                        color = <LED_COLOR_ID_GREEN>;
+                        function = LED_FUNCTION_LAN;
+                        default-state = "keep";
+                    };
+                };
+            };
+
+            qca8075_2: ethernet-phy@2 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <2>;
+
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            qca8075_3: ethernet-phy@3 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <3>;
+            };
+
+            qca8075_4: ethernet-phy@4 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <4>;
+            };
+
+            qca8075_pqsgmii: ethernet-phy@5 {
+                reg = <5>;
+            };
+        };
+    };
-- 
2.40.1


