Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108FFC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+MV2YRPMb42Ec6VMXrDn54MdXbA5Kj57aOu4iXdrhk=; b=p261iZbC7c00bRFeWTu9Re/ze7
	UEOIKrUh3p8OrpzL4h/wZ34m3bcVMK0jpidYf26xB6Pyyubi6OZ29S4K1ae6JNjVGv+IzNVuzxmRq
	m9km9eVIQhVUFDWjgOXSMeL+aNYvhBKhZP9HBk8KsMWDzv9Gde7YoCnhXpcs9rxf3HcYQLbdR5jAf
	Sng4hU9fsD/zN/4Dx7yT1RRW7oktUSQC4DRSFRI3AGhRB4fa19HT5iXsKHVi0fAi02cfOGZW0fWnb
	dxNaIFVemW1JL8qMKoy6cBrs6fUb2ywJqA3K0QexzdsruXl9UYUvuGxLMjlb3CZG6C4DdOgHzBGAH
	I7RDMIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prdUk-003muH-0h;
	Wed, 26 Apr 2023 11:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prdUi-003mtV-1M
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Apr 2023 11:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=i+MV2YRPMb42Ec6VMXrDn54MdXbA5Kj57aOu4iXdrhk=; b=k5a/A5XxZW309WtMn2JoWpxie+
	xES0G0d+fIPh3LHSgFMwjy1Vs17Jz/s6QTfDPbzYZYN8tzR43pqHSr3pY/YbkuE4EkLwfJorXdfjB
	NU/O320RGh46R7mlB3Z6OvFAwyb//VAGAggO7LO/3L38oZYx7svCtFjpROfhvFmz6LiRcyKVw68NG
	KYYdgrR22sSl8c4shf1N4m0EWnPTxwkMyjI5yAbP50vG+mPphPI58lnH+mnBRAr7bnguBlXwlaToV
	IbdX8d584l8T2/VvViXqXqvCFIfB47itSM5vQ7kzyGIvOnYnXmYGlcXy4ZjpOotDzsb+twut6+K47
	7TCQmQ3g==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciW-00AwzP-0n
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f086770a50so46564825e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506182; x=1685098182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+MV2YRPMb42Ec6VMXrDn54MdXbA5Kj57aOu4iXdrhk=;
        b=25Nzod8AU4qYFSkCvMZLHKZUCAimmEJz1CJiYrbOFIimjx4RXU37ipuhmlhIaxKglJ
         7bK2TLm1s2YX/43jwLbQBmpIl/BsIat2N8WoUFTHwH5idsYYBiIbu+FgtsMfqUGkVpyg
         haJUs8+BWafhWxm8j1nIQgAKJuF+jsu+QKF1ZSaSBPY3ebzjSgDRETMmy5nf4XeHpia9
         TFwdcR6p+tzmmIKMSsWTCN0hkgoe3cJ0Eda0Lkv9CQs+N0UlpKnA6VqaGP+A/1MNVQ8N
         xbBf/ADgvVd3OufWPGEvFUjLNU9pFLmdc++aFElnBpw5aL9gcEaQ+E40HkNdn/EOcRWr
         YHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506182; x=1685098182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+MV2YRPMb42Ec6VMXrDn54MdXbA5Kj57aOu4iXdrhk=;
        b=CuVgpjxqPFMj8ZeRDmGVB/hWMo614Fwe/EUo+G2YvnzUMffGWQk3rnCk9rKs/iuWoI
         9CP/zUOZREPuXKWNVDe61zeCl1qsJgBKVNmGOyy42k5P/g87M0qT9NVWEm8ZfMebB3FF
         5B39u5o5nijBU35Pi3G/VGK9SYntS+e3V7IJb9RqQwihYXBMzREoFnwQaYk/HmXiPp6J
         D5wjKmTD84dWvguwKxDsIGaamj3CBumCR8mD9hHDFRRtv5F+iOt6F7OKHyrPJPCIZpy3
         5kTr6HyLV9F2hchiNxnisXramFP8hkBC9Ks5Mkt5vyViy8EHL5j/LTwZqSUhkMB6R5nf
         gjCg==
X-Gm-Message-State: AAQBX9cTngkaZfzFtY9RZ1tNwWEBS8fSR11GsqUvaWcdDu92OBKwEhkt
	4cQtGmegLe6qaSX7UXLptSkt8Q==
X-Google-Smtp-Source: AKy350ZsqXIA6dY/zcCkAn4eA6AnADYf5wsjoH0O5TQug54dyT+/wRZ5gGNhDP0aLZELRLUO1JQKgw==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:952c:3c70 with SMTP id n25-20020a7bcbd9000000b003f1952c3c70mr10898307wmi.40.1682506182141;
        Wed, 26 Apr 2023 03:49:42 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:05 +0200
Subject: [PATCH v6 05/12] arm64: dts: mediatek: add mt6357 PMIC support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-5-8d6b1cfe7f29@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=k4aaIXAKDcyErU7IaTZAPbHBHYNzTOzKpV3NgRmyt84=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/XO3wImOfkSs/V7BzeswXYzrfzBA/gpK6oOyH
 N9RR9ayJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHURUHtD/
 9bwGPmZ80v1QqrJc78yl8L1dYH3ttxEwwnHAsb5LbV7rubQNUr6T5URp30LcHI1FKYjzSEIhTxLYv2
 Ol74OmRcBVIJrVk6ZVRDdG6+GE9D2Bt5aJX+qayY6DpttRJsnVreWYNPI1tqK7H9hF/o0MV6odU3H9
 6QVqfna9Jaz0AgG7U6N6oE6k4wkeYa8CrV4Om62qtRTMfOBeQ2zekOyOYGzKlwl1AE7pAjElCfvss3
 q3eQkiFUE0f33MPElo7Xd2nlhG69jaV0NdzbzaxBbMYDon2NTHffowrf7K9I/y31AdcUNLN8mP5CMP
 vY8yn3DOUj916wsOtpsf6YmZ4p0LIEWglGs67BjtE9Vcw5RS9QhHp2THZf3vLNFmz/q71cQRagdhRJ
 34jkUiMXJDb6lOv4eqWC/GdUy0Rv8tW9tZ7hrpwJ1wgZ/jkkCwao1xKFmnr75Xljwq9KmGfFmxYLwt
 MjrOPdkOIP/NRV13KaKPoblT2a9lYzuPWMcbN/oud6kt1UOyY2iUzwieIE4VDBwLd5e27Y151Ny9sS
 fI+UNvqnjLoqS6n601z6jGV0t78HYroxQY4guYb43oGutBus4dJuqqS5gFH8oA0/0esKOXJA1Z5RKv
 cYysCLdbVeZNcRD18CbLZ0WabaZUOdZ3UP18QulllW+TSJ5JTi2suwpDFmJQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_114944_833775_CF8A0593 
X-CRM114-Status: UNSURE (   9.60  )
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

This power management system chip integration helps to manage regulators
and keys.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index dd7da86420cf..a238bd0092d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
 #include "mt8365.dtsi"
+#include "mt6357.dtsi"
 
 / {
 	model = "MediaTek MT8365 Open Platform EVK";
@@ -94,6 +95,12 @@ &i2c0 {
 	status = "okay";
 };
 
+&mt6357_pmic {
+	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
 &pio {
 	gpio_keys: gpio-keys-pins {
 		pins {

-- 
2.25.1


