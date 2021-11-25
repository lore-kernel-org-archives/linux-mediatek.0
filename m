Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695B3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaMYIvNBo8+K61SxnUD9tzwOX9VZmOTU+NvGEJ7PBVY=; b=NV8xZHonazv+aF
	FVYzzwQ4UKtcRZUHJpNI9fFdwRy68hRi6QGOs6EjzmsDqUzLqadsB4KN/MsmJpnkIyzllw10mxvRp
	r0wlin4NwLFakU1X5TMliaZ9E+mLtxoci7ETa9tGYMDq9itwmmPczwEJLdAvcGSJCn2ENG6xDG07/
	4geqjEuqCpANdtbLuZboc/SrBqoq9aeyW9Uq6XBmEImYByPFp4H3+ccd/lNLVbtvG+/1DHtYjL6/z
	HIjiUvDEi5s31xpzyfH7hro1+nhmI7M0AUSRW65tIku2insJKnDZwqrWvsuakdiJluupx6vphsPlJ
	nTDW0gADEnzfqStjfcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqCrw-007FQv-5t; Thu, 25 Nov 2021 11:24:48 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqCri-007FOu-Ng; Thu, 25 Nov 2021 11:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qUti78e3jsyzO7x29q3kqbuHe+yUYDFAU5I9L/Tz3As=; b=aKnH1EzIQjbVU717jKyRCHcYkc
 mcHbvOJjCyP/1D+A3NriVQ/K1ws9RM/h54p9QBf1a7AGCxG1Pac5EDUmb/dWJdyvbgvi7wX0leZ8T
 hU+2gODXqIcQQ1nXNYjeh5/MKw7sGtyVSUcs8Q8aTRdlyxoiTFQPIqdmmAdGqrc7n4rE=;
Received: from p54ae9f3f.dip0.t-ipconnect.de ([84.174.159.63]
 helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mqCbW-0002ws-Mq; Thu, 25 Nov 2021 12:07:50 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: john@phrozen.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v4 10/12] ARM: dts: Add PCIe support for Airoha EN7523
Date: Thu, 25 Nov 2021 12:07:36 +0100
Message-Id: <20211125110738.41028-11-nbd@nbd.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211125110738.41028-1-nbd@nbd.name>
References: <20211125110738.41028-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_032434_967953_C5291163 
X-CRM114-Status: GOOD (  12.02  )
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

This uses the MediaTek MT7622 PCIe driver, since the PCIe IP block is nearly
identical to the one in MT7622

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/boot/dts/en7523-evb.dts | 12 +++++++
 arch/arm/boot/dts/en7523.dtsi    | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
index e8e5c034cee7..af1a8dd40a41 100644
--- a/arch/arm/boot/dts/en7523-evb.dts
+++ b/arch/arm/boot/dts/en7523-evb.dts
@@ -25,3 +25,15 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 };
+
+&pcie {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
index eabf3fdb3d52..d9bdb51614b5 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -119,4 +119,64 @@ uart1: serial@1fbf0000 {
 		clock-frequency = <1843200>;
 		status = "okay";
 	};
+
+	pcie: pcie@1a140000 {
+		compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0x1fa91000 0x1000>,
+		      <0x1fa92000 0x1000>;
+		reg-names = "port0", "port1";
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&scu EN7523_CLK_PCIE>,
+			 <&scu EN7523_CLK_PCIE>;
+		clock-names = "sys_ck0", "sys_ck1";
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x20000000  0x20000000  0 0x10000000>;
+		status = "disabled";
+
+		pcie0: pcie@0,0 {
+			device_type = "pci";
+			reg = <0x0000 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			pcie_intc0: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		pcie1: pcie@1,0 {
+			device_type = "pci";
+			reg = <0x0800 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			pcie_intc1: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
 };
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
