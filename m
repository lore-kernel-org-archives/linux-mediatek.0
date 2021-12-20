Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 21:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTQLIn+TE8UFMPodCSFO2S43ACJb0blzH9Ui4Jqk3/I=; b=OH7oK7GDshywo1
	aJu9S+Ywzg1Wuo3vbGKfb6zq+4qlRuRBG7PExql02rAO16qBNh16+KHJ4Xd6dXIkT7deBGJuYv5Hw
	prhlF9OQ72Q86h1CyRS99PoxKjsxnW1E66YglQZUCPQvGO0PRyIBLZDbdDWug9j6z/AnUiITJa9sf
	R6PKm+AcKbuE31lGhcLeLYRnENLu7TQ2gfkYo5JLSPPkEgJLxYkf2h01QnhfnVW7ExLltQD7eSb9i
	bxnWWbU7i2IzYNc48l58dYlrA00IXBJOUuW9wf/1H7LQxzpA6rqAPDs8qmcgHwvCxdoEBTQn35kue
	RhvLcUm67dk1JsvqJVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzQ9k-004Rz5-2W; Mon, 20 Dec 2021 21:25:16 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzQ9H-004RnB-5A; Mon, 20 Dec 2021 21:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EJlxClv7lGaks+7g6MaGFpuicispAFvSlSbDezAHD8s=; b=NZnOa0UGI2TpJvBlC0CUXinolD
 VHXHi0uN7D7NebuQwaeFparboK76Fk29RbH1b9PTGn2P//uF9Y19+ce5/MRMt96GRmNti/895I9yv
 Xd2bGsRpS1U8HIa75P9Z/J3nsdO3Ou67XPfHgVXScnI0OCZe9RkpIeqklDQPao2BFUV8=;
Received: from p54ae911a.dip0.t-ipconnect.de ([84.174.145.26]
 helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mzQ3s-0000zo-1g; Mon, 20 Dec 2021 22:19:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: john@phrozen.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v8 11/14] ARM: dts: Add PCIe support for Airoha EN7523
Date: Mon, 20 Dec 2021 22:18:51 +0100
Message-Id: <20211220211854.89452-12-nbd@nbd.name>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220211854.89452-1-nbd@nbd.name>
References: <20211220211854.89452-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_132447_382902_95AE36D2 
X-CRM114-Status: GOOD (  11.39  )
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
 arch/arm/boot/dts/en7523-evb.dts |  8 +++++
 arch/arm/boot/dts/en7523.dtsi    | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
index 69754ef9a628..0a79f5f6c311 100644
--- a/arch/arm/boot/dts/en7523-evb.dts
+++ b/arch/arm/boot/dts/en7523-evb.dts
@@ -25,3 +25,11 @@ memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
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
index 0148958c607b..862da104d6f2 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -119,4 +119,64 @@ uart1: serial@1fbf0000 {
 		clock-frequency = <1843200>;
 		status = "okay";
 	};
+
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
+
 };
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
