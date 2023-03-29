Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BF2C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfv77BVZkJVCikonyTsjNYks4OjSzyX47Vy4hDh/Sg0=; b=ieCTaMkkByLWcl8nvnPx3wloxm
	AzPmLl8aCXg/lEH09mHvqVRz9x3tj8g1hpyBNSSzH4m2pNk0CTjtBWJPITlYQukQaj9LI/FsFQhrq
	/eeJMsWSV8Flc83VGqvgIU1sg1yCv5xzBS5igLxlgEjVv0CBGq63gpxEibrwtJ3KJGIPSTLDGk8ZT
	EKAj5vwEgYSgBrfUFBByKH0+jrJg53R9mRnT5HR7Q8mddjYcHkbiyG6vAUjmqxgcz1oYosFJb8vwB
	Zy65GoB3bNuVYcJqrMEu71uThQOCBvpibq+ZXdUYwW/LDM3sNINEDuWM9PwPVRxb7GCKfOIxhyry2
	rsITqH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSMz-00HLSD-0t;
	Wed, 29 Mar 2023 09:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSMw-00HLRf-2p
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Mar 2023 09:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vfv77BVZkJVCikonyTsjNYks4OjSzyX47Vy4hDh/Sg0=; b=ahcaGM2ikUUshe1B/CbdS1AknX
	93J/Lnns4ys6vl4OsMnPQ03ORVAURZpdlZeXRmqGsBG1jJjOCdfSNf29e+ZXmheY9QnFEq5x6iwRL
	0Qq1J81i1TQqa/awzDdFMkdjHOL989fKMQA2q5AQxFP0Va1Qr5HbmwftbuDkgUlr5VlAqFIajTPnH
	GzffK/qciKT7gN+7H87hjS/eVGb9INZIDnwF9VOBMtz1r6/wbWAiRsx9G0UOBBWnOhaHUn6Ox0Mlv
	J+QaN83hOx4bc5rRbZ+Go4eYolwFl4cn8NA6/aw7sOeytatVhK9nQORyguuONBUU45wBCbhHk57p2
	/uSR4rjQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaG-006oEs-21
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so5792901wmo.4
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfv77BVZkJVCikonyTsjNYks4OjSzyX47Vy4hDh/Sg0=;
        b=6SQOn3AJXk0D5Kmi5TeP8s87oZ3KX+eIQfpKDAuDtGetLDd9+GVbBxu4RqkbYL8PHE
         DfVRGafoTh26zXW+hO1Frc4nH4o3B6J6VH1tYwtwNURXrES+YzDKk99tSeWDlliCqwzq
         zUjdWynxSFX0vAiT8DiuQRVAcQlqJrOy4fHil/9G9VZnThrzNNGk2rRGIZax8sItmxVZ
         mFOktn0S90ci9viYPO0tkYCC1tQy1oRQUbhucGHnZ88doT3Aupn3OP5uNpgwM5GK6tz9
         Zeoo15TMG0l1qb4Os2mOV1uTiHn/b0L9LaKoJSip+Cd5CO7+fzzYnPd1jLzlAE+2lKTu
         a3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfv77BVZkJVCikonyTsjNYks4OjSzyX47Vy4hDh/Sg0=;
        b=GRJ9Sg5csztj4TZ6JXmKd5fm9bg1pfI2pg/CVG2ikZDTtt8rS5vlFo87WQx2bnMq5F
         HO1viKUW68N805JqTEjQqlnhr5JIzj8M+KXur3VvAJIu0ZntHKRaUAdQns9VqKeSTMMt
         ng9mDqiaR3rpyGfTo7r7rMNqAQz+T95r6WBy+Tqfhn97yAHpDIpZusdtsonkphJ75tIP
         pG3TzkRPipzDK4r7fEw3QsFTEpuzWec1zegJD5/9l1ZpTNTaActXSxBhz4HGlKx+zcsQ
         0luEAuUMNf37+iNGnCyxJhWKvmcEKIXQCoAd0GwjF5JCklQ0uHOIXdfCTkpBtGF8aIXc
         gP8Q==
X-Gm-Message-State: AO0yUKV4yITcxgT9XoN3uL234aC2kKgr0vw7i8vX8w9deZx5i/6HthqX
	FFc+G5YsTdHHMkXERfXmZJ7h0Q==
X-Google-Smtp-Source: AK7set/NurkZ3bIlLrAgkr2Y6JZgLdOtnj5zDBVm+jrx0GGKfsz6ayM5R8SktVJ0Y4FoVQt2ebs1jQ==
X-Received: by 2002:a05:600c:20f:b0:3eb:5ab3:b6d0 with SMTP id 15-20020a05600c020f00b003eb5ab3b6d0mr14323525wmi.6.1680080105715;
        Wed, 29 Mar 2023 01:55:05 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:32 +0200
Subject: [PATCH v3 11/17] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-11-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=C4mUGelmedcnsN+galzBspSPAKiY8Y1mIDOmQThfXX8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcIyxSg+PaknWT166wpFSYZfFQS1WkE9JumQvN
 r/47U5WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHUReesD/
 9Qb6O84sJevPXhmoLp2Gww0rkY/wGRPEGhBPMtfdiR5LM+AiXe24K1XkDzxLktmXzK+/9Fa7OA0yo7
 hvMCbtYq4McT6FnpWYmbHBx1MBvi4w/TimSalwDbqWhAWeRcKF1o3mwtOjqsoonDX1659VvaLRpd1D
 j/eSGdU/OM+1SXVft/W+cCmln8toeVaxzbtErhbJY1f9BUuUK4fA+jvrAUIeUxGy6md37tS2OiczNz
 4GCQaCo6lBbBmBY/LiG7VphksjdUyITtup1O2TLYY2Mj+5B2gcryHrDTiS9nhj6ICXuMzenIQ8n55k
 i9Q0iGBKds6nxmpkP+qfFKnNR4J+LabVedbbscReeTzGmy3gLOwAQc/Y3b/uJTYARd7o8yz0FBW+KV
 o0AOU4XAd+dHvn+HxQuUoYDqhrcYFZJB+sH6ukVGQ/7SWl4xSOefWZ8M/Z0gXFNW7zTpqTgXJp8COd
 a22ukHnSgKftyzmwPEuHIuANmIs/jMxvNmlguRvAtyNn5bBzUERa9RdVmhsc4LhBI9/rp8HxC6VH66
 ygLXqfqP5SLBN7Y5yIawKtk/ssllkPGTtdlfVqoRYMO04qvkJDhaik6aoH+bu0WQ1ufMBOtAE2jvj0
 nCt6N/VUzwEzbBt5zSb7HBBAGaKzBGwVpyhM0/g0NhfugxFDEwgoszrw6cdA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_095509_150029_ACE0AF16 
X-CRM114-Status: GOOD (  11.64  )
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

This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
It also add support for the Extensible Host Controller Interface USB.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 22ec332fe9c9..868ee0d160e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -319,6 +319,28 @@ &pwm {
 	status = "okay";
 };
 
+&ssusb {
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+	maximum-speed = "high-speed";
+	usb-role-switch;
+	dr_mode = "otg";
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		type = "micro";
+		id-gpios = <&pio 17 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_otg_vbus>;
+	};
+};
+
+&usb_host {
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
2.25.1


