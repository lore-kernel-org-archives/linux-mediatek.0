Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB20C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=; b=a1BBIbm1IxRgTsjlCq3PaRdD2+
	nyfkmnWzu6KQpSU14aY3ThGNqwpfFRh56e8LXcdxMQamqGSk+EO2cK7zKoN+k7We3cX0NnPr8NL3Q
	Rlf/Nmr3v7uJFbFiMDAy5ye7aBvJiIv2W3nRRdhkdEkuFomY0oIaRtUNfB34IJ1ZnrdNp4o8QLmLJ
	sjL2hmJDgermvOeFsth06EeADBz/dDz99gLpWXSy0mRHz+oVdSBApd6soLAHq/Nd3erX1Y9EwGVK7
	eXsKhPko55Z9PAemGUxKHMdlI8/Yo6q7Jd+Q+hUikMBUux3XzTlGcsIRSUhh2lKiXMTIZ1AYTirYi
	QxtE+rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmgP-00ARW6-1G;
	Fri, 07 Apr 2023 14:03:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklgz-00AEQV-1A
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id l26-20020a05600c1d1a00b003edd24054e0so777689wms.4
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872388; x=1683464388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=;
        b=xv8CfFkMqYwBmqEr/0E3zTwZfbDRoSkqGO9okB6XjK+ij8mtzHpMfpU1dC3elVbsG6
         q03a+eiBT4MWBRUYtlg7kqqux5UTxr1qY0SIS5+ZSUpcWq1UkzMXDmqMMA4+n3XF9+R+
         1VzX2KsNG49ugAyjqpK34DjONSpeTm2t675c7QmYfoYwpTFWIhlBwL4XEBmJWYpb/eF4
         Ubgiy1xXsXFIpTAOkr4hEpFxX51tKBkPlgQcuCyE6SQIbO128SR06YBiq1T3s96btbzK
         dX0XJHwx4lm/pn1mhWPKge85HW2z8Q6eYo7cxem+Fi2BhfG/qiQ0h2U59tjzA0GyMdM7
         0VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872388; x=1683464388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=;
        b=dh9ALOPp3T19jC2tPEJX9+UmYmR6UYIddRzlYNxAcXYNvjx7uyNbWHfdTNdTh2xcKG
         SdhfRFFsvet5ic26FOZgrSk6tq7YJrOgdh4pYdxC2t2mlpMkkI/AeTCvLV+cqF1nwuuj
         GFQhk3KO/DwK2DMWM6lGShPGFY1bpr9+uAll5CqmT5ZLyWf7CQcDILc88wMqUx8ZhKxc
         tC8KqLWxcEK9TT6xyUF5E89S0H7UeycTMfin+ppCmVw6RUTzg7/8NvbR/GNo3QY0ZIRI
         46iohpLaAFOj+G5FIfK0yXmI6jx4r7n0UTGJkfyxbb7A3zALpOO0jkqWkznz3LXZB/cY
         OtCg==
X-Gm-Message-State: AAQBX9cWhbbO0clknviEz+JpjOpbP5Pz1SHjg+sHOCb4/dGga3wV0BB6
	Z8RMiwr/wG/6uy/Ix9eJR0c9aw==
X-Google-Smtp-Source: AKy350aucb0CvLpPssXEd9Bl9FPwG8/MH1VtJGun7nEPa4wGQ4vwYaAhvCFz4NruqA50Q7403ymijw==
X-Received: by 2002:a7b:cb8b:0:b0:3ef:f26b:a173 with SMTP id m11-20020a7bcb8b000000b003eff26ba173mr1238315wmi.14.1680872387885;
        Fri, 07 Apr 2023 05:59:47 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:47 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 14:59:25 +0200
Subject: [PATCH v5 06/12] arm64: dts: mediatek: add mmc support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-6-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4904; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=BN8bTib7fvPNr/LKVqArOJTqhPRat6Z9u+9b+IKGQWo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO6kOeEKI2JOhHvUO0PHFI/QZ3S4szmHQhakR4N
 zckHpdCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATugAKCRArRkmdfjHURYBuEA
 CMN+VGk5LU73nb+kRR4VlvsgygUMJtW3SMtgbLekKdRbe+Z5V76OAtX5M2CEi8liTEGNOW4PRNnSyx
 872D2u2fJXZBdimzVjOKYSlX4Ie+zyN6YBnE7+rFPrpVJ8VKAuom0ram3yV5nm8uMIILT0OTuNL20g
 7F5Za7bY4TG5hl+XStDVfiwAl8cdSyCgpsIHlQc8bSEvMCnc0Z1QaLw+D+6Ew4aE7GqqYsiffTCyk7
 YmDvVI3s+8JdgKmA6wDrMMOWJ1Chfqnxnb2i04jGbFy2NUu2IPfSV9Lu9WBEpomyB9UyFnwSj5lggd
 ZOKV3PLEeIdt3nHjvAf2cxkLFLzkdb2IgafoN/EtXPu1Wq5AQu7KOl+bUHMwTYbCt86TioYQjbE1ft
 jrHfkzlJ3CJsQKn4GY28b33kL//BcyRyz8LSh2DK7YnQptVH1auhVIWEprDBfDB0dTdoO0UZVhtCDo
 jK43a24CiT9MJOyNsTnCpC+HCC9sFO9xXaL/mnGrxLin4BEU0ZxGQaSsSFTY4/A+eRlkAAtllSVBAN
 Dbnx1l0BlcC3ltSP7jkMSNQog//KpARTeY8qEdCRLEs+6+Ye445ieJKCoIQUf503eQC/QneICzLSfw
 XilBxOa6JOOzBNxS5YmT0lXfnI1RA6CJ+Tq14NYNkza7XUBTWKQ60twwog+A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055949_408899_86F51F72 
X-CRM114-Status: GOOD (  10.04  )
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

- Add EMMC support on mmc0 (internal memory)
- Add SD-UHS support on mmc1 (external memory)

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 138 ++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a238bd0092d2..cd920d09c3fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -95,6 +95,42 @@ &i2c0 {
 	status = "okay";
 };
 
+&mmc0 {
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	hs400-ds-delay = <0x12012>;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&mmc0_default_pins>;
+	pinctrl-1 = <&mmc0_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&mt6357_vemc_reg>;
+	vqmmc-supply = <&mt6357_vio18_reg>;
+	status = "okay";
+};
+
+&mmc1 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
+	max-frequency = <200000000>;
+	pinctrl-0 = <&mmc1_default_pins>;
+	pinctrl-1 = <&mmc1_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	vmmc-supply = <&mt6357_vmch_reg>;
+	vqmmc-supply = <&mt6357_vio18_reg>;
+	status = "okay";
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -118,6 +154,108 @@ pins {
 		};
 	};
 
+	mmc0_default_pins: mmc0-default-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			bias-pull-down;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		rst-pins {
+			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
+			bias-pull-up;
+		};
+	};
+
+	mmc0_uhs_pins: mmc0-uhs-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		ds-pins {
+			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		rst-pins {
+			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_default_pins: mmc1-default-pins {
+		cd-pins {
+			pinmux = <MT8365_PIN_76_CMDAT8__FUNC_GPIO76>;
+			bias-pull-up;
+		};
+
+		clk-pins {
+			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
+	mmc1_uhs_pins: mmc1-uhs-pins {
+		clk-pins {
+			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		cmd-dat-pins {
+			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
2.25.1


