Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A8ECAC5B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 20:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojrSKhmG/fxO+GWCa4ng/6S+zCuiK4Lwk2+N5nW6KeM=; b=Dow4FfSnNrY9FYcAT60qUxr90u
	Zeh3uqpjskYFg+34SI5rSwBT9SyVM6HDo/5g5Bny5FE9YUxAd7g6aEb+BOtZb4O1SYSJJyABgsqIG
	sH7yMndZTzQYazAAkC/pqLdOecTnellLgpEi4wifnqgrfHz3vz5LeiUuBinWpWK7EHEOth/53YHAt
	RTZPNID7AUdszJXN8fvPMoo0CmU3GYctytqjcF/jOvi5gvrGUHJv4zRjifTIrckYQorO696TK39Qt
	DavWx5WAnQmn8AKzHIQzlzekBky2Wg7TaQoHpPIzgifJUOHhXHFEI9Psjfgwn8XZcoAnhaPNTUuUF
	6WVm+qYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nn-0000000EjwH-2rf5;
	Tue, 23 Sep 2025 20:13:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nj-0000000EjsF-1yDR
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 20:13:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ee1381b835so3965788f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658378; x=1759263178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojrSKhmG/fxO+GWCa4ng/6S+zCuiK4Lwk2+N5nW6KeM=;
        b=D4TdGbsbB16vslTrWoOmlbNMwaUdwU8l8gSFkf96jdnU1sAweZpfcmev1PEnczy1sJ
         e3styy7EXLg/gky8UODVbfwCjqXbA/XBBqAg5iImlTyiZ/da0pExC3T0/aXyKgKYBFCf
         slfJoRcKcT73yJLOEv64AXZ9sRHPOitI5AvxukmudIXousqthgd/VMgMt9iSQBl7KtjM
         k2xHksvHrNFDeap5dMnVAc5eRQIa4TSebw3+epOVLhP5cSwxI70KjKEadfSGgKIdq3F2
         SVMj/qARPBnMTpcN/EXO5R2Yh6eo+aIWfVdO0SLSyndj5/f043MLdgI0S2goQFw5RvrM
         l0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658378; x=1759263178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojrSKhmG/fxO+GWCa4ng/6S+zCuiK4Lwk2+N5nW6KeM=;
        b=Hxdtl5I/L3akKeq/H5Bp9inaYO5Wtfz+2YbYv+ajJi+hRO+2J1cYOiRBbmXsv1Ic+c
         UfmD2DCrpL3QdUz5gux7KKZj4+BA2LMPyUJcx7eYYpkf2tClSpicZTxS5ZT222N7ZlJK
         PxXcOx1cWunbNUgxLEHStYAEVSrJefeu23CNSLPhzAEMRtUHg5yVjWY96Xf2MnVx3wTF
         qEbXcCL/OhErF+I2f6DX2X7grK9eHn0S2+ZJdO8UWKmgTr/kvZXuvuV/vxwP1kftJllI
         6z/tonZllMgNO5PR+jenJf5by9P7GzkiUlbYTVqjz00k2e7s/5qklJyxHnrfS9BzClrR
         pyFg==
X-Forwarded-Encrypted: i=1; AJvYcCXz4ezuNM3/6iHo1dtQVuKtbiIhk1YLsyHV1FHn5fUtEHLvDiCy8V93BvCxb0XzrdG2stxuanRhUmLwDy0ysA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcd1+aNPlbiv4zUaPKpfxF+pa4MQ9HLhnQABZvH0zihsbzKAfu
	oeYsLskTC2Fkuc3SHWPCW8rPYyBZ5jSo0fD6H0RiKs6JUcW6yy5RcH/F
X-Gm-Gg: ASbGncu9Pqum2wipxuwOGBBQS/hUtp0NVS0tdn9ulhOiY1zbK1iMR+GpOIOlpXGm1Y/
	n7lYffoW9Tmw2xNsgUQxp7C9OJL4ttRts/rhnJHska4SInU+/Dzxk0ULVmcd5aWNxQiKoPGnhRC
	57IDF5vvuUVXw+6rcqgiDtEo7g1VkZHDfrm7Ap/PBwoGibOdMwsZTLwcRqOYSlRRbBCLxdVHpBJ
	BGSx/QBoCnNBJjlGuhRZ+MUgn2PqS231xlOQR9wwDPIMYa4tNu7PUiIZkZfzbAAAi0DwkDe0PAB
	9sqPErTNTrtHk/90MLwqdB8VFvQ2abS2RfTF0Sd6Xg2SFtZVPTOVm/yeqH3EewynuWmpsIyxfq2
	yE3UIehlv6htHquo/0Ejy2DZUA29DvOWfElessDbN3XXLT/cApnlWwhhbV/SUujIVj/3L4go=
X-Google-Smtp-Source: AGHT+IGqK47tNLWDzv+QVmr3Noen4JYHJzHX9XOvwSn6hx1DoeLXgBT/x9MNl6d/T3WqvGo45eUn9g==
X-Received: by 2002:a05:6000:4024:b0:3d5:d5ea:38d5 with SMTP id ffacd0b85a97d-405c5eb6416mr3557423f8f.25.1758658377507;
        Tue, 23 Sep 2025 13:12:57 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 3/4] dt-bindings: PCI: mediatek: Add support for Airoha AN7583
Date: Tue, 23 Sep 2025 22:12:31 +0200
Message-ID: <20250923201244.952-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923201244.952-1-ansuelsmth@gmail.com>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131259_563217_0119201F 
X-CRM114-Status: GOOD (  13.47  )
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
index e3afedb77a01..46000049a6c5 100644
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
@@ -61,6 +62,17 @@ properties:
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
 
@@ -96,6 +108,45 @@ required:
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
@@ -131,6 +182,8 @@ allOf:
 
         power-domains: false
 
+        mediatek,pbus-csr: false
+
       required:
         - phys
         - phy-names
@@ -169,6 +222,8 @@ allOf:
 
         phy-names: false
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -209,6 +264,8 @@ allOf:
           items:
             - enum: [ pcie-phy0, pcie-phy1 ]
 
+        mediatek,pbus-csr: false
+
       required:
         - power-domains
 
@@ -243,6 +300,8 @@ allOf:
 
         power-domain: false
 
+        mediatek,pbus-csr: false
+
 unevaluatedProperties: false
 
 examples:
@@ -402,3 +461,54 @@ examples:
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


