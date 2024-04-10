Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1882ACD1296
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLxbIyTffQXMweX/nw1WgtSEtrAbG5epKEVnoT/DnsI=; b=kUoDy1kQO5fvCVmwoV/UgTXEsH
	fflFGUdGQ4BVmrUygqLKMtFDKbb2xMI979azCdi9+ndYOlCHJU6dkCRQwmgfPptwUV1RfTl1oy2lH
	sqvjNREsfZgilI0zIp2XvJbwZWiz4NYKzFJgvHm0UShUM6s+H40Y66ZbtTt7rDDsHiwYZScVLRpmm
	eUo1ycs2WIBNxUNhhsXGazlQmWYbfO0Gzcz606coRYo/8XQMgs8NABL1WCAsnDsVeed6gZ7vqz7xG
	gV5xqpmyABaL1gKBnYdQ3zap1J6WV6ab2yqW9lUFim2f0j8x/36IOXVzKxfMXKVQpDtnAWqAvPl+u
	Y+JuBD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLi-00000005sBB-0ygc;
	Wed, 10 Apr 2024 08:30:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLT-00000005rzK-0wB6;
	Wed, 10 Apr 2024 08:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712737814;
	bh=b4MLchRiNSL52tqLOyPY8VBf2E7n/dezst1uYn65DhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Te2T5ZgPV2LKbzTtO1oH+ZWGnawgmIKS/5/7aEQPrwB53c/40JzpVJ+gLcD6vHXgq
	 iTZmLGzypNDGZYY98NIiFSlBzs1+cP/119Dd6W6ve7LM3BK4HXv1mnNAJSF7bYTuFr
	 blUjDzwH78OLhW/mUxxv4u919c630QxyROJMmMswD2nghmMT/ELq73VCjxQyaSstkA
	 i00APPQ8HAdllwHsQeOzldtkfIHIsAnuqNnn02KyIp5OB3MjnJVn7gn1CL8o4ife1k
	 lJZ8cWjIaIjJfPBpGZmvHDZtYzipzix1xcRXckJ/gv5H7UWDeYrUez4IOQqZugWwGQ
	 UT1KecdF/7B0w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F22B537820E2;
	Wed, 10 Apr 2024 08:30:12 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com,
	bero@baylibre.com,
	amergnat@baylibre.com,
	nfraprado@collabora.com,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8183: Refactor thermal zones
Date: Wed, 10 Apr 2024 10:30:02 +0200
Message-ID: <20240410083002.1357857-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
References: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_013015_518751_39EDB02A 
X-CRM114-Status: GOOD (  11.11  )
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

The thermal zones in MT8183 had cryptic names and all of them, apart
from the cpu-thermal zone, had no thermal trips, hence those were not
probed at all.

Refactor the tzts1..5 and tztsABB thermal zones to add the correct
thermal trips and give them a meaningful name, corresponding to the
actually monitored thermal zone.
While at it, also rename the thermal sensor node to "thermal-sensor".

Now the thermal zones are probing and their temperatures can be read.

Fixes: b325ce39785b ("arm64: dts: mt8183: add thermal zone node")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 136 +++++++++++++++++------
 1 file changed, 102 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 93dfbf130231..1978156cae76 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1183,7 +1183,7 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
-		thermal: thermal@1100b000 {
+		thermal: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 			compatible = "mediatek,mt8183-thermal";
 			reg = <0 0x1100b000 0 0xc00>;
@@ -2089,61 +2089,129 @@ THERMAL_NO_LIMIT
 			};
 		};
 
-		/* The tzts1 ~ tzts6 don't need to polling */
-		/* The tzts1 ~ tzts6 don't need to thermal throttle */
-
-		tzts1: tzts1 {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+		tzts1: soc-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&thermal 1>;
 			sustainable-power = <5000>;
-			trips {};
-			cooling-maps {};
+			trips {
+				soc_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				soc_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
-		tzts2: tzts2 {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+		tzts2: gpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&thermal 2>;
 			sustainable-power = <5000>;
-			trips {};
-			cooling-maps {};
+
+			trips {
+				gpu_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
-		tzts3: tzts3 {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+		tzts3: md1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&thermal 3>;
 			sustainable-power = <5000>;
-			trips {};
-			cooling-maps {};
+
+			trips {
+				md1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				md1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
-		tzts4: tzts4 {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+		tzts4: cpu-little-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&thermal 4>;
 			sustainable-power = <5000>;
-			trips {};
-			cooling-maps {};
+
+			trips {
+				cpul_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpul_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
-		tzts5: tzts5 {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+		tzts5: cpu-big-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&thermal 5>;
 			sustainable-power = <5000>;
-			trips {};
-			cooling-maps {};
+
+			trips {
+				cpub_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpub_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 
-		tztsABB: tztsABB {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
+		tztsABB: tsabb-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&thermal 6>;
 			sustainable-power = <5000>;
-			trips {};
-			cooling-maps {};
+
+			trips {
+				tsabb_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				tsabb_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
 		};
 	};
 };
-- 
2.44.0


