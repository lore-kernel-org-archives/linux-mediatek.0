Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDA0C0755A
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9LJN1mgEySGU8oKiT605MgEBGzWasHtQXxakyyFMOs=; b=yVO5aHjsiC2w+RmebkA85IRL/y
	OWmopsYsi9AGs2pnwpECh1kz2L80DqJGA7DYindptE/NedvL3TcGsLVfLwO1yMdmLHf+rOkU0n+oI
	OZDVylGiTinUJqFLcawinkrjwCZKWs3pWKmRQm3NZHjw7mCx8DY3y+cU5EmNsMVFxoARj0W8a0Stx
	ZM1+VgBFKANHcXVf5Bd6ytha3m72NI+8B38tt0NwFkrc4SZW+jOaco6v7Thehw1nngb4tDTjByoXM
	/rGWkjZPyxbj3uck5QLJ8s/4UyXMNeN8ieMICYBIXRvCbS4wxVfF4BreOOdQCLW0FFlO1YgjS0oJU
	N1yq+H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74Ld-00A4ka-2M;
	Sun, 26 Nov 2023 01:54:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LS-00A4bG-1L;
	Sun, 26 Nov 2023 01:54:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso22196805e9.3;
        Sat, 25 Nov 2023 17:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963641; x=1701568441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9LJN1mgEySGU8oKiT605MgEBGzWasHtQXxakyyFMOs=;
        b=LU26qOLvLYGQJjVk3p1m+bq+l5oce4YcbBqlCwsZiuLKcEc+IFAiRqM9pwqkSBlyyp
         CJXSa1oXkS3UVy6SWPQXlDMRhZMJ03EqMyYOp2SbaGY3/kJ9uFx/4LthWXj+uTxhTp8J
         irsWtn3fB99LYQnp1Aa8+h+efCVGnxUh836sKmhCXAG9s+T7mZ7k5O+ayqpr8JB2ohzO
         3GM3e5V65PcF5cs5/JzbGLP8GZOv8LMGPK1F1lntwYMAttT0J1upTHjC3aoJdCuqWb2Y
         r2dnjwCi9lk0nywI08y5QHQV0cbVrtbpj/TRG+6fon+s6uD2GKlwTKM9H8UqY9v8zYsJ
         7udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963641; x=1701568441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9LJN1mgEySGU8oKiT605MgEBGzWasHtQXxakyyFMOs=;
        b=X+oeCi9Hs6eBd1/G+Bld9U9pjYdnHmwh2zr/XXOSfitOCFuBO0PR2w6fTHX1HnwXjY
         vhRG0b6e0wJ1rXYjAsw0Oy2wp/2S0oLv/PKE2z2kYcePy0k3J98F6T1z7Boc6qlrsbV4
         bA/QD0DcdFBq13gv50VtH6+lCcUa4JxYm3aVq0ZnhAvRT129HyNXfR2T9hYF3tPSgkAk
         aFxcIGk+FavzyZuoeWNIuFyUEYbpOeibeIiUlAvAvRTUOE4oWnBjD2/6Nye60MDkhS/S
         bDRNBxhP7LAenI7zBD08Pc4Kwt3AIYLQoDqnVabaD5jFmA6aCyVDh1UWFd2BEBhN7ITZ
         v37Q==
X-Gm-Message-State: AOJu0YyhLTAVkL20DK47UcGcdFiFUWsVySke/Tj5XwKQjG0mybseHYDX
	Gdqkvhtoytm75T5+QttWyOE=
X-Google-Smtp-Source: AGHT+IEOlkdnWzLr3V/+uJg7PbiQse/jLD1AEgl68HSLlLB3UbwFYW+kAXv5TWq8sfRQ24c7VP3WoQ==
X-Received: by 2002:a05:600c:4687:b0:40b:36e9:b84a with SMTP id p7-20020a05600c468700b0040b36e9b84amr5561233wmo.23.1700963640552;
        Sat, 25 Nov 2023 17:54:00 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:54:00 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 6/8] dt-bindings: net: Document Qcom QCA807x PHY package
Date: Sun, 26 Nov 2023 02:53:44 +0100
Message-Id: <20231126015346.25208-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175402_454420_6465303D 
X-CRM114-Status: GOOD (  16.92  )
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
 .../devicetree/bindings/net/qcom,qca807x.yaml | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,qca807x.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,qca807x.yaml b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
new file mode 100644
index 000000000000..136ba2128b73
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,qca807x.yaml
@@ -0,0 +1,136 @@
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
+  PHY package can be configured in 3 mode following this table:
+
+                First Serdes mode       Second Serdes mode
+  Option 1      PSGMII for copper       Disabled
+                ports 0-4
+  Option 2      PSGMII for copper       1000BASE-X / 100BASE-FX
+                ports 0-4
+  Option 3      QSGMII for copper       SGMII for
+                ports 0-3               copper port 4
+
+$ref: ethernet-phy-package.yaml#
+
+properties:
+  qcom,package-mode:
+    enum:
+      - qsgmii
+      - psgmii
+
+  qcom,tx-driver-strength:
+    description: set the TX Amplifier value in mv.
+      If not defined, 600mw is set by default.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [140, 160, 180, 200, 220,
+           240, 260, 280, 300, 320,
+           400, 500, 600]
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: ethernet-phy.yaml#
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
+            compatible = "ethernet-phy-package";
+            reg = <0>;
+
+            qcom,package-mode = "qsgmii";
+
+            ethernet-phy@0 {
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
+                reg = <1>;
+            };
+
+            ethernet-phy@2 {
+                reg = <2>;
+
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            ethernet-phy@3 {
+                reg = <3>;
+            };
+
+            ethernet-phy@4 {
+                reg = <4>;
+            };
+        };
+    };
-- 
2.40.1


