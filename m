Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708DCC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqzG2A95Qy+V3Js2YnmOMMsM4ZOPDZrJYMVeOn8QJBg=; b=lXbv1bvipvZIQEY9rZvgZ9Yluw
	7ULtqHcbCQJvqngMyj4HulPF93tlSI70qv2HEHQ9kAyddmNnF79E9zfuNR4ZWQ7E6C7zP8qZbL9eB
	MjO3K6hq/bu3Lb0qCH5Xrwt1AsjOn999PztvObZzrq7n+OMJT5QccJ4BQa7J3VogbN2LR0WKuqxn6
	1vWJOPzxa+vx8HI7Lr7XiMX4FCyGeIbec3Bgka66oGFaqygXhjiawbqWJo9X65YKy6foP7DYOIMKT
	JynvsX9tv72QweBufBo+Aq6Ibc6jKIicKAxIyi0MedRaK6ARfpfuRVYe9+a5FOMsTBE2QH4gYYbbu
	k5HZkbwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHsB-003abJ-Md; Wed, 16 Nov 2022 12:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHs0-003ZyC-H4
	for linux-mediatek@bombadil.infradead.org; Wed, 16 Nov 2022 12:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HqzG2A95Qy+V3Js2YnmOMMsM4ZOPDZrJYMVeOn8QJBg=; b=lfyGzByEffRchy+eJcki5fY84k
	JG7juYi7WFa/pvew5CEbyjZ58hndBedoN+Z1KINWc56+IDgJdti7GMGrMmSTigmR/UNuWZ2yBWRFL
	Rz5Fey6u4fJ4CD+wemBQgEawsL5NRTDD5rX/h8YC/KPXeb64Q2si6B0/YEwJyXuvWIcph918GOwl3
	y+7FFWngPAMQLLn54o+y/UZfN9zpv1GFo89EtO7Oikq2Bk+nFUn7MAG2zEj6K2e0Gon4O7qeNL6Rp
	bRDgb06+2rYGfWRQipmPllzbtny4dMan14RkAwYRXwaRrWLf0nwjh0btEJes70Eo435GVqCm6szHl
	NKQnxfwA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbu-001JZy-5C
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id bs21so29687336wrb.4
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqzG2A95Qy+V3Js2YnmOMMsM4ZOPDZrJYMVeOn8QJBg=;
        b=ro4TmpgCVdz80BIyEcjyKYx3/q3Fh2lMHd5yg0cfc+IQQ9nkQp9E7oUfsMKOw9lXS5
         29WPeNsFh04WfEnCW3OMqQD5uXXDEvqiqB1Vi3jW5y7LrvrZX2aFQnzPAkmU19Dkaz0j
         QmbtmZEQDaYALd4oigi9bcTPfpMRc2AZcE6J/PY18lFRHg1iKZrdfKIcI7SoypFYT451
         V+nDe4LaNMxFKIKMvBRhq8N5KpccohpYfatmqsic+afv56X5NdzJiKRzgMimEhiXOyci
         ZaKCd7vzPJh6519WFDrb09YJO3drGg7gkDJNrmhL/tSq0iOpY4TCs6efQunpBapRi6ae
         XtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqzG2A95Qy+V3Js2YnmOMMsM4ZOPDZrJYMVeOn8QJBg=;
        b=ogi4W2OYzknIqThqdGR9oHsobUpvTF1D8UlUh8C0crz+Cxm1fAFtwEjJlJmXetP25U
         vY13u1P0BMNXAboU0nGmDkgHxs59Yt9txL93p+RNoOApxGfcRsfhynJZRqGvHjlHTwHg
         iYnWY46LE61hP3FwoU/8AgrgwftvPj8RjpyVTBx9LAxajcpd/gCwcPMzcRLXbmo/j82C
         PgBapkYXQgSSUEWQS+D1i9WzOvu30J9pQAxMllErUvHm9gCTOtRJxOtPAG5VSgwU/l/p
         y45fGJlTlZuHnZ4j9Ox/l02+udCbR2MvL7mYtnqtxrTZei74DrwVxj6hZ+/UOdpeFwJP
         41dg==
