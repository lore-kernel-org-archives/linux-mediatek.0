Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555E6C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCCv169W4C+mtD/jJqQ1bwLpnI9d/COT2hkaU8n69jQ=; b=1/dgyTca+XDRQ9Yv0vhnyjwIpn
	ixU/RweyA57TVyS/s2C01HtytBsNnrq7MbyUqsZUFrQGb8eP0oXPYFLOqAoSCVhGULocJVS9eZXAt
	4EFqO/gu4iiUJzTBU/Ua5hcYWyAPVd7OX+9dhLqohe+rsauUgH8hH4Sgvvz5E5t6XB9/6jqhBbV9y
	cgFB5JVIU1dFcDMBG+8hPoO84tg4uik5Y7NXjlqdZSYlRzDNDll3Ud2dcKwZFU6qSgyJHA7rFrw6d
	Lqo9XVyp1LDdq1gXPFbfDyn4nSjIzmlI79PTKw/x5ghAd7WJrdnPsCiunLRtErN8Ky3LWJfH65xke
	iwFkjJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W4U-008PIq-Ts; Tue, 06 Dec 2022 11:25:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2W35-008Nwu-F1; Tue, 06 Dec 2022 11:23:46 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D3196602ADA;
	Tue,  6 Dec 2022 11:23:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670325817;
	bh=lO17/VleyNXgn9N/3LZMvXR6w59EZEPe9elRRz8H1Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdcQBBpB7uwn4qOnYraSkpv3u0Rp+4xUnwnIUbUKeHhu7LssAJ5DJCM/iTCIm2Hz9
	 7/6YVhx+kJQbpI0Yd18SBhBOWmXav4RkIJPS6ohsQBNnLOYAoa2xtX5c+bA66tWeNb
	 7Q5mmtcKcYgbo5PihT7jMI3IapID34FEGhRX+6AxEQs/k5OnwFoKwnLJlLGTFLJhot
	 pzyFZaVbO7tC/nrluuNezvh25jai0uXRiKRIF3JyrdnKARTC7z1njEmRSBl3sEbIcr
	 UnQmuFm5cTZ9I8soWXtAP5ngp+V8Mm7zDTyFILMtpXLwY/r7nEar14Jmav80gxNPG+
	 VZayvKqB5NSSw==
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
Subject: [PATCH 2/5] arm64: dts: mt8192: Add complete CPU caches information
Date: Tue,  6 Dec 2022 12:23:27 +0100
Message-Id: <20221206112330.78431-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
References: <20221206112330.78431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_032343_859186_91B6088C 
X-CRM114-Status: UNSURE (   6.55  )
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
 - 4x Cortex A76: 64KB I-cache and 64KB D-cache, 4-way set associative,
                  per-cpu 256KB L2 cache, 8-way set associative;
Moreover, the two clusters are sharing a DSU L3 cache with size 2MB,
16-way set associative.

With that in mind, add the appropriate properties needed to specify the
caches information for this SoC, which will now be correctly exported
to sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 424fc89cc6f7..3b5d49bf174d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -54,6 +54,12 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -65,6 +71,12 @@ cpu1: cpu@100 {
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -76,6 +88,12 @@ cpu2: cpu@200 {
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -87,6 +105,12 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
 			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			i-cache-size = <32768>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <128>;
+			d-cache-size = <32768>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
 		};
@@ -98,6 +122,12 @@ cpu4: cpu@400 {
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -109,6 +139,12 @@ cpu5: cpu@500 {
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -120,6 +156,12 @@ cpu6: cpu@600 {
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -131,6 +173,12 @@ cpu7: cpu@700 {
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
 			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			i-cache-size = <65536>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 		};
@@ -170,18 +218,28 @@ core3 {
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
 
 		idle-states {
-- 
2.38.1


