Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D9C43217
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxbWMbCkLf2CZt0JWp3FbnSlefS2q4v4vpwjT3uyBkQ=; b=YXTkJr9EHSeHMufGuc1k1Vp4gP
	l+JG1VzWfy2iwLlPgg41hXhKnZ7pGWxWlp+iRYN2UiF9XemID8c3B3Hv/mSWVyZNnQ+nqw6ylA/L2
	zCtgERqPfPAJ7a+zwdfGYTj5W+Y3C/hHPsnPZg+kIcw0gOsuueX8xMvK0gNPosHWbeM/wv0JpY/JP
	N6OXKCCq8H4bvs/kTUrcMIaYD+4Km62HnpY8lSqs/Tvx3Bj/z24tuKFfhssQsyrcV2d1dttEERgE/
	ed7u35dPXx3/P3FcWIkNbv2p0+0ZXJJQG4+Nj12Zh8VHR5pNP5dlrBbsK/Vw4s8PNgqe8xt7MN25k
	t1scQNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTaH-007a2Q-Mf; Tue, 08 Nov 2022 18:44:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTa7-007ZqY-EY
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 18:44:25 +0000
Received: by mail-wr1-x431.google.com with SMTP id a14so22438883wru.5
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 10:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxbWMbCkLf2CZt0JWp3FbnSlefS2q4v4vpwjT3uyBkQ=;
        b=nmGXyLUsErw5uIAa+fZqWW7kRk09fk1ngioE+3GczLTiN6c0YYI59Xtkr+zwE1RrIy
         yu/m++l3gmJif+U5lTi4dKbPeJZYbPyU2qVNUQ7tSG5N1v5+bCe1r9R4ksge+vbrT8HY
         QI7dL6axXXQH0kYwcKddUTWXrQV4n+y9xpUK06iu3usQLSlzu/+5T+hnnXSF8AdJN53T
         LL5fnEElA6eKD5c0qzuIT9u8U/5xU5Ma+8GFPDhO+yzLTu5pku25elH2Yz0aQxvDimk4
         bo2IVBp02YYQCKc3CnAu16Jbh2PWiCZAjJyzk1mnNdFm06Lmwh2hyChR+TDHBX/mIFwD
         13fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxbWMbCkLf2CZt0JWp3FbnSlefS2q4v4vpwjT3uyBkQ=;
        b=ZpTLIb69vQw9972VmL2Miv44RYIyv/d4qy4NWXw3NU2hSGQvec5yu/7Blqz2qwEvQW
         F6ONY0wZiBubIA7MnhIXajltFqCY7EtOHecY1oq22U5rR0JEg3vdK4ise46VtwI1MYx+
         wdVU2pHqUL253U8tjXZgyTgy6qbqpa5cNsD27f6nMUBYXDZuwFwMjs3ygbbnl133gg9a
         sesaWwZVTMyJV4wCh7PpATcfOod9LmfSrW07eL4NL4fM+ReYjp2M89CKTz8+OKp0E3GO
         yVmrEU5NGVyzd7+4HpkXHVVVhiTZCUIzPSTCl2zbObRfaVjcdBccC9da919600Pfu5mH
         8T2A==
X-Gm-Message-State: ACrzQf3r0TqXNuxperNfwvkWGszEvHXmzrdV/Bf3OZ9X1kxidX9YpzAj
	P1zGWPblTDUQ5htQee+EjaX1sw==
X-Google-Smtp-Source: AMsMyM4UXrchFzDtnHtEG890uxWtTUD5uXXk3PVb0j7isqdzlo5AMfehb75a3fDSvQoOPn8+pEtcbA==
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id q16-20020adfea10000000b00236ec3e869dmr25304812wrm.33.1667933057819;
        Tue, 08 Nov 2022 10:44:17 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:17 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 08 Nov 2022 19:43:40 +0100
