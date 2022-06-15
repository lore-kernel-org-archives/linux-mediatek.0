Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027EAC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 12:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8i+vtaNLvafDy+XvSwBXQvm+ojJpl4/jOdUoqAvYxa4=; b=WXdOHdk+51fo3fmhpqAeweW5VR
	PfGtW6kxfClsM90/NUTcyLAmBJHBIZIwhgbF984K9q3Yqwh0Ns7bMn9pRSMkj//fYQUSM/GhAUzX6
	UFlZsAC1ZU04FjhgP1iNDG2Bfz/YtAkEto2q+gbyZDwuWvXmgI+G/0cSq9aCf6zp4EkSdAr/ae45u
	sqwZlvuhpmG2OxLu9dUeLPQTatQMXngjpvS9PbTjlSNvHqvgfPYEMOrfRe6D65ZQPJJB2nDb2bnB7
	Oeo06u1ASl4+kCCENAgR2oAownZS1Juib3SdjALkPbGAeaRpE5wA5EqJv7uSbF1qE/JyAL6CtoGYQ
	pZCCo5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SXG-00EZWV-Br; Wed, 15 Jun 2022 12:54:14 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SWr-00EZJT-T7; Wed, 15 Jun 2022 12:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8i+vtaNLvafDy+XvSwBXQvm+ojJpl4/jOdUoqAvYxa4=; b=Rbvbx53KggGbeatcidVKM0QKDi
	9DX8IoZd3zGrgJ1Ad9U5GLYqgWKVEJxfXf9pebjcctshMXliepR1hGJtsHcgtEpv5tjJcie0Q67X4
	smc7Z7iiIT0FjPzo7SCg6kDbTGC5h6rMxQFsc9v1Um33jz3Kpe8JkiBCCGR6i5t3WOQQ=;
Received: from p200300daa7110200c95c40f4ac0d06a0.dip0.t-ipconnect.de ([2003:da:a711:200:c95c:40f4:ac0d:6a0] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1o1SWg-0000WR-15; Wed, 15 Jun 2022 14:53:38 +0200
From: Felix Fietkau <nbd@nbd.name>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND v10 3/3] ARM: dts: Add PCIe support for Airoha EN7523
Date: Wed, 15 Jun 2022 14:53:35 +0200
Message-Id: <20220615125335.96089-3-nbd@nbd.name>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615125335.96089-1-nbd@nbd.name>
References: <20220615125335.96089-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_055350_222616_F5C9349A 
X-CRM114-Status: GOOD (  10.88  )
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

This uses the MediaTek MT7622 PCIe driver, since the PCIe IP block is nearly
identical to the one in MT7622

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/boot/dts/en7523-evb.dts |  8 +++++
 arch/arm/boot/dts/en7523.dtsi    | 58 ++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
index a8d8bb0419a0..f23a25cce119 100644
--- a/arch/arm/boot/dts/en7523-evb.dts
+++ b/arch/arm/boot/dts/en7523-evb.dts
@@ -33,3 +33,11 @@ &gpio0 {
 &gpio1 {
 	status = "okay";
 };
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
index 2e705b87b6c1..7f839331a777 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -143,4 +143,62 @@ gpio1: gpio@1fbf0270 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	pcie0: pcie@1fa91000 {
+		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0x1fa91000 0x1000>;
+		reg-names = "port0";
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scu EN7523_CLK_PCIE>;
+		clock-names = "sys_ck0";
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x20000000  0x20000000  0 0x8000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				<0 0 0 2 &pcie_intc0 1>,
+				<0 0 0 3 &pcie_intc0 2>,
+				<0 0 0 4 &pcie_intc0 3>;
+		pcie_intc0: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
+
+	pcie1: pcie@1fa92000 {
+		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0x1fa92000 0x1000>;
+		reg-names = "port1";
+		linux,pci-domain = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scu EN7523_CLK_PCIE>;
+		clock-names = "sys_ck1";
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x28000000  0x28000000  0 0x8000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+				<0 0 0 2 &pcie_intc1 1>,
+				<0 0 0 3 &pcie_intc1 2>,
+				<0 0 0 4 &pcie_intc1 3>;
+		pcie_intc1: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+	};
 };
-- 
2.36.1


