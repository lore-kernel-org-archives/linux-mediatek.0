Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsfJPXGMW+gszYGj0ctWW5gURhWWH89vu9x3iR9dZyw=; b=NF2pTbjvt6f/6momStk73YyBKu
	61Eeb8lrZajwCDZH8TR99rYGE7YLQ7U1t5eBqMhP53JqXSk7o5h8foCyf4dQAn3g10RYQ6DiE7rHI
	BNxHogcwigOjg9hwgKvcAOR2Mbb/q9uaPNLtYxd4Gl4x6f/+TgnHNGf6Layr9iY5jIqcAXLQ1b1TM
	EMXFIT92XRoifdFHxmSl362xzF4t4Q7NUC1ue5ie0iGTrvHSYb0pMpbLSTlm7IVB8ujeH38i8Ex8C
	WhX9LO+pfp4l6yb/4M0ctnL8dSSW2ysDbvFFFxN+KcAdK1AMWYdBlQ2q6HPGcBMrWcgbiOOmw4gc0
	ji6N2sIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1nO-001gLb-6j; Fri, 02 Sep 2022 08:12:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1mh-001fv3-DZ; Fri, 02 Sep 2022 08:12:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC1876601F03;
	Fri,  2 Sep 2022 09:12:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106330;
	bh=3OWhZI1FxYYC6TsKTsim+28cYr7jRgmawjyY6vyOJfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bdpSDozB4BZBPyQyHm9CehdN4InFb5e8qwmWXUsh1dFcCzN9HMuK+xsPA+NR7x+tI
	 WHWdWygG3Nt4zp/ib2pFc1b5SR0LaS+mEuKa85XPfIcVtpa9DXzWDf89AZQSETU5SN
	 5BbBFXnPqqQAE28rOiBDSAsVuSD/F4gSgtfac6hediAYoeyPpPLpiIdw1t2uUiVMK6
	 mpTGgYdNASG0RikibSckWDk5ZVhBmvQIBRQKnfVpKBM7dtQ0U0HV/iMYHYMrb04Gxc
	 3UWWVnAb70ReLDPmkAXiiSGf8cxb8qa4mvAJYppZyW2MDHxLxHPjOUPZPKOX55mgIL
	 nH4gCXoucENlQ==
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
Subject: [PATCH v3 1/7] arm64: dts: mediatek: cherry: Enable the System Companion Processor
Date: Fri,  2 Sep 2022 10:11:50 +0200
Message-Id: <20220902081156.38526-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011215_722264_6DC04859 
X-CRM114-Status: UNSURE (   9.50  )
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

MT8195 features a SCP like some other older SoCs, and Cherry uses it
for various tasks. Add the required pin configuration and DMA pool
and enable the node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index fcc600674339..e83d58d99757 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -104,6 +104,18 @@ usb_vbus: regulator-5v0-usb-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
 };
 
 &i2c0 {
@@ -600,6 +612,14 @@ pins-low-power-pupd {
 		};
 	};
 
+	scp_pins: scp-default-pins {
+		pins-vreq {
+			pinmux = <PINMUX_GPIO76__FUNC_SCP_VREQ_VAO>;
+			bias-disable;
+			input-enable;
+		};
+	};
+
 	spi0_pins: spi0-default-pins {
 		pins-cs-mosi-clk {
 			pinmux = <PINMUX_GPIO132__FUNC_SPIM0_CSB>,
@@ -643,6 +663,15 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&scp {
+	status = "okay";
+
+	firmware-name = "mediatek/mt8195/scp.img";
+	memory-region = <&scp_mem>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&scp_pins>;
+};
+
 &spi0 {
 	status = "okay";
 
-- 
2.37.2


