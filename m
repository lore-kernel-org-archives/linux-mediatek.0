Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF93C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCvaGSd7Z6Gw5xaW8y6u5i4K8y1pMM3hZZC8sYQtU5E=; b=phNJ8gmcOMN2aE3wYB8OpGQsgX
	yCr83wTnFagvG36zsEkP2fgONdLdGUGMF9cDEGwQlN5muOqNf85NyRNlkVj8skfs54mKUcJmjj8o2
	8s4F+AFDYmGu/tMitou/Ukt658JigTym6CNZ3QwmT+7ioX09+5BcWD0tfKskZu4NMdXwSfe4Lj3z6
	R5Aa8Gnp7oM6sRK9BWQ0T9vaYaD55c4x9wCRwTE+HxddGAQtDcUxAdC+IXA2gFHJYOP1++7mC7uLs
	+cOF+Nlhfvc+aAu0cmsYDcVTHnYnIngZ5s4Qcax79Bb7UbITjfSuZt+OFsZE2moYWuvbTC/EEDat6
	aiovenXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J93-006sSf-7t; Mon, 04 Jul 2022 10:17:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5H-006piP-Jh; Mon, 04 Jul 2022 10:13:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 856F06601987;
	Mon,  4 Jul 2022 11:13:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929618;
	bh=AFxHTqlOyeK1LCtC1MqBh69cl8u6Qrdx+4RcZLmfPmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7EdQ3Y5HL0jzjaagGKq2QTQYuaMQoHax6OdhjdlYsNW5q/fERJI7bAs8Hip404j4
	 dSRxYanPBc5COovVCREukZCJMWyMFo/THiTmjugyDl73ZQ8YU/DK7UmeE612r0hwJG
	 uUVA2sxiJwVoXjOaKGJ5ngR02HxJAZMd2iYuaTeCtMHyJ2H3Y5otZagmSlRqj7xGWu
	 SCJ9dLjfAxVbnRl8yXxYxNBs7C19bPf7dG+64JQLlfrilHpGgCkdmGAWUaF1JRgXJP
	 MXYj0AS8+sM458Xnc3R+GMNB8ZxyRs7GpvdlNk8+u5AbE6tO77mrEUWAA2VSVS63q9
	 c+w7naWjDdjag==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 10/11] arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
Date: Mon,  4 Jul 2022 12:13:20 +0200
Message-Id: <20220704101321.44835-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031339_843578_2C75C084 
X-CRM114-Status: UNSURE (   9.79  )
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

This platform has a SPI NOR: enable support for it, completing the
storage compartment enablement for the entire platform.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index c07d3ac79f62..2c8b760d0da1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -231,6 +231,21 @@ &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
 
+&nor_flash {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&nor_pins_default>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <52000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+	};
+};
+
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 	pinctrl-names = "default";
@@ -513,6 +528,22 @@ pins-rst {
 		};
 	};
 
+	nor_pins_default: nor-default-pins {
+		pins-ck-io {
+			pinmux = <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
+				 <PINMUX_GPIO141__FUNC_SPINOR_CK>,
+				 <PINMUX_GPIO143__FUNC_SPINOR_IO1>;
+			drive-strength = <6>;
+			bias-pull-down;
+		};
+
+		pins-cs {
+			pinmux = <PINMUX_GPIO140__FUNC_SPINOR_CS>;
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	pio_default: pio-default-pins {
 		pins-wifi-enable {
 			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
-- 
2.35.1


