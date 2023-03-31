Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE93C761A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2q+psvx4yJ9KCnO3jUj6x64A5eBfyf7+pEcxfNP/wU=; b=FWCn576Gd6fS+WdoP2X3q1r4B/
	TKmTuGuuNACPAPAy3e6+u3D4ThUkkpHZLjT3PX2pyAW97bwPv6IF2LKWDMYbd+r0vANIbzAZOIhTv
	tHTO+ad6udkYmbQte94xqpNzU9g+DxLpMNKCZ68a0y7tRvIUpNlQB3CdbvD/MQwmF5U2poZ4ZA9QH
	MsV1P2j/Dt59W2JoDeSSLA8FVxynbQlZzhWKe5nx0qb/g5qZx8JyZ6GR65N19985XXGCWoengXcNM
	EtRhkZx7BQDDkRsgn53CyfxAxJ69JtPngHuZKgOwmNOdz9xNfLo0RNaFKN30GAJTj5VyB7Izmuwvk
	QucNqA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyo-008Mpq-2K;
	Fri, 31 Mar 2023 17:56:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyV-008MdX-2m
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:55:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so10572920wmq.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2q+psvx4yJ9KCnO3jUj6x64A5eBfyf7+pEcxfNP/wU=;
        b=00roHh6wZyKgRCCS+tXlJUdtX4rgsWnaZ8SGGXUPitntIFu77w/7V0dtJ6HeavSwsH
         FiHoKQ6o4VGXUe30lak9/6XFwk1YCPjlgMxbemWndm5zaEu2SPfcDkssoUwFr3wunTSf
         KuRwuj+td150IeBqtyjQoR8lbEM2RTenzGd3E3oqNttxLPIA5Y8qhVPHvCiybAzZkp5W
         h3ixW4pUXotfs2YTtmkEONDKdQ3m5VB02qiWgzj81+wwZ7JhFMHwNviGZy88Px9r9IN0
         HJXb2CvsrpSX+PetG97VIG/BCiBmRpt789a/k6q0kc3/BXtUdNz2xyCDbxqHn+VHc3Yl
         eN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2q+psvx4yJ9KCnO3jUj6x64A5eBfyf7+pEcxfNP/wU=;
        b=WvG790mXgrGI7A0j5HVWpKtXNCJEwzbBkNwJq3uKUsUffx7J4D0ErR+mkNaq9M6nRu
         Qtfw6hxZ2aowshT2xYBdoUcGpSl3nBFrPpKf8dG3jIr911bmzF+OvcuGW+TheqAt3eFe
         2B/G57aZJcPxFlNTPZsF+PaOyHDFwVmppLviJNhv+nuNptcjepSDsvzqu95AEjUm/B3H
         +dUxASvTBGNxMNvPPG+dUP+xX/eTEyhRYbpi6STDyBFWLQ1bhKksRhr74f9oxS27jGKi
         aYZFVtiUDKlXCCfb6krNF6bAYA/JEk/p0KW3oeQuDTZxI9P+6st0YrNG7l8m0VC+UJ3T
         sG4Q==
X-Gm-Message-State: AAQBX9dekp90/ZV/sRP/VjAY9boLkLNH1wYI8shd8+GwMcFMstofUyOb
	1Cm7lM2u3BHdBMOd06buoeqpqQ==
X-Google-Smtp-Source: AKy350aXgWDWLroHpqWoUJQEh5Ilf+/ch4Ure/VySqTE578hpAJcDVWXSKXsHKwIZARfmozgRUkXRw==
X-Received: by 2002:a05:600c:1c0e:b0:3f0:3144:89d9 with SMTP id j14-20020a05600c1c0e00b003f0314489d9mr5723564wms.20.1680285342671;
        Fri, 31 Mar 2023 10:55:42 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:52 +0200
Subject: [PATCH v4 08/11] arm64: dts: mediatek: add ethernet support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-8-5cffe66a38c0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2431; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=qis7u9dUHrWOnbhiX3GDPhugjgVXBkDPDVj5m9M4200=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6UOf7L3FRMEsUrOg6xNMM9dW/tVoLzYAojXt1k
 22C2XmeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURVUiD/
 9xeBEAPPTteBP+awV0QGdcAjA43p+sXmW4Uz4l1lDajfdkmF3WOLsDriu2lXHYluEUb4LTj1v+6Bqz
 05TDbqO9Hr08FEgws298QlNdAWt7TTfaxq03RuT6aaCr9ogo+CEIz1Fo3GcjLef8tmdtCHTocxocQ1
 BU/EGmy/jxFzc3a6c4iLvVxZw2D4n4aSEfZK2p3vbWBy/muuXTfvJ8xk9eBdApsI1JzT5Pi/sQGwzI
 ikAehWJJ1YiKdZ+ibwKmL0mL98ARqqomaA2CMM89pA7kSXwg+JUIgQ0ELUKDTuLwSANhh0fBy5Ttqy
 712jyZuAcfZyivZobWGnWzI4Akd2DZ03HiSBHvsm7fWKzWx/5JZY4bHafE83o7RCuKBGV4sDCc+qOM
 xmea747WYqKgLi5vNap+Uud6kepBx5nql3eLR3yRJyGpUswZ97LddOKIHReVIUtvprkkYb1hLhBnMH
 Czd6eWS0JKtHb4vUAxqyzkiwj2hV7zctgH4jQIG73idOau+QXvw8vm4YCzhigd/FY22yykAtrC2fJa
 KsinFMXclme7YoBGTX/v60qkL9Kfr0nHbqfu1mQoIAI+dYq0Eleh4tdedNU8w8pDN5EN8rs2KxPw1a
 vDvw+OhO/SFO0/0bDhytP571ZgnN29juqpoqYhbXXe+0UcjVrGaj170q95Nw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_105543_989542_B68A4F0D 
X-CRM114-Status: GOOD (  12.03  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 9760f181eb34..431078f8670e 100644
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
 /* Needed by MSDC1 */
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


