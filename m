Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EF8C77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZkILxJ6Vtdq68bw7xQdkDENEKZGoEfmbEhpMPLgunQ=; b=tXrdAIR+wPWR2fFUnLehu5CdeE
	tIN4MPgzOOAkclqwYwK8P57+/2xDSlkCRvn4QJza8x+sDRENZ8gG010gp5LPQSsGKyrGH5JXrAdta
	dVfn6fIKj1gzAQMa62DabQjVcPmH7d1tE2+eGDO2xU+gLlo4RtQDkBqn/W1ulErdYQ8aQr+DULE1m
	zMmsl+7XwyP2+WyGwRkcJCXtP3UPBHBAFPu2g4sSfvSS7SvAJVv2I8TVyTHwqSVibp6o+ueWWLszl
	Q5Vg3t+Z/BODCk3RIyI08kr4i3nT1bVJEx98YpBrcxhpyaZq+YvXgEw4OjEb9uCZfA9+U2ABZ1GGP
	aHVvzPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSbe-00HP0l-08;
	Wed, 29 Mar 2023 10:00:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRa9-00HCWt-1P
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h17so14833974wrt.8
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZkILxJ6Vtdq68bw7xQdkDENEKZGoEfmbEhpMPLgunQ=;
        b=Ny6tinp4SScaEinyAVcA1g96VbU9Zxjhx6xZKgAWThDifejuVWHjbMCEh8U35ZiJDA
         QDApYEsf3dDAPyRUrmaq6lvd+o3Enf6XO2kMBa8uzVjx8XnKuGUZXyNIjKKDeGdem1Xw
         klMSHcxFwQ1GZaQ9C5xtA0BZ/lr5jcX3oJuRWXp3UXv1NX1KzYr32sHxZzwugmQ/7+DD
         OzEqJwGTaCfgPrtash0//Vyzey3EO2Vwtek1zQpUnllh+K0ckgTqIfndRzTFhKdN6niq
         B5rmTjQRK9JNE9hSdAjQ8q8SKjJJoAuAbj21qpWVqTbSGnOHJvHOY7M71j4AmTUwrPnV
         mOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZkILxJ6Vtdq68bw7xQdkDENEKZGoEfmbEhpMPLgunQ=;
        b=QyXUkujfakbtcvHxCb6Fpy6Yb89/Zgekl2nzPdD86GG9uRN2N9IsFLop0URjTMxDBt
         RN0qYaWxem3B84/ZDj7Au5ZrKrpHQLi41C0MNwNNX7RxAcVqbWTRFyvudpniCN3Z/LLs
         zDyRcYw8OvB/YvbD6Y32mcG1GTTAxLj1DJzvVrdxPto5OWO3P/dY06xC1j8wvT8zUTwx
         BXQRGkV4wje65sYm+Z/mItPufZE5iOa3jmTXYMoDm3u5gB7P3SA9mtj3VQMwqJ3VSnwr
         Rw2tK6A+4hd/nweVS2hnStRfupYa4DXcojv/wm7s1CtjgmKERNGgCpsrfCDOzqs9EM00
         UXSg==
X-Gm-Message-State: AAQBX9dDr1lowP/oOakOIZS1bIrXTnwcJBuMkp00tMWiG0hXAgmuZq6Z
	uTLgS+OvBTMjrJB1USiEFslOjg==
X-Google-Smtp-Source: AKy350b0yT6nbLsCeQANzdZ+qiRWtYtBEfnPCEpncN68p3xH4zjYNQ4QUiexTT7C9yCqb/8lv8XpIg==
X-Received: by 2002:a5d:4092:0:b0:2dc:c0da:405 with SMTP id o18-20020a5d4092000000b002dcc0da0405mr15607320wrp.34.1680080100138;
        Wed, 29 Mar 2023 01:55:00 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:54:59 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 29 Mar 2023 10:54:27 +0200
Subject: [PATCH v3 06/17] arm64: dts: mediatek: add pwrap support to mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-6-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Ay42OqgaWXvHkBRm3v2vHFu33Ywvrn6P8agKkr3sTyA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcx8eMVGJOaH7KITHH1a/93g25ff5aNwraFW5C
 H2SwKpOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURfNjEA
 CUT9/wBAHlA652cq3MF4x2dcUTdIqyBnrdlzHUyA6XXI+4fkuTT6Dp9y9lJwNhF6JYdUM/4F0+03wa
 eZQIGESAlZ14lE0A/YhobEfW+ZPGWjOcTpFg9JM125YacFOXXwHRQIW4oSYIfIt1fm9MgptEXuX3a5
 axWlnc57w1loWLZ9QKEEsF3KwS7mlaMeRyr4Fr+fMvPqRyKDL5fwYAKiCY2OK6CqEJYtdd59KB+hkS
 bXh7CWFkVTJpeDtcqryZwkbY22zs7gKe7UzZUBORIYXUFsqcpJuwXjpEbXWNMw5xYhx5Npxkcij4ES
 MUb8xt4CUCTX1/LaPd78oSpUQF+JVvWte2KV/qaEmcsFA4WWDkL5bnYYiJUrTln+amy8vkgJm55txQ
 KhKJCFyIuOs2QmoLQlnjOgTpBqQTRG4vPaooD6StLWW6wfgJtNFLyH03zP0Gdfeo6OeliK86/J+GDY
 +nlTO41FutAeGc1LuyqKa/X8znvJ4KPuPnRGemO5wQNxcLJt1m/yUYragSFKAVXAfdq8hSgeS9iOLe
 iKcK/+t1R+S0xHMwj1bjHOobNj2V0DcTj3LGUr/jZF2felDdBV0uhTnOQCmMeiRuqgkDJ1gLt5J8i6
 LGVwP7CuiByV0hAZn7C6sunGcK+2z8LuK32i5nAZ88t+wTqFZOrLUlP+HOlw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_015501_543941_67C1EF18 
X-CRM114-Status: GOOD (  11.02  )
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

In order to use the PMIC, the pwrap support should be added
to allow communication between the SoC and the PMIC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e018df6844f6..687011353f69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -186,6 +186,18 @@ apmixedsys: syscon@1000c000 {
 			#clock-cells = <1>;
 		};
 
+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt8365-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
+				 <&infracfg CLK_IFR_PMIC_AP>,
+				 <&infracfg CLK_IFR_PWRAP_SYS>,
+				 <&infracfg CLK_IFR_PWRAP_TMR>;
+			clock-names = "spi", "wrap", "sys", "tmr";
+		};
+
 		keypad: keypad@10010000 {
 			compatible = "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;

-- 
2.25.1


