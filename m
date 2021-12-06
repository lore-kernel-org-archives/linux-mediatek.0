Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F09C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BByVPArm3F0XUjD8NJdRQuJyPr1BFk7+hDxP6Y9+1m0=; b=1xBIotMmOJF0Nr
	SqSqKmowNv+XE1tO39OM/gxAEZSBr476Ge3v1V8gP974GK7D22pFlLtXSnK4S6X7NeK93aNH+v2RP
	tvCHYilS5RxzhX6oJtucljARDcKpohZfZfgMACGMhRkNDWnEqtcZJWRe8qod/3NhnbvvjEbKxqEkh
	q3DHT0wGla0R9VsxlYR5UjNPR0XInk4G8J72FsU4IliM/iOaW4IRK02xsyId7H03rPoDMy0iBIqLp
	gMlGRV106vadx+IFye/GRlXjou9pgUbgQ703SCly2EgAW4GWR50l6lY1ZXiZM0LNzReSiNS4swktK
	gx6k3nmb9VMRarDzVCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muJuG-005WzW-Pu; Mon, 06 Dec 2021 19:44:12 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muJuD-005WxZ-SW; Mon, 06 Dec 2021 19:44:11 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so14992012otv.9; 
 Mon, 06 Dec 2021 11:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OV4V5cyyfp1d5JWGFe/iPBsQ41nRRI65xNtRWHtdygo=;
 b=s5gXrSqVoBDXxmpre3Q+SHq1TazY9exORIiUn0TI5PeftmIniPqQqMFx4+n28VnZib
 ljti1jkxMtsZDKtyamrg8LoauJPOmJnLBgLMSDvnpsY7WUfTwASTId6r1dyfZ5MdM5Lv
 cHnD2uz4FjcvQYT19sJ6mptYjjkZNPYVhasa9rqZN2Q3UDw0DTT/WjQOp1OS2RtTB3Ms
 y+SnsqCdeIm3RIn2JssVkJaeVgQGc7gsLjwdqbR2+bc6newxB2VWIrLyQf3niKVfPhrD
 G0zHPXH+M6f4HP6LkJIfmbvOoOi7yQizU7STU1eIY9pk6Wqexch1UeC/oIEaVt9kEQuT
 /fnQ==
X-Gm-Message-State: AOAM533E3sWIBu9QMkUJ4eVFDgu9knGeN2vIhpue5s6T4cFbMQsvfN2k
 GbvW/i9XEJZzfPn+WItScA==
X-Google-Smtp-Source: ABdhPJwi4XEJy59m8vu3H7Fv79SUAhYZeBX8Nof8y9Mu60hPozLl0q+Nd+PTyUE+N+3I89DX4D0Azw==
X-Received: by 2002:a05:6830:2019:: with SMTP id
 e25mr32350823otp.96.1638819848480; 
 Mon, 06 Dec 2021 11:44:08 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g17sm2876640oiy.14.2021.12.06.11.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:44:08 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: Fix 'unevaluatedProperties' warnings
Date: Mon,  6 Dec 2021 13:44:05 -0600
Message-Id: <20211206194406.2469361-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_114409_949932_8A0EEAA9 
X-CRM114-Status: GOOD (  10.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

With 'unevaluatedProperties' support implemented, there's several
warnings due to undocumented properties:

Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dt.yaml: pcie@1e140000: pcie@0,0: Unevaluated properties are not allowed ('phy-names' was unexpected)
Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dt.yaml: pcie@1e140000: pcie@1,0: Unevaluated properties are not allowed ('phy-names' was unexpected)
Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.example.dt.yaml: pcie@1e140000: pcie@2,0: Unevaluated properties are not allowed ('phy-names' was unexpected)
Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.example.dt.yaml: pcie@11230000: Unevaluated properties are not allowed ('phy-names' was unexpected)
Documentation/devicetree/bindings/pci/microchip,pcie-host.example.dt.yaml: pcie@2030000000: Unevaluated properties are not allowed ('interrupt-controller' was unexpected)
Documentation/devicetree/bindings/pci/ti,am65-pci-ep.example.dt.yaml: pcie-ep@5500000: Unevaluated properties are not allowed ('num-ib-windows', 'num-ob-windows' were unexpected)
Documentation/devicetree/bindings/pci/ti,am65-pci-host.example.dt.yaml: pcie@5500000: Unevaluated properties are not allowed ('num-viewport', 'interrupts' were unexpected)
Documentation/devicetree/bindings/pci/ti,j721e-pci-host.example.dt.yaml: pcie@2900000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)

Add the necessary property definitions or remove the properties from the
examples to fix these warnings.

Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>
Cc: Abraham I <kishon@ti.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/mediatek,mt7621-pcie.yaml     |  3 +++
 .../bindings/pci/mediatek-pcie-gen3.yaml       |  4 ++++
 .../bindings/pci/microchip,pcie-host.yaml      | 18 ++++++++++++++++++
 .../bindings/pci/ti,am65-pci-ep.yaml           |  2 --
 .../bindings/pci/ti,am65-pci-host.yaml         |  4 +++-
 .../bindings/pci/ti,j721e-pci-host.yaml        |  2 ++
 6 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index 044fa967bc8b..d60f43fd9c5a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -45,6 +45,9 @@ patternProperties:
       phys:
         maxItems: 1
 
+      phy-names:
+        pattern: '^pcie-phy[0-2]$'
+
     required:
       - "#interrupt-cells"
       - interrupt-map-mask
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 742206dbd965..0499b94627ae 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -95,6 +95,10 @@ properties:
   phys:
     maxItems: 1
 
+  phy-names:
+    items:
+      - const: pcie-phy
+
   '#interrupt-cells':
     const: 1
 
diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 7b0776457178..edb4f81253c8 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -46,6 +46,24 @@ properties:
   msi-parent:
     description: MSI controller the device is capable of using.
 
+  interrupt-controller:
+    type: object
+    properties:
+      '#address-cells':
+        const: 0
+
+      '#interrupt-cells':
+        const: 1
+
+      interrupt-controller: true
+
+    required:
+      - '#address-cells'
+      - '#interrupt-cells'
+      - interrupt-controller
+
+    additionalProperties: false
+
 required:
   - reg
   - reg-names
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
index 78c217d362a7..a6896cb40e83 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
@@ -66,8 +66,6 @@ examples:
         reg-names = "app", "dbics", "addr_space", "atu";
         power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
         ti,syscon-pcie-mode = <&pcie0_mode>;
-        num-ib-windows = <16>;
-        num-ob-windows = <16>;
         max-link-speed = <2>;
         dma-coherent;
         interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
index 834dc1c1743c..eabe1635e336 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
@@ -29,6 +29,9 @@ properties:
       - const: config
       - const: atu
 
+  interrupts:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
@@ -87,7 +90,6 @@ examples:
         ti,syscon-pcie-id = <&pcie_devid>;
         ti,syscon-pcie-mode = <&pcie0_mode>;
         bus-range = <0x0 0xff>;
-        num-viewport = <16>;
         max-link-speed = <2>;
         dma-coherent;
         interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
index cc900202df29..2115d5a3f0e1 100644
--- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
@@ -60,6 +60,8 @@ properties:
       - const: fck
       - const: pcie_refclk
 
+  dma-coherent: true
+
   vendor-id:
     const: 0x104c
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
