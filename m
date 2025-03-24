Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BACDC36002
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JR3Vjat4//MGEukixFZKwpNgnByay/aE/Yu8JW2MD0s=; b=v48nabQ3B/NM2AJXsCSzxAHTQc
	6e7Mp8VTq6ZDPb+Mtqky3MrS9bCQNeDaahaN71MhYpWrCOdLZBMDznpmgqdBwCWcDipti9YBMiBQl
	nxsJkcgra4BiLldWp6gl4uMkz7uke9s3xsfnPZyt0yRRPH2vwivaI5un7jgas2I4QozkRF3d9Zyl8
	dHFcfms+FOVNPzk6IGIuI5wpf0ujbROnnFVzKAT9gWi8Oo6ZBFueyW+BFaMInil1Ukd3Gj4VRr4gh
	fp8UaONUI3fzmdM0QD+1TEGcaX08hnTTSf0cZ7FuIso4hPv0b7SgFOJCnTkWEES3HmdP04DxPbz6N
	ECCxqO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiHe-00000003JrH-0iT6;
	Mon, 24 Mar 2025 13:56:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiFu-00000003JgR-03sQ
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Mar 2025 13:54:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26583755e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Mar 2025 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742824456; x=1743429256; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JR3Vjat4//MGEukixFZKwpNgnByay/aE/Yu8JW2MD0s=;
        b=zQwEi1szz26LXx9+cmERrTucMnhtIsi1GSvfSis4jOIZ5jLZBgZo8xQQeOTsvjtOVD
         7K5dwKA8wAhyGTN/PN3ULd/j16hQCrcJdurmS0rr3t8m0UY34UktFroxXAeoHCERfhNl
         IqSY1JYruq3dVjbNaphOQec6rtkksiZZURaqFgfEEPGSS2923Kndqo3v58lVRyQppWSd
         Kr3f6YFFDh+fz88WyD2N/sDLlgtJ7BZeKbZ7FRRgwVo58f533hZLJ5th4AlqZ9XCzeGg
         MbiZRqcy63Nm7BufPA54NtzkdfpT7qTJqxMH4l76jn7MP5oGKcXEc74nxUGpZ8nWRqhb
         S95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824456; x=1743429256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JR3Vjat4//MGEukixFZKwpNgnByay/aE/Yu8JW2MD0s=;
        b=PXW7STWcdydmJAsGuzDTIgkO/drjvd/SY7klPNQ28NZ7lF+ZriN3fc1ES0LjfDgP6R
         4e9Nja61JVIEVCwp7hsJU0wEbR4PYXpZ6B/W/FoY5MsEPV0HqC2jacIazn4yGFkhqXTG
         dk2TvPcsffCIrwaVGhtwlBBgpbHy5CmueUZKpY9pQcWh60+jqOKsehpxzQ585Pr8CjHC
         RWPpcpAjftxkYoWnT5FkXsLoBKHI9JfK7X1hhsWDF/5BJwRHlOTvmSJ0bfVbcZ8Tzldr
         zxogXZyvQx0U8dAzERVzEOubMFSXEPVpKZ40CrOOn9Tdl8aJkVnJ+ugY80gBw2jOOZNR
         Fcog==
X-Forwarded-Encrypted: i=1; AJvYcCU4Y9KnpZOQR7SLromP3xfSIZDnAx2KxiAaPQjT8fg8BpJyOqNrDwP5d4kiY8RFX+fDG1AmMvjXam/4oNVqzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz6aj0BsW8GgqxvE+a9rY09dU/W0j+lHfl0La8+woy8oUWLhEQ
	V5Kd6QZRgG18YH4XpGjTvYceyggluFT3nZKrzUkYK9nd2iKszsXblVksEPdX5xY=
X-Gm-Gg: ASbGncu7oGI70V7EBGBP2iF53qgxjjP/lrie323nQlBv7MpRGEj4oN0LD+XiDmt9Bk1
	DKIb739IG67mvnSENNZiGMellU57QQIcb+LWwWFIWSc4Wt0g5szKB/PDUssAG9cPEu2gZmI8tDj
	z5ovPeNEPGTjB3LsdlGTN8oGOeXp1f+Cud3i3fgtAFjgweUPdNED+Hwf7oKmeYCp/PJxAbA6thx
	SuSu3gaea3vohuM7sXUdD5P5mw9qR8cBv5p/W0dFdOpADQbt/StcQVMC4cXV6YwdQWCWN59F/97
	zf0W+6/V5pYuV9568xk3AaNtTdR+9HxEzlyosMlqa5KY204=
X-Google-Smtp-Source: AGHT+IFH33RxIKZKH2JbP0YaKUVRu316Wyz1RxNXnEWmCEW34UaKhoXJkjdKNuiOfa4Hg3Dd/jontA==
X-Received: by 2002:a05:600c:3b29:b0:43d:683:8ca3 with SMTP id 5b1f17b1804b1-43d509e2df8mr89756545e9.5.1742824455740;
        Mon, 24 Mar 2025 06:54:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c587:ed44:4dac:278])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d43f43ecbsm170929235e9.10.2025.03.24.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:54:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 24 Mar 2025 14:54:08 +0100
