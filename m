Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9572FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKRaDeYityyYC0OcdCumufzIaOo2oeXHdJzjsr8Ds4k=; b=XgtgzL5bKgGhT9
	x1JfMQ2P86gj5YlU6nA2GxQPBBOVAphdmPyheG3HNcwGtlr9nraUHOZRjnjND8zBY3+mF6CCR7ogh
	LweltFO0yPHwrJSe4Ex++XS1qnrTSortzJIb3vQjdbokkaDgvJ5EJcLViMYRGLZl0lHYpQMgcHeKX
	EYQv+2bZ4tH2aFMVtf32dgWNAQhdE3u6aVMVC4y0n4fAydbk5n8CXIWU+GVAk48tqVjM7xej3Klmq
	WajqjOZsPBCHtYP51U+v4HGPy5nt/Er1EWRcooTWr60Sd6VV8NYZJMHNxaKUJKpQykIwSXqb5zM1r
	VFFzMVhj0m7CTEVWXz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGhe-001UUj-P7; Thu, 09 Jun 2022 11:51:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGWN-001P9A-96
	for linux-mediatek@lists.infradead.org; Thu, 09 Jun 2022 11:40:17 +0000
Received: by mail-ej1-x633.google.com with SMTP id v1so36212900ejg.13
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jun 2022 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=yVmsRslMEUy7wlHAqgMJFz72yzFAB5LWmuXwc4lfybSFvT3pJvwKfsMXOpG8Puc1dD
         tUDQdzsuJ1GhS5m1t3K1uoPGE09QfML9JqzWT+yOPdMgxllbLb5NByOiPpxregbU5Qcq
         92H0Vw4/mfkcG+kehOeqpgbKYMxUEs1BO4C2Yv3SXqqZKkZut1xVnDwt2k4ZikG+8A+f
         EKHKFcO+T+FVtl8kEVHkS5E3E/9D+4z9TZjw6dgqIDnAb+MELuBv8wgFSZXT10dWWRlr
         7QpOxpDw/5wLtngLULFgEF8ZB+0TZ8rbtn8MJxHDuqrRGMP5fbHQCUFGpbzAFVldeB7B
         1yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7ZvfBFlgPRJsl6DK8VefG3/ZMxJo+DUINNCMnWClFY=;
        b=UmdetKT2/gspy8RBX4ZWUavfUCMZDvcmXZlWcU4VFhxVsU+cVvXVWyWAtlqm/rZ841
         cUqX7p75uzqfwNfufH0JWEuVXTFWCe9h5bdysSnKSaGAfAFx4YbMIFUI72jW9NW9JaER
         +/0y7C7QZyIvDaPE19pXsmI4db3IeVQ7uFlagjvOMLJLjRFf5kP9gBjOjIRYAaVUY0a5
         sANNBC2hXxSDz5vGELuetn3t14fahUAG7bYAjtIXzSAnKGqV+MG4xQs8ufvVQcFYArwh
         rRqk7B4lln+/OHG/x4ROWwnXrv7N84BOKrDPc8oN+3clYv1231aTsk/h0I2sNeu21GKZ
         KK+g==
X-Gm-Message-State: AOAM533RWUCEGaxbv0w4C84yjDggTMKbzlbrHjWJ8+s/qDvzfxbziS8R
	JoD6TQiGpEZflZWxL2qylCa7PQ==
X-Google-Smtp-Source: ABdhPJy4nNBXEdz+l/Sj3rWUAf/e1lV1tSllqUAwXDG63YFIeAVjqjH96BstlWGTQkxOJxGYYXiQCA==
X-Received: by 2002:a17:906:acb:b0:709:d274:611b with SMTP id z11-20020a1709060acb00b00709d274611bmr35686861ejf.147.1654774811641;
        Thu, 09 Jun 2022 04:40:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 22/48] arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names with dtschema
Date: Thu,  9 Jun 2022 13:39:55 +0200
Message-Id: <20220609114002.380563-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_044015_366541_3FA99D9A 
X-CRM114-Status: GOOD (  10.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
