Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A68C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+Ug1fNXKqhMIsYovXrNoGeoiYN1L74TmzLpXJQ+rb4=; b=0GHyhp4BrXb4AK
	X069hwtILPB9iuQUAc16fgHayVi7NwKQbe3m3NF8I6Rbk7gjTmcw5IQB77Z5PEd7rIyU9ID51nADU
	XRZPYmMQnXD/lER7Y/IKQ3s5luUbzoqH4oujTD3ly902U+Z71eHwhzI/WHtitXZqEHq52hrKQ7XXR
	zgz4jRqBPn7gCJYC6Q/ye7Jga48LJJX7t4j+/DcqdmpZ9xD8SoVnnzqVYe8v0cN7vgMZJMknIGstS
	Hb4lQgVbyUq+Vk0dVhFbb7+rOxO5YZBdhl7I6T/a3cM4YB/sQWKCiHPJB2jeteiQWhaPQ3uFIyjiz
	p4KlV4r1jmFP1Jr8x2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesZk-000000076tX-0jXE;
	Thu, 24 Jul 2025 09:49:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerV0-00000006tna-20Pz;
	Thu, 24 Jul 2025 08:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346421;
	bh=6OOCevs7P0On/TexTueu0AhU/Ozx/Y1fqp4QRf6p5mQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NX+d18t24qSNl9AjPCeLiaNG/c1iUQb6l95upybpkRtkP++4F5fNhb6WUA8sptqVA
	 04+zJCkZ83mXEYM76ozJUztKeMaHUJegw7MLpGqFEPCU4eAGNx4IM6rKQEytqk8gxU
	 Gytyf44PqcucTzUWyHUUr78IwvAUzYtsZCISZiG9ij1eGgUp1V/D+bLlK7hDnKgBTi
	 nsr6Nl8R/1xtTLJtZmzkbTiWP5pPacL53NntI+DrvvKzEYy577Hf4bhLzyD8z+BH1f
	 KLfLHuWmJU/0dxF9P1LAgBbqKvhjAvq472a9H8knrX2PUIPTt4w6+Mn47NNSBDetpX
	 eoFf/GiO4ZB3A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E4FE17E11FE;
	Thu, 24 Jul 2025 10:40:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 21/38] arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
Date: Thu, 24 Jul 2025 10:38:57 +0200
Message-ID: <20250724083914.61351-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014022_669753_B497F458 
X-CRM114-Status: UNSURE (   8.95  )
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

Add pinctrl nodes for the MicroSD slot on mmc1 and SDIO Controller
on mmc2 and assign those to the respective controller nodes.
This makes sure that all of the pins are muxed in the right state
and with the right pullup/down(s) before trying to use the mmc
controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 03cc48321a3f..fccb948cfa45 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -227,6 +227,8 @@ &mmc0 {
 
 &mmc1 {
 	/* MicroSD card slot */
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_default>;
 	vmmc-supply = <&mt6331_vmc_reg>;
 	vqmmc-supply = <&mt6331_vmch_reg>;
 	status = "okay";
@@ -234,6 +236,8 @@ &mmc1 {
 
 &mmc2 {
 	/* SDIO WiFi on MMC2 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins_default>;
 	vmmc-supply = <&mt6331_vmc_reg>;
 	vqmmc-supply = <&mt6331_vmch_reg>;
 	status = "okay";
@@ -311,6 +315,40 @@ pins-ds {
 		};
 	};
 
+	mmc1_pins_default: microsd-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO171__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO172__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO173__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO174__FUNC_MSDC1_DAT3>,
+				 <PINMUX_GPIO170__FUNC_MSDC1_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO175__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
+	mmc2_pins_default: sdio-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO100__FUNC_MSDC2_DAT0>,
+				 <PINMUX_GPIO101__FUNC_MSDC2_DAT1>,
+				 <PINMUX_GPIO102__FUNC_MSDC2_DAT2>,
+				 <PINMUX_GPIO103__FUNC_MSDC2_DAT3>,
+				 <PINMUX_GPIO105__FUNC_MSDC2_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO104__FUNC_MSDC2_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
 	nfc_pins: nfc-pins {
 		pins-irq {
 			pinmux = <PINMUX_GPIO3__FUNC_GPIO3>;
-- 
2.50.1


