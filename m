Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C86AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHH2HxTqNFJ/lJNs1qFaIqd5v0nMoi5SSZVPExpVJco=; b=uMIcDhwuyJwv6s
	vtpZcH5BxQ985pYwUsuTwZnaNNeXf9Yv40zwd8c4ViNV8gPJAng/XFhDoo9iSxOQvnLeExd02ywZL
	pL+essQRcyAbye02a4P71as46D16ys4sIJT32uuhnTxDP7+IvGvNx+tq5mrGYyoDbTgxsoonJVY8F
	PUafmvFgxIzW3lZEqH/iog6sBjZJovzKVwB5DNl2FW3rfxwVk9q2SrE9qUAf0/0w3zx3p+RqZGDcl
	z6MFQCwq9Ddqdxxs9YOiUe+U8jsbZHDvD0xcaqNkfq6c10U2M4+6WVXPb3gwWlsN/WuIbjLC6wXGt
	1KFMrdkd4uvunbaYXRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWq7-00DxoZ-8U; Mon, 14 Feb 2022 08:36:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWaT-00DrBE-Uc
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 08:20:00 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 733FF407DB
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826796;
 bh=EbCeV0x/sMs+Jsxt5g9p8vtgK7tOVPzaf7TxkPV9Qwo=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=YTGyysoi7/EX7GpmevTv0P8buQzccWWhfkjSPdPniMpIkcE2k8RwHNfykd9dkJOl4
 tDlfIYvNYvPwW70swf6k4QWdIDkNcmrRPFQ2vppOAWmpUqU/VtUlB4o+xRqvTWyJFh
 O8A18uh8Y5W7ncBcjwxLXoaswF6HOd/iWQENOGIe14tw0DVHTN4MlxwzPGxRc9TsWr
 j3RKCuh/IKICi9QSogGh1ZUEYQHTmN9eQ0IfVOC8rpz23iohSuchUuDE7iGCWiqHNX
 3bspGZ0FxumDA8yGOqCinvyxskYo1Wtv6DAbKB/o4UYLNDur2+gujgTXlO+RHtkeTr
 BbD/QDO4YqwFQ==
Received: by mail-ej1-f72.google.com with SMTP id
 sa22-20020a1709076d1600b006ce78cacb85so597445ejc.2
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 00:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EbCeV0x/sMs+Jsxt5g9p8vtgK7tOVPzaf7TxkPV9Qwo=;
 b=r4TiAFMb9rybQ4CtFM+gLYZCb37j44Cpdq4IkbKBaq9w48otwzo9QP+7DSB6j+nbU1
 FdKdpTKg/WlXZGepKHQh+KCHMErimt0deTICDYmBHSVBh+SnF5asjqT5yUTkEA1p4kT5
 R22r0XPhbW/+G5gl4dambZuQ8LcswweHpC5Rt5uZ0ZWu6Czp+ZnmKRxlSmn16BYyq4Oz
 8TyE2T3M7Fxzs//HDZQnp3UE6sBY2poGoCPb69FtbpJXLkr4MPo54B1ZTux3pqMbWfUs
 /8V7ySgnXhrWx4FYnUOax74sVX88WIe5wstV+ok+Mnk2pQf9CMqrO3sTuWbtHoh2ghue
 Argg==
X-Gm-Message-State: AOAM531c7UokMs/L829mzOkZDi5zPMDMpdHbiGjdxQnrpfADxUHf3WqA
 I1/a9BeSdGxff8+vwc/qBob4KPBI80jWGTjQxo3I5ZIvH56ywaRO363qRYUhIMV1ADI1lbsBGGv
 1OX6wzJEfKkv3RI5KUFFZfFIs/NO+2Ip+8W55VOwCAACbk8ZOmQ==
X-Received: by 2002:a17:907:608f:: with SMTP id
 ht15mr10447781ejc.498.1644826796180; 
 Mon, 14 Feb 2022 00:19:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuUtAFxe/AINzxrq5NNy+IKE6ovx3e9DkEU19VgsoD3pIeaS61uCEwn2sfqcNpphQUr0Ojgw==
X-Received: by 2002:a17:907:608f:: with SMTP id
 ht15mr10447762ejc.498.1644826796018; 
 Mon, 14 Feb 2022 00:19:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:19:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: qcom: align Google CROS EC PWM node name with
 dtschema
Date: Mon, 14 Feb 2022 09:19:15 +0100
Message-Id: <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001958_223404_E5261BC5 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dtschema expects PWM node name to be a generic "pwm".  This also matches
Devicetree specification requirements about generic node names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 78296ed6fd29..732e1181af48 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -637,7 +637,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
index af46a60b4b98..1779d96c30f6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts
@@ -705,7 +705,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 7c22f0b062be..dc17f2079695 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -421,7 +421,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
index 0896a6151817..a7c346aa3b02 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi
@@ -20,7 +20,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ap_ec_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 4a6285a25f77..e7e4cc5936aa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -708,7 +708,7 @@ cros_ec: ec@0 {
 		pinctrl-0 = <&ec_ap_int_l>;
 		spi-max-frequency = <3000000>;
 
-		cros_ec_pwm: ec-pwm {
+		cros_ec_pwm: pwm {
 			compatible = "google,cros-ec-pwm";
 			#pwm-cells = <1>;
 		};
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
