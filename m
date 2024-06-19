Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351ADC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7n2AkJl0fgGMf2VEe6AhFr9U06FnNgwEKVPhxtEQpY=; b=o9eckvBruq5Jgu6igGMkqENQsF
	uMqVXzG/LxFjKTgQS3NzGHeB3rPC38fBW7BteAJCyJkK5ivMaqiGBhu6Xscut1+nyIWj0IhYKsmb+
	iuhzAcLwrsEVRMwAUMcl1gju1W8ntNsEZtcnmfjCBZV/rW0MopboMKUDoqk/2IyAsKNK3p4a/zs8N
	nTrEWJYdF1tKUzgLGdpIOZGX1yoMl9euuYKmAdA/7RyrCxcSaVNjWdrKg7DsfzF+C6CwzYlSlZeHg
	3wZYQqq9udymR/vr82yPxKx/P+3atPbA3ddpP0iCbMtvAdw8UND/WIQXYKg0YVzkhA8HEjDYTFRUZ
	ZDmZtNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwcu-00000001ebF-18gN;
	Wed, 19 Jun 2024 14:49:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwao-00000001dJt-0ztO
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jun 2024 14:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/7n2AkJl0fgGMf2VEe6AhFr9U06FnNgwEKVPhxtEQpY=; b=MSBT995aYn/iWJ6KePZXJ2UHBt
	yxTA6xis68eZFo0Zwx9y2B3ZrdH1R2h1cFPLEoYMjLkj9xlG0REnPG/etvLRpfdwmm7S1NMXHXBU4
	HLk0aWloWBmHITK1PbBTiI2jVLw9Tvpx2/mvnMfrDQze18KBgZBPTeDVc7zx7Ab8FigKPAieek9l1
	EQ4J4nNGKX74jwPnNoYqp4e9zezotDL80QmdY4rP8s39Wb9eW3IAPc0nWqeWML4n/6yakOGrg7Iq1
	nBnS9Zu2UOYkjjk2RSvtc9TnRBxg9Q0XcLRQx6mJ12zYQbSTM5Ufuz8TMAA72b4mj4FSBLXjh2Sbr
	YNhGpgdA==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwah-00000007Msk-11va
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:47:17 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso788211766b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808433; x=1719413233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7n2AkJl0fgGMf2VEe6AhFr9U06FnNgwEKVPhxtEQpY=;
        b=UXBWsSaAEC8CIvWT2sGoP7CsrIQevzZfA0hb7FTvahc+i5PA9mlBGwm+mKKDFBaFvx
         3cwYCIxzA9cXhHC86CGD0hw+vRijZYvpOpDbtiZp3R3qCS5G8Lf903nF4tv+gavlmXDc
         wvHgFoLE8Wmr7P2hZ5P5N0p43h9Plgbq9Lk11h34QpLTXwK06pn4InHd5ayUUoxDWp2f
         kL09JHQznfct3QbgzsCrHbIEQ+PL38x21e/8qJRSelgkFuRzavMzRLoNnAXJFjXZI6gI
         7Oe4bLowofVBLhEXyFXNZ/WvciXBMhm7tFOlwC+NOfDdSsIK/dDvjO2re5QgUJeX36YQ
         N9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808433; x=1719413233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7n2AkJl0fgGMf2VEe6AhFr9U06FnNgwEKVPhxtEQpY=;
        b=V0vZ9tFM1+xuclBezBu397vo5CXj5CKKbJ8haFFGO5oLtiHX89+5lmzWpjAIpHJ1+K
         7+px1iEvY16fEC2Vc60W0fDU1Of6ItB8H741dpndDPl2uy11d2N7sTUAO0iM5Df7I8/H
         pMD1bn+mswYoi66GsRPn2UerCaUGuL3misst3oXrV8wV1Y3ZRXdQEfqnPzXJWGkSbJAI
         fmjsEppcvraafakeLKTARwGux933YO3jWmDeqhkmwTYkSoCoE+JGpwpV498C9/KCxdJT
         +hw/jMLvYSJMQhfpzs/cz2wxzBZw6SDRR5G+i96/+f246jqtrjg+0doEYGEj6j4hkdeS
         Hpjg==
