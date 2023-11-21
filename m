Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503C9C61D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/wsfGTD4qIPzV9aYVLPlzsDTVh1NFbKfRsNkAhi+fc=; b=X53ZKfqptKNVHEp3Mdn7/aHOZT
	eBSlVsGqfnyT7fa62HQqGIOJY8GwgP1wCq3OCA39eeQkVwPuC771Xfoq5yRM+ct0ZVllQkHSIB0nW
	2T91IMlFO42ZK2zX5197kkOYI8EASUZUAFPbCEyGi8hCHTUF8MeAHPYFGKYkTg9rZbGoOA4WLNSVB
	/Tqp6/z35rnRVXhSZEJVjPiAqghkeewUTh250UC8g0zScFh9GW89KVTJZg4GRII9HwLJTQ++ouiuJ
	cMi0BGOHmj2LbbAnEbU33KuLvXi5L1aGJD0579LmVc02Pe6zm8sXSbip0hyHGx3W0hZVuNBpcBZQs
	TBDiUWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QEW-00Gkna-2C;
	Tue, 21 Nov 2023 12:52:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDg-00Gk5B-0o;
	Tue, 21 Nov 2023 12:51:15 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 33FE86607323;
	Tue, 21 Nov 2023 12:51:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571071;
	bh=7Is9gmN9hkuGxy+sJrNkxtzwuNgilsJCxJ9IKhqUks4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U28OlFbjZWTNhHg7n02D3GbangEkkeyjxK6DU74A/EClsB8By4WT4sVVfgxWsgp3u
	 K3PtCRCEyErdirpchxpVdaWmOgv0zH+J0EmCwQuYpLgJcBrke4Mw+D9uhcXDecYtpY
	 mlMLS5/O4qI3dags8d5kyl5Z0epQKWQWukwIUm64L13KO1/KqDGEIXS1VRy6izcmV0
	 oNIkmKGEf3NXQ93+nrzm1qNF9qjKBQFhVvK50btDkoae3Oukd9GwDRNA5DI00Cznj8
	 lACrjJWfQl4wwVAw9ShgaRj+TGGekYNij6Xf72WugNXe4u+0U4vGhjzhVD5VVjVveB
	 raH7B/hYytneQ==
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
Subject: [PATCH v3 19/20] arm64: dts: mediatek: mt8192: Add Smart Voltage Scaling node
Date: Tue, 21 Nov 2023 13:50:43 +0100
Message-ID: <20231121125044.78642-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045112_465123_3D938793 
X-CRM114-Status: UNSURE (   8.34  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 238f6eb25832..6dd32dbfb832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -809,6 +809,18 @@ lvts_ap: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		svs: svs@1100bc00 {
+			compatible = "mediatek,mt8192-svs";
+			reg = <0 0x1100bc00 0 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_e_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg MT8192_INFRA_RST3_THERM_CTRL_PTP_SWRST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
-- 
2.42.0


