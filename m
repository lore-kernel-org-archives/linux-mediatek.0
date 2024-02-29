Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED4DC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQJeM6ag5khHewHjTbwo7xXqRvGtr+MUgx08yMgvTmM=; b=ckil+bYSEmF1Y2hm/oMUUsXU/J
	kpJqJ+oUpesOGpP3CSZOdEPFe9YAsV2EDmebNc8VqsCqoABU7fl5JVdljtMBcJPk0Ha3yRDc7f3W5
	YJrOHqELBateCfWCrEjFCLWahUwvzal6gN54iXQWJIcX5YCiyJy1lt4n7ZJFWbM/7o5pw/FCw/FS+
	9kwF8q2RXjE1X3DAnlvQMy615uVeuvrGTqbGR2uUT0+J4bQ6AOieA2DhVReMeFavehjzVQ7eZ0pLo
	4ZSxOC2+zkCcfiu2NZrs+Epg5C6D2+qfnhyD+biNrDwuL04eVKEkAsshvNf/f1oInwEAyFCJvAZBf
	Td96M1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnD2-0000000F7gf-3MuU;
	Thu, 29 Feb 2024 20:40:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfnCd-0000000F7U1-46RU;
	Thu, 29 Feb 2024 20:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A228CE0A0D;
	Thu, 29 Feb 2024 20:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C96C43330;
	Thu, 29 Feb 2024 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709239225;
	bh=v72yR9TvJL75rbdEOwqmwC5IEhpmO5X238jNeAFXJaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RogbHVy2ewpx6oYzwsYA7t3aYhUsA36K9G70LPYPI5OfHSnN2HB6Bv/+XuNE9k265
	 7hJNgLGrWN00FCXQTwKpKEgUtktl5ps0+gTYMgvAxMZ17h1nta/YM3LQklzrNT7tQ+
	 ZNBD5oB5bSkuNzDuyp2jzFEZ6k/596pUdO+pQd39mvjRrIc/ZnVi9geQINLJEtrNAa
	 grAlya4gAR1kUweVvCpTlixSdYCsmx1hjFdT61twcErdk9PL3LfALS2T/0ra7LQFPg
	 4IS5+wiUfJndIjAIE4yoSabFgNIsc048nvSsznns/9BE2cChU8aY3on1wQ7b+F5qcr
	 cyicPOUU7icJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chanho Min <chanho.min@lge.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	tsahee@annapurnalabs.com,
	atenart@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	magnus.damm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 19/22] arm64: dts: Fix dtc interrupt_provider warnings
Date: Thu, 29 Feb 2024 15:39:12 -0500
Message-ID: <20240229203933.2861006-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229203933.2861006-1-sashal@kernel.org>
References: <20240229203933.2861006-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.18
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_124028_534487_A941E53D 
X-CRM114-Status: GOOD (  10.82  )
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

From: Rob Herring <robh@kernel.org>

[ Upstream commit 91adecf911e5df78ea3e8f866e69db2c33416a5c ]

The dtc interrupt_provider warning is off by default. Fix all the warnings
so it can be enabled.

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> #
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> #Broadcom
Acked-by: Chanho Min <chanho.min@lge.com>
Link: https://lore.kernel.org/r/20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi           | 1 -
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi           | 1 -
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    | 1 +
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 1 +
 arch/arm64/boot/dts/lg/lg1312.dtsi                  | 1 -
 arch/arm64/boot/dts/lg/lg1313.dtsi                  | 1 -
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi       | 1 -
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts        | 1 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 4 ++++
 9 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
index dccbba6e7f98e..dbf2dce8d1d68 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
@@ -145,7 +145,6 @@ pci@fbc00000 {
 		msix: msix@fbe00000 {
 			compatible = "al,alpine-msix";
 			reg = <0x0 0xfbe00000 0x0 0x100000>;
-			interrupt-controller;
 			msi-controller;
 			al,msi-base-spi = <160>;
 			al,msi-num-spis = <160>;
diff --git a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
index 39481d7fd7d4d..3ea178acdddfe 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
@@ -355,7 +355,6 @@ pcie@fbd00000 {
 		msix: msix@fbe00000 {
 			compatible = "al,alpine-msix";
 			reg = <0x0 0xfbe00000 0x0 0x100000>;
-			interrupt-controller;
 			msi-controller;
 			al,msi-base-spi = <336>;
 			al,msi-num-spis = <959>;
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 9dcd25ec2c041..896d1f33b5b61 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -586,6 +586,7 @@ gpio_g: gpio@660a0000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index f049687d6b96d..d8516ec0dae74 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -450,6 +450,7 @@ gpio_hsls: gpio@d0000 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-ranges = <&pinmux 0 0 16>,
 					<&pinmux 16 71 2>,
diff --git a/arch/arm64/boot/dts/lg/lg1312.dtsi b/arch/arm64/boot/dts/lg/lg1312.dtsi
index 48ec4ebec0a83..b864ffa74ea8b 100644
--- a/arch/arm64/boot/dts/lg/lg1312.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1312.dtsi
@@ -126,7 +126,6 @@ eth0: ethernet@c1b00000 {
 	amba {
 		#address-cells = <2>;
 		#size-cells = <1>;
-		#interrupt-cells = <3>;
 
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
diff --git a/arch/arm64/boot/dts/lg/lg1313.dtsi b/arch/arm64/boot/dts/lg/lg1313.dtsi
index 3869460aa5dcb..996fb39bb50c1 100644
--- a/arch/arm64/boot/dts/lg/lg1313.dtsi
+++ b/arch/arm64/boot/dts/lg/lg1313.dtsi
@@ -126,7 +126,6 @@ eth0: ethernet@c3700000 {
 	amba {
 		#address-cells = <2>;
 		#size-cells = <1>;
-		#interrupt-cells = <3>;
 
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 2c920e22cec2b..7ec7c789d87ef 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -138,7 +138,6 @@ pmu {
 
 			odmi: odmi@300000 {
 				compatible = "marvell,odmi-controller";
-				interrupt-controller;
 				msi-controller;
 				marvell,odmi-frames = <4>;
 				reg = <0x300000 0x4000>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 5d635085fe3fd..9079e48aea23e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -128,6 +128,7 @@ mt6360: pmic@34 {
 		compatible = "mediatek,mt6360";
 		reg = <0x34>;
 		interrupt-controller;
+		#interrupt-cells = <1>;
 		interrupts-extended = <&pio 101 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-names = "IRQB";
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 3885ef3454ff6..50de17e4fb3f2 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -234,6 +234,7 @@ gpio_exp_74: gpio@74 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 
@@ -294,6 +295,7 @@ gpio_exp_75: gpio@75 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio6>;
 		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 	};
@@ -314,6 +316,7 @@ gpio_exp_76: gpio@76 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
 	};
@@ -324,6 +327,7 @@ gpio_exp_77: gpio@77 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 	};
-- 
2.43.0


