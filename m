Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F37C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 20:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cshQ1wZc9ed3nNJC8OJtTnZn9EB9nDUdyNUb+6odG2I=; b=WVJa9RBcylSZUxQzA85G53wYi5
	190SlD34rA7M4N6zQGxw0hvDN9Uhi4nIyGEl4SYWAfcwqsAoCUcB7y7vByogBxTBLbxpyiXiOUsjS
	+6/n6Ef+jXMsSQipNH9HO5m4VPzIpkFSAcApAOMlD571p++rgIZv1WBP8l39Jm6S78av217Ie8/Xr
	sMlm0vFanIq8IAMIcyoWYoiB9gNJ9SUSHfFl3RyyVaiBuSIGQp74HvSYhlUlvDnt37wuKIUqJwoxr
	l5Mv+DQMh7WR8/UixcO6zuZWubKRp29RjSRrLQows2C3ZS+LRdzJn6W3I7gxAt+0Br6qg4yEiItdc
	QuzPjBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrkgG-0000000CgL7-2nTu;
	Tue, 02 Apr 2024 20:24:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrkgC-0000000CgJ0-1DfJ;
	Tue, 02 Apr 2024 20:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 162F9CE1C8F;
	Tue,  2 Apr 2024 20:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D310C43394;
	Tue,  2 Apr 2024 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712089461;
	bh=ueMPMa7Wa04+ZFktkd2Z6B4anKiLlzjqo1vxs3xrVm0=;
	h=From:To:Cc:Subject:Date:From;
	b=dadBzVxF0eifc7/RW5NahmvsfQtrZYmXy4zPDfmszEjxWMsKn+HiiNHNBUm01JxYu
	 cAxM+B741Lhl7hPPxWl3u/sI+tm9UXIS808eD7ogPzIpmCMuI7m6ZkMz1U1t5t1030
	 nXjPGxq0r+s6QZUG0EQAFe8MRl5RSqsAxgaYpr+GD8RapWqws1PCcAJeJew7Qhar2O
	 +pLmMbwruGXhTXSkUANq5LkOgi6Dz8VYHt8UPQjB/lm7biLyDG367t6UUCHMNE4qY6
	 cUygLGS3GSHTXts0wQMfCSxRPVzoGiGp9fmzYbEeap1SI+VFMPlkxIVILjnHUgT6Cp
	 RxB9QkE6O4fjQ==
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: syscon: Add missing simple syscon compatibles
Date: Tue,  2 Apr 2024 15:24:11 -0500
Message-ID: <20240402202413.757283-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_132424_738394_AF43B201 
X-CRM114-Status: GOOD (  13.12  )
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

Add various "simple" syscon compatibles which were undocumented or
still documented with old text bindings.

apm,xgene-csw, apm,xgene-efuse, apm,xgene-mcb, apm,xgene-rb,
fsl,ls1088a-reset, marvell,armada-3700-cpu-misc,
mediatek,mt2712-pctl-a-syscfg, mediatek,mt6397-pctl-pmic-syscfg, and
mediatek,mt8173-pctl-a-syscfg were all undocumented, but are in use
already. Remove the old text binding docs for the others.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../arm/altera/socfpga-sdram-controller.txt   | 12 -------
 .../devicetree/bindings/arm/apm/scu.txt       | 17 ----------
 .../bindings/arm/marvell/armada-37xx.txt      | 32 -------------------
 .../bindings/mfd/brcm,iproc-cdru.txt          | 16 ----------
 .../bindings/mfd/brcm,iproc-mhb.txt           | 18 -----------
 .../devicetree/bindings/mfd/syscon.yaml       | 15 +++++++++
 6 files changed, 15 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/apm/scu.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
