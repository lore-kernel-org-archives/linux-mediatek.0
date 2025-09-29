Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D7CAC5BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0akVzwetHFuOLRrA1RBETtHcqSI0prdy+4IQvcPTIc=; b=kWjk8ohDhHJVl5mGD8g4KTvyXF
	IkjpdxShHUBCmDYZGQjTTqAgM24oaFl8aZIRggqtR8laL1mK7FA9NjTKJOeDXb8JnL5ftaq8di5gi
	OB3fx0CGkHA0BSOM6S4C/BRpjFFqWXh9vO7p8I4WwTK712OtKcraKeqHp9A/z/heYyCw3ol5dJjmX
	R1W+zeu0n5UhBb+3hbq0f2bd5E8j0w6uV0KON+GkasNGHK3GA5M4btnNfOgm7B0dpklODw0HQAHyg
	G3Q/bg5DvNl2WONr5rFE/DzklC7ng2ve0l1sw1pcOKPecgfZ4mr9HUnBbKhVtaa1Ic41mIYkbiA5m
	eR0PR3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD5-00000002MSf-49L3;
	Mon, 29 Sep 2025 11:38:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCz-00000002MLH-2cGr
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e504975dbso8641675e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145900; x=1759750700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0akVzwetHFuOLRrA1RBETtHcqSI0prdy+4IQvcPTIc=;
        b=HNhjNVylo7gB9RRthlnNIBRqKtKDgaFSImLB5qmXHnWKqQdBgOp/ZI7SItOnX0uuAR
         TrBJl8iPfLJ7D+kVbnDMd4HdA5xE6zBQpNcw606wdddtc3XO9PDYbSLXaWf5V2ffbOjn
         G3O9yCtaCGfnlqMwSjfMOiCfh6IjmJjyr5H1WN8Udi478WbZU23b/jkx0pJGI371h6rf
         Nc2xc5YFe4M0TqpPI0Hx96Pi5eFd4K/eesISuxGW2SZKisUbRCW/TRILPe7Xb2cWoHG6
         W0PRZemAc0XnQovTIRNpAdB0niLtwDVLBnhM/+wAO5EBFv4WB7iSh9QPiPbz1HPV8vhW
         z5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145900; x=1759750700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0akVzwetHFuOLRrA1RBETtHcqSI0prdy+4IQvcPTIc=;
        b=tRLfWBNlo3tT5/LplaR2hjsdmEU3J5r+fuMomuMzfs2immXnTE3a4oBZjaBxeS3WTd
         Gvs1xuJSb61KmdnK9RaeDWJlwA82cXEH/cNysiCLpcq6Fj3MdAkgizMx9TuVT8Dkvdv8
         CQGUgBg6XJZVTSteHcBsc/IXw565jm+lZnbsJAJ4y1VZbAelsarNLRPe6O167mEmIgL0
         l874mZ8kqeLjwPYOjSgq0PtUmlzwdLcYalAsTL2o2hzrSSfwF2e6n+ziL0rBCX0z6zWa
         D9Ae43VE8kt58oyhwZA3Y6iIXe+uaNXtGr3WtP3p0G6jPB+1Pcr4R1thQZJiM/En87DP
         S/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCU4+HE191UCJH3Hmz1hUWuOXnQlX1zPcPKkayC6jyH05FB4kLwyczwGyX0dvtRa6jRNyI9zXBKbt+fND3BQCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4U4Y9/Fi0Y9PCM1DRfTnz2bsUlMWK4hi5jMCttOG4TIs87/vO
	yLOkKPA6Muy/uOeQw/ufNNnIcwfHLqNMZMS0IQiFbmlhb0xbfpcazWuG
X-Gm-Gg: ASbGncvaoH1tgF5TjzuTEZTUBWnJrR7r/e27usqS8gZojedsms5/Atv9IBlRfLLfCiF
	rXSMhIyFUxLCWxCrhv+R0yx0PMPlDvNdwQABU4pgpTCXkklA+eqVU4+IW/WRjPys5mzQg7BZBWz
	60hTg1Ll9nDCI/aBqerGrTBBRn0Y9xK5jCwz6/quUDjZtePqG+xvjjdaVXzZXt42RKCJSzpH3Rn
	q9r3qbsx/utmPi5ZvJS2AVOvCOfiORGGxjRAM5XCgpSKvp9YZLIgOUjTTixbvpYX+DBbL/98e73
	vEldkBQt7Zjv1WSRYgGMpdyj/lGGJP1f7Uedow/LF1+pODxleovyHU0NexAfRvqESoU4PTTIPbC
	jg9SLwah7XqtaUpi1rlvq/9fzF+ba3ZryDCXuBJtc9jX3TWaaT4CJatuxwFuOM81WWcov2Icrkv
	cRdMoRMw==
