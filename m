Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77FBC54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHVyTdsvnETOeomO48jUBn2eX2wwAxeyeumDMKU/lXE=; b=mVHMbK42If8MHneQy7Yc+DHzm4
	8io4UpRcNxCJW6USfgcoZ7Lto7KIe+ZBya1zd89xPO9geMqD9jj3ZofbmW6h586+ficbL/RXcRdEc
	BY+WXI0LZeSRnVvfiLGWrGjW+oPUw1r6490feI56fCVxFiMiiRHKQqfDmjiwURpMBJTeXIQCljUGF
	0RHWkPS2RsPies74LWjonHnsyDIFN/ugfl5HFIVPL4U75jSoPkrwTerQqjbbPys/Fm4V/d1bmABVN
	H6t13T+V4TsgRcqag5sab5ygpbVxLt+egqsUM2zaKwl8q8oc7Y4+GMeiTq4Xk89b5/1MYhJU/llOD
	OCuOpGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNXC-0000000A2FV-298m;
	Wed, 13 Mar 2024 12:16:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMNk-00000009mlg-3ikw;
	Wed, 13 Mar 2024 11:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710327767;
	bh=jy17j4GnL9+x3VVzlB6GUuhq0JWZqZM8wbSx/KQK9R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNmKMdd+LL/hqyid/LM+DBI6BeaIV3fWIjMkFTPDYL7nMlx3sLd2xtBHWrHPncIAM
	 7KJyUhvFd8q8E1kVZ+dZezUBIyMDWhQar2zfco1tvLHFwIF2uArh6rwbNONyj5Y5YQ
	 MH+WAqXGQu87Nx4MuK8SkA+GNNTj6WuLBYztaZ8oPLa6grHX4oyuJ+UAodaSsDwwJu
	 WBshp+5yc7kKNwqaW3YBpB3k8n1jLlCo+5bxHj1+qfEn9ixLkIuIvYkIPafGiCZW63
	 O1x+qKJiK8rxPzw+VglDf9Lh/L0X1pOefZzNU4KxDNw+SfYUEAvP/+yc9Rry4GbuVh
	 H3DlDm2g493mQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7363637820C6;
	Wed, 13 Mar 2024 11:02:45 +0000 (UTC)
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
Subject: [PATCH v3 21/22] arm64: dts: mediatek: mt8195-cherry: Specify sound DAI links and routing
Date: Wed, 13 Mar 2024 12:01:46 +0100
Message-ID: <20240313110147.1267793-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_040249_266115_CFDE1D11 
X-CRM114-Status: UNSURE (   9.15  )
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
index eb07cad1991f..86d283ffe807 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -242,6 +242,7 @@ adsp_device_mem: memory@60e80000 {
 	spk_amplifier: rt1019p {
 		compatible = "realtek,rt1019p";
 		label = "rt1019p";
+		#sound-dai-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rt1019p_pins_default>;
 		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
@@ -336,6 +337,7 @@ &disp_pwm0 {
 &dp_tx {
 	status = "okay";
 
+	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&dptx_pin>;
 
@@ -406,6 +408,7 @@ audio_codec: codec@1a {
 		/* Realtek RT5682i or RT5682s, sharing the same configuration */
 		reg = <0x1a>;
 		interrupts-extended = <&pio 89 IRQ_TYPE_EDGE_BOTH>;
+		#sound-dai-cells = <0>;
 		realtek,jd-src = <1>;
 
 		AVDD-supply = <&mt6359_vio18_ldo_reg>;
@@ -1132,6 +1135,48 @@ &sound {
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