deleted file mode 100644
index 77ca635765e1..000000000000
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram-controller.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Altera SOCFPGA SDRAM Controller
-
-Required properties:
-- compatible : Should contain "altr,sdr-ctl" and "syscon".
-  syscon is required by the Altera SOCFPGA SDRAM EDAC.
-- reg : Should contain 1 register range (address and length)
-
-Example:
-	sdr: sdr@ffc25000 {
-		compatible = "altr,sdr-ctl", "syscon";
-		reg = <0xffc25000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/apm/scu.txt b/Documentation/devicetree/bindings/arm/apm/scu.txt
deleted file mode 100644
index b45be06625fd..000000000000
--- a/Documentation/devicetree/bindings/arm/apm/scu.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-APM X-GENE SoC series SCU Registers
-
-This system clock unit contain various register that control block resets,
-clock enable/disables, clock divisors and other deepsleep registers.
-
-Properties:
- - compatible : should contain two values. First value must be:
-		   - "apm,xgene-scu"
-		second value must be always "syscon".
-
- - reg : offset and length of the register set.
-
-Example :
-	scu: system-clk-controller@17000000 {
-		compatible = "apm,xgene-scu","syscon";
-		reg = <0x0 0x17000000 0x0 0x400>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt b/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt
deleted file mode 100644
index 29fa93dad52b..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-37xx.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Power management
-----------------
-
-For power management (particularly DVFS and AVS), the North Bridge
-Power Management component is needed:
-
-Required properties:
-- compatible     : should contain "marvell,armada-3700-nb-pm", "syscon";
-- reg            : the register start and length for the North Bridge
-		    Power Management
-
-Example:
-
-nb_pm: syscon@14000 {
-	compatible = "marvell,armada-3700-nb-pm", "syscon";
-	reg = <0x14000 0x60>;
-}
-
-AVS
----
-
-For AVS an other component is needed:
-
-Required properties:
-- compatible     : should contain "marvell,armada-3700-avs", "syscon";
-- reg            : the register start and length for the AVS
-
-Example:
-avs: avs@11500 {
-	compatible = "marvell,armada-3700-avs", "syscon";
-	reg = <0x11500 0x40>;
-}
diff --git a/Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt b/Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt
deleted file mode 100644
index 82f82e069563..000000000000
--- a/Documentation/devicetree/bindings/mfd/brcm,iproc-cdru.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Broadcom iProc Chip Device Resource Unit (CDRU)
-
-Various Broadcom iProc SoCs have a set of registers that provide various
-chip specific device and resource configurations. This node allows access to
-these CDRU registers via syscon.
-
-Required properties:
-- compatible: should contain:
-		"brcm,sr-cdru", "syscon" for Stingray
-- reg: base address and range of the CDRU registers
-
-Example:
-	cdru: syscon@6641d000 {
-		compatible = "brcm,sr-cdru", "syscon";
-		reg = <0 0x6641d000 0 0x400>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt b/Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt
deleted file mode 100644
index 4421e9771b8a..000000000000
--- a/Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Broadcom iProc Multi Host Bridge (MHB)
-
-Certain Broadcom iProc SoCs have a multi host bridge (MHB) block that controls
-the connection and configuration of 1) internal PCIe serdes; 2) PCIe endpoint
-interface; 3) access to the Nitro (network processing) engine
-
-This node allows access to these MHB registers via syscon.
-
-Required properties:
-- compatible: should contain:
-		"brcm,sr-mhb", "syscon" for Stingray
-- reg: base address and range of the MHB registers
-
-Example:
-	mhb: syscon@60401000 {
-		compatible = "brcm,sr-mhb", "syscon";
-		reg = <0 0x60401000 0 0x38c>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9d55bee155ce..0327e779e327 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -38,11 +38,20 @@ properties:
               - allwinner,sun8i-h3-system-controller
               - allwinner,sun8i-v3s-system-controller
               - allwinner,sun50i-a64-system-controller
+              - altr,sdr-ctl
               - amd,pensando-elba-syscon
+              - apm,xgene-csw
+              - apm,xgene-efuse
+              - apm,xgene-mcb
+              - apm,xgene-rb
+              - apm,xgene-scu
               - brcm,cru-clkset
+              - brcm,sr-cdru
+              - brcm,sr-mhb
               - freecom,fsg-cs2-system-controller
               - fsl,imx93-aonmix-ns-syscfg
               - fsl,imx93-wakeupmix-syscfg
+              - fsl,ls1088a-reset
               - hisilicon,dsa-subctrl
               - hisilicon,hi6220-sramctrl
               - hisilicon,pcie-sas-subctrl
@@ -51,9 +60,15 @@ properties:
               - intel,lgm-syscon
               - loongson,ls1b-syscon
               - loongson,ls1c-syscon
+              - marvell,armada-3700-cpu-misc
+              - marvell,armada-3700-nb-pm
+              - marvell,armada-3700-avs
               - marvell,armada-3700-usb2-host-misc
+              - mediatek,mt2712-pctl-a-syscfg
+              - mediatek,mt6397-pctl-pmic-syscfg
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8173-pctl-a-syscfg
               - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
-- 
2.43.0


