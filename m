Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DDEC61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nSvjwhp8KEX+f10c8PjMOZ1/nuFqQp7c5iuH1zb1GM=; b=GkFF8JwoIknsgc2TKDxnZ7/7G8
	FM3G7vD/LN6kJKemNTofnCE8S+9Egs7NDxPLnfyv5sq+vLd9r7uVo0Vscp8h1c03IbRFh4R0J+r3C
	auwbYx1arz1HWfGDtLPCVsnn4tcaSLzydn4MafgJdJ4se6Qm1zRWyExSUCZiqbo+AvXFvx3Vvstqs
	BvOFRq3CEehMvdBBkTKT1NX1RjT88hZDcWacJxs6UA/7sFMmDaQEhx9EfiNVK6Cyyj84C/H5JphHW
	5vjYa3J0x+3gzTYXwzt1cRNYKvbY9lTSYUTZDtxbLs7Cgg+gIDwHO/uKC8gNEFcM9SnJgS3Evt46o
	d3gurwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QEZ-00GkqV-0c;
	Tue, 21 Nov 2023 12:52:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDh-00Gk6X-0v;
	Tue, 21 Nov 2023 12:51:16 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3748F6607319;
	Tue, 21 Nov 2023 12:51:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571072;
	bh=6uV/aa1GXqZk9w0ZoiU/aw6OTSIwDj0KZLX0pQNrucc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gTH53GTfmI0yj69H84sNUw/o1GfBc0RPwtqU956LSEUYkdzVdK+rs6Vxzt4jmo5VW
	 gaquzXsQFkH/PivbRg+Ug2iCwrqiIPhi2cE6exT3izeEzH6HpR5CT5xCfMC3t9sL6U
	 9g6pZu2nHjuKUY44UEuOcCoBErJG4TKWf1HFjR9mvM1KBEV93hgEr12hIfuOQdy+vs
	 x5FY4Pj/4SUGn9WPtpt3s3JWy6p8eSOLGDwdu2e9YOCgAptH4gq4h9ULFxdqGA25UZ
	 pcJojGZkWJCltiCsOH+g3EvBx7muBViZzmGvX6KjkacPQ0sBypAaGn3C8H/kFPkGv8
	 Xdcb0wBIOsO/g==
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
Subject: [PATCH v3 20/20] arm64: dts: mediatek: mt8195: Add SVS node and reduce LVTS_AP iospace
Date: Tue, 21 Nov 2023 13:50:44 +0100
Message-ID: <20231121125044.78642-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045113_479256_9344AC16 
X-CRM114-Status: UNSURE (   9.68  )
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

Add the MediaTek SVS node: this will lower the voltage of various
components of the SoC based on chip quality (read from fuses) in
order to save power and generate less heat.
Also, reduce the LVTS_AP iospace to 0xc00, because that's exactly
where SVS starts.
 - LVTS_AP start: 0x1100b000 length: 0xc00
 - SVS start:     0x1100bc00 length: 0x400

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 54c674c45b49..54debd4cf8e6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1115,7 +1115,7 @@ spi0: spi@1100a000 {
 
 		lvts_ap: thermal-sensor@1100b000 {
 			compatible = "mediatek,mt8195-lvts-ap";
-			reg = <0 0x1100b000 0 0x1000>;
+			reg = <0 0x1100b000 0 0xc00>;
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
 			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
@@ -1124,6 +1124,18 @@ lvts_ap: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		svs: svs@1100bc00 {
+			compatible = "mediatek,mt8195-svs";
+			reg = <0 0x1100bc00 0 0x400>;
+			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calib_data &lvts_efuse_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg_ao MT8195_INFRA_RST3_THERM_CTRL_PTP_SWRST>;
+			reset-names = "svs_rst";
+		};
+
 		disp_pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8195-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1682,6 +1694,9 @@ lvts_efuse_data1: lvts1-calib@1bc {
 			lvts_efuse_data2: lvts2-calib@1d0 {
 				reg = <0x1d0 0x38>;
 			};
+			svs_calib_data: svs-calib@580 {
+				reg = <0x580 0x64>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.42.0


