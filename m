Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC38CD4F5F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amEp3d9dA2kLes/bKsPMBk46Liy76YOCyltVKKQIsdk=; b=4AaKSGZf4e6WkjwQkgrujrMlg8
	Mjl8pOXAysRJSn3gDtmwqR3JguFiTJ9jv46FXqwlcmvJDXFJOyy6fHEjEJAqI6fdVE39WvuQNFWeW
	/tX80khuiCMWZWAsbsRgjDHt6n0G0XfJ4HH6PlOIwYTo+l0Zr60wxJo7cTIGFCXruXlSihe9CvW2B
	+ZKJ+PHK8EbnKyoS/koDAvAlBkLzxBBarpI9QbKvBTNbEKq39DbBYeT9qjNmsid2PAAaoSERRVX7R
	ik+H0hfmLPy/h83eubWgQshbswRnWVQvH0v9scxhB+Ep1NwfY5YFrz83YDiHRzsfvKRnL7Wnd0AzO
	B9GeNwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Xw-00000007i1J-0rRR;
	Thu, 05 Sep 2024 09:12:56 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8T2-00000007goW-1vGZ
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:07:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-533521cd1c3so621689e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527271; x=1726132071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amEp3d9dA2kLes/bKsPMBk46Liy76YOCyltVKKQIsdk=;
        b=EOCYRPalcZ3jeJPFycFTLOkMaV/Nw5sExEPDsNMIq8kLtzYGbjSYYiUdyNy4mT1+z0
         f6lFdcq/zgQbFetNq0jb5CCMSX2NhNg9bHJxYqVNM7h/me+E7giiM+uSxGQXfAHjc17f
         N2iO7k/nxttL097HgHdbZkpIgESk/iwKRDLR6BitRr2WGjughtkndD72ayP4OSk6flQ7
         BK6MuTnXdWppybM0sp67I+2+GsrLyqF6ndqT9vP9tGdcso8yrg7H1u/axUQ2oouwmisT
         oExtRmwK+INaKldyiNp8sz7Nh0XwGRFvVgJScTxXxODETjaOH2FUHQhawWzTefFvA2/M
         kUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527271; x=1726132071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amEp3d9dA2kLes/bKsPMBk46Liy76YOCyltVKKQIsdk=;
        b=WnUMqcsSmGzZFm2/HN7Vyg9iGe5A180xyWDSf0r1EXXrnSH+PilvE9l251aVRTT4xU
         Lw+0NhVfLNG+EQfLyhcnvLJUKdVTir+fj+FAgKS+E9Jkb/IHWmbz8S9UJylJGDzD0PAM
         SbdEbpjwAppvjP9dqPPC4CsRUBKKY1/cpE33hkift+3Rp+JUmhzMRK5hEPeW/xGQCOtX
         +7dTaBEFMwU54dvLpkeHjUJZ0JS/szqiKbeFzxjp7JUKQDQvLP4Q2CSqNT/cc8iCE6hL
         YBMRQlmT48k5/XAlutf15dDf2ZvVJnFEqMbdZId6/Bo7tNSjo+/T0j2a3mkUo1OT/Kje
         KUtw==
X-Forwarded-Encrypted: i=1; AJvYcCWvt0LzfZ12gEN5X8ri3z3+84IzgWtntvv7V8GQ3DJcWKryB0gdkpN7AUrKhiXaR3/hlWcwOzbIq8MLx/uBxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhy2YaDuJ05lg/xGTYsmPf9JBv712X3oE578HAAaYHXcQc7oc1
	Il9nLlhgLz9ZvNPfRda7S/E6K6qGssG7q1awEHygIbI48SfSXcO+EsgymFZDOdM=
X-Google-Smtp-Source: AGHT+IEXxv3v/7gChECZyOGuQolflyMIMwnjLiTaBnwFPxxgLEbat0KiTCUHf92EE0SVtscCFlRltg==
X-Received: by 2002:a05:6512:1593:b0:536:53e3:feae with SMTP id 2adb3069b0e04-53653e400aamr788908e87.11.1725527259850;
        Thu, 05 Sep 2024 02:07:39 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:07:02 +0200
Subject: [PATCH v8 5/5] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v8-5-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=FIwNsi2/7C6h+hTUlPdOVAIygtslJZRWw1saG4r7H9A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTORpSVxJ3WbTSdgdCVCYCnTzKrNLC1U02Hx9yO
 uJ38TEmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURdtGD/
 9QPgfVxIgAgeB4+Wq1OA6v2H1AeKw1PS2HUIJjwj/wYkXZehlBvs+xePlZPiQN4/TRR/CVjAhWCkoF
 zf51VPxBZ/lp90Dlugv+8vp32PrpJfmS9WD6aB2RYg5jbnUbOWEa8KsDi47EXIP4Y27TFLQvFzTY0Y
 h12/eeBEo2b8MyIt3ILEv+HCALp5gKledvonGxIt+6fmZETN6LrhyW0SPp2Bq5hvO2TvoDUz18ZfG9
 2KPqWUU8fwjIYzJF+Jg/23G/lZwab/DXH7rXBMbq6dP4GW7gFNd9tyMrButbSQc2FqKiFuzJoaZw53
 MV92eRMwEItx4bC3iF2lNyOO0vvYyuNIfQM2+RFZ1X9kS+pKt8YsX7bnFmFn8YBibxBomvFh3EP0PK
 BpDDxSwd8W8SjrqfTqwpZh/97bbv0GzRXLTGPKvthkIenQraunMIjpU6Vx8WRODrliBlqdANnw7xT+
 YLvteJ2EOAkVtcJIAnOis3y7NhfCDtnngmHCksnkzcnywYKKjPJdOx0lzfL/o8w7OsSwT1vYlP8MUo
 xeDkui005HYUMjGbc+pT9IujVhpu555SYHNYKx+w1A4RISxic4hSUcmu7p+/3MNpBGt1H6LjmZCAqH
 2ux5hGjZYZBJcaBojKfPHEMr3myzjvFPFynmx2GmmKXusBFk9GzAOOCndFrw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_020752_526197_FCD62CA5 
X-CRM114-Status: GOOD (  10.59  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 86 +++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4211a992dd9d..7d90112a7e27 100644
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
@@ -178,9 +201,72 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
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


