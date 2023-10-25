Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB85CC25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5dKFfVhTkYPAF/cZFOjYLr5H4P3cZuNWSNKuF98cCI=; b=xMiP/ofpcEBUEGXDjjkznaZ3gX
	6Kd0GcJZnG1+gr3XAjQcIfIaH81evkZkx044Q426ekZBOe1tsGUY4RLt/PhaOUp3EOi52JsHEHu/a
	n5sHTOIj4Pr5qRKaYD2ksZANZeoVK58jymihozHpu9AKYuVSI+HgODHr031n1XsV4obnsbvEcq68c
	xrussAtWgQQdgX6f9+em4cTAAHQNnc/O4xyo5dmdRg8fIUkq2bk074poTLxRkrDsvNBillYg3zpNe
	WCZwZBMDc+P+fmTCPPsJBHg42RlQBi23QtOmVqMU7PhMewpyYOludG3PrrBQG328Z9pq5Tj0IQ8cD
	YaIDve4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaMV-00Bqps-03;
	Wed, 25 Oct 2023 09:39:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLY-00BqQ8-1G;
	Wed, 25 Oct 2023 09:38:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 057996607352;
	Wed, 25 Oct 2023 10:38:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226719;
	bh=J7xboHYN7HDtc0HAbTcQagqCVN2JYka3vCOT9PGWQZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0bqLgaeVnaZKE9gmupysWUHq5O8gXxPmzBWgcDRMUMdwui/b4/buO/WsjGwHG+xt
	 5WiZOaSh7pO9iZ1yveZ7SaXIEd+iBG76DuQlLfx1t/9YMb0nTD6/XQMPxLU7TBsjZY
	 ILCrbW5EMWJN+7PeDMiN4k+TYWJPAR2WuwYBkvbaqwvvsk1iJxnMkU03cAv2xH/Mdf
	 zLGz++ddJJV+MyIAwKahEFVY1oBB5bwcotN+FM/aH5bao5iraiIpgHp6pCUphkt/x5
	 smmUPRv/Snh0UKDZj65w34fjRX8BPo2gaxeX59SG0i2xHCxwfUf03CeNg8bqoXQTxz
	 s3K5jojJhuxdQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: hsinyi@chromium.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	erin.lo@mediatek.com,
	eddie.huang@mediatek.com,
	pihsun@chromium.org,
	fparent@baylibre.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 8/8] arm64: dts: mediatek: mt8183: Move thermal-zones to the root node
Date: Wed, 25 Oct 2023 11:38:16 +0200
Message-ID: <20231025093816.44327-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
References: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023840_762232_5A395385 
X-CRM114-Status: GOOD (  11.83  )
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

The thermal zones are not a soc bus device: move it to the root
node to solve simple_bus_reg warnings.

Fixes: b325ce39785b ("arm64: dts: mt8183: add thermal zone node")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 242 +++++++++++------------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..976dc968b3ca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1210,127 +1210,6 @@ thermal: thermal@1100b000 {
 			nvmem-cell-names = "calibration-data";
 		};
 
-		thermal_zones: thermal-zones {
-			cpu_thermal: cpu-thermal {
-				polling-delay-passive = <100>;
-				polling-delay = <500>;
-				thermal-sensors = <&thermal 0>;
-				sustainable-power = <5000>;
-
-				trips {
-					threshold: trip-point0 {
-						temperature = <68000>;
-						hysteresis = <2000>;
-						type = "passive";
-					};
-
-					target: trip-point1 {
-						temperature = <80000>;
-						hysteresis = <2000>;
-						type = "passive";
-					};
-
-					cpu_crit: cpu-crit {
-						temperature = <115000>;
-						hysteresis = <2000>;
-						type = "critical";
-					};
-				};
-
-				cooling-maps {
-					map0 {
-						trip = <&target>;
-						cooling-device = <&cpu0
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>,
-								 <&cpu1
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>,
-								 <&cpu2
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>,
-								 <&cpu3
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>;
-						contribution = <3072>;
-					};
-					map1 {
-						trip = <&target>;
-						cooling-device = <&cpu4
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>,
-								 <&cpu5
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>,
-								 <&cpu6
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>,
-								 <&cpu7
-							THERMAL_NO_LIMIT
-							THERMAL_NO_LIMIT>;
-						contribution = <1024>;
-					};
-				};
-			};
-
-			/* The tzts1 ~ tzts6 don't need to polling */
-			/* The tzts1 ~ tzts6 don't need to thermal throttle */
-
-			tzts1: tzts1 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 1>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts2: tzts2 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 2>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts3: tzts3 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 3>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts4: tzts4 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 4>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts5: tzts5 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 5>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tztsABB: tztsABB {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 6>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-		};
-
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -2105,4 +1984,125 @@ larb3: larb@1a002000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_CAM>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <500>;
+			thermal-sensors = <&thermal 0>;
+			sustainable-power = <5000>;
+
+			trips {
+				threshold: trip-point0 {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				target: trip-point1 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit: cpu-crit {
+					temperature = <115000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&cpu0
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+							 <&cpu1
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+							 <&cpu2
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+							 <&cpu3
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>;
+					contribution = <3072>;
+				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&cpu4
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+							 <&cpu5
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+							 <&cpu6
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>,
+							 <&cpu7
+						THERMAL_NO_LIMIT
+						THERMAL_NO_LIMIT>;
+					contribution = <1024>;
+				};
+			};
+		};
+
+		/* The tzts1 ~ tzts6 don't need to polling */
+		/* The tzts1 ~ tzts6 don't need to thermal throttle */
+
+		tzts1: tzts1 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 1>;
+			sustainable-power = <5000>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts2: tzts2 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 2>;
+			sustainable-power = <5000>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts3: tzts3 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 3>;
+			sustainable-power = <5000>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts4: tzts4 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 4>;
+			sustainable-power = <5000>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tzts5: tzts5 {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 5>;
+			sustainable-power = <5000>;
+			trips {};
+			cooling-maps {};
+		};
+
+		tztsABB: tztsABB {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 6>;
+			sustainable-power = <5000>;
+			trips {};
+			cooling-maps {};
+		};
+	};
 };
-- 
2.42.0


