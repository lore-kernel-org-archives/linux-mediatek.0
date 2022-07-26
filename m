Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4240C04A68
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv8Wb/XUfgDvlUBb7xZCItYlnc14Qbd8klbk0fBR/cI=; b=hmnuSjTVgIriL6bZyhSUR8dLE5
	O2reR8hQavuy7ZuSIPWqzdPAwplBWlG2qOUhNuHoLOQoK0PeBjFSrU6jTVXawnVTfG8OTqs4lO/pE
	kso8HW67h6dNhOeT5LvogqTDih6GfyF9YJijgo/N8GeVWwY0pITG/xFhBPCsbVrC0XCId0NG1vh6z
	K/bt1ejOivUiaHVE0N/Arx7RM9jZZvYBYxngwgd6MLHHoe+MX3tqNsLwCMYLFrQb7MPF7TbFKHD95
	wwYSYdFwYY+H4vJnEUHbczR6NCAvVq9H9XQ8E3Fomz3zqeS+4NbEVbT/5/FDhgF8+lj4NNy6tThXo
	gbY2eB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKqn-00HSwu-WA; Tue, 26 Jul 2022 13:43:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKqi-00HStN-Sx
	for linux-mediatek@bombadil.infradead.org; Tue, 26 Jul 2022 13:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:To:Content-ID:Content-Description;
	bh=Pv8Wb/XUfgDvlUBb7xZCItYlnc14Qbd8klbk0fBR/cI=; b=X1CawYW0m+KJJ/6/jap8YPDZe+
	gJS41reTvf8keN5eaRT8xaMyAUbWJhScPPtUlPTl1zOWBk1wZRMg/1/hMTVShiSEpOMH87cFRs09K
	6URex/njBISAUG0rZ9PaElLXM65qKG6DgsSif1iCYkZOXw+HQ/waa9EK4T9BeVlLzoeLqzbKUZ2FV
	xSAcqbUGGYKoBQbuCiDNxB8ygUsxWJHdtEP/occWU3iu0KMfUEgVBNbD180hzYk8kHm6cMKL0zdBb
	rq5rgExW8lQy6FgfCaIxBLfXChPNy1BloG0ijyONhFFjRLgxtGmSeVD03dGrLTyhbdryAmpw5n2AF
	KfyRflUw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK76-0002Sa-4w
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:45 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c22so8682566wmr.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=Pv8Wb/XUfgDvlUBb7xZCItYlnc14Qbd8klbk0fBR/cI=;
        b=JQC0LDeiyCTONLO9wJzCR3DZayr2OeSY97UtihVtK2Bg//mORTzwXNPQ+3bZvguNmQ
         G8HgNDfEkkPic2mCzlej2yTg5sJBWpWQOKJW4hmFNVLOtUNlTHZLmvnLaYTGO57swON9
         JnMb07hRleek6DOVe9ppMcxjCwr4KlqQ5aYSfJsjWJ43VFGGsOTp1NkHXUuBaFtIwwkt
         /bgJS8DYAK1Zn8Fw53JRW+sZoWXXjJs3uWAfYWySQg+Yc5Wpnwa6Ee7Xuue3cpQ89FD+
         e5reycwqnH7QxWvpijS7glQJuXIBJEVn4DgeAUml+0SWnmHj/ADspwBVxwBwtXp/TTOc
         0OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=Pv8Wb/XUfgDvlUBb7xZCItYlnc14Qbd8klbk0fBR/cI=;
        b=R6sNvFT98A4nmIc9RWw1mz01chxklQE8RWiFWIc7zQhrYq4dK+QfqlCZ/ktrM0LHAR
         5kMDQ+TXPkST3LTCyNxXMiHddNogFgdpfprSwuDjtXeigAf9OVS3OOdJVG6KkJ05Fk3V
         dA3vm82hEFH5GIsRZzcIWTAvCx1QWAhhexC/wGpTD4+49S/VJSzmKnNvFUiBYNuu+Wvt
         NwfkSsZkG6ZgQlaH3+CHDrTPAJ9UPnJ0bmiRQ2DqiTtE13YCpp2Qhzcdke9s+3PDUZ5D
         laICLav/naSl7U0lUB01HBmLM9FnduLVtFLSRDjD7kpSNLdaF8O43EFqrJ4RRPZ9gkeq
         j5Xw==
X-Gm-Message-State: AJIora8Exob5Bct36Pjj08GhzVFKcDZ1OqWD/r6jMMJ2QGY2OrQirpw0
	tivmAs9zN1cPTgFrtklBrDq98w==
X-Google-Smtp-Source: AGRyM1vvvRdQPmoQCB+VQgE8Mf8j6lPcMzabj6A5fEyQBKVFOEwxFB9YOwKu5xXK1jyzEiBm23752g==
X-Received: by 2002:a05:600c:19cc:b0:3a3:3cfe:d548 with SMTP id u12-20020a05600c19cc00b003a33cfed548mr12225185wmq.6.1658840196274;
        Tue, 26 Jul 2022 05:56:36 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:35 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:12 +0200
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8183-pumpkin: add keypad support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-7-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_135641_508257_ADD1FC70 
X-CRM114-Status: UNSURE (   8.33  )
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
index 530e0c9ce0c9..a1d01639df30 100644
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
+	mediatek,keys-per-group = <2>;
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
b4 0.10.0-dev-78725

