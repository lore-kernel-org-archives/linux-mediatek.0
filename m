Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252C0C61DF4
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHiLFw1bIGohpGtROyp7CqLCgHPbQhHjoTE9dyN6vFM=; b=oNC0X/ZP0+gRhJwC5OnA+ZoQ0M
	QLor79SIuceIcaaC6l+aL25aYB17JFWIfHP6HYYD5XNdq1tDYE0wIV7x3z6GG0NeZrjWkrmgTBLrl
	VZM6cNDkiH4pKKMhyIY4emCGedUsf+rCu52I16tjG9Cnq5FvlXg2cmkOdtJUY6Gr9W4v37PW5wU3I
	lSBNlIFPLqqAO7F2MHV8ayJNMT6Ggzy2W7LMPdtIJX4cjYi6jiCRb2CKYx7/OQIFmoGHBf3IpYWrG
	BDZQHdkn+BSB1aLmIHY5pwEJzLkIoLiM6rCopws+6fjQlDJCvgwQwwfsOZtL1BIQ56VkXb5YQcZic
	I0mfIxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ger-008Ftu-0B;
	Sat, 25 Nov 2023 00:36:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdy-008FEX-32;
	Sat, 25 Nov 2023 00:35:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b36339549so15979505e9.1;
        Fri, 24 Nov 2023 16:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872531; x=1701477331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHiLFw1bIGohpGtROyp7CqLCgHPbQhHjoTE9dyN6vFM=;
        b=MpUkbeNbnGY5FmcedW1IrmYFElQdT7YNP2jIDZ5PGnzTufMlDqDbG0xnatcar7DZDP
         v/CvBu1CDB5hxXDfMjRSN/9cyzevL1+ToTUjSSDAwlThDsnb43aK9aDns46w/cE716Pp
         10IRibPec3DX6IDonKfLegOHZOekkqa/NFqP7FT1IdUUj6dwi91ToUutcJeEnH0sZ1wC
         nkNdvmQLn1+vaNM6vt0SPBp+/IzoJLuLsA150dpbolJnx6Br5wkuaaGEBalwkkmzWoi2
         lgLO6exH4M5kJnICQ2c9icTMa+2wpN58GK8zFIpuYTGQCerY7+PolL3QYXPG0JVVSEFh
         60Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872531; x=1701477331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHiLFw1bIGohpGtROyp7CqLCgHPbQhHjoTE9dyN6vFM=;
        b=oMSOrjtoRvKcySg6Uj40AUxZJDrGHM/msylr2x9UAlyTMvjMFx0B3S9SVWdr1HGbQi
         T5T35PuF4LOGefmuhTYmVqsexLZFlDs5NHj5TZUVmWbTyBQDSMbRiPnuyfInkt0GJJfj
         +NxPQ6SmtYsVL15A5bAmwR1OfM84ZJKntRmPheGBJ04KwcYKaEY47nF2yrQGrau05VK+
         BUIWxpZvQm9k5+GdLk05zF0ibYahxG36XhyN14vO9mBqTV++RA1K5x5Ll7Q6Abw2bPuH
         ujiiLOgofVbC3IYsgci9Ygm0i8QXfWaV6rvkdIN+l9uVWchTI+iLncTDYOhrTIs+7ZEt
         u3GA==
X-Gm-Message-State: AOJu0Yxb4QkdACuEnL8moUyGO9AZHAiFyIeV+VTPoJ4WPBK2F94hIDE8
	LiRDFB+yaTsXeWSsTHstevk=
X-Google-Smtp-Source: AGHT+IGLc1mlt385WXqXvC6FEasxlmbyfmfpQzHK0GhuUqCYjrLEyySLW33U0gTDlILd7OygLIsynA==
X-Received: by 2002:a05:600c:5252:b0:40b:36e7:1edf with SMTP id fc18-20020a05600c525200b0040b36e71edfmr3919226wmb.26.1700872531054;
        Fri, 24 Nov 2023 16:35:31 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:30 -0800 (PST)
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
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 09/11] dt-bindings: net: Document Qcom QCA807x PHY package
Date: Sat, 25 Nov 2023 01:11:25 +0100
Message-Id: <20231125001127.5674-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163534_984907_71CF059A 
X-CRM114-Status: GOOD (  16.60  )
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
 .../devicetree/bindings/net/qcom,qca807x.yaml | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
new file mode 100644
index 000000000000..f6f07c77a639
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
@@ -0,0 +1,148 @@
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
+    $nodename:
+      pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  patternProperties:
+    ^ethernet-phy(@[a-f0-9]+)?$:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ethernet-phy-id004d.d0b2
+              - ethernet-phy-id004d.d0b1
+
+      required:
+        - compatible
+
+  required:
+    - $nodename
+
+properties:
+  qcom,package-mode:
+    enum:
+      - qsgmii
+      - psgmii
+
+  qcom,tx-driver-strength:
+    enum: [140, 160, 180, 200, 220
+           240, 260, 280, 300, 320
+           400, 500, 600]
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
+    if:
+      required:
+        - gpio-controller
+    then:
+      properties:
+        leds: false
+
+    unevaluatedProperties: false
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
+        ethernet-phy-package@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+
+            qcom,package-mode = "qsgmii";
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <0>;
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
+            ethernet-phy@1 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <1>;
+            };
+
+            ethernet-phy@2 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <2>;
+
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            ethernet-phy@3 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <3>;
+            };
+
+            ethernet-phy@4 {
+                compatible = "ethernet-phy-id004d.d0b2";
+                reg = <4>;
+            };
+        };
+    };
-- 
2.40.1


