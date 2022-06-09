Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62095C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMDqAc7eJDeoVZXCUZlDfsGSG/mhQvG65FR8JAM6gPs=; b=QdTZtM9vcx3Kzk
	TE/6Adj6jk17PjiPiAlDnTS6kgFzCLt132aTQgGhsjCZGFGmtVAM/FRpa2bcZygM1R29dWbxhZ+My
	pLrCDkirpIpgV4VaLXcHlsSd3ENRfb8/fNrZMxZ6xyX/qqC3sxt+zJdTQOKkVFrpSefgci9TSpv3B
	HwsmJL1IU9R+WkeZ7zMmtL3zrYAXDKJbzxnfty7cupNDsohAim9AXet24qEuIlcKXa+dpy7MfsiaW
	if0dnkBA/EixJRZ2lQ6Y+mdrVdZx8vc9LCL9V4SUAhWq7AP5jnWBmMW7WVZvkQ+EJg/sUZe+5Mkzv
	/YiQDG3OIfmkfD1lFPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGHs-001Hhr-UW; Thu, 09 Jun 2022 11:25:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFv-001GNj-6V; Thu, 09 Jun 2022 11:23:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4970E66017DE;
	Thu,  9 Jun 2022 12:23:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773794;
	bh=WuVp9m47oyjyo3D3tPO/1kylTmjfohSx0q+3cGh+06U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CK7dkublgX9MuOdlRyzGs39pkn6s+SI1Nh8TzabermlqKyJysJlCxeYNtsoOIG4JF
	 /eEbhkgnevY5rOUaW8bV82Jzz/5m0MCrKRekJsO3oalSjw7FuueuTyuLRunoB4QxIz
	 hbfMIPJzK5Ff21fOBYSN0yBum462gZVpQpiit3w3woIQQJFR0k+Lr+aX4N2ICJ8RLz
	 r7Dhh/Op6ClLT4VBF55pyqHeTaqE0U3Y3zd7JKSMTEGT5SJeCU0ThWSeTsD0XZ51aS
	 x9sqv82SycC9TVFn3cEHlJFtJLY7hkXeyBavbaIjMVNQ6jDpOZHinA+bVkpxQcISol
	 SCdJJ0zF4R1sg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 06/10] arm64: dts: mediatek: mt6795: Remove incorrect fixed-clocks
Date: Thu,  9 Jun 2022 13:22:59 +0200
Message-Id: <20220609112303.117928-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042315_385222_D4B426CD 
X-CRM114-Status: GOOD (  10.24  )
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

Remove the RTC and UART fixed clocks, as these were introduced to
temporarily provide a dummy clock to devices: since the two 26M/32K
fixed oscillators clocks (which do really exist in the SoC) have
been added, there's no reason to keep the aforementioned (and now
redundant) dummies in this devicetree.

In order to remove the uart dummy clock, it was necessary to also
reassign the clock of all UART nodes to clk26m.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 7123c1bf8d9e..b6f7681cc151 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -162,18 +162,6 @@ system_clk: dummy13m {
 		#clock-cells = <0>;
 	};
 
-	rtc_clk: dummy32k {
-		compatible = "fixed-clock";
-		clock-frequency = <32000>;
-		#clock-cells = <0>;
-	};
-
-	uart_clk: dummy26m {
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-		#clock-cells = <0>;
-	};
-
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_LOW>,
@@ -235,7 +223,7 @@ uart0: serial@11002000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 
@@ -244,7 +232,7 @@ uart1: serial@11003000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 
@@ -253,7 +241,7 @@ uart2: serial@11004000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 
@@ -262,7 +250,7 @@ uart3: serial@11005000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11005000 0 0x400>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 	};
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
