Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD9CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y6U/O2cW1kp0MEYYlgdcRumC1g8PUdg2NEss+CEK4Y=; b=nk0kgXiRSP9rwLxXS6IScPYDdL
	WerVH+f6+/qVPTFWgyLaFDyZVheBZDQZ37EHXVpqF8GaQ3/yPIoZbQQi0JeNnQ2ewJrILAEJBHmgp
	VFiv2ne5gU0AQiEwkbmJApruPp23jCysk39aOKnNgZ2XsCoENOfjwKrgssxuKdRfVxnMFZJ5eCnGQ
	bBidh3Yte0+I6koVfdvIm2oJydnsjHDoQEXU1ruLBehmbCOHTIsv6O7yvjgxphd9f0O1jBeXj8XER
	0BDyVrA9nL98P8+RmEkbgiN3dhAxTMG85mVrxxxxbnXxsIdM5Z2XRS8Fwaq3RmBgXbki+n7BF23Mp
	RiqTRBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL53-00DUTa-VX; Mon, 19 Sep 2022 18:01:18 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7h-00D4Pa-MS
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 16:59:59 +0000
Received: by mail-ed1-f48.google.com with SMTP id y8so98630edc.10
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=5y6U/O2cW1kp0MEYYlgdcRumC1g8PUdg2NEss+CEK4Y=;
        b=u9o63LTxFa7L0qIFlEApgQkRIlw0NFfFQtW1Vdw4ql0gk0AkcKQUA308pxM1LeQsTV
         ealEEZUUQ1Hoc26qB9doB91p2dMDciChIfhr5efax2uEJls/dFAHbvg72hGqyPc2ZCli
         /jtjFI0iCGSTOGhwM0REsrlbCu6NmyGmUve8aAOWWow0ddGpbjiYETkTphqQ7chs719p
         i4s1mpSRVVmRqL3N3loAyHeDe/c22M5IQRRGBjhk0zhNR088zfQCYCghvg7Gf0yjBkOV
         jWYjrMsnDxopS6FaQY3glD94bxQViwhQjaECJnwkS+0NUaZXxlVdW4g7EbcdNq8ZdMwI
         t5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5y6U/O2cW1kp0MEYYlgdcRumC1g8PUdg2NEss+CEK4Y=;
        b=AA2DJskwj+qNEbGs00Z7gz4T+7CrbwsjX8BJ+tNfYeK9W1GQ9ohZ/wHYvDXNBl2rJN
         UIulZfPfTb3un+SCVfihhcsjPWH8w9ZkK2cI8xDdCWR37iN13aEzmwTjesInb9ejLhgW
         uAhAmedFeZUIJ2qEx6l5qxXJDnEP0ikix7nPw0ZyC+tZ4pIB4oanTqYwcOy5NuQWG0Af
         v/gM1E/h3sI0MDuMP3fl0YRgdylhtZ96tM3fDejqRL+04OLMwp6sE2CLIBLfQWzjQTak
         qmXf+/4rKrkVBklP6ZDvOnfPuzUU76yX6H25EsoDHQlcBykMtawRo7bIPNPg15N2u/c3
         +mFA==
X-Gm-Message-State: ACrzQf1KZVJXbIQaceG/WuATsi1VtK1m+ZflyPxOeGuHBGL9jjewdclD
	0ZDulUgcaRWrPHgtJpws6uWEoQ==
X-Google-Smtp-Source: AMsMyM4z9QtWkhNsKkQaCij9zXzUMc6vE8fa01Z3HxRTpUioaFewUxAHVAEU609+mICb4RrhgGgc5A==
X-Received: by 2002:aa7:da97:0:b0:452:bea2:5200 with SMTP id q23-20020aa7da97000000b00452bea25200mr16562187eds.341.1663606794718;
        Mon, 19 Sep 2022 09:59:54 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:54 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:04 +0200
Subject: [PATCH v1 06/17] dt-bindings: mediatek: set the hdmi to be compatible with
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-6-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_095957_766319_2A5FF577 
X-CRM114-Status: UNSURE (   7.80  )
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

In order to share register with a dedicated ddc driver, set the hdmi
compatible to syscon.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index abb231a0694b..86297b7eb7f7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -16,12 +16,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-hdmi
-      - mediatek,mt7623-hdmi
-      - mediatek,mt8167-hdmi
-      - mediatek,mt8173-hdmi
-      - mediatek,mt8195-hdmi
+    items:
+      - enum:
+          - mediatek,mt2701-hdmi
+          - mediatek,mt7623-hdmi
+          - mediatek,mt8167-hdmi
+          - mediatek,mt8173-hdmi
+      - const: syscon
+
 
   clocks: true
   clock-names: true
@@ -142,7 +144,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     hdmi0: hdmi@14025000 {
-        compatible = "mediatek,mt8173-hdmi";
+        compatible = "mediatek,mt8173-hdmi", "syscon";
         reg = <0x14025000 0x400>;
         interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
         clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7640b5158ff9..3e7a0f406631 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1306,7 +1306,7 @@ od@14023000 {
 		};
 
 		hdmi0: hdmi@14025000 {
-			compatible = "mediatek,mt8173-hdmi";
+			compatible = "mediatek,mt8173-hdmi", "syscon";
 			reg = <0 0x14025000 0 0x400>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&mmsys CLK_MM_HDMI_PIXEL>,

-- 
b4 0.10.0-dev

