Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D02CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMJ3WopK8a5niskiRP0SzUJlGCXuhbpau4KCX70OMIU=; b=h/9DIuOhZ4awVj9mSRFqHpOiaT
	pVwb0u5xDglPZcWL19eG9ui5pWzdMG14ZgJ6nevTLPaIVYtShzl7M9xnVHWnkxrcjPuhW00eKM1ab
	Lpc26XsPShhUiB4r7Rhaf1u0p4Dr9FStswaVPn3XxqCNNPCNTq9BUE2wqUDbs1mCDBOgaMC6VPUGe
	9eEtrj8pvQj5IeW4q3Eg9at0IJX/XNjPEdEfpbf7hcZ1quhin6tY70znWst2FO3O/oc9wnOKkq4zX
	OtyX5XWYqj/CaoYEBpWLWDA84lOpDykGF8VZO9T26zKiTf1wUI8r6vir+ZSbukAWb4XdUXF2U7o4T
	HsGGMExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1olB-0000000B53z-3hWU;
	Thu, 25 Sep 2025 16:23:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol4-0000000B4tv-2oBT
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3fa528f127fso888141f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817429; x=1759422229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMJ3WopK8a5niskiRP0SzUJlGCXuhbpau4KCX70OMIU=;
        b=maQmG8xGtat6b3RkvTsSoOOwzianx/dWBlOycrCGctXnOUN0v8+aqibMRPR6HdTG6L
         yk87D14PmN9HGYOnEXvNDkklbypd4gkVsyt625Lz3QQuJEXn/J3FeyrqBU3/OUrMkCgP
         wnezdp5MkscU7PG0XhmYMAeOd3qvgd83WwTs5aFf0p/eyIH8aaUBAXlK8hFErTSSwYSM
         TaHTMn1mOXiJAbM6Rp1EjkMuCHifgSxgs4hWO8x7Wqd80gMvZYXXcBCRw0+yXho9A+e2
         Due8O4phZdHZ4cz24W2X8cQBnFb8IdfrQggCR42CF7GkSgSEHkaOYcoovro2LhuJ2gGK
         XLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817429; x=1759422229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMJ3WopK8a5niskiRP0SzUJlGCXuhbpau4KCX70OMIU=;
        b=mFjbK7n1fJvg4WVguca/AKccUpJhZK1AY/1MYngkcUtnxQqzWDrJw1s3CGKVAFIDq0
         ImGqsYZNVSvEU5JcJcY2YnvqHojyDj4OBhQC9658kz9FvxQimFa8ZQ8l2jpScIlTPp+e
         YicyCxIsuFkbzN6BY60XzgiHAROh+WU2e7u974U+rQ1pFxj76Kr5ySoC1iQhbZ0oJzSw
         df97ur9rQYXJDAGlFWshZYxyCLg7RIlAuWh48xu6NjQB05/8lzWBC7/D1x+IEgr9GNsv
         cvZqYZwcfsRkuj8l7+xwEshUEs/s3DdhwpPSg1ApFRDOyPWNnmdUpBxY3nQNi0FES4vB
         cDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJM8mPMS1VGVcOx2q4aNVpdPgo+TMqv+Ek2O4KacycJL7DNylGpf9TEsnwQnHTjKVgqmZWNPWIRebRJMj47w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgtVbO1Kuw8pmcGgQtyoFssrU72dbzrmDz4Z7XEyfV+5/9QjGO
	+tQlHceFzMVn6kcCIF2BhkZKy3KIp06sgBu8XcFU4gvwbmo0N2NVC76y
X-Gm-Gg: ASbGncuGAupwOxHiAUR4U60UxF38jkfxlbWH8OD7Yr9h+a4Q8C3izrpXMidtdANIpUX
	ZWsq+wXpTcRFMdImCEFg260Q0pcswem1tX/6BWRLrVPfbdrvMQVsxQ/0tCQa+EpzRIiyZolQkDP
	9DGJvnKPFWqTpQNJPIALtVJJwFRqpjKey7Foi32EzKk/OTmPqLz8wSD9T+Z66028fHqILpukJtw
	K1NJP3u73qB+MtfvRZXL7r0GAwccG3RFUEJUaMuJ5QbazUvP34ZnX6WuALJXC2XY2tOJpGSo/fv
	7md7Ulj+pLl+k4VJsBbvWWJyemI8DZYeAiwt/1yaX2xGPBsw2thOVmxKjvmCenkeDo7YTeErTQE
	/wWuFOO4Wk5rO+2vWciWGViYTnUO7DD8X6q9SmljVN3VtDPIGvauIkmYfhQhDRjq4LujkSKg=
