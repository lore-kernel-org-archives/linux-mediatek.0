Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46114C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=; b=ntBH+/D7XNEUOjUjZUu3GNSjQu
	39pltx+J6DKYKojdjSeYtNnBMl3xkg+WoN9ehkLbzkxQ1oiLUR+c/midsulXfvarbl1AbbaCH7vcf
	cXchMiEILZmqXagecwaAkLoNuPvUu66L6f7STfCqiFR4dD/Hzih9hHVHMx8N02jSw8b5/QQ7HrM1t
	tAYBXJTY/fMty9qQ8PHJbzxp28IA1anljXyAgiR2Tu6NlSH8x0FgCKl8o6QTWE78a6FETcFSpH/lg
	2sD56DpW3fMimNTiCfnumCVlREt5QQiCaMgXPhHKkc+HbZZ6A9M5SWJupunZqpOi8Mh2RRh1Ak85d
	vsD4s0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5GQ-00Dg9Z-2o;
	Tue, 28 Mar 2023 09:05:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5GK-00Dg6i-16
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 09:05:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id t4so6108909wra.7
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679994302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=;
        b=kSTUngGbd0x2rICWSwKqHBDxwwZwUqBr3JtNVGGONj1jRj24D0rImM/g4be0T0YjZs
         USUb/3lv0YOjsBdcXat/eGnwpOTfONZTF3QmR8nHEYJDy5U88VuFIlQQFSsFXss46b9v
         ZH2HDy37IJp25e1Xvkwdr7U3PtpMZsuaqtZwnP7/pbZAUXT/YYkNSFxD4FP0nqijM3ZH
         IC3iUQz8UlBAa/MiMBO6QaYzO024AQB7hkbciheNCcrF5HsyabyjrB7Hv1Gknp9W0UlT
         0jPPmAVi39YZa8SDWOX9SRnDZFm/hMKJiR+VHLaAg02zmTfHAj32vjJi7d0DHN6oCns+
         tOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=;
        b=ZKOVdeOgKZV8ji4W4UccLkHN5oafH+sHGHgx62q7mqQEO+yE/UWeKIqFOUUpX3mkD8
         2hECWEi1c644vIRByiDlIJCrWBs3cVJcBfETwVd0vjF1CGSUtU91Oz7piYVuyW6Ob9Qj
         zA9X5zx1v47Gic8r0QGu0ObwA99KJkxkLbf3ML0mM18xr86Nrd+hokGV/58iohFq8qxs
         VDqtCFnIOJvve9iW6egtsw5a+AIqQFsLe7vyxeNjj4ruGiczKTcxS3p+Sro1tnT6kAtW
         MxngpI/0atdRKe7AvlJf4/rpVEZLNa9vYPLkocQJhxOaJBruRQOzqQDvdOKs+jP1cXaa
         68aw==
X-Gm-Message-State: AAQBX9fEZT4JsOVHvYs5PwCnivxyCv6Q7SzC3h/ZSGVk42eMjyB2VbeQ
	s+NyOeOAvGmpLqchRYJ2W4VypYTX2DnOSYzIAVc=
X-Google-Smtp-Source: AKy350byL89JIjiOjxqBRHMtLnvi9g0Z+r/G3kxD/7mZHnJZ8HQ3SBI70fCbQHE89decSsBspr6HIw==
X-Received: by 2002:adf:f6c9:0:b0:2ce:a612:e3a5 with SMTP id y9-20020adff6c9000000b002cea612e3a5mr11695132wrp.50.1679994301835;
        Tue, 28 Mar 2023 02:05:01 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j10-20020adff00a000000b002d1bfe3269esm27102109wro.59.2023.03.28.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:05:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 28 Mar 2023 11:04:47 +0200
Subject: [PATCH v6 1/2] arm64: dts: mediatek: add i2c support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221122-mt8365-i2c-support-v6-1-e1009c8afd53@baylibre.com>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
 Rob Herring <robh@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=751COW4mlyt6NiZw3ZmEVilTCKVZTkOYnz6i1pHU/mc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIq27A//D5eTADCDZW5waqfVl8NWE1cZPKo7QzgiC
 QRY+qwWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCKtuwAKCRArRkmdfjHURdKcD/
 9dklIQyjq2bmzwRR1bmW/+ucAFmmdbP+ueL5/JvJgO2UYTKs0dAUjRvVeAlRUimE/+1PRxlG9vmw6R
 W2HSHcsx2m0stXGqwqLUeSGoO7VO61cHl3CD4ksm1sw8BIXkGee+9guQwuCpvm+G43Qik20amAVn4k
 76j5WjfNGANer3cuTkBqFfcI2EpUy8G51UfKyfoBvHmy543aR0A8gccs4fptpVkcYqS7QF3q0xku9V
 Tb7icnO+irswsZGNe90mnAdzUPWf4cDlcLPH2AnddCHJ8F1jpeM804/cxzzi5zs51IL7hkg54TvkB8
 4e+1jWeV64d5BxhUL+rcnRE0S9AsovOq+X+Nc7Vfr7sLnjTMCwojclLcQ9I03fRNJ5fAGs1x5uMzfR
 V8DSU3Xgzt5BcFjDbFjHIJf31Y9UgMWLexRz41gJcaiudvPPK0B9gjsEij78LnLoQD5O40Au45+hpv
 nDJOX7PHM5GrzSw0aowSIFZQVmmAb1I7JqHZqmUh4UijJf/czUMi95xVmQ6neBEAhwc0/2qy1g7f0J
 B5vqq34XX/Iyr08yVdl2oU/TW0V5AM6uA4gnsVQuBwMnCSc1QnDhuRbtf/7tdU5TDpvtaxomYodWa0
 IE9TZtRb0iZR3iJBvgH+rRojySvGge/iZb2iWhmSnG8LnJfQRT3RZuD3Jniw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_020504_462585_94DF16C1 
X-CRM114-Status: UNSURE (   9.81  )
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

There are four I2C master channels in MT8365 with a same HW architecture.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 15ac4c1f0966..b70f4d256f63 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,42 @@ pwm: pwm@11006000 {
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C0_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>, <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C1_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>, <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C2_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;
@@ -295,6 +331,18 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C3_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ssusb: usb@11201000 {
 			compatible = "mediatek,mt8365-mtu3", "mediatek,mtu3";
 			reg = <0 0x11201000 0 0x2e00>, <0 0x11203e00 0 0x0100>;

-- 
2.25.1


