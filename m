Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E22C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrQHbQcokOcatyWwpm/XSQD6kmg4zwfxr0Dh4OQ013s=; b=vmNKN1m5jyXHvNkScGfKAnG7rx
	UWoQ9E3EksxkbtDbkHyT7vzyQ0F481Lp6npSKgSqwfdwmUNsXjQjUOMxKdzO+7HkopWju8zqxyQ7N
	YaJBk/2k/m16qLFZZdmZzU9g4w6GA/zu5G8CUFuPr8RL74QGeB6fhT+5usneqylzFekbR3raO5fE0
	noMAUTBxdAfjPwSkRuNvbyoXtQkab8yj5bkQ4K7PeXX4hoCLxmuBfKVO4f1UoUIv1TdAG5fuvfHnk
	hskrp//MYrpkAQRlSIg9fVT2UiGZdOCsgY7yXKy8av8h+9xNyIglhDjmU0vNchScED8z9e3Gj6aoc
	P68ippsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02v-00CFmA-Co; Thu, 13 Oct 2022 15:22:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj02S-00CFZa-4N; Thu, 13 Oct 2022 15:22:25 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A3D44660236A;
	Thu, 13 Oct 2022 16:22:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665674541;
	bh=1Hsa+hCs6ujNKDF0QPMj+cm7hvP4DZ+oiE2dgapkeCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9uzIrSVYtl3sc0lo308WxbTghFY6HMyxmml2wdtHPXM7CfuzgUIaaV1dfej+p1E9
	 QQjdZPn3ygu79WPsAVEmN+fLbdDVnTYFJgdjOfl6s55EgOmCIYkY6wcOpZSDQYbB8K
	 L3Vp5D9eMFzLsVTK87zYMhosBF1+4nezr3W79Kaw14yPl1ZiVbG8B/zJ/3BtVYJErO
	 EkSZkBp0/iGIWkkFeDVNbDyzMfjrjmIorejmTplHDBZXIsd1YM7EfK2z2k47AuR1hf
	 cXxC7tGHNM7bqU+EQLNtdEm6J5Rc4D5xJ17UyD4p7cdpAbZFY3YnyO4vsAqCjnc4bY
	 vFPX6E9nz15zQ==
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
Subject: [PATCH 2/8] arm64: dts: mt6779: Fix devicetree build warnings
Date: Thu, 13 Oct 2022 17:22:06 +0200
Message-Id: <20221013152212.416661-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_082224_375456_FCBCFDCB 
X-CRM114-Status: GOOD (  10.07  )
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

Rename fixed-clock oscillators to oscillator-26m and oscillator-32k
and remove the unit address to fix the unit_address_vs_reg warning;
fix the unit address for interrupt and intpol controllers by
removing a leading zero in their unit address.

This commit fixes the following warnings:

(unit_address_vs_reg): /oscillator@0: node has a unit name, but
no reg or ranges property
(unit_address_vs_reg): /oscillator@1: node has a unit name, but
no reg or ranges property
(simple_bus_reg): /soc/interrupt-controller@0c000000: simple-bus
unit address format error, expected "c000000"
(simple_bus_reg): /soc/intpol-controller@0c53a650: simple-bus
unit address format error, expected "c53a650"

Fixes: 4c7a6260775d ("arm64: dts: add dts nodes for MT6779")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 9bdf5145966c..dde9ce137b4f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -88,14 +88,14 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
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
@@ -117,7 +117,7 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
-		gic: interrupt-controller@0c000000 {
+		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <4>;
 			interrupt-parent = <&gic>;
@@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
 
 		};
 
-		sysirq: intpol-controller@0c53a650 {
+		sysirq: intpol-controller@c53a650 {
 			compatible = "mediatek,mt6779-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
-- 
2.37.2


