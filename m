Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E399C4708E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5ks/xVVW1flxoFIdotaJ/wB5DmYPz5bZmhRLC+QJZg=; b=DwvmIizR7iv/NhAPtYyv7N3eTt
	TqFkOp+JGwWzJeINmCK84jx25m5FU8+XQN9meoF2zE9shY5q4uZS4abB9BehQleqw2AqBQwTMQO9n
	iLhCfKWAUdtCGUqK+sVlRYF0eJdKXXYt+pNCd2ubHlxzNON/uS71Xmua3wvmzqe9RnnEfaAVQfXif
	x0tq94WlWQyqPecB3ZURHkcXZ4A0V4t5mHjBlC+jBMoeEDSha5EsGGDH9Fv9g1rbF1OsX9HAHHtlt
	rsOjYM+otmGQCdC6sxd39SxouUarKOgFDr4Ulpcl/pW0NBageP9bSs+bAFcX8JFIbwv8SEKpEr5By
	hXEv6zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W3r-008Oic-F8; Tue, 06 Dec 2022 11:24:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W35-008NxK-DJ; Tue, 06 Dec 2022 11:23:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F18F36602B11;
	Tue,  6 Dec 2022 11:23:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670325818;
	bh=rlTgEOFncee6fPGxGrdmPJK4iALNYJfpw5aOcS2FPzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iI84tUNJ2OgxuFKyUIzMasbWPp2x5Gvjz71MPz5WLHgrr45NUIS3ZkaYJPU9r9nmn
	 tyvLjCHa52c0d8hIvlGd/aAyUeE7epONddmSG+W201MlMM9sJrlHIQ/4G+wWvBG+yc
	 Dhj+aYvpt1aRuXYXZrV1z+2FHquB2R7O7eDDO4xvtlH0EzvLKtT/0+ePpShU4MPNi6
	 1V+g68BhgCE7uGuG+ueWHd8B7hVHlE6wbaazQ3BoL5NMI+S9gB4x0XqjiyuhgmYjI6
	 TgcFVHcJL89VE2I7qWRPU0DXg/BTDRUHuPwiz9UhfYoiglXrmuZCwtUH942k9m+VUa
	 UoYC7CAvWdaFA==
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
Subject: [PATCH 3/5] arm64: dts: mt8186: Add complete CPU caches information
Date: Tue,  6 Dec 2022 12:23:28 +0100
Message-Id: <20221206112330.78431-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
References: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_032343_792004_E109CF19 
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
 - 6x Cortex A55: 32KB I-cache and 32KB D-cache, 4-way set associative,
                  per-cpu 128KB L2 cache, 4-way set associative;
 - 2x Cortex A76: 64KB I-cache and 64KB D-cache, 4-way set associative,
                  per-cpu 256KB L2 cache, 8-way set associative;
Moreover, the two clusters are sharing a DSU L3 cache with size 1MB,
16-way set associative.

With that in mind, add the appropriate properties needed to specify the
caches information for this SoC, which will now be correctly exported
to sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4a2f7ad3c6f0..c4a80ce3124c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -69,6 +69,12 @@ cpu0: cpu@0 {
 			clock-frequency = <2000000000>;
 			capacity-dmips-mhz = <382>;
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
@@ -81,6 +87,12 @@ cpu1: cpu@100 {
 			clock-frequency = <2000000000>;
 			capacity-dmips-mhz = <382>;
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
@@ -93,6 +105,12 @@ cpu2: cpu@200 {
 			clock-frequency = <2000000000>;
 			capacity-dmips-mhz = <382>;
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
@@ -105,6 +123,12 @@ cpu3: cpu@300 {
 			clock-frequency = <2000000000>;
 			capacity-dmips-mhz = <382>;
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
@@ -117,6 +141,12 @@ cpu4: cpu@400 {
 			clock-frequency = <2000000000>;
 			capacity-dmips-mhz = <382>;
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
@@ -129,6 +159,12 @@ cpu5: cpu@500 {
 			clock-frequency = <2000000000>;
 			capacity-dmips-mhz = <382>;
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
@@ -141,6 +177,12 @@ cpu6: cpu@600 {
 			clock-frequency = <2050000000>;
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
@@ -153,6 +195,12 @@ cpu7: cpu@700 {
 			clock-frequency = <2050000000>;
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
@@ -200,18 +248,28 @@ cluster_off_b: cluster-off-b {
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
+			cache-size = <1048576>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
+			cache-unified;
 		};
 	};
 
-- 
2.38.1


