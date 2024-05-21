Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DA1C25B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=; b=1y3OImusB+RTC3V90FBJsX7Ndk
	a8aZq3YnjydxdPuT0rF2ymKVa4Ze6I3Y8APPXHvHNU0ieXWnLPRwJouf+OLiLptswlXbWm41nPUtD
	SSdL7pz30KYH2/vPmoBZi0utjFfcJDbGkE2jIyiZXn8c2am2ILh9Jn7w5ODig6TmAoI+shVZN8TgE
	V7oOav3TIz/glhD9w+sVhzMeTm74YKDjbqu5UXG4MhUf7cqz7O4CEV0F8zog0j7TOOaTH0vWv2ywM
	L8gzBRHGMhw7/d5ej5DqI0B5zXZo1FwYZ0C+a7TibntCcF3pOIWkQdYX5gIrKcEkLm7ilDtHrOWy8
	Q0EfHhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Q7w-000000006GA-0NnM;
	Tue, 21 May 2024 14:06:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Q7q-000000006At-2nmD
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 14:06:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41fd5dc04f0so23494825e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716300349; x=1716905149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=B9bWkQYE4bkV14TlG0S3qz9QbkQFfk+5zkMHHKiNFvOrtfPGkI1y0DMlzcwQ3ZzDy/
         twIs0/AGZGT27WCz9vSTBO19QWn0WZtW3vfHs7BGjPMFXYkyT9xECRJ4fDRdUqZqSCds
         dxI6cX1LHh1QhQiDGI2IKAH3+18Ezqxf4zOfgH62IlGtirgYAB7CybTokZuHbGWQPnfD
         9XDYttmg5VYp85+e4caYdcdpima+VzcjuV7Kuq/n4Jux4WRsrhTOruvYB2ln4dwhVuEW
         +k91yLRYjUQehEwb4jPsPSPIj8GijiT+1GTPIF4cTAUx+2+zvs3wPzqx8y75D+fQDFLL
         oINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300349; x=1716905149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=SeAMPUyShlLOuwLW1YzTw08z6PG5DBb8rKU1zL45XbB9cfR+IIFhIeWFCteqlgKDcq
         R97KSewuIIGow2be41yNk6rTO2DkALgk47WuPGrJ5cSS4C+xAW2KmUDi/nFGtRT+sRMw
         quqsUmbqOSQHzCBB5OPtlG5BD81Zi3Yo65e8EA2cbIGmEgo6sVDGeeM7b9WLZS58uAjP
         DQrbUZfMMC6vvwHVgitAWhd9FoLYhwthnzld6cBK735PSeq3NeKtl9/+cdDfYVt4AxqA
         00OzceOfE7iqhLU0LHQSTbWE5onAiipCTFFVx+1fXFKE8E27IdL/OEz8rnPzZztMNShN
         P3iw==
X-Forwarded-Encrypted: i=1; AJvYcCW8sMhL0uUVnEmViIgNo7jtqbuaDeIzfdiEkdv+xBYSBfZakV5XJYz+7ihEF0Lwapevl3YZrhr2Q03aYniMFWSO89rVmxsgm7sdc7b19um97l9U
X-Gm-Message-State: AOJu0YzRpbm7MeP5eb1gsKJ53NxVimPzmEbFZZtssSWyEBB4akUAdqI7
	6RT7rXr5dRoFu0aZ4KtGqpysquY6D4pUAm8/J08toA/rDl2Xm9bsKwXlJhM5mrA=
X-Google-Smtp-Source: AGHT+IEa++vEX6S0j4Qn/W6RWxeUoiqgzZ7i5R9ToZMW8f9WDpRB2jx7hqSqjlNUMUX/xfHdMq+oGA==
X-Received: by 2002:a7b:ce0e:0:b0:41f:bcd7:303f with SMTP id 5b1f17b1804b1-41feaa38a8emr336486565e9.16.1716300349354;
        Tue, 21 May 2024 07:05:49 -0700 (PDT)
Received: from [127.0.1.1] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42015deac1asm342085945e9.17.2024.05.21.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:05:48 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 21 May 2024 16:05:35 +0200
Subject: [PATCH v4 1/4] arm64: dts: mediatek: mt8186: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-mtk-thermal-mt818x-dtsi-v4-1-b91ee678411c@baylibre.com>
References: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
In-Reply-To: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716300346; l=1717;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=ZXPmUPXXFa1JCVfBMk9FrptEjzZlcdWN0z1cSMSnOwA=;
 b=rHnbnAL2mPLXp0uO4yIwYFoqu+Y2g1UyXC2LBLUx32VUK6RlUWIUCjZvwl1P1UCGxTrtDtI6J
 XYPKEf3F01NA7jUuR/3F2HrthlbW2N+RFTutwMV4M5HM++ukraBP8m1
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_070558_885228_AD1FB7B7 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Values extracted from vendor source tree.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Link: https://lore.kernel.org/r/20240402032729.2736685-8-nico@fluxnic.net
[Angelo: Fixed validation and quality issues]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4763ed5dc86c..caec83f5eece 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1361,6 +1361,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8186-lvts";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8186_INFRA_THERMAL_CTRL_RST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
+			#thermal-sensor-cells = <1>;
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1676,6 +1687,14 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			lvts_efuse_data1: lvts1-calib@1cc {
+				reg = <0x1cc 0x14>;
+			};
+
+			lvts_efuse_data2: lvts2-calib@2f8 {
+				reg = <0x2f8 0x14>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;

-- 
2.37.3


