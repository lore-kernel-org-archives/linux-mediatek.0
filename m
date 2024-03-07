Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C551C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjxk+G0JXaulLp0Gsjtb2mSL2FrjZisK0OaKlVbjzRk=; b=VtXBNdKjC4BwSt2uTIhmxQjXZK
	jCBTJPm2Pz6FJAlfFIk7XM38wavurFsVD9cMR/SMKblQLZ/Uhr14/Orr4EcJSNuNVVXh/Voi4YvbL
	3mD4BWle1L0FtrPkWgZuU9eKwTZ3tYw99oRsgXuhyqRcsf8x2sU9SxKkc7Vc9/WWY1BbfbW/xeiPY
	1WgZanAvkFWrWvKogWkgkgP1rd+3URZOy3hpLTybFl8DWSIp+rtByTLCSlL6yEFmL2bIRAnjtOFLL
	eAOqpEVxqwE2X3pmw0PYycWblW7Fpy+uQ1pdQCKbwabn6Dpx1m9DusCMynUaQw3ZWyi1kY47ZJvbz
	QFAZj4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCD4-00000004Otg-0uh7;
	Thu, 07 Mar 2024 11:46:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCC4-00000004OAS-2MvU;
	Thu, 07 Mar 2024 11:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Sjxk+G0JXaulLp0Gsjtb2mSL2FrjZisK0OaKlVbjzRk=; b=pyUlg86HmYVOiYTxf4jiTSCVsd
	2mZQzbIRVaxIucgkZlmzri2kJdbrpcg/tFTnhuxvD5FWhRscOZHel/IjLyEvLTFicFAAAGzrXG+ow
	RdOBwKvEP5ILpmDzsjGf2sIhY5h/ZZ5DARUPDHeiFoFDATUmt7aNplwWgI3QDyHPX9RlCtakkjyJn
	RK1ic460e/J3VAL2oXT/+uwEGw+VPk/DA6cJxWdWq6Vc31/yXfv+sH5JopGko/5vRtNdy9ntNi+pi
	cnF0uW/g1gwwlWJ8R9c7DY7ws4tqXjIPCJA/W9j/jEWiPcndkBKyNFSx1wZ2mJDSoENiM14Vq+6as
	FDLtHPmw==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCC0-00000006atC-0Edp;
	Thu, 07 Mar 2024 11:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709811943;
	bh=Jpx8HKm9BGBUo/aktxdkRyrJGYDFjXNdMQ+YMjx31sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzPy4O7FFib+GXCU0T6moiZzufkarJUjBZ3jFGUbwm4ujlC2bT3TRwHng10reERTP
	 c11943Znel7Bq2EtZefNIOcgRLApJuSN4cYoOowyzL7c2tx/mkumivES6PRwejprQi
	 fvzZ+XdMZiQHDPtMDVNisyiwG6x/RAJatnRqkGWiUDs5uV8IspStqJKY0w+4kaq8Fg
	 XWLeSTDpHem6k1Akla2LXE6h6mopVd89NZhUdPJHy7lHqJ0sNKn0CHjZw048fzFu4n
	 K275ateORnFYuF1K9CJktQIpB1FxtT6Gjc2K09NO/hSZYPjnq0jvFK5PO02TfdO0gk
	 xXZKqiSI+IHbw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4A2B37820EA;
	Thu,  7 Mar 2024 11:45:40 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 21/22] arm64: dts: mediatek: mt8195-cherry: Specify sound DAI links and routing
Date: Thu,  7 Mar 2024 12:44:44 +0100
Message-ID: <20240307114445.196981-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_114544_415213_F0346E45 
X-CRM114-Status: UNSURE (   9.40  )
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

The drivers and bindings acquired support for specifying audio hardware
and links in device tree: describe and link the sound related HW of this
machine.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f94c07f8b933..e405e226e449 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -240,6 +240,7 @@ adsp_device_mem: memory@60e80000 {
 	spk_amplifier: rt1019p {
 		compatible = "realtek,rt1019p";
 		label = "rt1019p";
+		#sound-dai-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rt1019p_pins_default>;
 		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
@@ -334,6 +335,7 @@ &disp_pwm0 {
 &dp_tx {
 	status = "okay";
 
+	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&dptx_pin>;
 
@@ -404,6 +406,7 @@ audio_codec: codec@1a {
 		/* Realtek RT5682i or RT5682s, sharing the same configuration */
 		reg = <0x1a>;
 		interrupts-extended = <&pio 89 IRQ_TYPE_EDGE_BOTH>;
+		#sound-dai-cells = <0>;
 		realtek,jd-src = <1>;
 
 		AVDD-supply = <&mt6359_vio18_ldo_reg>;
@@ -1130,6 +1133,48 @@ &sound {
 		"AFE_SOF_DL2", "AFE_SOF_DL3", "AFE_SOF_UL4", "AFE_SOF_UL5";
 	pinctrl-names = "default";
 	pinctrl-0 = <&aud_pins_default>;
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"IN1P", "Headset Mic",
+		"Ext Spk", "Speaker";
+
+	mm-dai-link {
+		link-name = "ETDM1_IN_BE";
+		mediatek,clk-provider = "cpu";
+	};
+
+	hs-playback-dai-link {
+		link-name = "ETDM1_OUT_BE";
+		mediatek,clk-provider = "cpu";
+		codec {
+			sound-dai = <&audio_codec>;
+		};
+	};
+
+	hs-capture-dai-link {
+		link-name = "ETDM2_IN_BE";
+		mediatek,clk-provider = "cpu";
+		codec {
+			sound-dai = <&audio_codec>;
+		};
+	};
+
+	spk-playback-dai-link {
+		link-name = "ETDM2_OUT_BE";
+		mediatek,clk-provider = "cpu";
+		codec {
+			sound-dai = <&spk_amplifier>;
+		};
+	};
+
+	displayport-dai-link {
+		link-name = "DPTX_BE";
+		codec {
+			sound-dai = <&dp_tx>;
+		};
+	};
 };
 
 &spi0 {
-- 
2.44.0


