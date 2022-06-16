Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCCCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 00:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=; b=GMPRoVqEvuOmsypBmen5J7CPah
	WEXve6+BDWUah31NdZGgZsSx/83yDqR7QHp44K7U+vUl4UhyzYRuwP5RxiLhorEph4m+/gwMDRi/j
	pa949BYKbI4BfenDb/jr7Wh71oraChHsLgi/bQI1E4Zbn2tZ9jD1y0W/aO5tof/RgqP3piRmMw5ta
	gsPp4oFdJXVa1soHPOSlzPTGdVOuYRqlwqJmEWDHhboJIJs4HJ0uUpC8qwX4+ON8ycwAoBlreOCUQ
	iU8vKvXKGS4eS9V3BAYkqvBSr8wFt9mA89WiFTDfyloltLbdkl5MM6Fp08GgQXz2gGM3ri048Kff5
	zuwE5ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dpI-00HEfK-Iv; Thu, 16 Jun 2022 00:57:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dm5-00HCzg-RD
	for linux-mediatek@lists.infradead.org; Thu, 16 Jun 2022 00:54:19 +0000
Received: by mail-pj1-x1034.google.com with SMTP id e24so131842pjt.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 17:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=AmdVaSSwEogVe/9M1TOoUc2KNBC85KjowawNQ5OditenjCVKoATZy1xzGH0AWvY0PW
         +ruwOoIknYWN8oXkuND6gyo6SGV5QaVTkJmugDPEVIs9O/36GFB4YgbPqSFa/qlDyuuh
         oqY3gLkQ5my1bmTcQyGQquh7GIbxTRrpnmrUELsBEBSIMlKBR3fuUfSh+T8lrAc1WG90
         S3GSsuFxXJFDfFfg07AMTh+KhT3iOT9/WNT/6sHImC8K1kjtTJGbmYTpcO/k09QK3LZ/
         G4bF72u/oRkqYE5xDdIrzDbkDndwVAqfb9CK5GsZKWhUE337//+lRz6fuyGIx+HZmBgD
         qGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=tr60cJy6lVFZEUHtDb2MJXeudqJr4JbXFAURBBK1vAsO5FYxYcOV8qZ+lRApQTIfK/
         2lMrjpyof7J7qrsqua4K9NLlJVYllIJGpn5FyQYpANhfBVR+pzAcdEs3b2RlvjGFrmT9
         HByqR8FGeBrYexX5QUBlA3nRoJg7e/yk8eXdLsWtLnR7cTxNnN6Eoi5FDa3Ud9MpKuGj
         GC7c2sbnBNwk1loBDgvMmDFE4GiusuFl/LUkZD5bbyGhF0gBKpXtdhfba3zKFm9rIiwW
         hTgGsKKlg8bk9SIJ0/728xWeftinFAfrUsn04OU8wE6VeZNITYDcHv8Z68Lwui6t5bUY
         fgYA==
X-Gm-Message-State: AJIora8XLm24yUqT6EQuxNtFWu0UPeUgHbUnPyuGiRkUFHXwqLgRKTPD
	17ZAYa8CUU11eamCEVM+hnUM3g==
X-Google-Smtp-Source: AGRyM1sNObqkH52c07IQavirEDgcKWdNXNYQtVpTlkyBYahg7ZgiY+wBXJWdOuZmeBkQ5uH7e65xHw==
X-Received: by 2002:a17:902:cec2:b0:166:4e45:e1b2 with SMTP id d2-20020a170902cec200b001664e45e1b2mr2353533plg.73.1655340856999;
        Wed, 15 Jun 2022 17:54:16 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 16/40] arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names with dtschema
Date: Wed, 15 Jun 2022 17:53:09 -0700
Message-Id: <20220616005333.18491-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_175417_926230_F7EA0A39 
X-CRM114-Status: GOOD (  10.59  )
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

The node names should be generic and DT schema expects certain pattern
with 'led'.  Use generic color properties instead of the node name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index c2311733d2de..7d1ecf72a6c3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 #include "mt7622.dtsi"
 #include "mt6380.dtsi"
@@ -56,14 +57,16 @@ wps-key {
 	leds {
 		compatible = "gpio-leds";
 
-		green {
+		led-0 {
 			label = "bpi-r64:pio:green";
+			color = <LED_COLOR_ID_GREEN>;
 			gpios = <&pio 89 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		red {
+		led-1 {
 			label = "bpi-r64:pio:red";
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&pio 88 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
-- 
2.34.1


