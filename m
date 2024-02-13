Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094DC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YVvE6JGrrW+bdoM2H4XHHoW+Iw01AOmS4Rx/471szCE=; b=3ZYCGkRXP9XZgfQyPbuaiHla88
	Wx4xJQkdSKXQ6sDYjQ1NP6POJhf/ngtm79WlvIhs8Hi3Zg+6pp3zZukDd1hmeytBa+kHKEXT5Z24D
	ygKuUzF/EQUVVlbNDQjUQ7pkR5svekw7JcX1CZ19DtPLush8P+BH4tjaq5v/xfmaxa64MsOZNn9me
	kMkxC1/5BCxWsNudBmD0Jwm3smJgG89GD2nhKff/9ltvgqD77oiJSfEj7YcKKRNo0N6CVef//hJOM
	TxHgEDcWNCjh1iy+iIECoVTUpoX2eASAblXmDCUKOrK1ZuWxwloOg4L0gugxn3t2d13ZuKpAtMVcV
	FgelfUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnWU-00000008Ir6-3iOW;
	Tue, 13 Feb 2024 07:48:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnWO-00000008Ipf-2MUf;
	Tue, 13 Feb 2024 07:48:08 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a3d002bc6f7so30840266b.3;
        Mon, 12 Feb 2024 23:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707810483; x=1708415283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVvE6JGrrW+bdoM2H4XHHoW+Iw01AOmS4Rx/471szCE=;
        b=N6zY88MmiSuuLBWGL2FiCDkvZo3XQXCfzXJSF0QkjWuQeF4Hg28hXyZpYMSV0C+iJq
         hoaFsRD5EL89RfC+cX2mVo/KqYM3HTgGfLyG7cS09ilJE8XaLK1y/cwMAGF3NJnJfXyX
         0wa5JUUBDgeOHU/gjvxxgN087h5LhBIBUdBXsZu73xapShTTsapFzNycLviN6RTMnMUx
         /QdBslECFHWC62kHw7tTVgWIkrl4b20/6m30Ue9D2r9n/Ensaf9C98j708dJ+JPj2gZR
         4FZGUcEYDzmlZFunB+BEk7jakHUEKEgX74i1TSApEgfItsjUsSMMwk076BU2mVNlI6fU
         E48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707810483; x=1708415283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVvE6JGrrW+bdoM2H4XHHoW+Iw01AOmS4Rx/471szCE=;
        b=TPvF+g/0GTZkHMTeW7riPZihOxnFTnpyxuqr7myK+m8wlvDPETBYTtElnQ8UIDIZ0a
         rXlVsOx/JvXOHzNIXybiu+qyYCw/TrHDLRLT5Ogcn3COxy3pAwhyO1n18bh/NN5FfRzF
         aIhwNV97Cm+AmVCMFn8KO8VULo+pp+Mg2VO+r2UMkxzmkVjkQxy9vipZ4iIMR+NefhIz
         z/+EYSoWRS2aaUl1s4R55VA7A7HS6q/w32MFOstWYT85GKxxbtYKnaTZz1dqfRYIfzce
         eAaKepAxgAezLeJDolpQWyiyCPvfrW7JHSRhMsmnqCruRi+097MA3Bk4ro/wwObczvjK
         0y9w==
X-Forwarded-Encrypted: i=1; AJvYcCWRiKEwesq4WkkS1Sin0/SGArvcZWQhLO5p3WsQOXrP3EbkwqeS9qpYQsjX8JjMWTJ04ZQfUMofGEyxYNThZsghL7UkAVKgJkE6gRvMwghMVxUTjHsSQl+oJfPLDQMmmcVV6cudEs+3bWfSDcGfu9NXZpb6+NCohLM=
X-Gm-Message-State: AOJu0YwsTh1diHvbKHq7KKHnxA1UtxQ3Ag63oaSwxCUv3Tq4dmSRkGSS
	OWNKdfD+RZ2zctSIs8awxQ5ukgDuYU6GTZ7UrzdwQidQ5eYqLfdu
X-Google-Smtp-Source: AGHT+IF0gttBNcV8sh6ab8bf5+rN66Ur/dk0idrz9NdowKTUw3UVn+HwH+clIeE2oz8xxvtquJ3uyA==
X-Received: by 2002:a17:906:80c5:b0:a3c:c614:82bf with SMTP id a5-20020a17090680c500b00a3cc61482bfmr2868502ejx.76.1707810482394;
        Mon, 12 Feb 2024 23:48:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6Vv+QdIy1Uwbyf/48Qht/36JdZFbwumkD4KHX7ZovhK07p7UCvN6ULGkxfVnjjVaVMnF02VxgWpUCOfLlY2PIR6cJ8V29xfsYRnhLZjUVuyvUxgSETT69/hN4PUxkaoCEH5lM+i+95sFu+cbq3gFcDN+qllWKq5+/YrAz4n+ehgkY2ALBRIGdmVbzEHw7RFr31brz5OtJmS/VkU8WG/ctiW4O7dDqHB+gVD2lpd6/YXsJJZru+kIy63uj/18PJhzsvQYAY9aj3mEEZhhgkk5P3Dlc8YGxLHg3/1mwdtW483HaYmnYg7VRbVzFJPgsmYK8mp1jIIUnPC/gYdV0tLb6P56r0X8lUb2wvwwYPYig1YpZNrGXxtHA93qk5xKFBtRC5PiP+iHy6JFHGvUiUzKhXJ0mUEhyy3D40JygSix9q8pHtsChj2Y/F/AHe6bPaxIc+iDPEFkWqkc8SftFW2RFGbKtvYwjbBKT8XNU1ULfgwMPr80HNVbegj4UVw==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id vw3-20020a170907a70300b00a36c5b01ef3sm1015845ejc.225.2024.02.12.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 23:48:02 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: ata: convert MediaTek controller to the json-schema
