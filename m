Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7517EC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=; b=Ix5X+SIsk1DoDZDbCubjCJ9u0f
	i7+r/EpxJg9Ov5Tpxs+TJQtL3r+rxq8iYvBTejqAIkvibIu83ltn2s5eK1MsGPtGB81STl6lkUSxu
	H1YNqo63E3w7m32tBMlBcMPLlsMxvOiwse5D87k8Ab40Xe0+kwVtRIusCvpRQLvU1mss+5I9KzFkd
	3tB1Di/eT0yVsp28B1trMRFBIepAK/oSXRC1MBfhTMs1/hp3of7ay/pKS9kIBj9sV0hZMMmZ+T2R1
	tr4jXbUjUY67VlltVEVzCrbetG3Fr0n4+J52x7Rtwwtjbckr8oDhppsNyVjHMFcU49+oS2NMemKAN
	DyHOf9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p031G-009uLD-4y; Tue, 29 Nov 2022 15:59:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02yx-009tEc-Ie
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:57:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id w15so9603101wrl.9
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 07:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=TOsiGYJWlU06i615Mz744FgxUDKlfWugiNsD0nyP6JoNViXxEx7FInOrowZad02nja
         Dh1Y51nI4Qw1jbdXInFs03Mvzic7wnGOScDkDV1fA27qDRK8sNMkaai0kJMjFqlS/eB8
         Wp9AvEbyjpXMZX74PXz2LnOf0C5DmOH5c5WhyPSGNCMZuOPsfaCmhtRpSVD8g8uS4+AI
         0HjwkRa7cbw1tm0JtqKdhm4FJiqGndOSMzADHcWeUVSNqpXkJuQLuA2iFewtDiGutDAw
         ywcTs8E23DP2//hSgXnVoSDOFYMfqcgP632f+oYIFineYvq1z0KNzjAdsUmxMGEPwFHS
         hN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=BMXF62tirm8MHKqH45LSdTpm+y9N/HdFBaYgFnaDekcasRliC4NPDMl7pKAiNmTkKr
         3GWWTzUgGx9T/MpZhReRNPiwb829RyZg1SgqOnksyZlMNQbYMKiF7WoPSDhXNWiRVo+E
         2Hj566x7G31xI+KuuOBlO0DaeJyJuXZsiDqdZWoW96ik/Q4DVW9btP/5j6ogVC1+RPBG
         yLorMDjl0O8tY4uKmc0it8OmCzvH0rhRi9AHbCyx0dkQKpQ+HDHFYoHAXJ3I6wbLpnBK
         45rTz/aX3cMzRc6+DUqFonSTsdNfKR4OQffdXLtX9eOSiwljHMHWvmod4cXU1fIo7dqX
         HRxw==
X-Gm-Message-State: ANoB5pmV2e4VMVqBXsKApkrL/45h3lydYnDjxiwuBudzZqRLzHcs7LMT
	YQ3DWHpXl1nVHEsDVN+sFvq1Pw==
X-Google-Smtp-Source: AA0mqf4ECiXf+xdfJdG3vPJlwXjOVlpo58ypKEQwprRXnEZBSE2h4Nf8JytGPCENNIy+0CWe3mmdcA==
X-Received: by 2002:adf:a552:0:b0:242:1425:ddbd with SMTP id j18-20020adfa552000000b002421425ddbdmr7386279wrb.508.1669737430565;
        Tue, 29 Nov 2022 07:57:10 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f2-20020a7bc8c2000000b003cfb7c02542sm2601550wml.11.2022.11.29.07.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:57:10 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 29 Nov 2022 16:57:04 +0100
Subject: [PATCH v7 5/8] arm64: dts: mt6358: change node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v7-5-477e60126749@baylibre.com>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>, Tianping Fang <tianping.fang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Parent <fparent@baylibre.com>, linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0w3mp8M+1h003hGCAyGu3KsDIgwbdfb6BOTNA6p/zCk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjhivPpE35gsPfyKhNRIC3z78IiW232tXy+OZbKIA2
 G56y7K+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4YrzwAKCRArRkmdfjHURTDmD/
 wMdcZOIkrsX6yCHGvtS81QT26C/yznAxYRkxNYzTDEM+du+IqJJtLf0oialBCX7syAleLnN22DFYZJ
 G6oBO8R5T52IJtZqIEcNOlb5PWCN7BKkLHo9Syqrp05N/63DM5K41sVQuZQyFRq567/x67KTuiF5sB
 RbQcuq3Ci7FZ/uPQFqRWXsDeJv6e10zTutW9VNj+BI8W62a3XX0BD0zA0jtLFQ79uVxvMqe7OgY/od
 gOJVNXwHDgdhU8u0brjiXi6f1A2cd9NjQRdDLHZ7KYeAulHM+fgGFLp7AR5k9XnrDb+LYKJlcXBp+0
 WCWaGH1LwGfABvAu0hVemEZJEsP1jpvzOHUdN1BMJar1pOkn4bwyV7mCf4WCvTs2MFRN89oBMkr613
 /GjAGEhviJ9H6ZdOTfZhYDJS4vZ6zCNyscKJzZq7EI4k+p71C7KGcvzVr6aKAh5FtqqaNboLQXWjZ7
 4sbe+NRK2IdZ8lnYb1P3yw2lEQ4bsxrNNsaltMYkox01+S8SMmrwDBDHw94lsMhTryUevGmuZvS6M3
 kT/DHM9EUGAlkN/CgkO5JPuD2osV8Uu46I3+oQuubap3r9uGjM4FlpC3hDAWiWDtS5YZjRGJs9LRuK
 KHJkB9un8+AsggdLz31HZTg6AfQ4ke819zx8h1bwG5ujBvHQdYLdO/flxnzw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_075720_776740_911967E8 
X-CRM114-Status: GOOD (  11.32  )
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

- Change the node name from "mt6358" to "pmic", "mt6358rtc" to "rtc" and
"mt6358keys" to "keys" to be consistent with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 98f3b0e0c9f6..b605313bed99 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -5,7 +5,7 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6358 {
+	pmic: pmic {
 		compatible = "mediatek,mt6358";
 		interrupt-controller;
 		interrupt-parent = <&pio>;
@@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
 			};
 		};
 
-		mt6358rtc: mt6358rtc {
+		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 
-		mt6358keys: mt6358keys {
+		mt6358keys: keys {
 			compatible = "mediatek,mt6358-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;

-- 
b4 0.10.1