Subject: [PATCH RESEND v2] arm64: dts: mediatek: add mmc2 support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-mmc2-support-v2-1-5f660c809610@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6037; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tVdOnKU51B2x4WqhOEirUsHUGpi24fZC4xipg7NMb4A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn4WQGonmqWbjvvOOnuWnTu4FnwVU7xp4VVEVlV95m
 3/HxwSaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+FkBgAKCRArRkmdfjHURVzyD/
 0eP8LRNlYpVHgwi3HS2/xN1N9cM+aemGFjdADD0BCVXrDM2npRTrHYB5/aDfwdRamAZO2VUIHR1t/c
 yFAGWCqxYLL2dzIYtW05ZfcbVpB3L0mHZ8Wl/29w4p9omGN3mJdNnpvZaMhz2gdPmRskgUmLUkMQy0
 3VJ7/+01qrMZZuM5Jk9QF2tdwCwBTQGUh2LKgIUMWtxsnrIpBah8zPR6WbGqxmPSp6q/L+XLTpgMMn
 9QurzShlkRBcrixPdTYmxcaocHLT1S4kfeC2obRaAp6C2ynmjkjDXJHS6lGYgU6JA6mNCeN+8Psl7v
 KMNaSioC/i3uCUKJ9/535rHdc34LrluE6LxYxH53L8BPMR9zL7YQd4oMlntERr7d/YW4IkPtrcR8CX
 cVYVWNqjUmcAa/ee0/Wwf2yaw8s5x+DZuN6X9DfLzLCoXH780bz0AMzY8yikO2ZC5yzGKOnCya4i5Y
 aJJ5Kn3brO92pEMhdNjBUkfm+9kspBKlR2swOnfxSauVu+3cuF/yRiPhEqKx7Xy32/ItQGsEhRA/DA
 DxnS6qKAWihMmpGQ3WbuASdGvqq79aRaVit2BPKjgC3fd/q4nj3qRR5zkJLLaqci4/OKup371gdwPp
 Fgbto/RHc7A9hy3sOEi6VA6fzLuo0TBjijhcxtpqsfe+9Gsry/XhdgUMcDzg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065418_061550_62532ECE 
X-CRM114-Status: GOOD (  10.66  )
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

Adds support for the MMC2 interface on the MT8365 EVK board.
It introduces a fixed regulator for the MMC2 VDD33 supply and configures
the MMC2 node with a 4-bit bus width, high-speed capabilities, UHS
modes, and appropriate power supplies. Enabled SDIO IRQ, wakeup source,
and kept power during suspend (to save firmware module) for wireless
chip functionality.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Apply alphabetical order to pinctrl property items.
- Improve commit message
- Link to v1: https://lore.kernel.org/r/20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 103 +++++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e274..a87f1b3ed6500 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -53,6 +53,15 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0xc0000000>;
 	};
 
+	mmc2_vdd33: mmc2_vdd33-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "mmc2_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pio 121 0>;
+		enable-active-high;
+	};
+
 	usb_otg_vbus: regulator-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "otg_vbus";
@@ -197,6 +206,28 @@ &mmc1 {
 	status = "okay";
 };
 
+&mmc2 {
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	hs400-ds-delay = <0x12012>;
+	keep-power-in-suspend;
+	max-frequency = <200000000>;
+	non-removable;
+	pinctrl-0 = <&mmc2_default_pins>;
+	pinctrl-1 = <&mmc2_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+	sd-uhs-sdr104;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	vmmc-supply = <&mmc2_vdd33>;
+	vqmmc-supply = <&mt6357_vcn18_reg>;
+	wakeup-source;
+	status = "okay";
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -324,8 +355,8 @@ cmd-dat-pins {
 				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
 				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
 				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
-			input-enable;
 			bias-pull-up;
+			input-enable;
 		};
 
 		rst-pins {
@@ -337,8 +368,8 @@ rst-pins {
 	mmc0_uhs_pins: mmc0-uhs-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <MTK_DRIVE_10mA>;
 		};
 
 		cmd-dat-pins {
@@ -351,21 +382,21 @@ cmd-dat-pins {
 				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
 				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
 				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
-			input-enable;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			input-enable;
 		};
 
 		ds-pins {
 			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <MTK_DRIVE_10mA>;
 		};
 
 		rst-pins {
 			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
-			drive-strength = <MTK_DRIVE_10mA>;
 			bias-pull-up;
+			drive-strength = <MTK_DRIVE_10mA>;
 		};
 	};
 
@@ -386,16 +417,16 @@ cmd-dat-pins {
 				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
 				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
 				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
-			input-enable;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
 		};
 	};
 
 	mmc1_uhs_pins: mmc1-uhs-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
-			drive-strength = <8>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
 		};
 
 		cmd-dat-pins {
@@ -404,9 +435,63 @@ cmd-dat-pins {
 				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
 				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
 				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
-			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
 			drive-strength = <6>;
+			input-enable;
+		};
+	};
+
+	mmc2_default_pins: mmc2-default-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <4>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
+				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
+				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
+				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
+				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <4>;
+			input-enable;
+		};
+
+		sys-en-pins {
+			pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;
+			output-low;
+		};
+	};
+
+	mmc2_uhs_pins: mmc2-uhs-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
+				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
+				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
+				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
+				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			drive-strength = <8>;
+			input-enable;
+		};
+
+		ds-pins {
+			pinmux = <MT8365_PIN_86_MSDC2_DSL__FUNC_MSDC2_DSL>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+			drive-strength = <8>;
+		};
+
+		sys-en-pins {
+			pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;
+			output-high;
 		};
 	};
 

---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20250109-mmc2-support-96b3ea516186

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


