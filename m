Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24292C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLrF8Lyon+lRRcj4/8IUgpbSTKbpVT3/7eOKhJdTSN4=; b=D3jAfyPzEN5OlQTvl9/DXZKjzm
	39k4W3BTt0n+Dyk7666ucjkXqeqfFHKxGEg83amnfyrN1lDSEMf4asxM0uZ5FAVJbkJxL7nYaYFRL
	uS+YEaTwOSQYG2fadurNIFz21EvoScyhVRvQbFWfs+eiwdzdXIi2mZACL2x0QaTTXRtL/XmMIjF6s
	duX/FXeJOB5LBrAJ/EETzrxrslgs/JPzyYe1sQ89Ufsc2GiOJVooKkzzA/8DXMqTS232JK2le+R6C
	RwK8NIiIdyo+jXk99ipwCEeeP/90e5ufnsNiTbZCubQkaVwYTXd/+VsHKFYwB3BufcOVDLm0g0UKL
	cKcgNDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXK1-000N2S-J2; Tue, 07 Mar 2023 13:25:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCm-000JmO-GR
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso10374168wmi.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLrF8Lyon+lRRcj4/8IUgpbSTKbpVT3/7eOKhJdTSN4=;
        b=wb+RgBUkEuRY+hKAiWUOlOl7QtxJXniM3HE3nTXu95DL4zm00qCTqqql3dT1Oacal1
         PJ5W5dUlmyJjobXgrqG2Afo5skJBLFcOcRpXeMBonuvQsHPWGm038xNNOfO8gjGPVQeC
         f1e5eiCXSVmv79z4S5ZE6twk0YEXajzJZPwAH0Y0YJ3uSmSETtNna3EBOUPObem04DgW
         Iw0PUohV4/GaimqO9zlzB2vABmD0jVZJNaWXryZZGQBonniJFggKdE1H5qJIUg/qfzO5
         S7eDrV9iHsa66wKjF5NxjDVVJlc1cKQ2pI3CqBcfpI1D1QX2yji9OE/3W7CGO9H3KYjV
         iZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLrF8Lyon+lRRcj4/8IUgpbSTKbpVT3/7eOKhJdTSN4=;
        b=uOOi/F8f+pxpfFy05nGVXDM1MDKHgbavqXsEhMoW3B7PIzchSix6MuQVFLDxYCeaiM
         pthD1RXxnKJLzAQf1uom9qnqwMlaq0q5xTNgYSHqglhazFizk5Je9HSu1jiOd9yigVdo
         DlNP3oZOZJ0XvBIvw77nodlprrjpqiwZZR0IROrrWeDsNn+0noyQEjh6hW76LaKRxOp+
         H2k9xZCDE/FBIyOrCY/Ys7uAnkPh7syNkd+9SjIN0yyoX/Vvy0OPeukzftrqPG2hkvHS
         F0mvkGTYn0gEROkRxvScPTQDzhOpV0kMR0XnBMKiL1pBrRalkzsM9WpRmoo1Ah/T9YM0
         zr2A==
X-Gm-Message-State: AO0yUKUWqJruBUyM/h/PnmW7Ep+nMaHsujD3YyfOeFCDuH51Gu/I73dQ
	YYmblZFNvW5YTuhrOph681RBGA==
X-Google-Smtp-Source: AK7set+e6Vi5onnL4uhoDo3Ml0k6sl1Cu/rHLXvGgYRU2tIEdvpwgke0JtDsAvPFU9zMg7sCw1kKHQ==
X-Received: by 2002:a05:600c:4f0c:b0:3e2:1368:e3a0 with SMTP id l12-20020a05600c4f0c00b003e21368e3a0mr12631189wmq.18.1678195090908;
        Tue, 07 Mar 2023 05:18:10 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:39 +0100
Subject: [PATCH v2 10/18] arm64: dts: mediatek: add mmc support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-10-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4900; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=FUvX4Y67PWFG8krX65sQgwyrwAHkOa5g9vcgPs+bb7A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmF1flymczK0c644lziXoPxw6UphNp4tJcYIBHB
 sYXsAe2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURZDvD/
 0RAz6KKvNuYMOaCJVO+YlwFHQUl7ufVeRqAQ2nUoP5miqPvR5GZQtPOzLqHo3sDVi1ZORFGkquGz/+
 gLhpjCQm5oeUJeIxO+P1iDuo2HzPYUED09/OZtMZjA++LKyB2skEsy0h0akW0gE+5oav+IDl3EYagF
 Mh8QzZRRBAuQrGrbadno2PvFIo/KTQVOiqr/32uu1J0bxJuXs531UBykd2cpunQrJASu6/1b2Qk0jd
 MYxdbplii8e24onYbJNAiqFnwUHgMTqsk5pFQadEJnekEbioWUW1Dk3TH3cjvwLGVChogK4+f2cOlP
 uX9xhyCkX6G0zp/L9jYxqoVfRevcKE7DH/iKqarbeKOtoG3odm95ShE3YLsceOi07IA5Zzhvg85fNe
 y0phjAXbkE3q/jbhqgTJ543mEr6JqZyVoFz52t+oaETITDpMOs6rwOz3a94+8Sm073eS/G4LBXLaPp
 JxP7lk7+g1rhyRw3G+yR5xn0wNZ9l+bk/dzv0CU/4nj6j9peOseXFSB6GLWkbNXJLu75TDNJY6QR6o
 PnenTfT2QMVnPCr9WBNjZafATu7zqOR5uK1fVBCVMvhRVvY+G+pqNtNDTG5+KFP7KJ+e3Sr0N0zIc+
 MQDlZsAh4gIPRH7xRJ9waPPqs1clC6chfhOqVRHjiteht53x2EhRMkd6sLOQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051812_662994_E4CAE0FF 
X-CRM114-Status: GOOD (  10.17  )
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
index 2f88562c638a..b5d018686cbe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -97,6 +97,42 @@ &i2c0 {
 	#size-cells = <0>;
 };
 
+&mmc0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_default_pins>;
+	pinctrl-1 = <&mmc0_uhs_pins>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-hw-reset;
+	no-sdio;
+	no-sd;
+	hs400-ds-delay = <0x12012>;
+	vmmc-supply = <&mt6357_vemc_reg>;
+	vqmmc-supply = <&mt6357_vio18_reg>;
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
+	non-removable;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_default_pins>;
+	pinctrl-1 = <&mmc1_uhs_pins>;
+	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&mt6357_vmch_reg>;
+	vqmmc-supply = <&mt6357_vio18_reg>;
+	status = "okay";
+};
+
 &mt6357_pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
@@ -123,6 +159,108 @@ pins {
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
b4 0.10.1

