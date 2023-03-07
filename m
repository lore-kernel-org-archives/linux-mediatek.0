Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81032C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjdHCu1yd4zio1WoQYU8aAsyBoW0zKJYpSN9pBzP9bo=; b=W1Y7t55iLK1ZR0srBvB7/P2HB0
	paUmqB9XrgtqjwDAr4gilO7tXZ1athGB+aO5QOOtI5iBW5nsBOcibKv6VvfewAgqeun3wk3MBxooE
	nIwV9PlEw77gPZbNXM8P0L/RGebd5oXYfNtQ3lWBAeQLQkQ9Bp8mhznYaeSelqSnRdb1SW5rrYjKS
	SG2y6Es4bZ3+g6i+YOuyEkguTHx0E9LzSnvdIc1aIfXn8Oa5ADvDyaqUzgABrFVl0SS9f1RgW21mC
	JRr1b4jrn1hCN/NtIMbLWvCgXF85o3tlU9YWAyTZLXlNtWGv7fr8Rv5js2D3WK57jBAwPtEm3MAvH
	dnkrYjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXKS-000NEw-Ey; Tue, 07 Mar 2023 13:26:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCn-000Jds-U1
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so10386758wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjdHCu1yd4zio1WoQYU8aAsyBoW0zKJYpSN9pBzP9bo=;
        b=3GjNkre5oldmT7wE2wfIMJg9jC0G8x/HtrTGBe/teZ1BqFuqs071vdVgHYU7xrzBF+
         KsUR7WJZXlkD86Qxr85nH02dKivyFumI2btx9CwV9YPYa5XaYjPgzpm4mRFl/7JLTVWp
         xVZQQLGRAk1NBdYfU9xfSogs3KFmheCxOrJ2YAM8T+rV/3vuLRweb52T/V5grUJ6LcRK
         DLejV4ASCbrMnslWkDMZBKfPP9NR7Bkl6dTf7ibzSo0dNIgUb/jowzvlSdrAkmUMJsX3
         gxGSQoDZdpM4BUBbSxdWSNHEVECOFu08dZWLaA5/4ioojdIBy0Eh/hTiw1WA656zVaKO
         t24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjdHCu1yd4zio1WoQYU8aAsyBoW0zKJYpSN9pBzP9bo=;
        b=Qp07VpcN7YcgFSdgdH6c6hk5P2/+kDsjcjwfdavYnPej9cMznhFpT/2xeULvgmMB6Y
         AxNJDbte2q6SwZv9MTLPd4P3Lmqs/YtXaO48kx1f5u+Nf9p+/oIxMFSjE6ed1mxqG13d
         sjE8Hjr7gTQL0b+/oi4/1aEM9hnBBf4mwM3g8JuZqFkryvySE+84X+69H3477NIzuRTv
         zljzuZ16U3U8Q6g9+gV70Rg1ckNOY06KKHoSasBLzhVANh28qzd2QxBjYtrtr0pxOp4e
         wHJ1Xm65OW6e+yCQ7qlWu5Qg1A8HnPawoh2SsLn7WXot3nbh03sqKeZcDTmIXzeY5wtQ
         P1gg==
X-Gm-Message-State: AO0yUKVk93wM+FC9cV5E1QUkUUG4bGDTD6Zyh1zBEEeG8p/LSi07xcaF
	/bjnCCvTbXpIJV1xT2/vIB+0Sg==
X-Google-Smtp-Source: AK7set8CIqmmxVf7/vfi024KXUUiP/yUMr9EcUa3fFK4twRA7eV4gKPuvdfyNpLz6hiMi09N/2p68Q==
X-Received: by 2002:a05:600c:4f0e:b0:3e8:490b:e286 with SMTP id l14-20020a05600c4f0e00b003e8490be286mr12412929wmq.14.1678195093416;
        Tue, 07 Mar 2023 05:18:13 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:13 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:41 +0100
Subject: [PATCH v2 12/18] arm64: dts: mediatek: add usb controller support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-12-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=e05d+1VSpqW5Tr4I+yJA0DTOWJXEH+g83HTfBtf6kgA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmF4OpgQGVHdnV34dAZk+75s6IV2QPLLNKZfS3Z
 K3IVa5GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURbpoD/
 4kMri4+oTxjblfpD5B9NEg/ITozMh9Puxh3dI/x/2US7SShFgWv2jtuGA97B5A1byBYDGPQtS95CwX
 Fc/m59UBQx+7mMCIgETO+ooQ8evVgFse/Ofd6lvmj3BI4tqtLdcXgqaI9TZrYlJdYmHS3A4HhdHM20
 d7tAfPZIdj2gYUiIRviSexiqAo+akaNj3Nm7N94OMS1NlPOqkK1YNp+UCerNJPoINxR1q/5Gjh6Qlx
 hkIrYI+qZ4ilWmK3GUqH/cE+cLpdksOy9POfxPuwu+Z5IRBRALFD6AM+o4VSi4xdqVH373GLd9/YuK
 mMmwWm+ye8cmWngAjAirg68J26PL5mCD8GRaHMoPPiofv+BjH/5GpvELqnvJXs6gCMFITCx3Rkf2vK
 pFbawGRB5jWJx1eZKaY3QMO7UwQNx65dLJ+ILHNRoCFCrz3IPWix/7SMRG5NeRQOcpak8fg9kEAwuV
 pU7EtXD1HmTIvgRkmkVvKHu7DYPOQgbLI1CJlt687HCNbG6RnN9BqwsWx/18IM4PfhGsLw+sg4i4de
 G4TFxtxkdljJOGwsIgIEHrKVt+R4oWuTks26tGo9vgG0aPISsx+vm7HLUBI29RAF7D4muEiDKN22OJ
 vMYMfvRWVUz9C3sClTv25i/93SMiCuRR5lB8UiPwIYwVxktAJRfn229jz6FQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051814_017991_9CF22AE7 
X-CRM114-Status: GOOD (  10.90  )
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
b4 0.10.1