X-Forwarded-Encrypted: i=1; AJvYcCXYGkymSUjTRiPUlRGOcfUo1RICY/cyM4Aujy+eoHOs2pTnSSnbQbLMcWA0KfrsO0T35D+I5TQy1THip6qm39JtEL5DuVjQrPlsVUPYHyRQzcIc
X-Gm-Message-State: AOJu0YzAaXiUQaXSfpC0kozZVdicXZynMT+MdXbyVV5dIjnLrxQhhXhN
	r6+G5j8djveF5t5RFYCpTjrhmgVMTPTZWH1hsJPpFG55j0U+bAYx4xi9O5YOAlw=
X-Google-Smtp-Source: AGHT+IFejjmBbR+O7NOilDUucTHeY4c4aDqAu2lRXv8q4ZHn25X/QRNZIhLDZJ8tRMuEdemHgCMIog==
X-Received: by 2002:a17:907:c708:b0:a6f:9ded:3200 with SMTP id a640c23a62f3a-a6fab602dcamr173816566b.3.1718808433651;
        Wed, 19 Jun 2024 07:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:12 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:52 +0200
Subject: [PATCH v6 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v6-16-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=AvMEH8+KihB+RCqkEHdbuY3XBZvm9qmhSI5bau/Z8bo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RgD0cIrV6/lCH0NYdwIPSFjZgfo8uICKgdRMK
 BiUeAheJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURX5xEA
 CVAxYmx20YDtVP5oFfSpgCktC+zv920AeENrb2JQxRdR02ezp1MasNc5UuKYalU+fXHwpgGjDaCEIf
 YqYAbCgFcT0QS/gij2R5R0zpORXf8quGhlpQx+5VqnF0lKCCG4U2PelntPOgKGMnZNlV2gEZodL/9n
 +0WiTS0FUzaTzQrC0vSh1CArExbmcxeg+JE6N+k3NCx1bEzRFX6yI3+F6bu40xUADNIrUNBzHkJtBr
 HSdVO4wWMXxuLM7EOZ+NWD3A4KdaToDG6T6gek5a1tVW5XQDUqMSxclIPtaF8Oyk0O9Cd8GCxKnkzC
 0wc8qSbhEVnOpMFt8ONEHPQVdaDF3Gndv2J3j/bnG5yQ9Zgo/g2Ezz33cHu0loW9J2ca6SY9BRfRo+
 E+JwpPhCxNLh+L288kzF6n9CBP+/O54C0LupdysRSxzDd/WBtbvZQMDCwIqpm5m+xJ41kOBe4eIPQr
 JnTj16T/X+Vb8FYvXw0mn1lv+K5VVh+uWTrcQZ52W1MsfpbU3HojZbfS4WzDawiPmc7YRa9/OOP45R
 sGmzx8awEwD38ybbIcpGx8lUo0lGI0w0vr/VlzSGrYXgl02FrsYjgu+F21jvflA+8QfY9ujx2B1zpU
 BKrnHGupCmTswsKViw1AnCcl4JFje0yKrx2j9WC0Fole5dwv41uEJaRkHfQg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_154715_798974_D41C488C 
X-CRM114-Status: GOOD (  11.26  )
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

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..f8e9bd732668 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -4,6 +4,7 @@
  * Authors:
  * Fabien Parent <fparent@baylibre.com>
  * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		pinctrl-names = "default",
+				"dmic",
+				"miso_off",
+				"miso_on",
+				"mosi_off",
+				"mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		mediatek,platform = <&afe>;
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -178,9 +201,75 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	vaud28-supply = <&mt6357_vaud28_reg>;
+	audio-codec {
+		mediatek,micbias0-microvolt = <1900000>;
+		mediatek,micbias1-microvolt = <1700000>;
+	};
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <6>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <6>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1


