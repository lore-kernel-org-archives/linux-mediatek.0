Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80822C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0fqpB7vAvCJjLxP7IKuFg0/eOBZKmcncI3L4+M85zM=; b=lq3TDE5mDxzktZxA7yAK8nw3t7
	/xl/kZXl64pS4seIb2+xyw/u5WV1wUoW2pzbHtZa9BqIni8nTAebRmXXcOySEFWT+mzZsvr4+u5BB
	jfTtyPz28E8D50NMnrUisvVE5YGDC/tE2oGg0RaDkUI1bxsuVj91z7/dZcJihY5pG3ZQH0gIqnbog
	cyHXfVJ1nW+fzd45pxYN1nGiWB20+zsnoIcvKr4XW/aITE64R9ZHyO0wh70mmXn9lSNjzqiQJT+BK
	c84itHt4z2atRjxwy4AmH1z/GrqTIbmk0mVqDd/EyO0pUvfTvGYhE3ksdRiMK0FDOjcAYOCTGz3VC
	rlP/K5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlVC-00DN1H-1s;
	Fri, 21 Jul 2023 08:28:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlV3-00DMwh-1o;
	Fri, 21 Jul 2023 08:28:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3786660709C;
	Fri, 21 Jul 2023 09:28:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689928112;
	bh=Comjd7Rpd+yn3bmmyHbh/cSi5Jl1oVbdmFMbRN+++wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VfQ+5tjv3f/+UFCapmORMaCBqgyuBz2TWAjeE2TyzmxjCHGJ5ZDK8OpIINN0zVDR/
	 dyLVzXOAbz30wwWTFEaRytxlNd4mhfviyN+tPHuUQr1ftUSz7hbRLJ7ORnSQydF6yN
	 YHYa+S30slPEWC92jPTfLlBxgn1K3il3fqPI3lt2xWAq7xn2mLcFjJqF4mBd4IxhRj
	 LL2jcp6nVvQA4sN312wwE5fzpLQWTll2BjzBUnjQcJmziK5LwfdKgQVl6sa/sLXlK1
	 df+zEBZdAY6t9Zcr8+MckM5oieH5GvYyRKk6U2HL5hbPwnaqnF4iQqFbDagPkCh9gg
	 5Ew0FTfoehOOQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs
Date: Fri, 21 Jul 2023 10:28:22 +0200
Message-ID: <20230721082822.680010-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
References: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012833_727156_99AAFE24 
X-CRM114-Status: UNSURE (   9.71  )
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

Add support for the DSI display found on the Sony Xperia M5, including
the necessary regulators configuration for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index ecdf00707a44..7364c7278276 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -66,6 +66,65 @@ bootloader-region@46000000 {
 			no-map;
 		};
 	};
+
+	vreg_disp_avdd: regulator-disp-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_avdd";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 138 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_disp_avee: regulator-disp-avee {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_avee";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 139 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_disp_vddh: regulator-disp-vddh {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_vddh";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel: panel@0 {
+		compatible = "sharp,ls060t1sx01";
+		reg = <0>;
+		avdd-supply = <&vreg_disp_avdd>;
+		avee-supply = <&vreg_disp_avee>;
+		vddi-supply = <&mt6331_vgp3_reg>;
+		vddh-supply = <&vreg_disp_vddh>;
+		reset-gpios = <&pio 106 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight_lcd0>;
+
+		pinctrl-0 = <&disp_rst_pins>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+
+	port {
+		dsi0_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &fhctl {
@@ -180,7 +239,17 @@ &mmc2 {
 	status = "okay";
 };
 
+&mt6331_vgp3_reg {
+	regulator-min-microvolt = <1800000>;
+};
+
 &pio {
+	disp_rst_pins: lcm-pins {
+		pins-rst {
+			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
+		};
+	};
+
 	mmc0_pins_default: emmc-sdr-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO154__FUNC_MSDC0_DAT0>,
-- 
2.41.0


