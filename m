Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E014C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxEqp9eFj1IvihyW4QXPcuVnqpwzcR28MiZSJPk5mMc=; b=nSUbyQOHd7NVHc2vsaZwFYqFye
	yYmJJUa5tA+YMxaf76lrC1pkm0uxWPfZRWlqPM7VbP2RrMG4aQEVksvwNp2F9R8/1F0B49bYXRChx
	gAP47b2l3uAlGA1jQcDwy9WRJqrDzyee2cN8RkdfTy7ddR9uJfEXqd208HOldLd6oCU96qhBVL9LW
	AkmjVg9TZ7bhUYsZBhPxqPqW3xF7VnXXVyjoJ7EZFQSybh7KYdduEQuSEZxNle4alAXAjZnGiRhPz
	NP+ge9Bol1EwYrHeAP+lDMS98ZJBmZInnjwxI7wFnOiAx6kA3xzd/SNrQVw5E7mJmfut1XhBHzXSw
	CXiB0Ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcj8-003eoY-1T;
	Wed, 26 Apr 2023 10:50:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcib-003eY0-1x
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3047ff3269aso2012426f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506187; x=1685098187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxEqp9eFj1IvihyW4QXPcuVnqpwzcR28MiZSJPk5mMc=;
        b=uztePX6uj2AI9ccX28BMm06IVHwtalEFUK8LPofCxrrjSNizDXXIUhhwBnfq+lah5c
         qZ4Ql20znbYMBXWaiJGHwVC2tLMxox0Z1faetNFoL161VAfjg61hGm6DfmVDdpriQiTN
         S59nKBKHYx/j1lU5HNQKc8lo28Asgpw0nF2wQgD/1oUmHP52Skn0fSq1aPHx5dP4TyF7
         LUbTmHgUo3tTnaCIxJ3IOcAwnejtERO7Oner9p8KX6fu6di4lnLxiUuVwKz7lpGs3d24
         OLYImL5ML2+Jfjs7NlT/g7FPVoMdM1n2J0XScGPflkUMoWmwLl7UpKIHC3kcHm3pK8oH
         LVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506187; x=1685098187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxEqp9eFj1IvihyW4QXPcuVnqpwzcR28MiZSJPk5mMc=;
        b=I7Jk+N24QDP7ugEqlhB4kRBjQ8YEts4KjYBFiLE+HyJzvA8DanRXynruUWTNbXYpt9
         4+eIUkMayZXgZBGBGAi0btSHcqhoEfghqSPpn/PMucs3DjmOO7GVMKee6qbwIep9CY/+
         NrkhCEk/HbUkUYegmbJ2yWTjk3N/pUQPDazTXn8XMOoPDmJL+ozphJYFTSzysTpeKJJ1
         f1EzQ8YuMMv3sAYfvac7GrT3vixjTlITNEqqn8B7ZGk4UekflW8yqjV2BWe3EXiXu7iN
         ySWmqmlO2pcVNUG+rwvpHjxTFffb1e1YeDFq8GKmcF6wo8mESLyKviF/lNKEBQuhmgN/
         EHrg==
X-Gm-Message-State: AAQBX9fY3mz/bMXDMIXctziAHLbybE3nedyGzLP+Fdkg9yVjTahWSVCc
	fpAfun7MUzNKyAdGZw9dazHwGA==
X-Google-Smtp-Source: AKy350ZqN39DuFrFqNueYeUpWSDnpS+1LhBpW2krDi4r6fP4OnNm3T7OnOE82422foljdoS3Ky2GKw==
X-Received: by 2002:adf:f8ca:0:b0:302:df29:cf15 with SMTP id f10-20020adff8ca000000b00302df29cf15mr12683949wrq.46.1682506186806;
        Wed, 26 Apr 2023 03:49:46 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:09 +0200
