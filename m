Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D07C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag+rb7nU3/EWnD+Y0KIIgs/mvUQKsK0PkG7AVRJJrVw=; b=Lera+ra+JGMPyVaJuXmeHOX/+x
	pbk98VRE+joN0vH8ZQAPpiiZpzfnRPXk55rlXVzjcvlB/TVJMwgM3qG5tO+AnyMhcjYabQUaN4iu7
	m5vl23KyKX9hvVwmgD5tXeLJZVYNv96dHvAV2DRrjHw5tZyp8vVhWZ+NhwIQynQtSVYwhHQ32rpjn
	inbzVE7knDshThdzA5B9X+BWft19QXnAamtbl4kWyyi/Mx3L1k72GsixzNZfTDxwzhGjGPQE1LyWQ
	9KVQYjDXWGhJ30F3+qjMqStMohN2foqQOUU1yykCDWvU3LgdgMgaKHtK5nVPTfisd+jh2vaB3CHZZ
	t1OF9AwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W4y-008Pll-5x; Tue, 06 Dec 2022 11:25:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W35-008NxV-F0; Tue, 06 Dec 2022 11:23:47 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A29CC6602B45;
	Tue,  6 Dec 2022 11:23:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670325819;
	bh=48tAHSkcotWDq/1mQynydodHHleYUjhYYLh9z9vaE/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VaH+ZWmLuTxCHfUaiGpfXsx9FVHf6bZKLYW4CxEs8l8GL8ZZcYJn/A3nHVgfdQ7Dh
	 vtjQWKDIdwcsVa+XnxXZcmaTRx6Y7YPcDPwBBP207xHNC+4ko0ZXClaHM+b9TbbF1+
	 K6FyIoLCGy/l1VZsL720JVFt3MWYuCV7oGdw+7+t/2bE6RRnJJ3L50QBuUV8ivMbhM
	 vHdrU3I3tIFU0oGXhftzsaIatOaURlEmPkSwwep+XZyO4yVl6cfbVzEfCU0urUSBiJ
	 CdgqhBkTTgBc1JTDs0k3QdjFfmVQF2x5V6BRCome2efPoeRKFh5reHEhYnhw2Yb28/
	 3wxepD4OolmEA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/5] arm64: dts: mt8183: Add complete CPU caches information
Date: Tue,  6 Dec 2022 12:23:29 +0100
Message-Id: <20221206112330.78431-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
References: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_032343_880038_FD623B45 
X-CRM114-Status: UNSURE (   6.72  )
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

This SoC features two clusters composed of:
 - 4x Cortex A53: 32KB I-cache, 2-way set associative,
                  32KB D-cache, 4-way set associative,
                  unified 1MB L2 cache, 16-way set associative;
 - 4x Cortex A73: 64KB I-cache and 64KB D-cache, 4-way set associative,
                  unified 1MB L2 cache, 16-way set associative;

With that in mind, add the appropriate properties needed to specify the
caches information for this SoC, which will now be correctly exported
to sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 74 ++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index a70b669c49ba..12f61cd20da5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -336,6 +336,13 @@ cpu0: cpu@0 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -352,6 +359,13 @@ cpu1: cpu@1 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -368,6 +382,13 @@ cpu2: cpu@2 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -384,6 +405,13 @@ cpu3: cpu@3 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -400,6 +428,13 @@ cpu4: cpu@100 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -416,6 +451,13 @@ cpu5: cpu@101 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -432,6 +474,13 @@ cpu6: cpu@102 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -448,6 +497,13 @@ cpu7: cpu@103 {
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 			mediatek,cci = <&cci>;
 		};
@@ -481,6 +537,24 @@ CLUSTER_SLEEP1: cluster-sleep-1 {
 				min-residency-us = <1300>;
 			};
 		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-unified;
+		};
 	};
 
 	gpu_opp_table: opp-table-0 {
-- 
2.38.1


