Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4D8CD11C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8PBrcXDQ2BEEKeipvNb0BLB7juYOf2uUh41C8OBtyo=; b=lCwbd279Tcr9EQn4mTVye0BHj/
	cr667ZiaIVzQ8Qoy7WmicBkHyRm9+xap2S//vd6XYDttSyqC1BlGqNzIdOg+0nNQqwbpp2hydyI0x
	3s4s4xRDnjgm7Da3fV+HnOw0/11h/XRew28Fv2VQQFYpiGNefQgcf2tyWJJ/c1n8kMtYIIdLi6i5P
	dtIfrxLGFDhQy5YJ3B7GsgYUwu2qRM60i2U41ZTU5jcOVzGMzedKhMnL7v8LWkW4Q2tgDmcieTyno
	wK9lnm34SC0X/hNyrXn1ajXUh/JdrMkICnuHY0cWRk0T8zzRgYpL1rCICtLeX10lwxoPCIEF+Kebh
	yxFHbzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj8A-000000074si-2UnH;
	Fri, 05 Apr 2024 12:57:18 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj84-000000074mh-0n5w;
	Fri, 05 Apr 2024 12:57:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516bf5a145aso2848615e87.1;
        Fri, 05 Apr 2024 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712321829; x=1712926629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8PBrcXDQ2BEEKeipvNb0BLB7juYOf2uUh41C8OBtyo=;
        b=Jwr/cp+WzHbomIImA18Zg2b31HIMQpu6cN2avtFgin65eaPHI9rq8CmOA2A3zCDHSI
         3a7FHMk43DjGCCUp2oHhYElPuuulWm3x/B2+ULIM9ZqyG/qmclfy3Tam+RES/opCpQP9
         Ew2uiL5IgeNsSetJQsLTQIs1u6YvUEOBtnrqkhe2BxN9AkfjJVU9zPVf4Q0LR6fh7bF6
         Y3MDI5eeHMyk5OtciVm1auh0FXplROfGF5MPwoUEjuntLs9voVKR02gGptXz/tiSdIhw
         MPzmlTl2fiB1ABP3DfjLbWEtdJPlvUGy/Uu/13whGtCj2UUtxrekUgMp8NV3wNAdnGxq
         qAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321829; x=1712926629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8PBrcXDQ2BEEKeipvNb0BLB7juYOf2uUh41C8OBtyo=;
        b=GxtjIseoME7WAMDep8XRCRyTAkwRwHfoS3399wuvHla3jEc+7iu3FCLzDU5gQD/T89
         jEJUEptviPH7rkMSEG7YgcY+FozRBmPinjDXsquFKa/pCBged8q/cO4WA48Qr11bhczY
         DwjJ76X5/yO1IjKAN832tFZUd7BgCJMksac69u8MFrLiG8Rhdfb+OoY1MGvDWccVHk4d
         n33iQBw0aFRsMxPgYyH7kD8U7N9qQ8Ux8CHRQZpIU6tCYj0X0v69ZfETjGU5C5DUHduE
         BwjnQvkKd8ZaY6PPp6Ck3uKM7s7c4FDCY001HsEwJuFGWxW5f897nYdmKrTtDxf2duws
         y2/g==
X-Forwarded-Encrypted: i=1; AJvYcCWFewZcx7nmif5h17BPEQDTAnZ84UfYgJDLIog/xdxlQbz1pZe3cQ+FXT3Dc5ixOsJnTxbariRntkICdgY2/g8GDis8e3wsYuIX+8VvHn1xcw9n+kyS/7dU9d0cjKpexm/M/1Ubg6PTAFsqab/v7pJs99H7n2iaJzw=
X-Gm-Message-State: AOJu0Yy8A59fVEzHUq8v08YgFapgVL+1BN14m7A2xJYnaAZKnJu6ihYB
	oK2Zp+fCqCJC+gmcFSdFRXYkfrjREsr5MBVySLI73aiOvYF5BVQ4
X-Google-Smtp-Source: AGHT+IHaZY4iKt9n3n3j/0D1aeU1Xk8VSlzUQa+bqB5aEtyH4fkDn/INz6NWvpT6EkAdWhtxPUNCJA==
X-Received: by 2002:a19:7605:0:b0:516:c696:9078 with SMTP id c5-20020a197605000000b00516c6969078mr864412lff.50.1712321829015;
        Fri, 05 Apr 2024 05:57:09 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id gx5-20020a1709068a4500b00a4e579ce949sm812121ejc.51.2024.04.05.05.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:57:08 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988: add I2C controllers
Date: Fri,  5 Apr 2024 14:55:49 +0200
Message-Id: <20240405125549.11972-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240405125549.11972-1-zajec5@gmail.com>
References: <20240405125549.11972-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_055712_348232_3AC67BB7 
X-CRM114-Status: GOOD (  10.74  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 has three on-SoC I2C controllers that are the same hardware
blocks as already noticed on MT7981 chipsets.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 27098f724b7a..b4dc81881cc7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -124,6 +124,51 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
+		i2c@11003000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11003000 0 0x1000>,
+			      <0 0x10217080 0 0x80>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
+				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
+			clock-names = "main", "dma";
+			clock-div = <1>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c@11004000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11004000 0 0x1000>,
+			      <0 0x10217100 0 0x80>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
+				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
+			clock-names = "main", "dma";
+			clock-div = <1>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c@11005000 {
+			compatible = "mediatek,mt7981-i2c";
+			reg = <0 0x11005000 0 0x1000>,
+			      <0 0x10217180 0 0x80>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
+				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
+			clock-names = "main", "dma";
+			clock-div = <1>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@11190000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11190000 0 0x2e00>,
-- 
2.35.3