Subject: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To: Fabien Parent <fabien.parent@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Chen Zhong <chen.zhong@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9988; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3vlZFWzs8N0acTLXMrSZvnl+PIo8Ay6uEyIXGvzMWuw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN67MeFVNi9wj+YauXCOp5Adu3UBl+sqhO+iHXu
 EGGs7GyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURY0xEA
 CkLBqbPGqeponCtdUBs1vuk3waC1p1QGY9X2mULKVA4gh7eWcuGINZBuREGCJVSjmlzmv78v7TroW/
 PsJNRrs9z2skwt2xqLuxjF44lfENDWV3FLLZmi8i4QWzFF/sRs7sbT6gvrki4fhu0R/oFLznVUSsnE
 Zg4fi6fWvLXPtKBx7f3V6wYSiRAYqGZitoY9L2V1cK+FEYnmmSXJ3ia9u6WtiNO1Q53vTHPJl2VTop
 KMxigrUL+lBdA06UYyLKdiTGvViDRSKTWVmUJo4p3+JfwvOYkl2cc6VDCrpc9gCsUcxxxfXNhyyhwJ
 bbOdLoY0Cvewm4nQzC2DwkGnK5iN/Nir0eGd7jX2sWy1glSA/p6sHGlfHMwdXWb4wFALQGwNw7YC6W
 2Lyp/70L2CYyGIH3cW6pt3D2g6alrEol+OwwfR75GLkcu4hayI8lntqg56xuflPMvqfCnGHiLwe72J
 ObnD4QXFgVVcIGSCRiJiJRzOkt6kbjFVoR6zOVNfx43bYDzNPjhYCHyG2h/l8gukZanxS4jGaluIH0
 QeU47usGChNiEK5EdgYyKrXwX/AHSc3qPCjyRt94iS/pmKPuu59nPSxicp6PnbAEkvNvJ6DoYUmReo
 icZtN66EmhDEdoK4GkA9ptrNtaEQITWO1CbLAfQSEwtBFiDiQdMatyVpcvHg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_104419_501724_13A3687E 
X-CRM114-Status: GOOD (  20.65  )
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

- Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
- MT8365 SoC has 2 additional clock items and a yaml schema for its PMIC
- Remove pwrap.txt file

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/leds/leds-mt6323.txt       |   2 +-
 Documentation/devicetree/bindings/mfd/mt6397.txt   |   2 +-
 .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 158 +++++++++++++++++++++
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 ----------
 4 files changed, 160 insertions(+), 77 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
index 45bf9f7d85f3..73353692efa1 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -9,7 +9,7 @@ MT6323 PMIC hardware.
 For MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 For MediaTek PMIC wrapper bindings see:
-Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
 
 Required properties:
 - compatible : Must be "mediatek,mt6323-led"
diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 79aaf21af8e9..3bee4a42555d 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -13,7 +13,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
 It is interfaced to host controller using SPI interface by a proprietary hardware
 called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
 See the following for pwarp node definitions:
