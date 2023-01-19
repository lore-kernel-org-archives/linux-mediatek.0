Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE0C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lzqfELb7YUpCCEgx48Y/w/kDKrqRmQBPRy0hZ8B7d4=; b=r1g+s92gh0b6oIXHwTOIYbdImV
	wU0eYolhuGE7zQ+9K04VPvtN096YG6yhWGpwE/Axlfvo4P154fqUU0a5rVdNOuYgAXKrehI2xqcfI
	dORgjnVgGqOLoaSroCCJ8RGsaRyppupgjaELZaiMjJuXBT1L72asib40bg1EAM2YwTOOJe1nLetQm
	SWyP/DkeprefJm8EFle7SKxYo4bJS2ozVwIFXBUYya7c7FnKwi3LC7ftVXN9h/55fPJ20WXbn6aQw
	wpTTSp4txfGKbyDgtA7K0ynKpmoN+7N6hGbSweHnfMJJ5Z4uNW8Br15g4ZsOofiRULnxYSTA+jRn7
	9AX6d66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYim-006H3E-BO; Thu, 19 Jan 2023 17:29:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYiL-006Gqh-0D
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 17:28:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so4076360wma.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 09:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lzqfELb7YUpCCEgx48Y/w/kDKrqRmQBPRy0hZ8B7d4=;
        b=NL/IJOQaR+JZyc/0NDfnhbgwykCNzKK3aeG+c19LGOl/1VHUta9PWfw1nIwa4n1AeH
         IJKvUGlKJRerX1xfdF1AKoZGH9dzGxakl2H9sa/MRtrwcqh1wMQuF26SAoYKcdjobIsa
         1TX/sR02bsku/bkhWjq+ssnY0wgsevObIktbC5Ka13S4aSXeAoH9ekkvV7trU/mlVjA8
         cXBnlhNdlvsG7VHhjc7USmckuwLFaZ5kb5woMahSyAYGZIacnd9SMGcO92d1did1654U
         2rSS1t04wtEtNW41Y7I6wGliE2Bg46xYzsd1scK4EccJmyAfc/VSrYwhILGeSb7S0grV
         0S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lzqfELb7YUpCCEgx48Y/w/kDKrqRmQBPRy0hZ8B7d4=;
        b=arL7aQmVk6Vcgb3EM9hxDVbfOIHwFtqubFjHgv4vEEfyGb0ztQil/e9ZTH5PJyk+5e
         r6tySZY6iMj0uFGRiIi6fkUdR9y51GLl7KOn615LMGIv2OwAWFJP1K7gUREO1yUB+C9i
         x3dTyHkvMKJwy99LuwbA/OPX/8QdVpbuGi2cpG1RfdKxvmg9iG8mEzGLNXN1UL9uUWOs
         y49xoPrswgn28BpYGSQA9ID+Q88c2PMaF87bgVDTCrTN2U+HXG2OGX6czlAd4IL+u3CX
         FFU5fYm7+DfBBWa3wNJmsBBpUF5rMr2xGqf9idMgWKM7Vu71QiPdPabPMKW2o8H6nbbn
         hMTQ==
X-Gm-Message-State: AFqh2ko+ZQRjkK6dW7mxsX5zP0DVHaz22DJaQuOWXxcI9AtiihF7e09k
	/4cS6yaArPyBSLUDoXj0ntO/mg==
X-Google-Smtp-Source: AMrXdXsKr2SCHosNK7ZHaW6ug4MG8CwdPEGjnF7NOVOhRGvPafXDhULrCDPzdMjZPNj1ffpR284ipQ==
X-Received: by 2002:a05:600c:a52:b0:3db:122c:1638 with SMTP id c18-20020a05600c0a5200b003db122c1638mr6707028wmq.27.1674149315732;
        Thu, 19 Jan 2023 09:28:35 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id h11-20020a05600c314b00b003db2e3f2c7csm124186wmo.0.2023.01.19.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:28:35 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 18:28:19 +0100
Subject: [PATCH v2 1/2] arm64: dts: mediatek: add spidev support for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230118-mt8365-spi-support-v2-1-be3ac97a28c6@baylibre.com>
References: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
In-Reply-To: <20230118-mt8365-spi-support-v2-0-be3ac97a28c6@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Suyd6CKtFRX281RLLJau/Tt13cU5nwILzGsKWHcTvXA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyX3B688UZjs+ZlBdfgwDHOvO2tLXCnlF4Vm2mytT
 AxqVjVaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l9wQAKCRArRkmdfjHURdQ3EA
 CyQnStyVIpy0hcdFn7IuaY/fmwqLaqpC3BMBnPVgMtADlkviPThxtByX/a03S2rNMXsxA51ZoigWli
 RmDxISjL1mzCu5hBnzODbMX/EsR+mQtJZyrVyaNDsIxGv5mFiWU90y3XdzO30sMEmI2lFUlY2QY5Hn
 fDPSUm6QvVNPHzfA7ATyJ+neO5Gnwz8CO9o8ypjV2j5c/3CI+3L5ObdSop0EDG0DWmLsYhaxGwDGoS
 4OISvh5jnyQEDeCxRjPIPRqx1mcvI6dalAnjqBYYRMeHiDpScaihqQ3zHmde3DKKMLjzoU0/ADbGhB
 IXRDdRVsJ2M27+8qf2SBdHzlbB3NF+hty4UnMOAOW3UW9Wj0OD6OW6FnRGY0lYdZcHFMMPGbPIFuQy
 a4U7zrwS0y6erAPgDtbb1ZynSyOC0XYHyrm90/7xdx/6cdTnWP5i8PAQ7wpUpAGsJ8IkeIREw3qk1j
 xUw63g1afMYAzGYVjjwEHGas/TVTzbp/0XgfCYX/lZ/TJlJ8bfxbUo9S4S/F+Z9dn5VgsN+a6pmd/6
 6kEuat0FU1yagR934vPaCF5TlPgkco7sGc7SOk8fMqU8tDlKzhuuWL+x6OuScYbNcIc0wmEZNZHAYc
 l3d/V8MtjCA+sh38x1w9ctRdP2bhvzmdVRxOJRhRbVYCX5zqgh0+W8GdR5EQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_092837_168143_2260BE3F 
X-CRM114-Status: GOOD (  10.31  )
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

Add SPI pins and spidev support for mt8365-evk.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 275ea3a0e708..c1d603cb129a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -142,6 +142,17 @@ pins {
 				 <MT8365_PIN_116_I2S_BCK__FUNC_PWM_C>;
 		};
 	};
+
+	spi_pins: spi-pins {
+		pins {
+			pinmux = <MT8365_PIN_26_SPI_CS__FUNC_SPI_CSB>,
+				 <MT8365_PIN_27_SPI_CK__FUNC_SPI_CLK>,
+				 <MT8365_PIN_28_SPI_MI__FUNC_SPI_MI>,
+				 <MT8365_PIN_29_SPI_MO__FUNC_SPI_MO>;
+			bias-disable;
+		};
+	};
+
 };
 
 &pwm {
@@ -150,6 +161,19 @@ &pwm {
 	status = "okay";
 };
 
+&spi {
+	pinctrl-0 = <&spi_pins>;
+	pinctrl-names = "default";
+	mediatek,pad-select = <0>;
+	status = "okay";
+
+	spidev@0 {
+		compatible = "mediatek,genio";
+		spi-max-frequency = <5000000>;
+		reg = <0>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
b4 0.10.1

