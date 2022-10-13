Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A55DC43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YFLHf9cQWkt5bJMlM5JX66oIpvdxfEiGHYBsSoWnYM=; b=1o7syOeUtZlW+vG5G07EKDerdo
	IP+p9Uz3ZulQ8K9Klf0lbH44dOkTFkBzkHl2pZsT6LQBFM2cdc1vhiOVJmbXqHHtkwJp+6moOuGMC
	Ot3HNu/XCeeILgo6FXqhge+CMaLGnaBRy7UHa06Q5aPHDjnyaaTcQXt89yKO180SdaTOjFmlpORnX
	md5IN3XQkP4qAMIfxBiABSDbzUIEGnY6r8Hpa6DDuoBc2vaaFKiQr1WK5Rpog0toooy0pghxaXuvF
	itFx9t7FPciFYNcGaDyGNYNIa3QZ6uhCOPnR9FWvOG8TG3Io1kK9dWsfLt6p2fl9oRghiSZogId6f
	geJsU+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj046-00CGKU-11; Thu, 13 Oct 2022 15:24:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02S-00CFZj-4M; Thu, 13 Oct 2022 15:22:27 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B4422660236B;
	Thu, 13 Oct 2022 16:22:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674542;
	bh=Q47jzu6AFAqzuRbrbtB0DzD1vaAnfZtqPNh3CnQRK0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X3vVsCOxxpri1Kk51lnYaqJ5Ny2Ppv16aGMzUVCFACJQmR/yIH1UeZFATRZyf4bII
	 OLQ6P5hZhEhvZmqy8bKK/dcjM0OAv+3X155aZxJBl6NmomQXTqMXMm+O8/IwT++DNV
	 nkc5uNQqq535MPugTQS4pdazze5TMnm8eYFgXEDverkgRBCoYZkQVPMMwUeR26hBYd
	 5mT8mZOPOAgfn61itpTXK3ZJv/FtoXcYky90EdgIK6f/bBnvmHjKvBUebWbeNhRivf
	 wsCXZ2jqwyD/DOJCzkVkle66mbQ71cDz499JjeeJ9uLWQ1q0+axMfm9SAvoEQ27bvF
	 azevhRmfcku5A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sam.shih@mediatek.com,
	hanks.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	zhiyong.tao@mediatek.com,
	andrew-sh.cheng@mediatek.com,
	viresh.kumar@linaro.org,
	chunfeng.yun@mediatek.com,
	fparent@baylibre.com,
	mars.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/8] arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
Date: Thu, 13 Oct 2022 17:22:07 +0200
Message-Id: <20221013152212.416661-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082224_392362_B1E4C3D3 
X-CRM114-Status: UNSURE (   8.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rename the fixed-clock oscillators to remove the unit address.

This solves unit_address_vs_reg warnings.

Fixes: 5d4839709c8e ("arm64: dts: mt2712: Add clock controller device nodes")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index e6d7453e56e0..ff6b26cdda81 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -160,70 +160,70 @@ sys_clk: dummyclk {
 		#clock-cells = <0>;
 	};
 
-	clk26m: oscillator@0 {
+	clk26m: oscillator-26m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <26000000>;
 		clock-output-names = "clk26m";
 	};
 
-	clk32k: oscillator@1 {
+	clk32k: oscillator-32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 		clock-output-names = "clk32k";
 	};
 
-	clkfpc: oscillator@2 {
+	clkfpc: oscillator-50m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <50000000>;
 		clock-output-names = "clkfpc";
 	};
 
-	clkaud_ext_i_0: oscillator@3 {
+	clkaud_ext_i_0: oscillator-aud0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <6500000>;
 		clock-output-names = "clkaud_ext_i_0";
 	};
 
-	clkaud_ext_i_1: oscillator@4 {
+	clkaud_ext_i_1: oscillator-aud1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <196608000>;
 		clock-output-names = "clkaud_ext_i_1";
 	};
 
-	clkaud_ext_i_2: oscillator@5 {
+	clkaud_ext_i_2: oscillator-aud2 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <180633600>;
 		clock-output-names = "clkaud_ext_i_2";
 	};
 
-	clki2si0_mck_i: oscillator@6 {
+	clki2si0_mck_i: oscillator-i2s0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <30000000>;
 		clock-output-names = "clki2si0_mck_i";
 	};
 
-	clki2si1_mck_i: oscillator@7 {
+	clki2si1_mck_i: oscillator-i2s1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <30000000>;
 		clock-output-names = "clki2si1_mck_i";
 	};
 
-	clki2si2_mck_i: oscillator@8 {
+	clki2si2_mck_i: oscillator-i2s2 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <30000000>;
 		clock-output-names = "clki2si2_mck_i";
 	};
 
-	clktdmin_mclk_i: oscillator@9 {
+	clktdmin_mclk_i: oscillator-mclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <30000000>;
-- 
2.37.2