Date: Tue, 13 Feb 2024 08:47:47 +0100
Message-Id: <20240213074747.26151-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_234807_409158_9636F6C5 
X-CRM114-Status: GOOD (  17.10  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/ata/ahci-mtk.txt      | 51 ----------
 .../bindings/ata/mediatek,mtk-ahci.yaml       | 98 +++++++++++++++++++
 2 files changed, 98 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ata/ahci-mtk.txt
 create mode 100644 Documentation/devicetree/bindings/ata/mediatek,mtk-ahci.yaml

diff --git a/Documentation/devicetree/bindings/ata/ahci-mtk.txt b/Documentation/devicetree/bindings/ata/ahci-mtk.txt
deleted file mode 100644
index d2aa696b161b..000000000000
--- a/Documentation/devicetree/bindings/ata/ahci-mtk.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-MediaTek Serial ATA controller
-
-Required properties:
- - compatible	   : Must be "mediatek,<chip>-ahci", "mediatek,mtk-ahci".
-		     When using "mediatek,mtk-ahci" compatible strings, you
-		     need SoC specific ones in addition, one of:
-		     - "mediatek,mt7622-ahci"
- - reg		   : Physical base addresses and length of register sets.
- - interrupts	   : Interrupt associated with the SATA device.
- - interrupt-names : Associated name must be: "hostc".
- - clocks	   : A list of phandle and clock specifier pairs, one for each
-		     entry in clock-names.
- - clock-names	   : Associated names must be: "ahb", "axi", "asic", "rbc", "pm".
- - phys		   : A phandle and PHY specifier pair for the PHY port.
- - phy-names	   : Associated name must be: "sata-phy".
- - ports-implemented : See ./ahci-platform.txt for details.
-
-Optional properties:
- - power-domains   : A phandle and power domain specifier pair to the power
-		     domain which is responsible for collapsing and restoring
-		     power to the peripheral.
- - resets	   : Must contain an entry for each entry in reset-names.
-		     See ../reset/reset.txt for details.
- - reset-names	   : Associated names must be: "axi", "sw", "reg".
- - mediatek,phy-mode : A phandle to the system controller, used to enable
-		       SATA function.
-
-Example:
-
-	sata: sata@1a200000 {
-		compatible = "mediatek,mt7622-ahci",
-			     "mediatek,mtk-ahci";
-		reg = <0 0x1a200000 0 0x1100>;
-		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "hostc";
-		clocks = <&pciesys CLK_SATA_AHB_EN>,
-			 <&pciesys CLK_SATA_AXI_EN>,
-			 <&pciesys CLK_SATA_ASIC_EN>,
-			 <&pciesys CLK_SATA_RBC_EN>,
-			 <&pciesys CLK_SATA_PM_EN>;
-		clock-names = "ahb", "axi", "asic", "rbc", "pm";
-		phys = <&u3port1 PHY_TYPE_SATA>;
-		phy-names = "sata-phy";
-		ports-implemented = <0x1>;
-		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
-		resets = <&pciesys MT7622_SATA_AXI_BUS_RST>,
-			 <&pciesys MT7622_SATA_PHY_SW_RST>,
-			 <&pciesys MT7622_SATA_PHY_REG_RST>;
-		reset-names = "axi", "sw", "reg";
-		mediatek,phy-mode = <&pciesys>;
-	};
diff --git a/Documentation/devicetree/bindings/ata/mediatek,mtk-ahci.yaml b/Documentation/devicetree/bindings/ata/mediatek,mtk-ahci.yaml
new file mode 100644
index 000000000000..a34bd2e9c352
--- /dev/null
+++ b/Documentation/devicetree/bindings/ata/mediatek,mtk-ahci.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ata/mediatek,mtk-ahci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Serial ATA controller
+
+maintainers:
+  - Ryder Lee <ryder.lee@mediatek.com>
+
+allOf:
+  - $ref: ahci-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7622-ahci
+      - const: mediatek,mtk-ahci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: hostc
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: axi
+      - const: asic
+      - const: rbc
+      - const: pm
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: axi
+      - const: sw
+      - const: reg
+
+  mediatek,phy-mode:
+    description: System controller phandle, used to enable SATA function
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - ports-implemented
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7622-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt7622-power.h>
+    #include <dt-bindings/reset/mt7622-reset.h>
+
+    sata@1a200000 {
+        compatible = "mediatek,mt7622-ahci", "mediatek,mtk-ahci";
+        reg = <0x1a200000 0x1100>;
+        interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "hostc";
+        clocks = <&pciesys CLK_SATA_AHB_EN>,
+                 <&pciesys CLK_SATA_AXI_EN>,
+                 <&pciesys CLK_SATA_ASIC_EN>,
+                 <&pciesys CLK_SATA_RBC_EN>,
+                 <&pciesys CLK_SATA_PM_EN>;
+        clock-names = "ahb", "axi", "asic", "rbc", "pm";
+        phys = <&u3port1 PHY_TYPE_SATA>;
+        phy-names = "sata-phy";
+        ports-implemented = <0x1>;
+        power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+        resets = <&pciesys MT7622_SATA_AXI_BUS_RST>,
+                 <&pciesys MT7622_SATA_PHY_SW_RST>,
+                 <&pciesys MT7622_SATA_PHY_REG_RST>;
+        reset-names = "axi", "sw", "reg";
+        mediatek,phy-mode = <&pciesys>;
+    };
-- 
2.35.3