-../soc/mediatek/pwrap.txt
+../soc/mediatek/mediatek,pwrap.yaml
 
 This document describes the binding for MFD device and its sub module.
 
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
new file mode 100644
index 000000000000..fe83458b801a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek PMIC Wrapper
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  On MediaTek SoCs the PMIC is connected via SPI. The SPI master interface
+  is not directly visible to the CPU, but only through the PMIC wrapper
+  inside the SoC. The communication between the SoC and the PMIC can
+  optionally be encrypted. Also a non standard Dual IO SPI mode can be
+  used to increase speed.
+
+  IP Pairing
+
+  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
+  The signals of these pins are routed over the SPI bus using the pwrap
+  bridge. In the binding description below the properties needed for bridging
+  are marked with "IP Pairing". These are optional on SoCs which do not support
+  IP Pairing
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-pwrap
+              - mediatek,mt6765-pwrap
+              - mediatek,mt6779-pwrap
+              - mediatek,mt6797-pwrap
+              - mediatek,mt6873-pwrap
+              - mediatek,mt7622-pwrap
+              - mediatek,mt8135-pwrap
+              - mediatek,mt8173-pwrap
+              - mediatek,mt8183-pwrap
+              - mediatek,mt8188-pwrap
+              - mediatek,mt8365-pwrap
+              - mediatek,mt8516-pwrap
+      - items:
+          - enum:
+              - mediatek,mt8186-pwrap
+              - mediatek,mt8195-pwrap
+          - const: syscon
+
+  reg:
+    minItems: 1
+    items:
+      - description: PMIC wrapper registers (mandatory)
+      - description: IP pairing registers
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: pwrap
+      - const: pwrap-bridge
+
+  interrupts:
+    maxItems: 1
+    description: IRQ for pwrap in SOC
+
+  clocks: true
+
+  clock-names: true
+
+  resets:
+    minItems: 1
+    items:
+      - description: PMIC wrapper reset
+      - description: IP pairing reset
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: pwrap
+      - const: pwrap-bridge
+
+  pmic:
+    type: object
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8365-pwrap
+    then:
+      properties:
+        pmic:
+          $ref: /schemas/mfd/mediatek,mt6357.yaml#
+
+        clocks:
+          items:
+            - description: SPI bus clock
+            - description: Main module clock
+            - description: System module clock
+            - description: Timer module clock
+        clock-names:
+          items:
+            - const: spi
+            - const: wrap
+            - const: sys
+            - const: tmr
+    else:
+      properties:
+        pmic:
+          description: |
+            List of child nodes that specify the regulators.
+            See ../../mfd/mt6397.txt for more details.
+
+        clocks:
+          items:
+            - description: SPI bus clock
+            - description: Main module clock
+        clock-names:
+          items:
+            - const: spi
+            - const: wrap
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/mt8135-resets.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      pwrap@1000f000 {
+          compatible = "mediatek,mt8135-pwrap";
+          reg = <0 0x1000f000 0 0x1000>, <0 0x11017000 0 0x1000>;
+          reg-names = "pwrap", "pwrap-bridge";
+          interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+          resets = <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
+              <&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
+          reset-names = "pwrap", "pwrap-bridge";
+          clocks = <&clk26m>, <&clk26m>;
+          clock-names = "spi", "wrap";
+
+          pmic {
+            compatible = "mediatek,mt6397";
+          };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
deleted file mode 100644
index 8424b93c432e..000000000000
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-MediaTek PMIC Wrapper Driver
-
-This document describes the binding for the MediaTek PMIC wrapper.
-
-On MediaTek SoCs the PMIC is connected via SPI. The SPI master interface
-is not directly visible to the CPU, but only through the PMIC wrapper
-inside the SoC. The communication between the SoC and the PMIC can
-optionally be encrypted. Also a non standard Dual IO SPI mode can be
-used to increase speed.
-
-IP Pairing
-
-on MT8135 the pins of some SoC internal peripherals can be on the PMIC.
-The signals of these pins are routed over the SPI bus using the pwrap
-bridge. In the binding description below the properties needed for bridging
-are marked with "IP Pairing". These are optional on SoCs which do not support
-IP Pairing
-
-Required properties in pwrap device node.
-- compatible:
-	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
-	"mediatek,mt6765-pwrap" for MT6765 SoCs
-	"mediatek,mt6779-pwrap" for MT6779 SoCs
-	"mediatek,mt6797-pwrap" for MT6797 SoCs
-	"mediatek,mt6873-pwrap" for MT6873/8192 SoCs
-	"mediatek,mt7622-pwrap" for MT7622 SoCs
-	"mediatek,mt8135-pwrap" for MT8135 SoCs
-	"mediatek,mt8173-pwrap" for MT8173 SoCs
-	"mediatek,mt8183-pwrap" for MT8183 SoCs
-	"mediatek,mt8186-pwrap" for MT8186 SoCs
-	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
-	"mediatek,mt8195-pwrap" for MT8195 SoCs
-	"mediatek,mt8365-pwrap" for MT8365 SoCs
-	"mediatek,mt8516-pwrap" for MT8516 SoCs
-- interrupts: IRQ for pwrap in SOC
-- reg-names: "pwrap" is required; "pwrap-bridge" is optional.
-  "pwrap": Main registers base
-  "pwrap-bridge": bridge base (IP Pairing)
-- reg: Must contain an entry for each entry in reg-names.
-- clock-names: Must include the following entries:
-  "spi": SPI bus clock
-  "wrap": Main module clock
-  "sys": System module clock (for MT8365 SoC)
-  "tmr": Timer module clock (for MT8365 SoC)
-- clocks: Must contain an entry for each entry in clock-names.
-
-Optional properities:
-- reset-names: Some SoCs include the following entries:
-  "pwrap"
-  "pwrap-bridge" (IP Pairing)
-- resets: Must contain an entry for each entry in reset-names.
-- pmic: Using either MediaTek PMIC MFD as the child device of pwrap
-  See the following for child node definitions:
-  Documentation/devicetree/bindings/mfd/mt6397.txt
-  or the regulator-only device as the child device of pwrap, such as MT6380.
-  See the following definitions for such kinds of devices.
-  Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
-
-Example:
-	pwrap: pwrap@1000f000 {
-		compatible = "mediatek,mt8135-pwrap";
-		reg = <0 0x1000f000 0 0x1000>,
-			<0 0x11017000 0 0x1000>;
-		reg-names = "pwrap", "pwrap-bridge";
-		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
-		resets = <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
-				<&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
-		reset-names = "pwrap", "pwrap-bridge";
-		clocks = <&clk26m>, <&clk26m>;
-		clock-names = "spi", "wrap";
-
-		pmic {
-			compatible = "mediatek,mt6397";
-		};
-	};

-- 
b4 0.10.1

