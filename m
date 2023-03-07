Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A749C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Da3gycm9GaSOTxM2r6GKDW6btSTz1Fl+GtonHRy4OIs=; b=QrQNt4iVNMoJEWdcq40f9kKLtQ
	9VDuTw0wavru08jk3NvP7bUxxhEM8gEExFKFA9TuwGc5yVSmM4S0AkDT1esiND8kib10LgvjO7Yg/
	dbaqG8eo/EFCMJb8hSXi1SIsF4AjDSYEoHYAMiuZuaTvqUkAaAkhDoeKWTx0xUglxMrshcEpsWj7D
	HgkW0ahrIRhD0e/jroQ88PaT/O3ClH4n0c60uA330W00H9Uj0MuDcX2wVwu9ZufziyN7uMhEG/QhB
	I4CkPgzevFLaYQDb2lxPvLrLkvOQCheOPLvi8McNgZiMjjhPfH2kkodVt5AgERAhael46jjmo27yx
	tcqFWdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWdT-0008RT-Bv; Tue, 07 Mar 2023 12:41:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWd8-0008HS-28
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 12:41:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id l1so11928017wry.12
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678192877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da3gycm9GaSOTxM2r6GKDW6btSTz1Fl+GtonHRy4OIs=;
        b=CeuK0gBWMnnVxKXxuaS4TbHqVvqx/XcRViY6Ab8AN5ulApgZO1xLbviliDSE8SggCv
         0oROsCCoztpy4OEIaM453xTfC+EaR6i6iWS+mzmQBhKyWMgaliV3Heff6IujzglBKc2d
         mpP0OgwLpfktzGbumYthAreBwgMeplwXW6dih2aPW13Bmi7Bg5hW9GMyFBuKKEzhUfrp
         WhIA+AJBhV4aRgMXikn4aEY96bWjucyydAZWpKz33v6QcC4MI0LsglG7EkX0JaLVbwjx
         /o5Wy6x0NNQAURfDWBOdjG6HznTOR31Gza8TyI7VHMWpBtWTuIGqcHga1x7bDUANvEZZ
         qpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da3gycm9GaSOTxM2r6GKDW6btSTz1Fl+GtonHRy4OIs=;
        b=pZbRGCSMcTnPYbWksuagxOAdAlCwJRXZapCUxcV7fxikPuRiT/SxL3J0a4uvPCtuY5
         4Ra+jqi/FzONlYfTil7tun4jhkg+cZxIpnK4uWqg8+NMVqReVZ7+oZEDw/uhtU4HVzYc
         TUDpG+4+Ubkb2pqiJFBOGFNnjfSkFcF6ytuERXNbYjEA8bFW0tINhOLQsAmxlJUsz66v
         fgvxIxXLmDQID22JVY00e4MOOB12cqkzHYw7NSkLbPa34CefJuIU4sckHfDhQx+EbBTp
         jl/ZftNIKTUgP24wg9d5tw+NXcCT5rRukVct4cEilC8awXTlg9HWbfBUxMbD0kKD/sO1
         NYmg==
X-Gm-Message-State: AO0yUKV639zPKAF2xeVmyrLnjhoTzGVPAwTQwl25yclWJnqi0zJtblGx
	F7h4jPUYCcWP+OqCfctVcFnBfQ==
X-Google-Smtp-Source: AK7set8ho3AE5slu0eVuVQjsVB3HmQggDT+fS0otKyV+eMbPIkDH2/8BRv6LrVQf2lZZpiaBnlISXQ==
X-Received: by 2002:a5d:4ec5:0:b0:2c7:1e32:f7ff with SMTP id s5-20020a5d4ec5000000b002c71e32f7ffmr8350736wrv.16.1678192877556;
        Tue, 07 Mar 2023 04:41:17 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w9-20020a05600018c900b002c5a1bd5280sm12434670wrq.95.2023.03.07.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:41:17 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 13:41:08 +0100
Subject: [PATCH v4 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v4-2-885ad3301d5a@baylibre.com>
References: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/2/cjSO2mF7U+slihZOD76PFWiM0Jv1Qz+ElLd/bOnw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzDqcQGDX7mF+2FUnSGPLDJyNAnKOn4NaJfOwzgl
 MmtGUVSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcw6gAKCRArRkmdfjHURYkYD/
 9KfGHtkTIXYn298xwf9hQ8ovbQgNJm4iLoD0gTwEbNJbtAQWcm+pf/kgA5UzVtT6LolXsRv6xkDDFg
 HtHgOj/0G6IQrF9O3BuUX7c1MW5ynG/CTjXxf/uYzlDG95t7NAQIxy7MzHKMlDur6zTNmVrks7GI5z
 s9EDsvMqQx1j+LBOv1Jj0Moq6vzCXrP4+LucyqXzSg7hMmXn7mRFalNAd+TJpN295ZFwwmL3Qg3EQs
 UnAuqUywmHwMWYxwRm9fFKutfibO2LvXfmQOs1Mgo+9NpQfuQxmtenzmqwqcvAyW0qhU/Ai8GFd5Wz
 w9/2JIXAN4K3kquecBWSkFZNGfux0VlX63Womo8TbX1mDWq3TNvNeH5g7mdqKdkccBF8XU2F7K/+5L
 3s/7x3JaCafJg1A/ckS5I1+eeDleUiHGtk5ZNYYEWNTMJdi64+G3bhL6OeU1DZdCx/ACZJv+Qgn4ta
 HMdFJgqwFGG3qnM0TxbgjGoGFtYn1E1Y8DI1BNhHugJHGg/Em9usE2p/nZxShBJrRbM7VGxaMWb5Wh
 2UsHNmnXEA8Qnu+FIL/w4Bi4o6PQw+AVgHrBxdDRscOaCeMd6axkQWAmFEsTSCiG7cMtwj+oAcSlI7
 IYdbwUpMSrB7sIeFan52LlY4xfCjYz/+APqYAGG9BpSyF31DoOnVHpqvrHAg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_044122_229428_8D19F7AB 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

Enable the I2C0 bus provides communication with:
- The integrated RT9466 Switching Battery Charger.
- The integrated MT6691 LP4X buck for VDDQ.
- The integrated MT6691 LP4X buck for VDD2.
- The pin header, to plug external I2C devices.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4683704ea235..bfaee9a4a38b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {
@@ -96,6 +103,16 @@ pins {
 		};
 	};
 
+	i2c0_pins: i2c0-pins {
+		pins {
+			bias-pull-up;
+			mediatek,drive-strength-adv = <0>;
+			mediatek,pull-up-adv = <3>;
+			pinmux = <MT8365_PIN_57_SDA0__FUNC_SDA0_0>,
+				 <MT8365_PIN_58_SCL0__FUNC_SCL0_0>;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,

-- 
b4 0.10.1

