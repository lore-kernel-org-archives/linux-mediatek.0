Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B40C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGx0ASsjf5zAlHY0KaJ1P0SxTlfY42ZZsRuXis30vkg=; b=LUiZkLpNCS5u328xiaOZuUkIJF
	x55xPEKVNb5R7wAllL7gt8lIdBbeendvxS9XHQLfOFubQAuiytMLyoGybEGSk41VlflVYXqGTRZ7D
	4fwCtc1inX1yaKPyNJ/r3vtSy1cK7LdWRiJgp07amASKUmln6usXFWhvLNCQGsmxGmivpcKQNjq5q
	wSTLzuBTZfpY/5nSKmmF5A8iV/trS0me2wj46xLSYfF94NlwOHnZydA530mwbn++DTihUqvSGwTnZ
	xqynfWThbjskQaFetWXpniqhk3p2X9f4vxyGcGXR3JpD9Y6O9GsxFdayq3ixhiXyQVuxut7Hn2bcM
	OUUKdxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1nO-001gM0-RN; Fri, 02 Sep 2022 08:12:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1mh-001fvc-Ii; Fri, 02 Sep 2022 08:12:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B64B6601F05;
	Fri,  2 Sep 2022 09:12:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106331;
	bh=wp3o4Y17CxutbsfUPDmxWZ120aLT+CWRC1GPj2X5+Bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLIpDl9BPR0MRTsh3do9lPthy0DgAYgsCPH4GemGyTGzHz9lWaDwkqHO0WxKBem4v
	 Wcy8gU2uNsfRc2oKp/FmLEI3+4ylOnw4SQXOtcbDdxGVNhyws+OCmKfKX86rbaUT7+
	 x1VNrmMFBstODhPVoSDkqRYK+twVdc5JBaVdn8fckjAO3XqPbaf2bzLTRJjzW556Eq
	 Ca9i4ePUHoyvTgt/nnY851ls2jCotbrJ5Bmx7NsIjCui7eyuNR09SFnk+BCj5LW2+5
	 ZMIIc4LHKHDydTIvw0SulkR130ir1D/adwcXpMH9RyfyZqMOEDleBN9CEnPl6n5Rkh
	 EQCrsxgfaDtFg==
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
Subject: [PATCH v3 3/7] arm64: dts: mediatek: cherry: Add Google Security Chip (GSC) TPM
Date: Fri,  2 Sep 2022 10:11:52 +0200
Message-Id: <20220902081156.38526-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011215_852365_419B27C3 
X-CRM114-Status: GOOD (  10.69  )
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

Add support for the Cr50 Google Security Chip (GSC) found on this
platform on I2C3 to support TPM and to also use it as an entropy
source for the kernel.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 73f531f84fa2..a07e7fe66315 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -149,6 +149,14 @@ &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
+
+	tpm@50 {
+		compatible = "google,cr50";
+		reg = <0x50>;
+		interrupts-extended = <&pio 88 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cr50_int>;
+	};
 };
 
 &i2c4 {
@@ -426,6 +434,13 @@ &pio {
 		"AP_SPI_FLASH_MOSI",
 		"AP_SPI_FLASH_MISO";
 
+	cr50_int: cr50-irq-default-pins {
+		pins-gsc-ap-int-odl {
+			pinmux = <PINMUX_GPIO88__FUNC_GPIO88>;
+			input-enable;
+		};
+	};
+
 	cros_ec_int: cros-ec-irq-default-pins {
 		pins-ec-ap-int-odl {
 			pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
-- 
2.37.2