X-Google-Smtp-Source: AGHT+IHc2sldTrNgGF8rhPUi/DYc+1Z7wh5Q8HiRuvHW/nw/mJhTW80r4LIKdvY/BzwTBOCgANZI6A==
X-Received: by 2002:a05:600c:181c:b0:46d:996b:826f with SMTP id 5b1f17b1804b1-46e32a02d46mr117755925e9.25.1759145899467;
        Mon, 29 Sep 2025 04:38:19 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:19 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/5] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Mon, 29 Sep 2025 13:38:02 +0200
Message-ID: <20250929113806.2484-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929113806.2484-1-ansuelsmth@gmail.com>
References: <20250929113806.2484-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043821_684547_4FAA5E62 
X-CRM114-Status: GOOD (  12.97  )
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

Introduce Airoha AN7583 SoC compatible in mediatek PCIe controller
binding.

Similar to GEN3, the Airoha AN7583 GEN2 PCIe controller require the
PBUS csr property to permit the correct functionality of the PCIe
controller.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/mediatek-pcie.yaml           | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index fca6cb20d18b..b91b13a0220c 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - airoha,an7583-pcie
           - mediatek,mt2712-pcie
           - mediatek,mt7622-pcie
           - mediatek,mt7629-pcie
@@ -55,6 +56,17 @@ properties:
   power-domains:
     maxItems: 1
 
+  mediatek,pbus-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to pbus-csr syscon
+          - description: offset of pbus-csr base address register
+          - description: offset of pbus-csr base address mask register
+    description:
+      Phandle with two arguments to the syscon node used to detect if
+      a given address is accessible on PCIe controller.
+
   '#interrupt-cells':
     const: 1
 
@@ -90,6 +102,45 @@ required:
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          const: port1
+
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          const: sys_ck1
+
+        reset:
+          maxItems: 1
+
+        reset-names:
+          const: pcie-rst1
+
+        phys:
+          maxItems: 1
+
+        phy-names:
+          const: pcie-phy1
+
+        power-domain: false
+
+      required:
+        - resets
+        - reset-names
+        - phys
+        - phy-names
+        - mediatek,pbus-csr
+
   - if:
       properties:
         compatible:
@@ -106,6 +157,8 @@ allOf:
 
         power-domains: false
 
+        mediatek,pbus-csr: false
+
       required:
         - phys
         - phy-names
@@ -123,6 +176,8 @@ allOf:
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -135,6 +190,8 @@ allOf:
         clocks:
           minItems: 6
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -157,6 +214,8 @@ allOf:
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
 unevaluatedProperties: false
 
 examples:
@@ -316,3 +375,54 @@ examples:
             };
         };
     };
+
+  # AN7583
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/en7523-clk.h>
+
+    soc_3 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1fa92000 {
+            compatible = "airoha,an7583-pcie";
+            device_type = "pci";
+            linux,pci-domain = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            reg = <0x0 0x1fa92000 0x0 0x1670>;
+            reg-names = "port1";
+
+            clocks = <&scuclk EN7523_CLK_PCIE>;
+            clock-names = "sys_ck1";
+
+            phys = <&pciephy>;
+            phy-names = "pcie-phy1";
+
+            ranges = <0x02000000 0 0x24000000 0x0 0x24000000 0 0x4000000>;
+
+            resets = <&scuclk>; /* AN7583_PCIE1_RST */
+            reset-names = "pcie-rst1";
+
+            mediatek,pbus-csr = <&pbus_csr 0x8 0xc>;
+
+            interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie_irq";
+            bus-range = <0x00 0xff>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+                            <0 0 0 2 &pcie_intc1 1>,
+                            <0 0 0 3 &pcie_intc1 2>,
+                            <0 0 0 4 &pcie_intc1 3>;
+
+            pcie_intc1_4: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
-- 
2.51.0


