Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200D9C04FF6
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 15:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OO3aO4bDgNa5+g/Ew0xG9FVE7e7m/ap/Zb3Xh9QhRPQ=; b=b8Rvcg+1sbpRl2+D6sbXVaEdb9
	cOEo+auCZzQdEW0qg1QGJcGrdp/9Lvs3A2Pu2jxiqibO++F2FClazHKZayzx/udvlfwAfowr4ypii
	+fOU24XhynhD4u12YusE2I0/XSpcK94lpSZi4bgpI+XG4BBlmIUnkOLh/ZCK+reVzumNfvw4qsoHA
	jx6si1EiXiYNNHr4n8hQHWJ8ogRJlxzCe3UyaQJ3rVeOmEtF82DO75N0+eSCSw16P8VMTiF38zm9j
	heJTYHTs3EYaMDA7htukLMAu6rRpMr0rh7ugplDf0ckM1VQcLRTEMIzdOypYX9M7N6ndWXBcQXtCu
	bp4F2bPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvf7r-00000003PwA-254j;
	Sat, 13 Apr 2024 15:17:07 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvf7Y-00000003PlF-4AGt
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Apr 2024 15:16:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso2243396e87.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Apr 2024 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713021406; x=1713626206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO3aO4bDgNa5+g/Ew0xG9FVE7e7m/ap/Zb3Xh9QhRPQ=;
        b=yoD7qqd054/gJZBv7f+Rm7zc+2/aLUccWdAXHBQQVsoyoTmhlrLiesSgVCywjeFeMH
         wVjUfvjwn9Dz/Fw0jpyN8WS/Qy6cNQImMo/MdsYlqa/bKirs9Ua/n4Xv/1/A52z9sWQI
         ec0nvFgW2cCon4VWk8i94gl4MTAWGth72uVLTIW7CQvMuO7Ie1qq6JeZwtntL3mY76Jr
         k28BcHJ4uf+wc6KzcDF/221jilG51V0UsXQeFDONZhtoVp4NPLHRX1DJmeivJUFSlqmc
         tsNk2TXtHjiwZ8oJYR6KIxwh970xJ99qHjfPa5I9keyl9+ZFlj4z3CdL82cbVmTceuHc
         lo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713021406; x=1713626206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OO3aO4bDgNa5+g/Ew0xG9FVE7e7m/ap/Zb3Xh9QhRPQ=;
        b=ZZx16EFYhkKQ10us4cy6UuUL41B3XtUnIPivzGwKvJ5F+1lEfQzn4ta3wXoOPIZO4b
         ulssPYpfnMWYi+kDJ4sOOsDiabjI2rg9HuHFjwIrKZx76qiIwnlFBliH8mjHFRxQXQC3
         5kSiQpnnoswMlmarkkAXFs+7ZN23qxyROWKjL5qm1PAPx2E3Bj387FaUjOzye3P4C8fP
         BnSFYIUoC2lUd/GTJ60IccjTj+DP7GfoHNH3aeYxMCf/EmDKrMAE0CizHWvFYNj3mB50
         rPZSEJ2GEzyZ9yVypOd7eGFFZ1MIXoF3DqPpCRHnAbfMBaksnNw92eKVwpo9o12gDCsZ
         o3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVEyfvJG0H/pU+0/pLXavHryQCmobXL3uj3kcO0LeQhd0GFV1FFhHB2HuyCVs4s61NXnpivS1uDkrzy4t70I5FRbWax3FOJw8qeNbqPgHlAT9rT
X-Gm-Message-State: AOJu0Yxqid2AIAbQG8GXVzpXDJt05nes33o11zfdjJF5oYKoCUwc+9u0
	05mO8SSMrkrXD5aoDINhKqN6uAZVF2bie0AefWgyqxPYEOZ65WHStCwZoSBBbyI=
X-Google-Smtp-Source: AGHT+IEq6dfX9spRTfYaEhxAZ7MusslRkqhNFSTd32InAq+acCueVUng+nPb05u48ACbCEjcK2gc1Q==
X-Received: by 2002:a19:5f54:0:b0:518:a9bf:73ec with SMTP id a20-20020a195f54000000b00518a9bf73ecmr1287837lfj.35.1713021406529;
        Sat, 13 Apr 2024 08:16:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id kj15-20020a170907764f00b00a51a60bf400sm3104956ejc.76.2024.04.13.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 08:16:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: PCI: host-bridges: switch from deprecated pci-bus.yaml
Date: Sat, 13 Apr 2024 17:16:16 +0200
Message-Id: <20240413151617.35630-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_081649_762952_C2610922 
X-CRM114-Status: GOOD (  12.15  )
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

dtschema package with core schemas deprecated pci-bus.yaml schema in
favor of pci-host-bridge.yaml.  Update all bindings to use the latter
one.

The difference between pci-bus.yaml and pci-host-bridge.yaml is only in
lack of "reg" property defined by the latter, which should not have any
effect here, because all these bindings define the "reg".

The change is therefore quite trivial, however it requires dtschema
package v2024.02 or newer.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # Renesas
Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. None

