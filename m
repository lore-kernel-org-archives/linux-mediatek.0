Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C41C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmaSZLeZjSQ/sfj0NzDmxDJsic9p5DXbQ+3CHJs5uhg=; b=mFPpAZmw9eGrPRWItXL6G7XFHG
	Ott2N03R4ybcBbTLc4OoRvraKzkf6LfQuCmZGiAjJap5SxcNoT54k29qWxLyTRF0FOWZ22Jky57Ou
	UL09g9LOotbO3wFVqymIoCJtRD9giZIDD3/DfRht07VzhfD0rkLH4Wnid+lsom3QETiuV+Jm9G3Vh
	mwhRbrQ3paLL4JDEEZU+fIfGkX5P++vQ0/b+u8UxJx+29SL2FBPbC04J3FrjLzm2/F2pVzNGLRz+9
	SQesaVA9Tsl0F1McXQl82NGRfOrJAPRYCZVYD4nb2jd5dFm+8nXWA1wwbvyy7zxKBvSRNOKCLDJuV
	2sqpK8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVD1J-00GuRj-1J; Thu, 23 Feb 2023 14:56:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVCzW-00GtUp-1r; Thu, 23 Feb 2023 14:54:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5B5306602219;
	Thu, 23 Feb 2023 14:54:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677164076;
	bh=EMwmDgqiKXB9Dx2NxJ/NhHjgvpsexC8a5B3Qc0K2qvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KruIvXwfhBJ1KgQJ8MomBQ7ddTMRxdJFkotOKOZNKWW2puLevwEou1ipTyayhMYWD
	 +RG5lQP49nVFlAmbJqLdHw6tddeqQx3O966PhIeYsTHtLsjONtLEKZCeuxstRVtlXl
	 GgBxgCU107vCmvk288rcgohAJoP5oc5e0YcUYLCUiKlYVlY7gSMx7ip+WZraEazNIP
	 fDumET3XZBY1J6PrGU0yI1d8nV2V1Bu3T/HsFrZIkGXrPpz05xc1uNMq/MNXHhGcOG
	 e8hu3/KYlj9qvPWO+VqfTI97mkRag8BJuQty6SgdBhKI4f7QEXDE5lH7pjqlsJ9JPG
	 9vItNLGbkzOkQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 4/4] arm64: dts: mediatek: cherry: Add configuration for display backlight
Date: Thu, 23 Feb 2023 15:54:26 +0100
Message-Id: <20230223145426.193590-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_065438_274617_4871AB25 
X-CRM114-Status: UNSURE (   8.71  )
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

Configure the hardware PWM for the integrated display's backlight:
all Cherry devices enable the backlight with GPIO82 and manage the
PWM via MediaTek disp-pwm on GPIO97.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index d679a04207d8..c50f1e2914b2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -22,6 +22,16 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 1023>;
+		default-brightness-level = <576>;
+		enable-gpios = <&pio 82 GPIO_ACTIVE_HIGH>;
+		num-interpolated-steps = <1023>;
+		pwms = <&disp_pwm0 0 500000>;
+		power-supply = <&ppvar_sys>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -349,6 +359,13 @@ &auxadc {
 	status = "okay";
 };
 
+&disp_pwm0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&disp_pwm0_pin_default>;
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -773,6 +790,13 @@ pins-cmd-dat {
 		};
 	};
 
+	disp_pwm0_pin_default: disp-pwm0-default-pins {
+		pins-disp-pwm {
+			pinmux = <PINMUX_GPIO82__FUNC_GPIO82>,
+				 <PINMUX_GPIO97__FUNC_DISP_PWM0>;
+		};
+	};
+
 	i2c0_pins: i2c0-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
-- 
2.39.2