X-Google-Smtp-Source: AGHT+IG4vLNUquEStWizenNmR9p3VJxttVYUn2b4fxFHoL1R1svjHmU9USmjFsPnRBzY3dNa7FzKUA==
X-Received: by 2002:a05:6000:2dc1:b0:3d0:e221:892e with SMTP id ffacd0b85a97d-40f6617670dmr3441522f8f.27.1758817428633;
        Thu, 25 Sep 2025 09:23:48 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH v3 2/4] dt-bindings: PCI: mediatek: Convert to YAML schema
Date: Thu, 25 Sep 2025 18:23:16 +0200
Message-ID: <20250925162332.9794-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925162332.9794-1-ansuelsmth@gmail.com>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092350_902683_59A36F04 
X-CRM114-Status: GOOD (  22.99  )
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

Convert the PCI mediatek Documentation to YAML schema to enable
validation of the supported GEN1/2 Mediatek PCIe controller.

While converting, lots of cleanup were done from the .txt with better
specifying what is supported by the various PCIe controller variant and
drop of redundant info that are part of the standard PCIe Host Bridge
schema.

To reduce schema complexity the .txt is split in 2 YAML, one for
mt7623/mt2701 and the other for every other compatible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 -------------
 .../bindings/pci/mediatek-pcie.yaml           | 404 ++++++++++++++++++
 3 files changed, 577 insertions(+), 289 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
