Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E25C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk29qGGUA7EZ2rLzJCzk1KySKRfv/0Bz4UdRcxP6NDY=; b=PwdSeNgukDVV9W
	5sh+cRcDs9msEYMLcksXIncB7u4FXgIXmGx0E7yVIpCE25G4QjMT8jW+nZW48ies0yYN0INUgNnzg
	1CywKiL3vVa0vTgq/y94oB7xSE+AynLE2oQU3xRbKP8TXzX3su0GA6hZkSMeQUXubsiSVQLUvTZOv
	ZM0ZGrPboZXssCC7kF4VGq0ry9CRsHJQHYLZguvUMCKpwbWUSY+lbz2eFDme0SXgo6ct40zw7V6vk
	mejuNwei1+utJdL3O3uwzw9e9+BRu7iWI6+H6Wt5GgdLUlEE+pVmdItzEkTPU8dZrA5StZjQDAjNU
	IqbYdIWv4aN2GP44Vj8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYvk-00H1zc-GQ; Fri, 13 May 2022 17:18:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYu6-00H0xE-AQ; Fri, 13 May 2022 17:16:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9A82C1F463B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462187;
 bh=xHDizGEAS5CEUxEZaxa3laKX/jFEH45gEkIh0l+Zvvk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=norOKTi32tuUwqGq38L3Hc4rQbrVKvPwvxJ3Nj/2aEw5sd8upvUxOAaR+YWmKI9F3
 nDQr2MUsdwQ1ksgr94q5xytYzl83x9hX2EpZeGZWdTbJZyqTBcdmqPpIqEJVYecyfn
 inVEIsFvYifnB9JyLEl+KF0FmKDrDInSYiycOwl8lllrx23et5EUFJCry+ubx34xkf
 PwA3j7UpPVQo8DIeH/PxUp915eKaJfU8eVC0KKxg3+TXWAKl7Hu++qOmYHeAGuuf7g
 xwRRpCFR6sH2uuC12t92Uh88FOSOmcA8QZFp1MhDJTiRFggczrDajx03dIagDPp7J0
 zLXrReUdCMDeA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/7] arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz
 and 26MHz XOs
Date: Fri, 13 May 2022 19:16:15 +0200
Message-Id: <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101638_563754_A9527B02 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Add the 32kHz and 26MHz oscillators as fixed clocks in devicetree to
provide a good initial clock spec, since this SoC features two always
on oscillators running at the aforementioned frequencies.
While at it, since the UART clock is actually referring to the 26MHz
oscillator, remove it and assign clk26m as "baud" clock for the UARTs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 363fa25b4edc..b6f7681cc151 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -142,21 +142,23 @@ l2_1: l2-cache1 {
 		};
 	};
 
-	system_clk: dummy13m {
+	clk26m: oscillator-26m {
 		compatible = "fixed-clock";
-		clock-frequency = <13000000>;
 		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
 	};
 
-	rtc_clk: dummy32k {
+	clk32k: oscillator-32k {
 		compatible = "fixed-clock";
-		clock-frequency = <32000>;
 		#clock-cells = <0>;
+		clock-frequency = <32000>;
+		clock-output-names = "clk32k";
 	};
 
-	uart_clk: dummy26m {
+	system_clk: dummy13m {
 		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
+		clock-frequency = <13000000>;
 		#clock-cells = <0>;
 	};
 
@@ -221,7 +223,7 @@ uart0: serial@11002000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 
@@ -230,7 +232,7 @@ uart1: serial@11003000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 
@@ -239,7 +241,7 @@ uart2: serial@11004000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			status = "disabled";
 		};
 
@@ -248,7 +250,7 @@ uart3: serial@11005000 {
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
