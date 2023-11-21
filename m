Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37FFC61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MZURram4+AEa4dg4UWiA48/8EOrUGOb9rBxviQ2z8M=; b=F62n+p4THrkwJbaSM6LV2Ge7l/
	aYh+G65+d0pfw7A65NbzPyGVKfWvXU4A+Wkem2K+798ETOMjiEWTYfHb99P6Cd9sU5wJ+MWf2LEzB
	3cBdVbmXbralvyevNGuvvufbSC6XuD3qykp4xUbICtX8NZLYMJrO760laJdTJYWCB9PC3xrbt/Xx2
	4NtYW6vI11IBmsOsMpdWOL1u6vlErCr7NCekHybB+2VL2QqqoWSHsh+8RYe4h6QwQ6EzGPzGZxjay
	3YOXiABlRfa4FgKIArr1cMG1icU2nvP+eoB73VUasE8D3E5m0V5S3lRGE0SvYEDcL2oZfw6NqXB59
	DoVWWwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMr-00Gd0x-0j;
	Tue, 21 Nov 2023 11:56:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMo-00Gcxx-0R;
	Tue, 21 Nov 2023 11:56:35 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C4B566072F6;
	Tue, 21 Nov 2023 11:56:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567792;
	bh=sMWHddCvw/Ujx/UtO/I5fhryZnx4605LdfFnzpLxwHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czeauBKlRlF/wJqxiNf1ks8mQDJ3NbIxGr2qzb3Qbway6mD3g5YCjbOqTMfNRNC6Q
	 s/nyCzzcdYxV9I4+wxsZI2AcmKXeXFVRbyzAk7dQLZNb8NospAVNL6b0fMbYoubxP1
	 /ZOm4QU24baJ537e2079m+8hf9SDfRU5zvy0kS7gOqwDyOEQqCdMjGgy8V5m9QgGSt
	 k9Uv7Kd8NJ+h/4v3L5hJb8l45O7L7SNfvGXTnhela5u6wUcAFab2T7nOTAZ+YWrPTo
	 8P0UILhY0R6/GMfZ7uNO2/9lqrFfJeMXcKf9OyJ8aIOW05QbTH+lpN6YE1cY++wHIJ
	 VloguQ+1N5K+w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 01/20] arm64: dts: mediatek: mt8183: Change iospaces for thermal and svs
Date: Tue, 21 Nov 2023 12:56:05 +0100
Message-ID: <20231121115624.56855-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035634_306766_60EFD3C8 
X-CRM114-Status: GOOD (  10.42  )
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

The SVS iospace starts at 0x1100bc00 and not at 0x1100b000 as the
latter is the thermal sensor iospace instead.

Change the iospaces for both as following:
 - Thermal: 0x1100b000, length 0xc00
 - SVS: 0x1100bc00, length 0x400

Please note that while this would be a breaking change for SVS (but
not for thermal sensors), it doesn't matter because the svs driver
never worked anyway because of the missing trips in tzts2, causing
that thermal zone to never actually register, hence the SVS driver
to fail probing anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..13c3104bc67b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1183,22 +1183,10 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
-		svs: svs@1100b000 {
-			compatible = "mediatek,mt8183-svs";
-			reg = <0 0x1100b000 0 0x1000>;
-			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&infracfg CLK_INFRA_THERM>;
-			clock-names = "main";
-			nvmem-cells = <&svs_calibration>,
-				      <&thermal_calibration>;
-			nvmem-cell-names = "svs-calibration-data",
-					   "t-calibration-data";
-		};
-
 		thermal: thermal@1100b000 {
 			#thermal-sensor-cells = <1>;
 			compatible = "mediatek,mt8183-thermal";
-			reg = <0 0x1100b000 0 0x1000>;
+			reg = <0 0x1100b000 0 0xc00>;
 			clocks = <&infracfg CLK_INFRA_THERM>,
 				 <&infracfg CLK_INFRA_AUXADC>;
 			clock-names = "therm", "auxadc";
@@ -1210,6 +1198,18 @@ thermal: thermal@1100b000 {
 			nvmem-cell-names = "calibration-data";
 		};
 
+		svs: svs@1100bc00 {
+			compatible = "mediatek,mt8183-svs";
+			reg = <0 0x1100bc00 0 0x400>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>,
+				      <&thermal_calibration>;
+			nvmem-cell-names = "svs-calibration-data",
+					   "t-calibration-data";
+		};
+
 		thermal_zones: thermal-zones {
 			cpu_thermal: cpu-thermal {
 				polling-delay-passive = <100>;
-- 
2.42.0


