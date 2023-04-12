Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85566C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5eIMVl42dYiIFENxNLdkHR4QOggB7sc3hcd7YstTt4=; b=eFx/wxUyFrJUH6uHUIySEa99rY
	3yuiEIOBQ7+N0UUD9TpxyZ7yVWQpOcO2x+cQAOH/kUasEhP91wKtg8c1s+NVREIVV+inGAMa8JXPT
	c83Q2IrRvht6B71vTRXtNk91TOme66rs3Q8unOCQdnzIVDRuX0yx/ZTxbFvxUQlp+sxlujwcIi/CJ
	WP8yULLladHPAcnRsP9FeyCtA2OJI0gUkJ9LVKEQqn0fiRbYLutiYKc6Cp2LRMl9htt9NsCv7LfdI
	2ml3gzwIeVt1rPArZ40GwwK71xJU/JB5IpwsrI/kAKqjoQFU73xDVYIU6i4yUyQArqWDlDyJmc+H6
	UsQ+q7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYhD-002r5D-1R;
	Wed, 12 Apr 2023 11:31:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYeE-002o6S-09;
	Wed, 12 Apr 2023 11:28:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64757660322F;
	Wed, 12 Apr 2023 12:28:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298900;
	bh=chGWBs1hJYSca6e8u/s/vnv2XlltpEF6hKJyQaXeTLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJ4B67IQhVehxBnCg7vCaAFTsKCrZJaYar7p2G0EvYSGXq1jakB58n2ggE1rfT4vt
	 hYO2Cf8WmSD8AEGL6b1YVqZQ3sMMz8hTZmZIe2aEpM8zSvGSr4ZGcsqv/L2M2Ynhom
	 NQrriGbEhl34aoLlaLPV/jWtjqohLwcLOrG4iAQ9ebZrEG8PlyG+1YTz+GSp2Q3uMK
	 PzqK6niOgIyVFB708Ebl4WyAzSngcTBqZko5cMza84tHuQbSjb8jgqlyZ+lpO7LdyP
	 vMDWInSAvoaVfLb+fEjsGedLN/8o/T1MczFldXGPEIgUw7gmalL++ciEGLQm1HdRCh
	 Og6QWH//MZrDg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 25/27] arm64: dts: mediatek: mt6795-xperia-m5: Add eMMC, MicroSD slot, SDIO
Date: Wed, 12 Apr 2023 13:27:37 +0200
Message-Id: <20230412112739.160376-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042822_360805_1226CC35 
X-CRM114-Status: UNSURE (   8.91  )
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

Configure and enable the MMC0/1/2 controllers, used for the eMMC chip,
MicroSD card slot and SDIO (WiFi) respectively.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index debe0f2553d9..155a573eac4c 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
+		mmc2 = &mmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
 	};
@@ -121,7 +122,97 @@ proximity@48 {
 	};
 };
 
+&mmc0 {
+	/* eMMC controller */
+	mediatek,latch-ck = <0x14>; /* hs400 */
+	mediatek,hs200-cmd-int-delay = <1>;
+	mediatek,hs400-cmd-int-delay = <1>;
+	mediatek,hs400-ds-dly3 = <0x1a>;
+	non-removable;
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	vmmc-supply = <&mt6331_vemc33_reg>;
+	vqmmc-supply = <&mt6331_vio18_reg>;
+	status = "okay";
+};
+
+&mmc1 {
+	/* MicroSD card slot */
+	vmmc-supply = <&mt6331_vmc_reg>;
+	vqmmc-supply = <&mt6331_vmch_reg>;
+	status = "okay";
+};
+
+&mmc2 {
+	/* SDIO WiFi on MMC2 */
+	vmmc-supply = <&mt6331_vmc_reg>;
+	vqmmc-supply = <&mt6331_vmch_reg>;
+	status = "okay";
+};
+
 &pio {
+	mmc0_pins_default: emmc-sdr-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
+	mmc0_pins_uhs: emmc-uhs-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO155__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO156__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO157__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO158__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO159__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO160__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO161__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO162__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO163__FUNC_MSDC0_CLK>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO165__FUNC_MSDC0_RSTB>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-ds {
+			pinmux = <PINMUX_GPIO164__FUNC_MSDC0_DSL>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
 	nfc_pins: nfc-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO3__FUNC_GPIO3>;
-- 
2.40.0