X-Gm-Message-State: ANoB5pnI0nxH9XgxGbbxVrhkeE3iWJO9QuIDnxSJD2Sz+QqIGQEUQHyF
	BsPo8H1MUgavZsgLG45WKsr4ag==
X-Google-Smtp-Source: AA0mqf4Gf1d8+Mg7JaqjbiGsjzK0ncUV/1NsBkYcA5A3zj6l0F8LqWTru42dSXB16t2YLWrXG7mcBA==
X-Received: by 2002:a5d:54ce:0:b0:22a:f477:7bb6 with SMTP id x14-20020a5d54ce000000b0022af4777bb6mr13604734wrv.390.1668602022752;
        Wed, 16 Nov 2022 04:33:42 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:42 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:33:00 +0100
Subject: [PATCH v5 06/10] dt-bindings: soc: mediatek: convert pwrap documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-6-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9532; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=SMS90aPuou5R7V3BK3qz6aBqSZLNv+XB8Kxtsil5lQg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNieknsUQIZhu4ijNtJfoIpGY+YhKWdfNsi0yfUU
 GTKWKMWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURXa/D/
 934ndpfb7WCeZvO5b3VbwywwyoJ8jVY22dSeCJw7fqzEhos/pPAE3ir3vn2HRiCkJL/yhE8PIdDkgW
 Nhs5oqc+0zmf5Qub33HXltPb6yhp3iUZ9kM2M1Vm7N59oqAIz2nQmxpbIqeIkXUFVmAu30bsNjujYN
 keIq6sLN/bHvYcFDYLlIaIj9GDQQ/IP0SYn1I3dNFRAfh4HttBHaWKEomfWppiHpcTozsrPZJfZ9RF
 BaCc/Fd50I2Q60pM8NUWQXhOhDIXW4YquWnSKwuAbmIKxDTch4ceFcVPeV4NU9+qgIrlKCiMUW6dmD
 cLcMdR/UXXTuhRHMaYsKcYc/VfDBPk5bjU4+g6dS7Kzik/NQZxikuu5EyZoQsZtqlAWusiDdK2tyr/
 YDosIsmb8qkforsnUrfdhTeBVBHbKwfDHsNMG+o6z+eWhLD/Ez/u74bmDASX27oy1u9uWL6WJoTZRh
 qlOuENaOsTJPPIdvE5Ds3fBAZMJpSHde1ITQEi2o28a489/J9hA6fRf/KtDhlcw2h5/IGjsZAL8v+F
 0z+zKJrJZEkdgkZRADyvFZiZnPKCqvvRvIjcdiTxnLRelVRWY3czWLxUpMkN+Hqp0XrDuHQ0AdylQQ
 aKKhnKd+kZvtlawqLJ20qQoqSxqsv8Mlk3dYTdbcg85IvPKklDxZh8+gkhBA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_123346_349713_E58FADF2 
X-CRM114-Status: GOOD (  19.56  )
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
 .../bindings/soc/mediatek/mediatek,pwrap.yaml      | 145 +++++++++++++++++++++
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  75 -----------
 4 files changed, 147 insertions(+), 77 deletions(-)

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
index 000000000000..6d19f534e994
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek PMIC Wrapper
+
+maintainers:
+  - Flora Fu <flora.fu@mediatek.com>
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
+      - description: PMIC wrapper registers
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
+
+  clocks:
+    minItems: 2
+    items:
+      - description: SPI bus clock
+      - description: Main module clock
+      - description: System module clock
+      - description: Timer module clock
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: spi
+      - const: wrap
+      - const: sys
+      - const: tmr
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
+    $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+dependentRequired:
+  resets: [reset-names]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8365-pwrap
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          minItems: 4
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pwrap: pwrap@1000d000 {
+            compatible = "mediatek,mt8365-pwrap";
+            reg = <0 0x1000d000 0 0x1000>;
+            reg-names = "pwrap";
+            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
+                     <&infracfg CLK_IFR_PMIC_AP>,
+                     <&infracfg CLK_IFR_PWRAP_SYS>,
+                     <&infracfg CLK_IFR_PWRAP_TMR>;
+            clock-names = "spi", "wrap", "sys", "tmr";
+        };
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

