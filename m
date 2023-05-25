Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4327C7EE32
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k66rQPOoFRNzRR5aSWWYeBLcZa0SzQjoYuJlxSEKAck=; b=Y4mFw06AUwFQalrCfzi5CRa4dh
	uhE2yFdMbl5YTALR1x/7Lxh143kIWU2G4vpTkgG888CZ/lnD381ukZpZ3DVHFq90v3sOheHvwaj8U
	+JUZuNIxGG27D2bHYDk+bhfV11thkXBym9QprcMbicU/iEtTnnHL6myc/NCJqRZUZzmQOLomAUycc
	39NlBhOM8/S1yJ8wp4/gyIN4e4O5BC1gsveATz4JiqMVHeO+gWZRcypjn05P8exRLoKBqwq3LsSre
	X7WplpDhZ4bFTrIcw5vCmgEeXeKAJuat1NZ+I5yhIsrZC7gaWpwEOZ3WeLZD9igySBEl3nB+VvDs2
	9ckfgr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NW-00G9i6-0F;
	Thu, 25 May 2023 09:35:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q4-00G0Pc-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:34:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30a4ebbda56so1786476f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003639; x=1687595639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k66rQPOoFRNzRR5aSWWYeBLcZa0SzQjoYuJlxSEKAck=;
        b=PucTazVrtWuLa08CIJ0EJLTZEvjzSWL/jb8Wnzyf0WybcJhpEN/4EkFN8blDRe9eji
         XIi9f7VJhMEE3QhOWBV/lrCNaPx8tr5vq2F5nrpu9P4T4JjlfDJyeg4b1W1xTh5rWwrT
         juZy4AZcw2kO/J82Rk2ZU62rloyIO3m7FT03I90yX1G4yoBszg6pupiV9AT2IcnuX0yY
         v4CuHrtb5rWGVLc1+oqlvN+KN7IGkmn05FF38eRYuiwgTWK4eF3PtQ0BVpAqavMpjuHg
         9FDOPzGEVUiJLtvCYvbIfbzJFGNAcgiNG6dm1CiIBUFoT63l9mxrJfyOv0GgJDnzur/K
         VhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003639; x=1687595639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k66rQPOoFRNzRR5aSWWYeBLcZa0SzQjoYuJlxSEKAck=;
        b=SbBisSnwxgR94PhdRCPTQbOlEyKbPJglcl5r/Q1ZXF7RAfWgG3wuwRC+EaMNHMsyJg
         OneYo6h5qr+GiyJb3Iqc6TAYf39/rTYxCD6OKQM0gHPSwwBJK84TOVg/u7vYAdXVuXVK
         OB9I1Q8ErumuFb/xhmlX6kx38f9eXvlUGf/ErRcLl+aGrCr4cQmX5hzdHOs+qHXAynbO
         NAKZJir4XsT1v86sJzVdyuOh8zlKfUGpFYHjxXsu094unJKqyxJLgwgy7VrlpfsZ5QTJ
         cPjrJ01CB77W1J1C7Ecj1BSYqYP+IN/iFhJpjwG5nGhMfIUIRuRIg9NyINq+38Uz0trk
         398A==
X-Gm-Message-State: AC+VfDw7ENuP6h5Dcvj2dfsQFxPoCgU8IcX5Pg78DvQrytdrfOTqQ6zn
	orBkRhssqGSIjUZThr6IbTflWQ==
X-Google-Smtp-Source: ACHHUZ5b6FWJvWuLmcFmG0FqA7r6gG5bur7xed3wtKMNGvpB5D5h4OyU7akFNruCv5esO16xgPnDMQ==
X-Received: by 2002:adf:f310:0:b0:2f9:a798:602f with SMTP id i16-20020adff310000000b002f9a798602fmr1651121wro.48.1685003639300;
        Thu, 25 May 2023 01:33:59 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:33:58 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:14 +0200
Subject: [PATCH v8 05/10] arm64: dts: mediatek: add mmc support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-5-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5033; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=zRgcMI3OkRmlctIxdpBDkf1niL6uEIqNHnmecLTeVcs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1v0C1JzXuYHBINqiREs25z5avZLyFnqbvkIyfF
 P1P6vriJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURaVzD/
 48V9TVKVorF3jjzO3fhNZt0OoREi/w4Ar6RLUFway9187nmD3w7cWd912rUMa49pTNLAmNdHJ6L6QP
 AmPaci6hXjhFXcd6vOMSQOiiBk4PRYnNjFTFpR4yFearUXJihawtDmIqnnVcOIW7Ow+hTLmokEi+Dx
 K9Rx+AUxObDjweU6qc3FGIVDZOCGtgesY3Sh1Vo88qJxbEsekFReHEfDKZwYxL3LNucdHdmrx1AMNc
 fRDVPrXuUAMvQgqRDWlYmG2Pmj+oKoUSbOA0OpsoZ2NWUcJ7psosNgMRU7AdNcLFY8PyvydNM3TyZf
 5BaKExGUVVhYVuTyFNEg9QNPb2nFTLnoXnjdnDYNw/SKPVkL4FqOhH+ppfK8S+rxcJq7dTlUXdrHbg
 wbI2H9P3LSzlhUUS3YKEw8bgHPQ2x0KHull70h6uCaCWyi7efh9Tl2nn2wqvfNiEv4CPssw0msxAAJ
 zFE2W59N++DaWRNxkYNytsvCizMrOxtIYZ8qXdFIrzMkA37hzZHCp01b0Z7We/Ivi5sYeHlsSmU33Z
 FIjKIiLpYuP4XMQIa/YH8ygpHK1TKQ2YX6L5Or/TofAs0EHDs360J4Y07Vhz4rHBrBG9oHNBXdkRBl
 qThV8PLma1BsxhGyhl4pqKovKgN1L1+oA5AUDLnPgsHEDrLKtfSyggfgXDuw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013400_601259_1E2AE853 
X-CRM114-Status: GOOD (  10.12  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 138 ++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 6074aa9c1c3e..6e2f3601509e 100644
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
+	vqmmc-supply = <&mt6357_vmc_reg>;
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


