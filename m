Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10E0C63797
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgoXPu1A6G8aOhAjG7a8w9p9zygyaf4s9I2TGoeTltI=; b=QJrI8pj6UMqWPk/Wbr2kvApxWt
	vCy6uZoRuOpXYDO2ApV+cn51W+f0rZfDsnJdR/OtGRrmc8JezZSUh9KjQJ2r1NvRvd5mvvpFi4/UM
	TyBSc5QZzG6xZGDW8r5zEQ+w/BfoXhPfxMoT/lYVNJ1+14UvKenfSYxUNA5dk4yAYK+pxWaumgWrI
	Hn0NuH7WqimgkYZfYkNp7pDsUSm24Zm0g/6M0KKn6f092pbeB4s6I1fg3oeYfzlpXGSTMfFiyLpDf
	Hrh9cGztCMvF2JQD+A9fZQKTHtNJ8mwJi0B9FNXXOdMDlGdh+dkMexiHaEsw4/wqwQdOO3M5ZfB9R
	w2P6nLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhgn-00DOWL-9Y; Tue, 17 Jan 2023 08:51:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhfI-00DNkZ-VP
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 08:50:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1797797wmq.5
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 00:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgoXPu1A6G8aOhAjG7a8w9p9zygyaf4s9I2TGoeTltI=;
        b=br0AnOeqEeTM0zui1xtg65KTyJzkss2Hnbj0igYV+z0AGaL3ZPigHUjl7LH+iLh9s1
         UOB99NxhPyHnEsOZVigJagAIQdCNDM2VGavpVH2lMZ3z+yD6qwJEyMoveeDWBxbUqK1F
         ZKd6b348eIeht3C4jJGN/IKf7ngNYLfIvhM+kYHnXHC3NiJwyEm8Fr6ePhAtv0EJDw9+
         0lLq1byDElzyt9jUJUycc2iMsgzJFGfmU80f3gJS/4PvmB58O80F1a2Pi/2l5im6rhd8
         MA+/y6l65ytx5H5LPYhF4dATSTXFK61F+/PKAoEaAe0AOW9chItrcYys7vlS4nVfIBrg
         pn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgoXPu1A6G8aOhAjG7a8w9p9zygyaf4s9I2TGoeTltI=;
        b=VFigucslWEk4BcQN1lm+mffJO7+J/3eyF8B329eE0YpOYHBrqCF0eSNznpneA4stT2
         GIOKJBog/vXghhoFLF7LjEVeeSt+U8C7DOPdVR2jsy4F8ydsBzhAi9lE9ntwNM9IvmVI
         NvHxkvGvWx5TtG83ws+8PMamsBwD7/q+PF51a1fb5aOP4Pr5GNLlkTzY2F9Tz7pl8bPU
         sgidgr9ic1quR8pvudLqtUy0BE4cttmJWQM8LgjS0mQoTawcwLctoxzuiR+KEHoQDuja
         V6GPInKNgzg1NOtNXNEJeBxP2j/nvvbnJTN5pgOUsh6ZG5OUt5fNFgxuwIIOlOVXTTg3
         VPVQ==
X-Gm-Message-State: AFqh2kpuHWoTTkqdptoxT3HG6JhvhO7LBmwjadrArta11gKXj402RLGz
	tzCfW+8ik9A246TAxe2P+Mamtg==
X-Google-Smtp-Source: AMrXdXuDwjuQIJ9bVydfzGqKXubMAUmMY5yYYHElltf5Pc0ST63jYYv8z3loNVA4Fd2I2eGFzTk8WQ==
X-Received: by 2002:a05:600c:4928:b0:3da:909f:1f6b with SMTP id f40-20020a05600c492800b003da909f1f6bmr2465111wmp.1.1673945394216;
        Tue, 17 Jan 2023 00:49:54 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:53 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Jan 2023 09:49:40 +0100
Subject: [PATCH 2/4] arm64: dts: mediatek: add i2c support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-2-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pLPRl4jPAYZIqf1fe/JXLH5pg1d46bBPCeqWhQgjHKU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEucJi1q1NdT5HmNXnp5kIxA1c+e049A9ok+evg
 5QXuV6uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURVrmD/
 4gskZjdw09f2tZ7bUHTkY/CVV7XUZSvc78gwOs2ISy6/sqNimRoXdAbaoO1qZEnZA8x73UFSv2cnNi
 +5FANiQKHS47maGYzC2OIaMnxsmhy8KvLsvsmgt45YoEb8t0LW5Erq8eYEWlB0qW4XzcfMloK2DZBo
 NkTlDS65SDy2FvvGJOyhmSXS0RGUzjnFz2AXv9ATc30Ne3VCoWdMn8t4kdESqovn4qWcxpAspbEX9S
 /vb/CeAquacvmUw90GvgcmZ7lOYWMlir36wYnHRrvpkEEwkhT9ibp4fRljjS9AHD9HvsJBV8aBvlJr
 nq9BkyYFSpmpnJhvDrmDiYlPjJ/uLM8urevXr95JSLe9hL03WuS/NcVgft99n081xCJ6da44ERbDrN
 MwcIeb0Qp78Guz6iICSbmkr0IChMmfZTeSm06oWPL63yLAzA2IbFCqIbe0H0a9CEW8c6k3VVMZAF7X
 5AhvgKdFJyHKaKlHpkl98w02jfFPRIKSKve0BN3Do0GwmfgicJSDded41vqU9vJ6gMPOvWe7wqVqsg
 Jllv4HfdHSwJFNwsONhbi+jbEPMzxFIFHdxK7A5GyS23UawCdMu9yeth4hWlSN7TO0zd4otLV69q52
 VqcBsbxU2S3VwSZLVsv5piHR5MIGFrontdbYQKgIiU5nwWCzvRK2LU7+0sfw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_004957_055571_88653E71 
X-CRM114-Status: UNSURE (   9.54  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a32f2b7507be..3c2819bd32af 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,66 @@ pwm: pwm@11006000 {
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>,
+			      <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C0_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>,
+			      <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C1_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>,
+			      <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C2_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>,
+			      <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C3_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;

-- 
b4 0.10.1

