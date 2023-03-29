Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CD5C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqk2Qvzyu9t26WJXQRSFQuOT876R213e4teZaPnt7S8=; b=sVDj3WixyyR/FOMAyKq9Ba0OqC
	HY93PAuxdfJA6DbHWrV+2cjFmNl3RMn8wVlUBh4ooaN4KuAUYFheQqKaW/XGlYZ0zJPTgKcYVM9Ej
	//6tfAl5jLOR7izWsnmdpkLvYP3L0CuQrjWbeLvFozDIIWkRBDg0JxW8CNqTpCyr5gdEvEFniTwr1
	7NFHquqJ6tra6+xkackCbbP6ERD/ejbirQYemo8o2JfeliopKbdZJ6qB7pYewD4xEqaJZ+1giNjg3
	ES1eZ+FFxRbw/4eYffLl8+/0RuyEVQzNCYkdpCozXriqZLk34sPPtt54+fLvvgKeqJAvZc+vp5/tJ
	TWHV7t0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phRbN-00HD6p-1D;
	Wed, 29 Mar 2023 08:56:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaE-00HCa5-00
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id r11so14831905wrr.12
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqk2Qvzyu9t26WJXQRSFQuOT876R213e4teZaPnt7S8=;
        b=tmNiVZKfDBwqaBjMYSt5jShG37Ea9DVxMpWLfF7figFH4xvPOL7KVQy4Nusib8WljY
         uKoBreQmjqeLYrvBVliUdUPa7n2myiW9timavJDUYNbbeEwhjOKiN3rGPfjAmTCUOvYB
         oMmKw7scLBYaXG+Jc5hTuaWNrHA+Bb09uveaj0DHBTo/MAGenOE+Is6mMjZmfNfkUVBY
         PUGPCudIuV/RS1VOAxKSvBboIChnBLviJ8TuCEMpzqrZfFsqKc50RP/7pDk3s8XpOoit
         BEeRQmuyQKNgySmIl2zvtVMpw10f6V4JdUus+1UG/Uua2fYr7ZhPHkwXgORPaN+G0mKt
         yooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqk2Qvzyu9t26WJXQRSFQuOT876R213e4teZaPnt7S8=;
        b=Qyr9pa4sTMbc7SNG0WgD2ga+6nk8m71yzM04OFxWeSFI8xGmAdzsMHAy8MdkMHk1ky
         J0ljeHx6fFGMQ1U0mEsCePFxlZ1foV6hPZC0GQuOM8xOyENP9jPsDcowGDUrA0PwUGbZ
         7HY3CZ6qZvkg4TfWrnqjVWlbca6bFzHBNswCxqsJrwHXTtk7mMxVSNcLGt2aNUuIHF/y
         6iK6aeeMaM/H6DSh7XkhGPe2OKXb0gfTsXSF7g1xpHXNYXglUggOWqXOxny+9shBXYzq
         3m3svXIMks489VoXlhFYkB/NE369/x0ZpN+cDB98H7hqz5Bp8cB8Lh9dW5iKQVNqHcOV
         m2VQ==
X-Gm-Message-State: AAQBX9eZe6OioPtm+/QxVM00Hxdq0DC/FjwrexHbkgMIqAmzcVsHuELY
	nO2Q3tpsvSwpszpU9eNihu0twQ==
X-Google-Smtp-Source: AKy350a+VmyKNKmoU0vGdq+Qx0GzPI8sMXzMn4Y8hAv8s7tgu+syjGsstEfJI0RmmKig0w7ptX4beQ==
X-Received: by 2002:a05:6000:2:b0:2cf:e3e3:5b01 with SMTP id h2-20020a056000000200b002cfe3e35b01mr13030662wrx.56.1680080102276;
        Wed, 29 Mar 2023 01:55:02 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:29 +0200
Subject: [PATCH v3 08/17] arm64: dts: mediatek: add mmc support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-8-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=XaojZ0A2so1KNSkGRKVMJnwpl8L8iAIQlaJ1i/uKU2A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcl9hVkica3ymhQrqplhn/No6jFL3Bfwn/C10D
 vCjfaZCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURT+JD/
 4stjlo5xiNAPRnFaULq1CvghyHl+PhTAL+MvO6h/KWCwyrrM3apbeTLiOjcqmu90sJZ340MGt7Qi+a
 qAqezwGxIEew22HA6O674c+AR133Mx2+FVa02/TA5wVGrd6YQAxGTb0qndfaVECb/UJGh0qdySw5cD
 a45FC7f2/obl/IurYXvCZ3iE1aHYT58NqkEck6N21GujK/RUCS+C6mEaRYoYM3JXlCzoyTPY/dQX7y
 8y579K7A5dP8njLJl0lx2nJp8bIQW7JCusknUP3Q9uOxjasebB6Ew1myjgpKSJCn6YVmNtNYVtvn8I
 9DFlgUBF+5Jwo3fY1ZwDIVhcbTySC20YAi9ORO0Bskvx7MC03Vw29nSFmYZy4U046M9aPx1h5dlC98
 MOt5SYET8YUfI9ogmizNm/b5m7qFsnMMPc/Aso1/6BN6PUuu7UJ1NMZ0gKPhumvcwFVa/+27+cdNxx
 FSv7ZGzq3NpN79EVS8GvmG78FmGQPf1TEiW3apfQIJMPWChmvzRUlt49LthMQC5LlRYH7rwYv3aZtZ
 mSHqKuKtKQQJ5XBjhURYtqaSNAOoVA5aCw3rZQSqcGvPD4S9SCfedEENK6b+upE8SYYG9uuYFGO8Ot
 RxEcMJzQQA5TL5Jlg2rhmhbHgej17wjflVmHDp6YHsIjlVfy9AjvTWzNo6mA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_015506_041471_774A01AF 
X-CRM114-Status: GOOD (  10.70  )
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

There are three ports of MSDC (MMC and SD Controller), which are:
- MSDC0: EMMC5.1
- MSDC1: SD3.0/SDIO3.0
- MSDC2: SDIO3.0+

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 687011353f69..a67eeca28da5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -399,6 +399,45 @@ usb_host: usb@11200000 {
 			};
 		};
 
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11230000 0 0x1000>,
+			      <0 0x11cd0000 0 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
+				 <&infracfg CLK_IFR_MSDC0_HCLK>,
+				 <&infracfg CLK_IFR_MSDC0_SRC>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11240000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11240000 0 0x1000>,
+			      <0 0x11c90000 0 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
+				 <&infracfg CLK_IFR_MSDC1_HCLK>,
+				 <&infracfg CLK_IFR_MSDC1_SRC>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc2: mmc@11250000 {
+			compatible = "mediatek,mt8365-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11250000 0 0x1000>,
+			      <0 0x11c60000 0 0x1000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>,
+				 <&infracfg CLK_IFR_MSDC2_HCLK>,
+				 <&infracfg CLK_IFR_MSDC2_SRC>,
+				 <&infracfg CLK_IFR_MSDC2_BK>,
+				 <&infracfg CLK_IFR_AP_MSDC0>;
+			clock-names = "source", "hclk", "source_cg",
+				      "bus_clk", "sys_cg";
+			status = "disabled";
+		};
+
 		u3phy: t-phy@11cc0000 {
 			compatible = "mediatek,mt8365-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;

-- 
2.25.1


