Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFE6C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHZCc6iP5cyLl1hYj/g5I+gkLg+6HSQEelOpwfLOUMc=; b=ttqivXk6PGaqcKzT+qyx5iSXTp
	CGIM9dnW9e03WZ3wZbDOx84jtm9pXkM3eMk8FCAyUp3ZHoFCUB258lNYuDrHJi3h9sRpej7MQeqCI
	VWJwJKXMZlqenMdzevkSyc5MlIBEbVe52rKvUxfYZ940nXueB7ZOV2MNZ8pp5bcoEG7qFLIBVHEa2
	f1kex1oSxD4SETg6sJC6mNnh2Sc/35Dh9Kb4/nIP9yv0wyCH/BzDXaRM/BkSWzZovo2TI+eRI3TcN
	2+bigcrbtFfs6ZQkUrgYqYIYNg3jVOgefsCoM7DJ36UX9dGwykG7AQiYMILFxtBDJ8XnUhH9cyjXS
	Hue8lZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prdUs-003mx5-2r;
	Wed, 26 Apr 2023 11:39:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prdUr-003mwI-1V
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Apr 2023 11:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MHZCc6iP5cyLl1hYj/g5I+gkLg+6HSQEelOpwfLOUMc=; b=cD/Z1sQ+nFalO1JHUxIkJ/f2kO
	4iJMS6beMVwhBso/HaBRAxreSxBcUOBYlkMDtK1kNXUoc3ZSWpJUf4mUSLDajHP+n+/ZLw23WpeZV
	d7mONHIyag+LRnouJbUjykJ9tmn+s3ee8EfNkvHt6S7ehrs6sEfD7lv141EL9H/AM/LMNasAKNcCa
	R7/keGr72JYOOeaqUsPpoiTiUpkiwK87+/Gq7hz4SW2+p4/pgD21WjMgp7uNm4GtAD8q0KmNBe7Yq
	Dh2TrC7V0ot5dO1EumIQ/G30ozt8Ig9er2C2ejmHgONi692hTarY7qmFFDiABe1dh6xWlbSyQRTBT
	rUNViMug==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciX-00AwzR-12
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso37449075e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506183; x=1685098183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHZCc6iP5cyLl1hYj/g5I+gkLg+6HSQEelOpwfLOUMc=;
        b=Pie75K4s8BIhiYlJtqo1aE33z9rRXKp084j6G7Y2Ilh2Ph6Rgn1HkDVTomOwlo+cSG
         rGxapLjA39BkiPoer7JDCuJSZf0dntpYgt1/BHq6Sc6gGJQ8JzPbkMLO7gjCpo4qhdRP
         W5QYOkT1CEwSt4M5gTyZXkn0PnF/BTxMXENZ5DEMlRw7Qf9J3zLNuqZBvRxke1STito4
         O4WR+cOiMnOZqDl9gyfVm0+GX8Gxj+3uTRWsqqBuXYNkN/q5ZdR4hlxl4a1ZINI799AQ
         QLZBP+ZbvVMXgBKF0IYPzm97622vw8ase2z3m0PqbCStnx9t9hTZfJx4GwVTk4iXjNvo
         cT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506183; x=1685098183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHZCc6iP5cyLl1hYj/g5I+gkLg+6HSQEelOpwfLOUMc=;
        b=jQ5aNbbrJK5eK6cwvSL7eFnj5YKe7vZvk4pVgmkji153/K9n2glQwD8wkXmi7sRAHt
         oHvRMz56nYirHlBTnlNkOOHvtUXj4j7Zbf0p4wyd+PoOyYgZWDjp3mIooopd47HRGC3l
         6RJNi841PvcpU9VyMRQgKBR+X6/RHceurkueST+3KNOSexIIp+YCwbT830I4CEGBbixL
         PWiIHPhR+jZ9VxL56mJCDCyF3rcaQTa19Qx1e8LoZcW9uH99UO9N1rAEzGg6hyguTF9h
         /TKhJ3DJrh+2Ws1m83rBuzcAUdsX9mxrgmAULXXjFi1FJpG0Eql8k91vhlTIdF+ABMWu
         USPQ==
X-Gm-Message-State: AAQBX9fEntYfoRuP3rn13OTmfZruk7bx62478atEpjbFInxZX2q3KJAX
	bV9eMFANdW1ycC4o98Uou+1sDQ==
X-Google-Smtp-Source: AKy350b+nkeh2k3kvh6FTUFlfqz2hgtLY5Nrp0IeTIDIAO1j9FguHfr/KBTgS3go1H7rvFSBHL6iDA==
X-Received: by 2002:a05:600c:21d7:b0:3f1:7a57:45cd with SMTP id x23-20020a05600c21d700b003f17a5745cdmr12735166wmj.28.1682506183332;
        Wed, 26 Apr 2023 03:49:43 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:06 +0200
Subject: [PATCH v6 06/12] arm64: dts: mediatek: add mmc support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-6-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5035; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=KUgwewXk1EivxDw0z0iI41cPCEtipZA2btoK/tgfO1Y=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/umbZhwtoBekc0Z2zrbAmgbW+PJfC5PmhHcFL
 +xNsY1uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURZxAD/
 sH7glPjJVGqd4zDlFQlqHk13vRY2wKNLumy5NScLHrqU4b8P5vqMZLUhfdIGJhLB6NFBeX9pjFkJB7
 kH57Z9R8WsDVGc3sv5HnICc27mRmrXjMIS9zRIrrxxMigydLfTv2Zcbog3V9NIjJ1JcN4vrNxdLsev
 SafpnNi6Uy+D+9VO0YUfKtgFrq0ikbQ5HAw4qi3vOYK95kJnNLFn9XvxbIgAvEjaO0qIo6tmDQzUoq
 mLoue4Tyb5UqU76XNSnqzTWPedGP4Qa8pGVJUxGTrREE7RuVpPZ0imjO+I90VPzYJRvrgXo2nU6UOC
 KWEYbEfulOeMhGKwsC/d0e1Zf8jjoIVjhrnsMsv8+A3StGJItSiPIB8ldZWRx1mJxI5GbnsSQLu7Cd
 9Um7SlmVN1m8Mr/AkPWQn4TlgUGvoY1mYunNULMHZR9wETEZ8s+8yXT1vsrzrme0iDoWQ+0D5RmZhu
 85drnIja/FVz5kyT8P/Jz+jasaHVRoff9U/9EpAE/tz5Gc5M3VVLTh14eT8eXWmjc6qlsde7SaQYPY
 DjdO8Rrex4qHi4+8L6VpdEly8Ht1zKi91c4Jo2BKfuvjFAFWM0c/MQ8Pqr12xR1xQysB6/22d4ka5f
 HpvxhpEViJ/H7Mnh/N4aKA1gPPbZ3UYkYRYTxv3mo4z7eUNEgVzAWaih4RZg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_114945_608412_0411BD0A 
X-CRM114-Status: GOOD (  10.11  )
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