new file mode 100644
index 000000000000..2f201c84e29a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek-pcie-mt7623.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe controller on MediaTek SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-pcie
+      - mediatek,mt7623-pcie
+
+  reg:
+    minItems: 4
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: subsys
+      - const: port0
+      - const: port1
+      - const: port2
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: free_ck
+      - const: sys_ck0
+      - const: sys_ck1
+      - const: sys_ck2
+
+  resets:
+    minItems: 3
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: pcie-rst0
+      - const: pcie-rst1
+      - const: pcie-rst2
+
+  phys:
+    minItems: 3
+    maxItems: 3
+
+  phy-names:
+    items:
+      - const: pcie-phy0
+      - const: pcie-phy1
+      - const: pcie-phy2
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+  - power-domains
+  - pcie@0,0
+  - pcie@1,0
+  - pcie@2,0
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  # MT7623
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/reset/mt2701-resets.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt2701-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        hifsys: syscon@1a000000 {
+            compatible = "mediatek,mt7623-hifsys",
+                        "mediatek,mt2701-hifsys",
+                        "syscon";
+            reg = <0 0x1a000000 0 0x1000>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+
+        pcie@1a140000 {
+            compatible = "mediatek,mt7623-pcie";
+            device_type = "pci";
+            reg = <0 0x1a140000 0 0x1000>, /* PCIe shared registers */
+                  <0 0x1a142000 0 0x1000>, /* Port0 registers */
+                  <0 0x1a143000 0 0x1000>, /* Port1 registers */
+                  <0 0x1a144000 0 0x1000>; /* Port2 registers */
+            reg-names = "subsys", "port0", "port1", "port2";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0xf800 0 0 0>;
+            interrupt-map = <0x0000 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0800 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>,
+                            <0x1000 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
+                    <&hifsys CLK_HIFSYS_PCIE0>,
+                    <&hifsys CLK_HIFSYS_PCIE1>,
+                    <&hifsys CLK_HIFSYS_PCIE2>;
+            clock-names = "free_ck", "sys_ck0", "sys_ck1", "sys_ck2";
+            resets = <&hifsys MT2701_HIFSYS_PCIE0_RST>,
+                     <&hifsys MT2701_HIFSYS_PCIE1_RST>,
+                     <&hifsys MT2701_HIFSYS_PCIE2_RST>;
+            reset-names = "pcie-rst0", "pcie-rst1", "pcie-rst2";
+            phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>,
+                   <&pcie2_phy PHY_TYPE_PCIE>;
+            phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
+            power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000	/* I/O space */
+                      0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>;	/* memory space */
+
+            pcie@0,0 {
+                device_type = "pci";
+                reg = <0x0000 0 0 0 0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0>;
+                interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
+                ranges;
+            };
+
+            pcie@1,0 {
+                device_type = "pci";
+                reg = <0x0800 0 0 0 0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0>;
+                interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+                ranges;
+            };
+
+            pcie@2,0 {
+                device_type = "pci";
+                reg = <0x1000 0 0 0 0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                #interrupt-cells = <1>;
+                interrupt-map-mask = <0 0 0 0>;
+                interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
+                ranges;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
deleted file mode 100644
index 684227522267..000000000000
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
+++ /dev/null
@@ -1,289 +0,0 @@
-MediaTek Gen2 PCIe controller
-
-Required properties:
-- compatible: Should contain one of the following strings:
-	"mediatek,mt2701-pcie"
-	"mediatek,mt2712-pcie"
-	"mediatek,mt7622-pcie"
-	"mediatek,mt7623-pcie"
-	"mediatek,mt7629-pcie"
-	"airoha,en7523-pcie"
-- device_type: Must be "pci"
-- reg: Base addresses and lengths of the root ports.
-- reg-names: Names of the above areas to use during resource lookup.
-- #address-cells: Address representation for root ports (must be 3)
-- #size-cells: Size representation for root ports (must be 2)
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names:
-  Mandatory entries:
-   - sys_ckN :transaction layer and data link layer clock
-  Required entries for MT2701/MT7623:
-   - free_ck :for reference clock of PCIe subsys
-  Required entries for MT2712/MT7622:
-   - ahb_ckN :AHB slave interface operating clock for CSR access and RC
-	      initiated MMIO access
-  Required entries for MT7622:
-   - axi_ckN :application layer MMIO channel operating clock
-   - aux_ckN :pe2_mac_bridge and pe2_mac_core operating clock when
-	      pcie_mac_ck/pcie_pipe_ck is turned off
-   - obff_ckN :OBFF functional block operating clock
-   - pipe_ckN :LTSSM and PHY/MAC layer operating clock
-  where N starting from 0 to one less than the number of root ports.
-- phys: List of PHY specifiers (used by generic PHY framework).
-- phy-names : Must be "pcie-phy0", "pcie-phy1", "pcie-phyN".. based on the
-  number of PHYs as specified in *phys* property.
-- power-domains: A phandle and power domain specifier pair to the power domain
-  which is responsible for collapsing and restoring power to the peripheral.
-- bus-range: Range of bus numbers associated with this controller.
-- ranges: Ranges for the PCI memory and I/O regions.
-
-Required properties for MT7623/MT2701:
-- #interrupt-cells: Size representation for interrupts (must be 1)
-- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must be "pcie-rst0", "pcie-rst1", "pcie-rstN".. based on the
-  number of root ports.
-
-Required properties for MT2712/MT7622/MT7629:
--interrupts: A list of interrupt outputs of the controller, must have one
-	     entry for each PCIe port
-- interrupt-names: Must include the following entries:
-	- "pcie_irq": The interrupt that is asserted when an MSI/INTX is received
-- linux,pci-domain: PCI domain ID. Should be unique for each host controller
-
-In addition, the device tree node must have sub-nodes describing each
-PCIe port interface, having the following mandatory properties:
-
-Required properties:
-- device_type: Must be "pci"
-- reg: Only the first four bytes are used to refer to the correct bus number
-  and device number.
-- #address-cells: Must be 3
-- #size-cells: Must be 2
-- #interrupt-cells: Must be 1
-- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- ranges: Sub-ranges distributed from the PCIe controller node. An empty
-  property is sufficient.
-
-Examples for MT7623:
-
-	hifsys: syscon@1a000000 {
-		compatible = "mediatek,mt7623-hifsys",
-			     "mediatek,mt2701-hifsys",
-			     "syscon";
-		reg = <0 0x1a000000 0 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	pcie: pcie@1a140000 {
-		compatible = "mediatek,mt7623-pcie";
-		device_type = "pci";
-		reg = <0 0x1a140000 0 0x1000>, /* PCIe shared registers */
-		      <0 0x1a142000 0 0x1000>, /* Port0 registers */
-		      <0 0x1a143000 0 0x1000>, /* Port1 registers */
-		      <0 0x1a144000 0 0x1000>; /* Port2 registers */
-		reg-names = "subsys", "port0", "port1", "port2";
-		#address-cells = <3>;
-		#size-cells = <2>;
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0xf800 0 0 0>;
-		interrupt-map = <0x0000 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>,
-				<0x0800 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>,
-				<0x1000 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
-			 <&hifsys CLK_HIFSYS_PCIE0>,
-			 <&hifsys CLK_HIFSYS_PCIE1>,
-			 <&hifsys CLK_HIFSYS_PCIE2>;
-		clock-names = "free_ck", "sys_ck0", "sys_ck1", "sys_ck2";
-		resets = <&hifsys MT2701_HIFSYS_PCIE0_RST>,
-			 <&hifsys MT2701_HIFSYS_PCIE1_RST>,
-			 <&hifsys MT2701_HIFSYS_PCIE2_RST>;
-		reset-names = "pcie-rst0", "pcie-rst1", "pcie-rst2";
-		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>,
-		       <&pcie2_phy PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_HIF>;
-		bus-range = <0x00 0xff>;
-		ranges = <0x81000000 0 0x1a160000 0 0x1a160000 0 0x00010000	/* I/O space */
-			  0x83000000 0 0x60000000 0 0x60000000 0 0x10000000>;	/* memory space */
-
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
-			ranges;
-		};
-
-		pcie@1,0 {
-			reg = <0x0800 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
-			ranges;
-		};
-
-		pcie@2,0 {
-			reg = <0x1000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
-			ranges;
-		};
-	};
-
-Examples for MT2712:
-
-	pcie1: pcie@112ff000 {
-		compatible = "mediatek,mt2712-pcie";
-		device_type = "pci";
-		reg = <0 0x112ff000 0 0x1000>;
-		reg-names = "port1";
-		linux,pci-domain = <1>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "pcie_irq";
-		clocks = <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
-			 <&pericfg CLK_PERI_PCIE1>;
-		clock-names = "sys_ck1", "ahb_ck1";
-		phys = <&u3port1 PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy1";
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-				<0 0 0 2 &pcie_intc1 1>,
-				<0 0 0 3 &pcie_intc1 2>,
-				<0 0 0 4 &pcie_intc1 3>;
-		pcie_intc1: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
-	pcie0: pcie@11700000 {
-		compatible = "mediatek,mt2712-pcie";
-		device_type = "pci";
-		reg = <0 0x11700000 0 0x1000>;
-		reg-names = "port0";
-		linux,pci-domain = <0>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "pcie_irq";
-		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
-			 <&pericfg CLK_PERI_PCIE0>;
-		clock-names = "sys_ck0", "ahb_ck0";
-		phys = <&u3port0 PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0";
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-				<0 0 0 2 &pcie_intc0 1>,
-				<0 0 0 3 &pcie_intc0 2>,
-				<0 0 0 4 &pcie_intc0 3>;
-		pcie_intc0: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
-Examples for MT7622:
-
-	pcie0: pcie@1a143000 {
-		compatible = "mediatek,mt7622-pcie";
-		device_type = "pci";
-		reg = <0 0x1a143000 0 0x1000>;
-		reg-names = "port0";
-		linux,pci-domain = <0>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-names = "pcie_irq";
-		clocks = <&pciesys CLK_PCIE_P0_MAC_EN>,
-			 <&pciesys CLK_PCIE_P0_AHB_EN>,
-			 <&pciesys CLK_PCIE_P0_AUX_EN>,
-			 <&pciesys CLK_PCIE_P0_AXI_EN>,
-			 <&pciesys CLK_PCIE_P0_OBFF_EN>,
-			 <&pciesys CLK_PCIE_P0_PIPE_EN>;
-		clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
-			      "axi_ck0", "obff_ck0", "pipe_ck0";
-
-		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-				<0 0 0 2 &pcie_intc0 1>,
-				<0 0 0 3 &pcie_intc0 2>,
-				<0 0 0 4 &pcie_intc0 3>;
-		pcie_intc0: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
-
-	pcie1: pcie@1a145000 {
-		compatible = "mediatek,mt7622-pcie";
-		device_type = "pci";
-		reg = <0 0x1a145000 0 0x1000>;
-		reg-names = "port1";
-		linux,pci-domain = <1>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-names = "pcie_irq";
-		clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
-			 /* designer has connect RC1 with p0_ahb clock */
-			 <&pciesys CLK_PCIE_P0_AHB_EN>,
-			 <&pciesys CLK_PCIE_P1_AUX_EN>,
-			 <&pciesys CLK_PCIE_P1_AXI_EN>,
-			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
-			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
-		clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
-			      "axi_ck1", "obff_ck1", "pipe_ck1";
-
-		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
-		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
-		status = "disabled";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 7>;
-		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-				<0 0 0 2 &pcie_intc1 1>,
-				<0 0 0 3 &pcie_intc1 2>,
-				<0 0 0 4 &pcie_intc1 3>;
-		pcie_intc1: interrupt-controller {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
new file mode 100644
index 000000000000..e3afedb77a01
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -0,0 +1,404 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe controller on MediaTek SoCs
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2712-pcie
+          - mediatek,mt7622-pcie
+          - mediatek,mt7629-pcie
+      - items:
+          - const: airoha,en7523-pcie
+          - const: mediatek,mt7622-pcie
+
+  reg:
+    minItems: 1
+    maxItems: 4
+
+  reg-names:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: pcie_irq
+
+  resets:
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    maxItems: 3
+
+  phys:
+    minItems: 1
+    maxItems: 3
+
+  phy-names:
+    minItems: 1
+    maxItems: 3
+
+  power-domains:
+    maxItems: 1
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+      '#interrupt-cells':
+        const: 1
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ranges
+  - clocks
+  - clock-names
+  - '#interrupt-cells'
+  - interrupts
+  - interrupt-names
+  - interrupt-controller
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt2712-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - enum: [ port0, port1 ]
+
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - enum: [ sys_ck0, sys_ck1 ]
+            - enum: [ ahb_ck0, ahb_ck1 ]
+
+        reset: false
+
+        reset-names: false
+
+        phys:
+          maxItems: 1
+
+        phy-names:
+          items:
+            - enum: [ pcie-phy0, pcie-phy1 ]
+
+        power-domains: false
+
+      required:
+        - phys
+        - phy-names
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7622-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - enum: [ port0, port1 ]
+
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+        clock-names:
+          items:
+            - enum: [ sys_ck0, sys_ck1 ]
+            - enum: [ ahb_ck0, ahb_ck1 ]
+            - enum: [ aux_ck0, aux_ck1 ]
+            - enum: [ axi_ck0, axi_ck1 ]
+            - enum: [ obff_ck0, obff_ck1 ]
+            - enum: [ pipe_ck0, pipe_ck1 ]
+
+        reset: false
+
+        reset-names: false
+
+        phys: false
+
+        phy-names: false
+
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt7629-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - enum: [ port0, port1 ]
+
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+        clock-names:
+          items:
+            - enum: [ sys_ck0, sys_ck1 ]
+            - enum: [ ahb_ck0, ahb_ck1 ]
+            - enum: [ aux_ck0, aux_ck1 ]
+            - enum: [ axi_ck0, axi_ck1 ]
+            - enum: [ obff_ck0, obff_ck1 ]
+            - enum: [ pipe_ck0, pipe_ck1 ]
+
+        reset: false
+
+        reset-names: false
+
+        phys:
+          maxItems: 1
+
+        phy-names:
+          items:
+            - enum: [ pcie-phy0, pcie-phy1 ]
+
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,en7523-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        reg-names:
+          items:
+            - enum: [ port0, port1 ]
+
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          items:
+            - enum: [ sys_ck0, sys_ck1 ]
+
+        reset: false
+
+        reset-names: false
+
+        phys: false
+
+        phy-names: false
+
+        power-domain: false
+
+unevaluatedProperties: false
+
+examples:
+  # MT2712
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+
+    soc_1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@112ff000 {
+            compatible = "mediatek,mt2712-pcie";
+            device_type = "pci";
+            reg = <0 0x112ff000 0 0x1000>;
+            reg-names = "port1";
+            linux,pci-domain = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie_irq";
+            clocks = <&topckgen>, /* CLK_TOP_PE2_MAC_P1_SEL */
+                     <&pericfg>; /* CLK_PERI_PCIE1 */
+            clock-names = "sys_ck1", "ahb_ck1";
+            phys = <&u3port1 PHY_TYPE_PCIE>;
+            phy-names = "pcie-phy1";
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+                            <0 0 0 2 &pcie_intc1 1>,
+                            <0 0 0 3 &pcie_intc1 2>,
+                            <0 0 0 4 &pcie_intc1 3>;
+            pcie_intc1: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+
+        pcie@11700000 {
+            compatible = "mediatek,mt2712-pcie";
+            device_type = "pci";
+            reg = <0 0x11700000 0 0x1000>;
+            reg-names = "port0";
+            linux,pci-domain = <0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "pcie_irq";
+            clocks = <&topckgen>, /* CLK_TOP_PE2_MAC_P0_SEL */
+                     <&pericfg>; /* CLK_PERI_PCIE0 */
+            clock-names = "sys_ck0", "ahb_ck0";
+            phys = <&u3port0 PHY_TYPE_PCIE>;
+            phy-names = "pcie-phy0";
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+                            <0 0 0 2 &pcie_intc0 1>,
+                            <0 0 0 3 &pcie_intc0 2>,
+                            <0 0 0 4 &pcie_intc0 3>;
+            pcie_intc0: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
+
+  # MT7622
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt7622-power.h>
+
+    soc_2 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1a143000 {
+            compatible = "mediatek,mt7622-pcie";
+            device_type = "pci";
+            reg = <0 0x1a143000 0 0x1000>;
+            reg-names = "port0";
+            linux,pci-domain = <0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "pcie_irq";
+            clocks = <&pciesys>, /* CLK_PCIE_P0_MAC_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_AHB_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_AUX_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_AXI_EN */
+                     <&pciesys>, /* CLK_PCIE_P0_OBFF_EN */
+                     <&pciesys>; /* CLK_PCIE_P0_PIPE_EN */
+            clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
+                          "axi_ck0", "obff_ck0", "pipe_ck0";
+
+            power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc0_1 0>,
+                            <0 0 0 2 &pcie_intc0_1 1>,
+                            <0 0 0 3 &pcie_intc0_1 2>,
+                            <0 0 0 4 &pcie_intc0_1 3>;
+            pcie_intc0_1: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+
+        pcie@1a145000 {
+            compatible = "mediatek,mt7622-pcie";
+            device_type = "pci";
+            reg = <0 0x1a145000 0 0x1000>;
+            reg-names = "port1";
+            linux,pci-domain = <1>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "pcie_irq";
+            clocks = <&pciesys>, /* CLK_PCIE_P1_MAC_EN */
+                     /* designer has connect RC1 with p0_ahb clock */
+                     <&pciesys>, /* CLK_PCIE_P0_AHB_EN */
+                     <&pciesys>, /* CLK_PCIE_P1_AUX_EN */
+                     <&pciesys>, /* CLK_PCIE_P1_AXI_EN */
+                     <&pciesys>, /* CLK_PCIE_P1_OBFF_EN */
+                     <&pciesys>; /* CLK_PCIE_P1_PIPE_EN */
+            clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
+                          "axi_ck1", "obff_ck1", "pipe_ck1";
+
+            power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+            bus-range = <0x00 0xff>;
+            ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 7>;
+            interrupt-map = <0 0 0 1 &pcie_intc1_1 0>,
+                            <0 0 0 2 &pcie_intc1_1 1>,
+                            <0 0 0 3 &pcie_intc1_1 2>,
+                            <0 0 0 4 &pcie_intc1_1 3>;
+            pcie_intc1_1: interrupt-controller {
+                interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+            };
+        };
+    };
-- 
2.51.0


