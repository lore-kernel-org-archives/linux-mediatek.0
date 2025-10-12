Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B4CCD184
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALuuSU+7OMf38Yq7lgs2vGROJq6nvro7orSmMW4CmOM=; b=o6stFbHiq/9+VnCXbf2FpoVima
	NJtXLjxLlSo8tDBNGRgp96PAljDsCvKWb4K2CDwqRL97l4yd9W8lL6MJ7NYiygSQ6FAFqaHmj6saV
	QQDwzdiz2HeqAP8eBklGTsR1XxvTOj8rt91VQnXohcsqAon1+pAgGwN9fOLefQhQahzVArxP2/jGp
	lx946bIdb5Betyj2Qx9fCEGHZTgTwZqV61CJ3kevj4A2JB6CltBnFiKDas15L1cZzaaDiUIknjD29
	FAhQjqnwm/qmAHcXg4yYeWxqsq00BUnCb3di0c4TA94n7h3gIsrxHp3Ltcw50C0PSmJUw47iiD/xj
	jmA77VWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839y-0000000BlYt-1ZGg;
	Sun, 12 Oct 2025 20:59:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839t-0000000BlRf-2vu2
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso25712865e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Oct 2025 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302752; x=1760907552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALuuSU+7OMf38Yq7lgs2vGROJq6nvro7orSmMW4CmOM=;
        b=JgrVl8Sws1Viv3jJF+j7p9d5qHaQhfKY98SkBT3nN+E+6caX5ZiFq2AfjIaAme8O8N
         iS5lzGpXmjVMOvDXRIHAwGRbTON76BF4m16i3U4tt4KHHV+y8Io19s1TpCjBXY4/pevG
         QB7tWqvV2YPPBmg7xJqkwp6nwVWjMiL2dAtpepwx96dqW7bZXK1kYzNhN/lC0Bvm1DWM
         NlIKzIMtt4u7YdtotIQ5CiuiZXNubjLPueNE3z67W8Ic2wiOo85pjPXviU9ZcPj6tNt1
         OMkNEXipb6knfomFSQKoM3ebw0Zok7+tzUWigsbWtL2Zbp28edMUuBl0kpMlPZKh7ybd
         aznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302752; x=1760907552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALuuSU+7OMf38Yq7lgs2vGROJq6nvro7orSmMW4CmOM=;
        b=FM2Dm+uGTCoe4+Q36ThW7mqnyc5f7yGYCl0DApO5ZzsvA6GaLDfqI3SzhkCTtnv/sc
         pxnp/TDIx8RWNGo1eFcSeBbX/lPDRJheml6plRD+LmBkX7tfDmNq2xHMHUyfUPZVr0yk
         Zxz8qpg8vUVNdCWzpgrtwfXTsK8osbWbUj6vp3dNS34713+NtRedtLcCiWXAi2fERI0z
         UwH2t6lp+Pv5FTYiHgyFmK/H9tgMNnsEg6BbIrwGM0xVEGqTIcpwxqr0ZAJWGFJuKOZc
         Xpye7frLItW8wJ2rG4iNQ0ZsMJgIFvddM0lrLz0fkZWuwflogdA+xhBXlAy8t9wyAqCO
         D7pg==
X-Forwarded-Encrypted: i=1; AJvYcCWSDQRzLqqUM7gOCWYnxaKSCdZAWuD9ieGeU1UUvlYptZGizxczcaRN2K9VyoOYVZnu1RyowiYw3dO4pbDMbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAscNXrSrUhV1ul9/pvURZz2mRLzdu0Lf/+R32YYXq50TyMB4L
	sp5rgm0pe8VPdnIK8T0AVie0cwn2juY+zwfnu+Z1xUdZfnUnz49TFFn2
X-Gm-Gg: ASbGnctpPvktnV0tyUg/g/grlaQmnOd096FxOGFTYqYx4SkctjZawSsz2lWlfbf2w0L
	gzL9TKyeyqO9rHBZifpwYzdamCSETPxxnSnpBGhIvx/U7D6eUuyvUNpkAtBVHHCC3qZz8HUD3iz
	cuT17rJ9TGIFnNYxDkmlnXMp5XkmdBNjBbA5Nj/bMGeUYWryG2p809vca6NK5LiTacBWmWJhl0m
	9CbkFRUPzBc1tMiP2gZZ5H24PTOAA2mTtwjHeRZfRcpdMjYC0iNupoLiNFxOpX14DBo4wsA4pn2
	AQKGX9ot8s7CiZBSsDO2URbdJplVh/leNDnCZomQGC7NMNaYTAH+6ycvxAQBWCWLm8cB3Ow9y8L
	JDgZJgParsvLcmjPoSrdz9H4IQ4habGQXgLLw4cYpYo+tCPEaqxAglrp+l/YEjHXMO3vETq9RI0
	hf5hw+sSZ3
X-Google-Smtp-Source: AGHT+IG/dpUbIS0g2Y3eod2I3EyF2R8BKbiMyTePG06XGuV1O4BBygByLPvF2RP+JjrNujG+8ex+nQ==
X-Received: by 2002:a7b:ca44:0:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46fa29ffedemr100671465e9.18.1760302751667;
        Sun, 12 Oct 2025 13:59:11 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:11 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v5 3/5] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Sun, 12 Oct 2025 22:56:57 +0200
Message-ID: <20251012205900.5948-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135913_827991_634AC4A0 
X-CRM114-Status: GOOD (  12.64  )
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
 .../bindings/pci/mediatek-pcie.yaml           | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index fca6cb20d18b..0b8c78ec4f91 100644
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
@@ -40,6 +41,12 @@ properties:
       - enum: [ obff_ck0, obff_ck1 ]
       - enum: [ pipe_ck0, pipe_ck1 ]
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcie-rst1
+
   interrupts:
     maxItems: 1
 
@@ -55,6 +62,17 @@ properties:
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
 
@@ -90,6 +108,33 @@ required:
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-pcie
+    then:
+      properties:
+        reg-names:
+          const: port1
+
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          const: sys_ck1
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
@@ -104,8 +149,14 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        reset: false
+
+        reset-names: false
+
         power-domains: false
 
+        mediatek,pbus-csr: false
+
       required:
         - phys
         - phy-names
@@ -119,10 +170,16 @@ allOf:
         clocks:
           minItems: 6
 
+        reset: false
+
+        reset-names: false
+
         phys: false
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -135,6 +192,12 @@ allOf:
         clocks:
           minItems: 6
 
+        reset: false
+
+        reset-names: false
+
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -151,12 +214,18 @@ allOf:
         clock-names:
           maxItems: 1
 
+        reset: false
+
+        reset-names: false
+
         phys: false
 
         phy-names: false
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
 unevaluatedProperties: false
 
 examples:
@@ -316,3 +385,54 @@ examples:
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


