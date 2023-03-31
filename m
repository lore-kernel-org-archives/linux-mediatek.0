Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043C1C761A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 18:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=; b=V3covC5BEYsLnCDRRFPQsQq1Sc
	4bZfBUSspc7ggewAnZ8seBu8KWYiHhbZk1aQFiViTq/UcUtSAyVWlCM+PGtuA4gyvUa90SBIOcN74
	pzq83DWKsG7dIDxwDrpguLsgitU4pltqBePL/RHwsre7R6/5WdS4gpFeWDn2mwE7B8tC9MxmY5tzU
	JWeJT/RvWgaAQTKQRl4ldAXUZdfySK4Fd4RqLP4wa7VtxP3HO/o5O3zFTimGK45dzi/ePFtyN1BTu
	fQJxRsbj6CfSsvQgUosvkXtrB7CrLpFEYJ7aTITPsceMvomSeScchepbxKlXst8n/ngRStLcDWFp1
	DVYDgdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJl2-008V9B-0t;
	Fri, 31 Mar 2023 18:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJkf-008V17-11
	for linux-mediatek@bombadil.infradead.org;
	Fri, 31 Mar 2023 18:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=; b=Vo0YoEUJmnzEdD8z5OV9UUFmK5
	D2CriDXVYBJ0PC4xNhORLAly8ruugMPnCzM6nRNUi7CjTCko4XZcvdM2joqFM7h0kF67BH5oXW08d
	ta54oevLsRiy+Z9TG4kgv0lqCK5sYp3suHEvm1WgsgrDgWcnNMoreci2hpS0UsI78MqAbHdGQxht1
	xVFOdfp2LmabVDbzrFoztDURY+2nlzT1Ky2dmhzExOvMw26YBFm/8zHQXCYrXxzmXzL4M7NR9V/d+
	DqGzCWckRBndGfYfOSoATpAhpkxA2+MkvelvuQk4X9pH/7E2F9ZksOv1FDiVrNLBY5pz8pxnAaBTW
	ls+1aulQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIyk-007kGe-2N
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:56:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id j36-20020a05600c1c2400b003f04057c152so2274572wms.5
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=;
        b=RQS6mklPjc41zmLNoc02XX7Dz9LbkMG9yT78dsLFfOtL7uqkztA3rqDZUREp9uBm/7
         pdaF7hHgV8mCVb0wVsMGwqr99RaWXwvW46TGolwu1SIM+4VkEriSwEV71UGZVqZOF8Sm
         +gve9Ioa0Dr/CSY2jKg73uPt7TRJvIQZbvGBza5skN2eDXl4koH+H+qqQ+tp5Qs9UIMx
         YdziJWOCmYI/V64/zDXl7QgTvN7/rIhjQrtIJXdUHZ4mmV4/GCpHHY0hkY2Qr0Un1T7r
         aV99ZWfzUxuaD+NlWMQ/N1UyL/Zrl9EzSydNl3QjEF3DoSK6yddEM5wqlOLotCECTZtM
         iW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS7Sye0IPLu21f+Xi1LC07CtmBlPzToUPrfZNf6CO3E=;
        b=hYD6qhyrrwzRbSVnEOC9K7lMP4HWvBcxAc9IFXiGkrWY6npeFjO+rP5CiacOkbOdbb
         SaNRu8m1hDci+5uApWlcEb7/sqdA58ecnNfb1YM5el4JT+h2glai1Ei5fYuqRRvg4Xoc
         N3ktbaaFzw3ddXRXP1HmjTUxm/J0wD08M/r00DWRps467WGX7L9fKoWLWXk64GMXTVZY
         0MGFHBWZ2gSE1LOsWGgpMFnCtgHMaq81z7Z4RVHzLy8NVTXPVrNMQYgON8DDdq46pBxw
         LAEBu1GM0LMkkd+FF6H6wZ+t1bQQVrHr6TLxud4T0G8/cYpx6nKTsoYtPN6ULCQ1knoI
         gZUw==
X-Gm-Message-State: AO0yUKW8QUHCiw8UN7F70omZC6kDKq695MH/po3ZRTb3wI/NprXi8TvR
	5yg7buwPJW+RR5fZCEKv5QK6vg==
X-Google-Smtp-Source: AK7set8hjFirjY6iTMj41oguBQNujELW8tTVlEcwo7ZK1EixQ3Xak/ZSi+ZStfjdJNiOK00oPWbaQw==
X-Received: by 2002:a1c:4c0d:0:b0:3ef:4138:9eef with SMTP id z13-20020a1c4c0d000000b003ef41389eefmr23062906wmf.36.1680285341527;
        Fri, 31 Mar 2023 10:55:41 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 19:54:51 +0200
Subject: [PATCH v4 07/11] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-7-5cffe66a38c0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=fWeFY0N26AVZAJlISCaJeet0l8YjLAinj4NBVfmxvvQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6UmmMNd0+mhAls7cBjVg5nJ5pOWyNoAZkADzFZ
 N1h0kcuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURTHREA
 C0XpwI/Rzp2tNDdrAql0LQKhMWIqYKn+CaqvSl12DfP/GWVzaENjzwRAYiTdeLgEwMtxXNjkkb6qlO
 mf6XVsHJwjUHvjBycf/UDWKacCf9yEk4ZJ/psvASqqeqR9JTwXw+yprDzAlikqqSZLMsnYlDdPoKzH
 4UJMhnt8LUmEiFzqkOytdBcsU83bJgEm7jkDswJQe4CuNCC7ivvfq/1Krc8dvUawvHcBM3rXpS+G+n
 227RXCPWLJVczH7i9okj+Bm58Y0Ip/pUP1DHwzdw8wFk913b1STPsxd+b93f1neq4Lf1W8YLYQAI1x
 B2wEURlvVDDiWrvLjacbSKGK9PAtbXJit/2l8VCc1uD6omcSu1EyTW2O/b1hlWQrBTT28GIayeNJRi
 aSPpSW3HH69+G8jIbMGEQD+O1Uj/KDRenrNglnWrKf4OuK1g6D8R6DyDcMMy0FrjYb3yQCQTimQ+u6
 AjPcZXAY3qACUvs6BUKRtCZtnuHanb6PBnS33KXSjaLaW3ol388mN6Poh5KsvawhtZnRsAoNFcLUeR
 BlRrQU9PqEZPoLRdBc9HgCvHBv8GuYGtEyNIVbeEwDi575uC7+lajpmkLTk0nLPoiBIO9frPgaJ5+K
 HFLb0a5P5G5GWXmg4fxMyAk+x/nsgVrI9UWrk+TTLUhOuDcW0W8s1xF+mGYA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_185558_928517_977BC081 
X-CRM114-Status: GOOD (  11.17  )
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
index 1c36d8f19525..9760f181eb34 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -314,6 +314,28 @@ &pwm {
 	status = "okay";
 };
 
+&ssusb {
+	dr_mode = "otg";
+	maximum-speed = "high-speed";
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+	usb-role-switch;
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		id-gpios = <&pio 17 GPIO_ACTIVE_HIGH>;
+		type = "micro";
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


