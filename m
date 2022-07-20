Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5FDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7NWJMKmrg5UzWFssb9UC6+9fr3X64sVc8zqbdDmg/4=; b=X6KoW4p5BdK/Xtr+DHcMA/KqTg
	r/SGpkwY1bufx1TDJYAivRSHafJQ2tyCBH1OSNlcOSHCzppEWtec57wrfdyBflm7uHTEnlsmb1TiD
	vohFomEsHBldYjSYTWHmcQd1xHBlTI4OUthcR7gKb48tz3BZx+BVOkJGfZx6gdRCT20j9MIwJJS9G
	6DGeXduQ1p23UTjQqIsIQqpu+jX1acgLQ9ZrElHl3MuZpZkQ5PDAAM+6y9zC6uv5tH7AqK0rJos/y
	ffKJohMv+5M8rrQsSyJ0m/KRUSbcHjwrj7LnKfaYaGHHY6hqyCa+okJh0HTVMiSbvCFtOZKjcgcsl
	S4smQPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB1t-0076GE-FW; Wed, 20 Jul 2022 14:50:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0I-0074jN-Mz
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1420324wmb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:to:cc;
        bh=o7NWJMKmrg5UzWFssb9UC6+9fr3X64sVc8zqbdDmg/4=;
        b=35Q7aaLTpf6XHFiAk3xPyLuE7i3lVuBjTEOr4YEtua/WiSxQNGV5E7wgmPYZvrXdMz
         cb8+kgykVVSkEBD2kqKYw3w87eRLhTkDH4ekVHbv6Ct3OZOx8qIPGI9GE+lXGbLcXKa5
         677DZ1rDcZ1/vIdTs1a+kY5+jO4kbzxHXkF7rp3f8V3OVj2+AbMMjUcF0WPkDlQaJkN+
         lGn1dr92MXwPIn5iTDypPp9qq3tn8ZCYf9mlO7foOBdNrj85JwjhbuitB1nUgnvX8WM/
         txABYDNzMJXhCuTSuSUzbZHYOmgX7XUJbgn9PnY/mM1+iErCmsEpGi3f36wb/3TcvYFL
         4QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:to:cc;
        bh=o7NWJMKmrg5UzWFssb9UC6+9fr3X64sVc8zqbdDmg/4=;
        b=RL/DeffZRmPYivuwSInUVvUKJP1KTDAKlHwREkMqHlR9TGYY8PdqkJTCmX/GBe7Gqz
         dsIZ3WTRrh7/mpogsUK5LKj1ggHAeRO205EcT7WCTuF1e5zxacXPPF23ql1oP+Dp586m
         +6Odjgev4ogUub32Ay9BfqRiAKGMXx6c3aPUCnkNiQb9VKsFBom12JEyfF6OQQiCRoy+
         8bGsYXr2XDDiqHeiAf3rWCgjK4xxlLAaQrIpZHMBgSrNHa12AYfQ/BDdsK7Qkgylmrvt
         BuAC4+vkp5emCbhT3Nj4A88TcIg86Gre4xdypds9x2Er287SpWQsK0QZ6+HY7nJMuhks
         881Q==
X-Gm-Message-State: AJIora8DSqh6y8TE8aM8MINqEA9tkC6XqKYI6w9/XfpvkFiJ60H9QfxK
	gryRWE8l2XlJ2c5fmRj1U/XBVA==
X-Google-Smtp-Source: AGRyM1ucwB2vU/aGRAvjhlYFu9788qVNYbD0PNW11PcdfR+3DHacpm9xpneOLojFxCjqxsBH2JlD1w==
X-Received: by 2002:a05:600c:cd:b0:3a3:f40:8776 with SMTP id u13-20020a05600c00cd00b003a30f408776mr4254459wmm.9.1658328523535;
        Wed, 20 Jul 2022 07:48:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:43 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:42 +0200
Subject: [PATCH v1 6/6] arm64: dts: mediatek: mt8183-pumpkin: add keypad support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v1-6-ef9fc29dbff4@baylibre.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074846_793918_EDC897D9 
X-CRM114-Status: UNSURE (   8.55  )
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

From: Fabien Parent <fparent@baylibre.com>

Add device-tree bindings for the keypad driver on the MT8183 Pumpkin
board.

The MT8183 Pumpkin board has 2 buttons connected using: KPROW0,
KPROW1 and KPCOL0.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 530e0c9ce0c9..add697c94b05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "mt8183.dtsi"
 #include "mt6358.dtsi"
 
@@ -122,6 +123,18 @@ &i2c6 {
 	clock-frequency = <100000>;
 };
 
+&keyboard {
+	pinctrl-names = "default";
+	pinctrl-0 = <&keyboard_pins>;
+	status = "okay";
+	linux,keymap = <MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN)
+			MATRIX_KEY(0x01, 0x00, KEY_VOLUMEUP)>;
+	keypad,num-rows = <2>;
+	keypad,num-columns = <1>;
+	debounce-delay-ms = <32>;
+	mediatek,double-keys;
+};
+
 &mmc0 {
 	status = "okay";
 	pinctrl-names = "default", "state_uhs";
@@ -226,6 +239,14 @@ pins_cmd_dat {
 		};
 	};
 
+	keyboard_pins: keyboard {
+		pins_keyboard {
+			pinmux = <PINMUX_GPIO91__FUNC_KPROW1>,
+				 <PINMUX_GPIO92__FUNC_KPROW0>,
+				 <PINMUX_GPIO93__FUNC_KPCOL0>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-pins-default {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,

-- 
b4 0.10.0-dev-54fef

