Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A17DC7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwIpw1kBoGzwnr4u38UFEGe+NM5XQoO6XRmgydwFiVg=; b=FKE1uaRpooO4dqhIP4LmN7Fqzw
	1eQUj9zgSqb9s8PM1tN+9QZdFcYPglwMsLF1kxT+swasimNYGxFmwxGgrPxAdNBMK3wJYJmfRuh/u
	0Y9uNMZZ8UM92RyazTSns23hz/WLsXbw3S9MOxRu7tfjccLftuWL3nhQxCRbXRp+JOyMxl80on44w
	MMpg9LAhLvxqSSDrhV7KCXjaFagDTZYQkgcT56tChmhabtMlDanzVykvidP01gJV59zoYwIbnFRGc
	eUceIi9KXYMQ8TD9+PtCdCo7NNBFSHfaKDZGGZBCJ1eTkFFStHEeGR2795YFmN7CkPPaFYVp2l4Uo
	916UkVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AkZ-008VRZ-2Z;
	Thu, 08 Jun 2023 08:12:07 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AkU-008VOX-0d;
	Thu, 08 Jun 2023 08:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686211922; x=1717747922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fwIpw1kBoGzwnr4u38UFEGe+NM5XQoO6XRmgydwFiVg=;
  b=EZwkwS1EO9F1MrWA19mZGPk21BZlby7wCWIigV4gpvwyhiaMNPY8x2aX
   /kY5i7a5Qfo5t9AXmYxwOK/bJn0FL8slY1iFVALW+OOaj8Ys+nGjv4vVC
   DmGptA/W47uveZTM97YZtoF9vqMPSQCxrJwP5E/+ppJUMr0jX/glQPsl4
   TsDPK8zNHEzKKnESLDJ++5YjAFZQprOm2m/38tuuPG+rZrJ5/IdC3GhHI
   M5x43ohiEsDr3Dord8jsMEN4tYr1o2+Yq6ubRsULSk4qZdhqW59nzFg1w
   3GmVguzF1+UqlHoj2yHEN1xseJLexsPjm/HCLRtVm5H2Ti2bKF4LvC68H
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681164000"; 
   d="scan'208";a="31343606"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 08 Jun 2023 10:11:57 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 08 Jun 2023 10:11:57 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 08 Jun 2023 10:11:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1686211917; x=1717747917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fwIpw1kBoGzwnr4u38UFEGe+NM5XQoO6XRmgydwFiVg=;
  b=Top7tzmhNngUryekoSr7nqXcjKSozIjBcIe+jLPdrZ3nd+L5GvYEtO2D
   LEVrN1yULJKHyalEaCxCxitKYwQsWsXq7sK6dmT01P1GSuGUggPqUgfqA
   pnmoC5CsCtNSEoH4pEBKbBIJFaV1Lr5Gf1a11SPwFHyY+7AS9JnilJl7q
   E82nMyNRd+SvCrO9KyOeR2cpFWtGnsOkW5zzrb5oR4AuBmtedvvQj8YvP
   w5FB3TU8fohcz49Twn8q9c2v6vkLjjjMN0RL2pLs1jLhZyjNx/3pzNopr
   D86HhWLmlAUpnCm6b2d+dNq5cUsSOn8Zj0dFY+P/4UkVtsSmsFCmYTRoX
   w==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681164000"; 
   d="scan'208";a="31343605"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Jun 2023 10:11:57 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4902C28008C;
	Thu,  8 Jun 2023 10:11:57 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
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
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date: Thu,  8 Jun 2023 10:11:52 +0200
Message-Id: <20230608081153.441455-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
References: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_011202_538838_9F818363 
X-CRM114-Status: GOOD (  12.68  )
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
 arch/arm/boot/dts/am571x-idk.dts          | 4 ++--
 arch/arm/boot/dts/am5729-beagleboneai.dts | 2 +-
 arch/arm/boot/dts/am572x-idk-common.dtsi  | 4 ++--
 arch/arm/boot/dts/dra7-evm-common.dtsi    | 4 ++--
 arch/arm/boot/dts/dra71-evm.dts           | 4 ++--
 arch/arm/boot/dts/dra72-evm-common.dtsi   | 4 ++--
 arch/arm/boot/dts/dra76-evm.dts           | 4 ++--
 arch/arm/boot/dts/imx6qdl-colibri.dtsi    | 2 +-
 arch/arm/boot/dts/imx7-colibri.dtsi       | 2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index 48425020281a9..322cf79d22e99 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -168,8 +168,8 @@ blue3-led {
 };
 
 &extcon_usb2 {
-	id-gpio = <&gpio5 7 GPIO_ACTIVE_HIGH>;
-	vbus-gpio = <&gpio7 22 GPIO_ACTIVE_HIGH>;
+	id-gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&gpio7 22 GPIO_ACTIVE_HIGH>;
 };
 
 &sn65hvs882 {
diff --git a/arch/arm/boot/dts/am5729-beagleboneai.dts b/arch/arm/boot/dts/am5729-beagleboneai.dts
index 149cfafb90bfc..c5272302eb11a 100644
--- a/arch/arm/boot/dts/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/am5729-beagleboneai.dts
@@ -197,7 +197,7 @@ brcmf_pwrseq: brcmf_pwrseq {
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
 		ti,enable-id-detection;
-		id-gpio = <&gpio3 13 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/am572x-idk-common.dtsi b/arch/arm/boot/dts/am572x-idk-common.dtsi
index 1d66278c3a722..3fca84819dc0c 100644
--- a/arch/arm/boot/dts/am572x-idk-common.dtsi
+++ b/arch/arm/boot/dts/am572x-idk-common.dtsi
@@ -169,8 +169,8 @@ blue3-led {
 };
 
 &extcon_usb2 {
-	id-gpio = <&gpio3 16 GPIO_ACTIVE_HIGH>;
-	vbus-gpio = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+	id-gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+	vbus-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
 };
 
 &sn65hvs882 {
diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 4cdffd6db7407..ed5199d7acd84 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
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
diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index a643644430315..f747ac56eb927 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
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
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 31ab0c60ca75e..f8151c61488e1 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
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
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 57868ac60d298..cf9c3d35b0499 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
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
diff --git a/arch/arm/boot/dts/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
index 5709957075044..11d9c7a2dacb1 100644
--- a/arch/arm/boot/dts/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-colibri.dtsi
@@ -26,7 +26,7 @@ backlight: backlight {
 
 	extcon_usbc_det: usbc-det {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
+		id-gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbc_det>;
 	};
diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
index 104580d51d745..9fe51884af79f 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -29,7 +29,7 @@ chosen {
 
 	extcon_usbc_det: usbc-det {
 		compatible = "linux,extcon-usb-gpio";
-		id-gpio = <&gpio7 14 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
+		id-gpios = <&gpio7 14 GPIO_ACTIVE_HIGH>; /* SODIMM 137 / USBC_DET */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbc_det>;
 	};
-- 
2.34.1


