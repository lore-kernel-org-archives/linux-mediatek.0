Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A53C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4oWCwYFuP6OwbsQXM22bh9hzaCtQ3VsEH730TRt3wo=; b=QkGNUnD/N08Jvdu+dnD+Av9bYZ
	PiF2+ajPAOjar8zR8IuQIRjC/+VtPCtIgjio3Y7N/OYRUg3OC1sdCv53SEyr0sp8fmDM/V9i0wLhn
	T7R6Y/p+7T/q2Cw1aHvrd0X0flUVVfK/m47vKqUk8xyS+61wD2XVENTQf5ra1rDkm45gh9HPHcjA6
	ErVHEiAEN0ZOX9dRpJ6+2aWqCjlmYVjjtmgXBeTYHWzGjzk2DM89Fd+lgir5LvnHLschjIq5FTB4Q
	m2aPGZYLXKGCb7hMl63RdCXlVwVk50VXreY1S0E/q5FF2fCikKJ1sKp2QjvBhdOC+VQygEqbImNx8
	8qq5ZIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ8E-00EnEy-5I; Thu, 22 Sep 2022 10:08:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIpb-00EZ4p-Gc; Thu, 22 Sep 2022 09:49:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5AB706602220;
	Thu, 22 Sep 2022 10:49:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663840156;
	bh=wJr++mgtlB0haCHpsGcU+/sZxX7EhT3lTzKcLP5Sa+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=my13z2QCQ8ScWdhB1vhyZRsI+1ungf5aAE9eQB5FnsrX8JmyqTjOqLlkOqL54P/w9
	 hwMsDnsIGWpQrAJuM/lDuFNGaN53YvjZG4D67yd/2yvbl/GXsUbXOQsYX5NT3faYQR
	 L0wutPj8FEcMVdbNYzfndu3g3rkeMNp0S3ToETcOI+jMGldcUpZB4v5LnkaWas7SgO
	 1PiYEyooESo0x/wz79FHNCKjsfI4a0owXfS0TXPSSCd3XYjA9NZIgNVnFWc8b0n3yj
	 rPOtrHV/Uq9tl6gg9APb0J/yPYI1IRgeEVgOL3avTo9og1zecBxyUG7ZPg411MNDTP
	 XNfwiDB0SWPvg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/4] arm64: dts: mediatek: cherry: Add sound card configuration
Date: Thu, 22 Sep 2022 11:49:08 +0200
Message-Id: <20220922094908.41623-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_024919_905701_CC14DB70 
X-CRM114-Status: UNSURE (   9.74  )
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

Configure the sound card on all MT8195 Cherry Tomato devices to
enable audio support.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  5 +++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  5 +++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  5 +++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 40 +++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 3767b49ea896..2d5e8f371b6d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -15,6 +15,11 @@ &audio_codec {
 	realtek,btndet-delay = <16>;
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+	model = "mt8195_r1019_5682";
+};
+
 &ts_10 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index 0ed83a79d680..2586c32ce6e6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -35,6 +35,11 @@ pins-low-power-pcie0-disable {
 	};
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+	model = "mt8195_r1019_5682";
+};
+
 &ts_10 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
index c47b341e98fb..f54f9477b99d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -36,6 +36,11 @@ pins-low-power-pcie0-disable {
 	};
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+	model = "m8195_r1019_5682s";
+};
+
 &ts_10 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 95e93b791432..3410e16d7e99 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -526,6 +526,34 @@ &pio {
 		"AP_SPI_FLASH_MOSI",
 		"AP_SPI_FLASH_MISO";
 
+	aud_pins_default: audio-default-pins {
+		pins-cmd-dat {
+		    pinmux = <PINMUX_GPIO69__FUNC_AUD_CLK_MOSI>,
+			     <PINMUX_GPIO70__FUNC_AUD_SYNC_MOSI>,
+			     <PINMUX_GPIO71__FUNC_AUD_DAT_MOSI0>,
+			     <PINMUX_GPIO72__FUNC_AUD_DAT_MOSI1>,
+			     <PINMUX_GPIO73__FUNC_AUD_DAT_MISO0>,
+			     <PINMUX_GPIO74__FUNC_AUD_DAT_MISO1>,
+			     <PINMUX_GPIO75__FUNC_AUD_DAT_MISO2>,
+			     <PINMUX_GPIO0__FUNC_TDMIN_MCK>,
+			     <PINMUX_GPIO1__FUNC_TDMIN_DI>,
+			     <PINMUX_GPIO2__FUNC_TDMIN_LRCK>,
+			     <PINMUX_GPIO3__FUNC_TDMIN_BCK>,
+			     <PINMUX_GPIO60__FUNC_I2SO2_D0>,
+			     <PINMUX_GPIO49__FUNC_I2SIN_D0>,
+			     <PINMUX_GPIO50__FUNC_I2SO1_MCK>,
+			     <PINMUX_GPIO51__FUNC_I2SO1_BCK>,
+			     <PINMUX_GPIO52__FUNC_I2SO1_WS>,
+			     <PINMUX_GPIO53__FUNC_I2SO1_D0>;
+		};
+
+		pins-hp-jack-int-odl {
+			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
 	cr50_int: cr50-irq-default-pins {
 		pins-gsc-ap-int-odl {
 			pinmux = <PINMUX_GPIO88__FUNC_GPIO88>;
@@ -833,6 +861,18 @@ cros-ec-rpmsg {
 	};
 };
 
+&sound {
+	status = "okay";
+
+	mediatek,adsp = <&adsp>;
+	mediatek,dai-link =
+		"DL10_FE", "DPTX_BE", "ETDM1_IN_BE", "ETDM2_IN_BE",
+		"ETDM1_OUT_BE", "ETDM2_OUT_BE","UL_SRC1_BE",
+		"AFE_SOF_DL2", "AFE_SOF_DL3", "AFE_SOF_UL4", "AFE_SOF_UL5";
+	pinctrl-names = "default";
+	pinctrl-0 = <&aud_pins_default>;
+};
+
 &spi0 {
 	status = "okay";
 
-- 
2.37.2