Changes in v2:
1. Add tags.
2. Split mediatek,mt7621-pcie to separate patch as it uses
   pci-pci-bridge schema.
---
 Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/apple,pcie.yaml           | 2 +-
 Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml      | 2 +-
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml        | 2 +-
 Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml       | 2 +-
 Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/host-generic-pci.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/loongson.yaml             | 2 +-
 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml  | 2 +-
 Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml            | 2 +-
 Documentation/devicetree/bindings/pci/rcar-pci-host.yaml        | 2 +-
 .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml          | 2 +-
 Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml | 2 +-
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml         | 2 +-
 Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml     | 2 +-
 Documentation/devicetree/bindings/pci/versatile.yaml            | 2 +-
 Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml    | 2 +-
 Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml   | 2 +-
 Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml        | 2 +-
 Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml       | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
index a5bd90bc0712..79a21ba0f9fd 100644
--- a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
@@ -13,7 +13,7 @@ description:
   Amlogic Meson PCIe host controller is based on the Synopsys DesignWare PCI core.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
 
 # We need a select here so we don't match all nodes with 'snps,dw-pcie'
diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index 215ff9a9c835..c8775f9cb071 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -85,7 +85,7 @@ required:
 unevaluatedProperties: false
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
index 0e07ab61a48d..5434c144d2ec 100644
--- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Scott Branden <scott.branden@broadcom.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 22491f7f8852..11f8ea33240c 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -108,7 +108,7 @@ required:
   - msi-controller
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
index a6b494401ebb..f4eb82e684bd 100644
--- a/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns-pcie-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Tom Joseph <tjoseph@cadence.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: cdns-pcie.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml b/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
index 92efbf0f1297..378dd1c8e2ee 100644
--- a/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
+++ b/Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
@@ -51,7 +51,7 @@ description: |
         <0x6000 0 0 4 &pci_intc 2>;
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
index d25423aa7167..3484e0b4b412 100644
--- a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
@@ -116,7 +116,7 @@ required:
   - ranges
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml b/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
index debfb54a8042..3cae2e0f7f5e 100644
--- a/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
@@ -12,7 +12,7 @@ maintainers:
 description: PCI host controller found in the Intel IXP4xx SoC series.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
index 505acc4f3efc..1fd557504b10 100644
--- a/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/intel,keembay-pcie.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Srikanth Thokala <srikanth.thokala@intel.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Documentation/devicetree/bindings/pci/loongson.yaml
index a8324a9bd002..1988465e73a1 100644
--- a/Documentation/devicetree/bindings/pci/loongson.yaml
+++ b/Documentation/devicetree/bindings/pci/loongson.yaml
@@ -13,7 +13,7 @@ description: |+
   PCI host controller found on Loongson PCHs and SoCs.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 7e8c7a2a5f9b..76d742051f73 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -140,7 +140,7 @@ required:
   - interrupt-controller
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index f7a3c2636355..a3c4ddc094aa 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Daire McNamara <daire.mcnamara@microchip.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
index 0d1b23523f62..0a39bbfcb28b 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
@@ -95,6 +95,6 @@ anyOf:
       - msi-map
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index cf9a6910b542..f867746b1ae5 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -130,7 +130,7 @@ anyOf:
       - msi-map
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
index b6a7cb32f61e..210c3f2bf94c 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-pci-host.yaml
@@ -12,7 +12,7 @@ maintainers:
   - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 
 allOf:
-  - $ref: pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index 5a0d64d3ae6b..b288cdb1ec70 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -110,7 +110,7 @@ required:
   - "#interrupt-cells"
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
index 002b728cbc71..720a5f945a4e 100644
--- a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Shawn Lin <shawn.lin@rock-chips.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: rockchip,rk3399-pcie-common.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index 022055edbf9e..548f59d76ef2 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -23,7 +23,7 @@ select:
     - compatible
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
index a20dccbafd94..695e491b7b3b 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Kishon Vijay Abraham I <kishon@ti.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/versatile.yaml b/Documentation/devicetree/bindings/pci/versatile.yaml
index 09748ef6b94f..294c7cd84b37 100644
--- a/Documentation/devicetree/bindings/pci/versatile.yaml
+++ b/Documentation/devicetree/bindings/pci/versatile.yaml
@@ -13,7 +13,7 @@ description: |+
   PCI host controller found on the ARM Versatile PB board's FPGA.
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index 4734be456bde..b75ceefa6f93 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml b/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml
index 69b7decabd45..fb87b960a250 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,axi-pcie-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Thippeswamy Havalige <thippeswamy.havalige@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
index 426f90a47f35..b0d07c71c1c0 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Thippeswamy Havalige <thippeswamy.havalige@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
   - $ref: /schemas/interrupt-controller/msi-controller.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml b/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml
index 0aa00b8e49b3..2f59b3a73dd2 100644
--- a/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml
+++ b/Documentation/devicetree/bindings/pci/xlnx,xdma-host.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Thippeswamy Havalige <thippeswamy.havalige@amd.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
-- 
2.34.1


