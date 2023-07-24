Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B265C04A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 10:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD0vOMyCzKkm5UOe3FnHAVw+crzpiTUbMdsmSF2boG4=; b=yMxVHu1ZHLsaHCrTAp6GI3byiM
	M62nXmfbi2yZy59QKDGDsdXNIWFmwpFpOLgpWbEG3rkN4WZyphTG8nTXCWfsQbqjLi2wwwONWQCse
	as+8MzCNOjtt9N9LGdJaH9L2An/rmdJeykCMtqHNCF/OAHLgjBJFi8FfobuVKacn+6LzZxQjQp4wB
	No1tzLxWudrEhTfkb9Pedq/Qp8FxDtpnhv0NQphj0skY9NCZ/EuSph8+x7nR/5TfTlSWipHh25u3m
	RgAKYclJTq1Narf2/YI+wn2mBsGisidfI7dNbSQysFm0vOnqPUJqHlp0rLx3YUQi5PlLFq27ORQbo
	n+I/56JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyT-003qi9-21;
	Mon, 24 Jul 2023 10:39:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsyI-003qZk-0P;
	Mon, 24 Jul 2023 10:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690195162; x=1721731162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MD0vOMyCzKkm5UOe3FnHAVw+crzpiTUbMdsmSF2boG4=;
  b=RzsTZXNbhT6Dxf4S7V11yKC9VYzfJwEU9XyLLxTkox9l8pyoE1UUgdE8
   ZlZBQ/NTdDg2KD9O8b45vyIzbetCnfOO2nztgCSt12jsH9F03ZbUe4GVw
   ziV0LPpxy4IgUi4DBNF26Ns3Up6ARufgWIhs6VQMcD7hA9obJNCEVkpwd
   LmqXv8w5dT5zryMzWRjpR3xyhbAGdTXbQ3o/Phw2x4AwU+cwoe8Mqk/3U
   xJ5nJ2iw2RhuFyn9UwVeHHWs5zArlziWWrijt7D8/qnhcJz+e4qk/1yOL
   Gv/rZvFjIasYznILCHfxxDlEdLtCGFyh4icibPU4+1fxpV6oksLWm33Rn
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32078483"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 12:39:18 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 14895280085;
	Mon, 24 Jul 2023 12:39:18 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 2/6] ARM: dts: ti/omap: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Mon, 24 Jul 2023 12:39:09 +0200
Message-Id: <20230724103914.1779027-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_033922_467904_24F7E03B 
X-CRM114-Status: GOOD (  11.33  )
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

Use id-gpios and vbus-gpios instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/ti/omap/am571x-idk.dts          | 4 ++--
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 +-
 arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi  | 4 ++--
 arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi    | 4 ++--
 arch/arm/boot/dts/ti/omap/dra71-evm.dts           | 4 ++--
 arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi   | 4 ++--
 arch/arm/boot/dts/ti/omap/dra76-evm.dts           | 4 ++--
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am571x-idk.dts b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
index 48425020281a..322cf79d22e9 100644
--- a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
+++ b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
@@ -168,8 +168,8 @@ blue3-led {
 };
 
 &extcon_usb2 {
-	id-gpio = <&gpio5 7 GPIO_ACTIVE_HIGH>;
-	vbus-gpio = <&gpio7 22 GPIO_ACTIVE_HIGH>;
+	id-gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&gpio7 22 GPIO_ACTIVE_HIGH>;
 };
 
 &sn65hvs882 {
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index 149cfafb90bf..c5272302eb11 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -197,7 +197,7 @@ brcmf_pwrseq: brcmf_pwrseq {
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
 		ti,enable-id-detection;
-		id-gpio = <&gpio3 13 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
index 1d66278c3a72..3fca84819dc0 100644
--- a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
@@ -169,8 +169,8 @@ blue3-led {
 };
 
 &extcon_usb2 {
-	id-gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-	vbus-gpio = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+	id-gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
 };
 
 &sn65hvs882 {
diff --git a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
index 4cdffd6db740..ed5199d7acd8 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
@@ -15,12 +15,12 @@ chosen {
 
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb2: extcon_usb2 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	sound0: sound0 {
diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
index a64364443031..f747ac56eb92 100644
--- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
@@ -293,11 +293,11 @@ &hdmi {
 };
 
 &extcon_usb1 {
-	vbus-gpio = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
 };
 
 &extcon_usb2 {
-	vbus-gpio = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
 };
 
 &ipu2 {
diff --git a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
index 31ab0c60ca75..f8151c61488e 100644
--- a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
@@ -96,12 +96,12 @@ evm_3v3_sd: fixedregulator-sd {
 
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb2: extcon_usb2 {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	hdmi0: connector {
diff --git a/arch/arm/boot/dts/ti/omap/dra76-evm.dts b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
index 57868ac60d29..cf9c3d35b049 100644
--- a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
@@ -533,11 +533,11 @@ &pcie1_ep {
 };
 
 &extcon_usb1 {
-	vbus-gpio = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
 };
 
 &extcon_usb2 {
-	vbus-gpio = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
 };
 
 &m_can0 {
-- 
2.34.1


