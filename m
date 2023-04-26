Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971A5C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRMYoVROwFE1MJOO/HSe+KnQh9ytWH/O+ref06Ejh6s=; b=t3L8SgX+GgTE4NPSOLx2y/jq7y
	yb04r+d1MBp8Y8MxO1i9qj++hSlUierm/oXGifPIcNfq01Ry1HX3qOJpMglYJ3ORFPb1dOOAalkAy
	8D6AD2uA67aqDxPSmlFUOvtKHdNURJlfE0hU+WGPixXcd7ib1/lOQg7d/+q35u3+yImeSQ9yhueQ/
	Bu8Y+f4IT/KJuuc1DKYHke/W1e1/pdIZH0HQAGWyqxPZr0f/WM6E2nDAYUszJZDBDpWetG6ktV/iB
	y6tBSq375xxlZ/fDOZ5IKLgx84Zcq5NLwcWu5nU7b7cxVY6EDgjS77Qm2RwcE0WpakJhUn1HpYnfS
	H/+RIQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prdV4-003n3U-00;
	Wed, 26 Apr 2023 11:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prdV1-003n1j-2w
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Apr 2023 11:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HRMYoVROwFE1MJOO/HSe+KnQh9ytWH/O+ref06Ejh6s=; b=eKoS4TZ8TzN3xIGIpg+0ND5QgC
	jChBdWFwUl9KEiKa7299P/5vxaVaOC8F7XlNSh63iW0i5FNAnJxPvtHLL4aiLqlWcMO+kv1kcnWGo
	MnLVHRZJYwxgUCl00+xOrrYPgNpRJIe7mnqcFz3KB7751HSOcO6ugjXyM0u0jxgwsIG5AxhLUYkDY
	H3+gXWvxdr+TfdzAiCunFHt7mMSZu67JMKgoLsuQhnmU8ir9JLWcSQRvau7cZuUzvBKkLo9Y/tYO1
	mlvhRPPjGGkd431m5uTu6jfN9IiII3yFg/pEaNODZlnFp3lSLEhqLCWgVgJg0vzhKPWeSZm0tGrfu
	7Vhc+kpg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciZ-00Ax0A-1e
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f09b4a156eso46485695e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506185; x=1685098185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRMYoVROwFE1MJOO/HSe+KnQh9ytWH/O+ref06Ejh6s=;
        b=noxV53LL1sTVmsRPLGvKYJ/jkt0aDQj25kZMBmkWqLZcLjV3iUzbBzSa2t9aytnfRj
         HGT8VkZUxjCT6DFTPGoUYFty70vTMLTVPivLmutpcYK8VVErrzGDSAO6aemqI1v93V/9
         +Xq5AU7M0IRCY1qENTfqtS4IzAsRWl4ozQ4Oz/SJXn+mXALyc9zEwOcrXBFF+oeq9gal
         oE33P/E4i8VBcBtJgyc/4Pn0VNMNpHQomwvCUUSXyIseW44WzmFzHenSDYwPLgmWlWFS
         8E0gIO65jk1KOApAa9TgT1ycdABhZW1vB1VRLLjLS2XxPO6AdLf8ersdA9jjQNYgRVVV
         uOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506185; x=1685098185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRMYoVROwFE1MJOO/HSe+KnQh9ytWH/O+ref06Ejh6s=;
        b=Q4JXltFEhLh6Frm+HHJbQmXOS97QuXnDnMr/AohNVk2JiWoFeKsNYQff9GdbWs7RL/
         yc/XgTtzT0iZfjhkPowbZ0IyAVMyV/ILcPEXGoCTF6ajDm6X/nVdVQeEnM/TaESqP99K
         U8oTiA2FjcAjfyigNVKqr0rL3EnH7z+lOt/ixuLr6LqVHLxTWflKk9HiA+hR90tvXVBh
         CFW/MNTib7M5ApEo+WHmNxlWU7igZJ+HJMmiwWLTRefCtLGUF5BgHit8pEICp2vU9RiH
         L9qJmqJ0hhmeU2y79EWBlLXzLaKA4xM1RR8bcnwS+H4xm0QSdS2+xfQsVQ7pzDoj9KOR
         lnOg==
X-Gm-Message-State: AAQBX9fuUdqEX0XyY0m9M1GfWcDw3tXvwQGYspQbsxvxC/AhG22QS/5X
	7HT133u0FtxT3+et8wCXyQLBSw==
X-Google-Smtp-Source: AKy350amTGjWve9HimTCpqgKJdop6gEGzttQT/PYEMwRM+uQoAeO13PL3BxsXPJowcJVo9yOJR694g==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:952c:3c70 with SMTP id n25-20020a7bcbd9000000b003f1952c3c70mr10898438wmi.40.1682506185718;
        Wed, 26 Apr 2023 03:49:45 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:45 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:08 +0200
Subject: [PATCH v6 08/12] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-8-8d6b1cfe7f29@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=EI+ro2edTOCiZWpy9DB8h18gK0kLHGZDj7cwd9DAutA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/3oY1c/N0cq7rTjsSOZ+XwNF1OtLwxd6d/joR
 53AddaKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURTF9EA
 DHW3qBSMNWMCVVBF5sejDSKAq+dam8iOE9EDDeOaXUiYDMetQCD4oJSmKdmR1XqhtF8boL5Bovb+G1
 268Lb9gwBdoiVUI3e5M/zoM+aXRYy3JX0iwPrKsJCy+NwchHAlmLCFU7RMrLHyWENGOe9tQHoufEr9
 kB5c8ecvGo9oGIOQ98ZZigN5CTN7ZfqBrkFa4Wozzx2/QbiQBe9myaJ+oWrdWZQXAOWPFG0KaVEjdk
 /BR7wuS2nERFKR42yJW3VK+WgUbInGHjPccOB7m3zMF+JiQ6GPWdYwbUOc94NeU/EBcWUvQWpflgsB
 o5PhH/6jnAIzI7dXYwCt3IXDgMzr0GlTi77+L7cxACmHnq9daIwjZjU091iI3KrZGwUBVX2bzF76KG
 xtEeFSE5NR/wYPoklkaOOhE14+2904nk1BdEskp2ibuKjPx6lMEJzr1mdQnsC7GdJ0DWmgsGs0Lnvz
 Yl9LJMr2VzKBgeAktsv7WT1YFWfujpmYicPSFnxFMlyoj1xtlGHrtZsVxml6b7nl/EyrOnFWclrs8s
 vjvoCk6kaU9FWkliInOaMAWk3Y2wPshA2voqPOgi09xJrQKIIgW0vwGDcZdDsl6WISILH5WNMioqYt
 5Gt04wSNINgkqLI95WDphim0nvQrUFvMAWETUe0neeSQr/Vj9+TYQrbh/yog==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_114947_977363_77B5AB7B 
X-CRM114-Status: GOOD (  10.64  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index ceed6cb8152b..913e09545030 100644
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