Subject: [PATCH v6 09/12] arm64: dts: mediatek: add ethernet support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-9-8d6b1cfe7f29@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7EszwhdlVZWdtXiG7X73axwD3s6F8ryAMeolNiULVRc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/HPyHY0PZGh5cXqQyVV4RE1tHH+CJa2pwV4Gu
 BKP6bTmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURf4FD/
 42hXlvJEcBqPTrWTYquuNtcQ0VEdhVDQvrMXohmXxJ+pnOfoBhJ/1kg5U4F/S/D2LlHFhsLx1d0P1j
 n+JLdlh80wm5uWNbKpoS30ygPLCUupERN8Zn0snU9KeXNuCn9ZDT4PjLMLEiHQPjNyzQKHaTqLEaH1
 idSIpMKQywQW6X3PIxhYFP/soKH1L53bYKjre0vjeuROfMLatYXd5xF/gxDj1CNkn4ked+uBbBVOxO
 1tRbwofJhQA1Mr4UR/dM8sTItLhVSTTASS7DtSXb/1WJZxYoNxyBxvLJsK/yuUlU4MCLnwPBm8OwCL
 YvyWio/+DH9gwNTthh5Gp7Jjzer3D4wmvUflj/AyY3ut0dGOnU5nvxCe1iABi4oleIqiQqa6VM6zYr
 aIwE3GFf8tdlz+jB44N04jgqxGpoZyn/cxQHwwuke85qb6/RNGDcjjOKvGy9WIeenn1pwCdOIHNsw9
 Qj6rC7+CHyoaREhLk4C76CKFOOnTwPRPIDILOcY0gZhKAPwqsoTl2pnYxewz0lUNMHBWMKSlPr5GlE
 HXFMydvj5igYx/VlYBFkiUfwn/XVApdfInmU1HRDgGSHMKHMLjbL9isTBVDNiU0+6rE5ECgqMAixCO
 vUzllLkYr6C4OBzC3Fn/9bJoqci3vs5XG4sKPgw9cvpOXjqk6Kbvjj3UsDWA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034949_652355_01148448 
X-CRM114-Status: GOOD (  11.85  )
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

- Enable "vibr" and "vsim2" regulators to power the ethernet chip.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 913e09545030..5a4c41dbd3a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,28 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&ethernet {
+	pinctrl-0 = <&ethernet_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&eth_phy>;
+	phy-mode = "rmii";
+	/*
+	 * Ethernet and HDMI (DSI0) are sharing pins.
+	 * Only one can be enabled at a time and require the physical switch
+	 * SW2101 to be set on LAN position
+	 */
+	status = "disabled";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <100000>;
 	pinctrl-0 = <&i2c0_pins>;
@@ -137,12 +159,47 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by analog switch (multiplexer), HDMI and ethernet */
+&mt6357_vibr_reg {
+	regulator-always-on;
+};
+
 /* Needed by MSDC IP */
 &mt6357_vmc_reg {
 	regulator-always-on;
 };
 
+/* Needed by ethernet */
+&mt6357_vsim2_reg {
+	regulator-always-on;
+};
+
 &pio {
+	ethernet_pins: ethernet-pins {
+		phy_reset_pins {
+			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
+		};
+
+		rmii_pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_EXT_TXD0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_EXT_TXD1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_EXT_TXD2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_EXT_TXD3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_EXT_TXC>,
+				 <MT8365_PIN_5_GPIO5__FUNC_EXT_RXER>,
+				 <MT8365_PIN_6_GPIO6__FUNC_EXT_RXC>,
+				 <MT8365_PIN_7_GPIO7__FUNC_EXT_RXDV>,
+				 <MT8365_PIN_8_GPIO8__FUNC_EXT_RXD0>,
+				 <MT8365_PIN_9_GPIO9__FUNC_EXT_RXD1>,
+				 <MT8365_PIN_10_GPIO10__FUNC_EXT_RXD2>,
+				 <MT8365_PIN_11_GPIO11__FUNC_EXT_RXD3>,
+				 <MT8365_PIN_12_GPIO12__FUNC_EXT_TXEN>,
+				 <MT8365_PIN_13_GPIO13__FUNC_EXT_COL>,
+				 <MT8365_PIN_14_GPIO14__FUNC_EXT_MDIO>,
+				 <MT8365_PIN_15_GPIO15__FUNC_EXT_MDC>;
+		};
+	};
+
 	gpio_keys: gpio-keys-pins {
 		pins {
 			pinmux = <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;

-- 
2.25.1


