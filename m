Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1073C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4Emk+DZV4iVSdyVssYO2v06rARuSbXjBsgkXkP2558=; b=AFjz4VPoC2+gLYQSRL6AfDFtiG
	aqPP5Em/WWUWCo679fQTSw28RHUnv70ZJHSmNSbSe/YRaDZxd+/5ZDQJHaOe9XW0kc9T6tv8Veqjq
	kepzbhCUhOiqXTHroN9C/bX+bNnZM9En1ncQl5DjZdubqfkvX18Bwv2s2Ik6pdrHta65FUu2KPrFB
	5/Bn7AHD7VD0z0BSDWBxmoqwiVMI0MlrqVDtUa8O1t5gRcu3VH4KNU0JtXLkxS9KmnYFLgjJW4xoW
	9wv1qXNpCmjCe0gBD+BNyGz35tvZKhaz0zfqw8P4OIk80rsymdcSPuNnFN6Jc+wEnU8KkdeC63Dgi
	SQsNt7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W4s-008Pi9-7A; Tue, 06 Dec 2022 11:25:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W35-008NwQ-F3; Tue, 06 Dec 2022 11:23:46 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A13E6602AB7;
	Tue,  6 Dec 2022 11:23:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670325817;
	bh=BVRfMtyMwCW0uJUlIomeaMSMRsqv9hI5Ac5ZtARAL88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D0iDqCNMaVr/fLBzKRLQ2q8AeNqg1INofHA1m2ml76G9DY5GIU+mk7za6818i3ruS
	 V3hVuskVftUjbI8eKKZy6OXUBlW4ZnzjoGvS2lk93lVrvYxw3d8mFj4DN5Y80XjKpp
	 qQyVUcTB7lCoylb/H3TFkKxSsdvmlkVDC4Lzaajo0D6sWJCDB+8EqurFpvUeToCclX
	 lZATARRI5zFy5cJJ6sPGXkmTDOOPhSLjJQyko0e9XzlX1U0o3y7O9eKB+mUqfQpXIb
	 tPacq6AVDVWQ462Oe9FVEcnVFc9ADgc88/Y5jHZ7XlUsmbGEEhewHWRdM1GVEv3GwM
	 kA/oxc5rSgCbg==
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
Subject: [PATCH 1/5] arm64: dts: mt8195: Add complete CPU caches information
Date: Tue,  6 Dec 2022 12:23:26 +0100
Message-Id: <20221206112330.78431-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
References: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_032343_844164_22B40C10 
X-CRM114-Status: UNSURE (   6.63  )
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
 - 4x Cortex A55: 32KB I-cache and 32KB D-cache, 4-way set associative,
                  per-cpu 128KB L2 cache, 4-way set associative;
 - 4x Cortex A78: 64KB I-cache and 64KB D-cache, 4-way set associative,
                  per-cpu 256KB L2 cache, 8-way set associative;
Moreover, the two clusters are sharing a DSU L3 cache with size 2MB,
16-way set associative.

With that in mind, add the appropriate properties needed to specify the
caches information for this SoC, which will now be correctly exported
to sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..539c49324d64 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -39,6 +39,12 @@ cpu0: cpu@0 {
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -52,6 +58,12 @@ cpu1: cpu@100 {
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -65,6 +77,12 @@ cpu2: cpu@200 {
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -78,6 +96,12 @@ cpu3: cpu@300 {
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
 			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -91,6 +115,12 @@ cpu4: cpu@400 {
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -104,6 +134,12 @@ cpu5: cpu@500 {
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -117,6 +153,12 @@ cpu6: cpu@600 {
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -130,6 +172,12 @@ cpu7: cpu@700 {
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -215,18 +263,28 @@ cluster_off_b: cluster-off-b {
 		l2_0: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-size = <131072>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l2_1: l2-cache1 {
 			compatible = "cache";
 			cache-level = <2>;
+			cache-size = <262144>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
 			next-level-cache = <&l3_0>;
 		};
 
 		l3_0: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-unified;
 		};
 	};
 
-- 
2.38.1


