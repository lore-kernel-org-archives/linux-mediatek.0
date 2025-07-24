Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDA2C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hb/PS4A6kfMopl+mdbd23xmL9rp2HKKNPOjKItiR7Vk=; b=Rt6tjXiDcqog6p
	XALik1IrJVWbadqDTiI5m0ODQGLuzXlHh3JgiuqmETfQVe1WzUQWZm/Xw6Meh7X6V6OJo8YLsDjfo
	hv8s+cV3ge5gRZnV/FNUfFVVkscKdjtrRKK6rAYibEpzKED8GoPjwIsIHQWIZc15bCP3eZpaU9Vv5
	l7jnj8ePreljwN4EmpJF5V9GdNJieJMsE+z9A1L5J7Qld2wmintdrvB0rvjbeA8BkhHLq1qPwOIVU
	rsb/hTFxCHmqDub8lhewPrBMZOkir8d/CrgahCRgPIsKuWL6yn1dDBKotFkpu+ZPBV668foY1r4hp
	FYNtSRPJs/iK4RL4dv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesbH-000000077ML-2Iqv;
	Thu, 24 Jul 2025 09:50:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVO-00000006u1a-10b0;
	Thu, 24 Jul 2025 08:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346444;
	bh=gK1J/nmFCA5iQ9wSL8DiDVmGg7vxkIBM8ZUzDwIVnuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUB6PfHldk1/DqKfzI6izO+niovtYwIkMrvgcmL1OQwo6Tm09al+7ptOWNzR79Av8
	 Jnelok5aFfAfnGxE3nJMexloNhycRwsPCeXNcVLo0/lNKs1R3R9vvbrVkZK8lCaurF
	 ATEs2O4H3KD8kaFftSzEVKYvXIix3mnqQL0Y+3MI1qpgR6F1LogcB5uuLpCYo/PYlL
	 4vMZ8i8aJqQVCwEnXAauhI/H7XWBdnVsRk/iCMzfQEeqUgXFJsIzaqvHKvdD4LDrlO
	 GxRvOwR2QK7oBibfE2eUAJ1IoZ+fBv5qGBCvU+PcmPiTTpTav8IG67ZMKtM/nr1OAr
	 FRHFFDMLhwi3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 723B117E11FE;
	Thu, 24 Jul 2025 10:40:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl node names
Date: Thu, 24 Jul 2025 10:39:06 +0200
Message-ID: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014046_434090_75CCFD9B 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the pinctrl node names to adhere to the bindings, as the main
pin node is supposed to be named like "uart0-pins" and the pinmux
node named like "pins-bus".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a356db5fcc5f..805fb82138a8 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -198,8 +198,8 @@ &usb_phy {
 };
 
 &pio {
-	gpio_keys_default: gpiodefault {
-		pins_cmd_dat {
+	gpio_keys_default: gpio-keys-pins {
+		pins-cmd-dat {
 			pinmux = <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
 				 <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
 			bias-pull-up;
@@ -207,7 +207,7 @@ pins_cmd_dat {
 		};
 	};
 
-	i2c0_pins_a: i2c0 {
+	i2c0_pins_a: i2c0-pins {
 		pins1 {
 			pinmux = <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
 				 <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
@@ -215,7 +215,7 @@ pins1 {
 		};
 	};
 
-	i2c2_pins_a: i2c2 {
+	i2c2_pins_a: i2c2-pins {
 		pins1 {
 			pinmux = <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
 				 <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
@@ -223,21 +223,21 @@ pins1 {
 		};
 	};
 
-	tca6416_pins: pinmux_tca6416_pins {
-		gpio_mux_rst_n_pin {
+	tca6416_pins: tca6416-pins {
+		pins-mux-rstn {
 			pinmux = <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
 			output-high;
 		};
 
-		gpio_mux_int_n_pin {
+		pins-mux-intn {
 			pinmux = <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
 			input-enable;
 			bias-pull-up;
 		};
 	};
 
-	ethernet_pins_default: ethernet {
-		pins_ethernet {
+	ethernet_pins_default: ethernet-pins {
+		pins-eth {
 			pinmux = <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
 				 <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
 				 <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
-- 
2.50.1


