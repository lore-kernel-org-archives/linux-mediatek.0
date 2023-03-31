Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936E2C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=; b=ZBVYvgmS88raMuVdULhUVgZ6Jq
	EdmmUKJrmTAp4Ju5ntE81iYgYlitGKzdUEpe1S2HFQ9hBb5Jvtk2otzvVW/CsUD91rvY9Jr6tSluK
	P1ThFnd52QYDLv1CpryUkLWhBn8Lh9UksBDdnPa6JaZs9R7dUIM/UMXJ2eQ7xheMORVB56O3FzSiL
	9y1gwOxgsAQfUiiBx0e2/J2yUA6wxzic9nn6laTIkA8mIq9jTV4Z2Aej8Q9KF515/l7GFj/BxTqMa
	PDFouCc1CvlswBn5FS9YMkyJ++zv5PxGv2BXV7re7WFK9q8+bOfxtIpnLtZ8P//3+fnl0NrQIlaaw
	Ik4bSuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJl4-008VAL-23;
	Fri, 31 Mar 2023 18:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJkg-008V17-1l
	for linux-mediatek@bombadil.infradead.org;
	Fri, 31 Mar 2023 18:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=; b=IAhBEvy/uopBiQNCCWaQuwuEWH
	bINIUcLXJaE/dOBpNJXeqlbsboPV16ZBpyNctFmGUQVK2su52FOvyaHs3nar+bqDa018mtIHz9+Bk
	uZy0htW9ZHoWTJsSGalgbOmmE9T6OgWoQTxvOW6dYXtBV2aLKHOhO8qcd0gUDKY5GJ7eXSNJ5wNzW
	2FCuHhQyEeeMIn0ecOmaVslMM9nDgxT/owknJWs5ZSdbq2nnhUatW+IrmRZYQL4x9iXYyOQPsWIHC
	W3gSWW6F7Bubigs5fOPxqvXyBJpEpWmGhMdeUZNyRALO1Qx7ufUOW+8fVi9WFtRiewHmlfNTg5OvO
	35BBZENQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyk-007kGa-1m
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:56:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id o32so13366925wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=;
        b=tVPD7Mu6GPd936gPUMTulx9mKMNrVheETZKTNRpF3YEJU8bjaMDvVTir44rnSEgxf6
         fsJJP0oa/cTUFMdYeg0pBclwxC/wU2rwEyIQfpfx+waLZJ8SbsqFrmvdWYbiL0W0rQAr
         yjS0rI762JZt/f6h3XxSOEe5e0eiDLCCRdCRwH6leYY1k9HiXwYVUqRYubYcvmgGeeac
         hZwZCAG0ye3rJW/iWzHHXss4P+nClM7/RfA79b/FHmsCt1sQnDD6irPzIMIagDctOrzE
         UJI8l03QxIbjAkcz8b4ITu6Z7w6bRge/2FWBbr5xH/29pzgLjjxBFl4BDzwQ4cRjINZH
         UyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEqKdJ/cRRwoQx7sfrrkI2nxtWfAGamDLYnb1lO/djg=;
        b=FBukAP10qRWqsQMAiEPu1G0dh8kxKIb5hFW2VKSR+t3Ktb8dJSbcBAN1XmvZCTVaBF
         8I1HyJ3OArWQ6eHyq9T+zk17K/nfhVbjlO0pMvKTkK2TEUT09XrBTP+DnMOieVJSgQYP
         cXPEve6itCxjJsqKQOG+lRcpInfUeXlxD0JxcX8zMoLl11+akIAso/4mdFtofJhllP7n
         GCayQFcxUv9eKwtcXTzhd5yKxkoO22V8G1IHlZy0crIgjBhXaoXJ6NlnjSEjuri+exA3
         xlOtWuM6j4ey71+xNT/2yaGLgrUTKeTwNdnJYDpaiboIq6V4nBIEo+AiGIfauzen4E2o
         4bGA==
X-Gm-Message-State: AO0yUKWHP2RtL3rMbOSsdZIzc8OCHoQZ3+1sFTx18+sHU41910Qz8TqA
	EbYyRTlLVd5x5BDhfl6k/rGLBA==
X-Google-Smtp-Source: AK7set+PcyMjlMi2k0dOLnWAodlIA/RHEMeEYoy3JRA1EVWGiqsJtVfC5R6kYgaTqIsJ7OqIMGTUGg==
X-Received: by 2002:a05:600c:20d:b0:3ee:672d:caae with SMTP id 13-20020a05600c020d00b003ee672dcaaemr21701293wmi.36.1680285339282;
        Fri, 31 Mar 2023 10:55:39 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:49 +0200
Subject: [PATCH v4 05/11] arm64: dts: mediatek: add mmc support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-5-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6Ue0pNXCByGaW40PrlB0Qvu275uRnxwtVDAgN2
 kv5uifKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURaR+EA
 CcEAacfu2Fw+LL+12biCmeL02cEynkdp7DYTz2PKzy+ZUMzuA8ArmBSVNT5+7RheszCsY3wnrSkUYl
 53g9jxSnT79arrk5H5cNOalpNMZr0CLNpJNEeCG6SPdMzi08BzhxJwdVpFSePIc53qMsHVrT72EQGh
 Amzyzikh67DJiTJffkNOoVZ21vq+43YpPrRxTBzqXMDDZ0N78+m8w1pSQmR24k+XLSX7cS+brgB5mY
 yeJKXGs9ZaxvHcWk/JoD8ZNK/0SyayosDgC0bUYk1EdIkYt439OG2YY12vG7PCQU8RTf5KlCe4ik4N
 ik+4H92GDibiyE84P07aBPrVuwst6gbIh8VdP/hd7Xh6KiyWfc2R+fhcp+EGE0uGiX5v2WMSUrL9PI
 uaCvmFcm2fWyPOluSn05VB9aoo+STgqDnkEYbpkf+t0W9EpaaopYZ9ZNPiuD4K3csVtePYc3v/ORIM
 vQWt6+QLbV9d/CDQCdq3S/J7YVDQDyjYdW1RQlrLMG8gTmDU/nzIeoWOxo5MT/GXqv/wjXNlY9B4u2
 40Ff/1sHUQgY3CkpHrnD5+M1sUTcT9Vg5loAQcoaq0CmF6PE5Rpey9+BIkxV9MUNlVuTD7iq15XJfh
 83ldFpUwidQxIPygtFkNiZfz4K0T1Km9jyFQBwe87pct/svjohgPQFE3/3xQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_185558_897309_76B69AED 
X-CRM114-Status: GOOD (  10.23  )
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


