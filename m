Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D0DC54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5avw0bxbotM0m3N7FJG3wIsNtju2z+YF7knmyauJnvI=; b=uSWl1YOgwBDU5GeQuVwZiX3a/s
	F2IYaTNYg4hksbElRg+cFTMuO/ugzSAKHV0wa7wMxzafHgscpw30/doo3CQgBL7lkdq5fsWmAVKOT
	4hFhjq6Iwmk4GlRBIcQARa9N4/GPLTehKCkRPr+mJWlXaik5PjdGrm0V/7YZdMQ+E6ZL5qeaWxHhL
	HAOX16/+wWv2dDN/ffOR3BaCvOO/ygtOO9MCZAgCtd6GBOGiTuNwm7UkqLSRlqxicY4qeIJ0Aadkr
	ijXDZqYXsjxhgrWHyfBjquceGBN5QoguncCXwVij34q/ukVxwpLZgKRwUjAckcWU5LO/J/MSt+tud
	PHJL9kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rexJz-00000005Lan-3I60;
	Tue, 27 Feb 2024 13:16:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewIb-000000054wG-3KyM;
	Tue, 27 Feb 2024 12:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035864;
	bh=8bxWkdHWjuivwKz8TBybuK02NLszyCe4cZF3c/Vh6Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbZhegny3dX5c5Ge2uf8Vf0e4f5bvOx9G2h0WeuWNKBmlSmVZVJ4pSer12jNuDAgl
	 XLGCdiHd5iIgtvrCebyFu9KAwn93c7avtXOxTOoXDDm+QGKtf78g0Tmr7+qf9YDBTZ
	 WNcMQ5QlycAGFk3qX+VPdvxvOEvaS7GKC1QqBXikVtWwDBnuTi6IHOiqEmzS/qK5A7
	 YZCxu2h1AuTGBMdZrrfTCkrbdQHR2rnwLiJ2dtwrzHd+k0E++sOWc2DqSFjleIt1f+
	 2kWgp4GRvH2dh/X+5niD+4XmJGqYERLi1TyOUQ/oU8s3Y+cAN+g2QMyWYjpbltqeYW
	 gRBO63LnWu6AQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 195D837820EF;
	Tue, 27 Feb 2024 12:11:02 +0000 (UTC)
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
Subject: [PATCH 22/22] arm64: dts: mediatek: mt8186-corsola: Specify sound DAI links and routing
Date: Tue, 27 Feb 2024 13:09:39 +0100
Message-ID: <20240227120939.290143-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041106_445974_3428A7B4 
X-CRM114-Status: GOOD (  10.68  )
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
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 3dea28f1d806..0bdb83c3e560 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -42,7 +42,7 @@ backlight_lcd0: backlight-lcd0 {
 		default-brightness-level = <576>;
 	};
 
-	bt-sco-codec {
+	bt-sco {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <0>;
 	};
@@ -223,12 +223,44 @@ sound: sound {
 		mediatek,adsp = <&adsp>;
 		mediatek,platform = <&afe>;
 
-		playback-codecs {
-			sound-dai = <&it6505dptx>, <&rt1019p>;
+		audio-routing =
+			"Headphone", "HPOL",
+			"Headphone", "HPOR",
+			"IN1P", "Headset Mic",
+			"Speakers", "Speaker",
+			"HDMI1", "TX";
+
+		hs-playback-dai-link {
+			link-name = "I2S0";
+			dai-format = "i2s";
+			mediatek,clk-provider = "cpu";
+			codec {
+				sound-dai = <&rt5682s 0>;
+			};
+		};
+
+		hs-capture-dai-link {
+			link-name = "I2S1";
+			dai-format = "i2s";
+			mediatek,clk-provider = "cpu";
+			codec {
+				sound-dai = <&rt5682s 0>;
+			};
 		};
 
-		headset-codec {
-			sound-dai = <&rt5682s 0>;
+		spk-share-dai-link {
+			link-name = "I2S2";
+			mediatek,clk-provider = "cpu";
+		};
+
+		spk-hdmi-playback-dai-link {
+			link-name = "I2S3";
+			dai-format = "i2s";
+			mediatek,clk-provider = "cpu";
+			/* RT1019P and IT6505 connected to the same I2S line */
+			codec {
+				sound-dai = <&it6505dptx>, <&rt1019p>;
+			};
 		};
 	};
 
-- 
2.44.0


