Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34912606A327
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q2kDua8N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKChQhQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=; b=Q2kDua8NM4mfo9
	msqXskcpf3N429K+VqP+K932zsTcjuhVxCnUbbVehOATok0/hFtNHSrThPkdC6bSsUGaF98/AxVgn
	+a4Uj3ixgoTfa5UCbfgSWUwdjtzr06o2DNIaj5Ngji+F2gG/PDZprDegr0czDWbqjmhcUrWd4A4p5
	HNuxE26I31hdpdWSLo5uS48JHn8A6GBAQ3JP77KNNCy4IDO8NY9cvJgPYUm/oIoIz0BtLv9Kb1G1+
	P8dP2CL1+z6i5qwN7azjauUsYWT1YCsDnbi8qAugV3Zhfh4NyJGWM5jOuPCA4opYPhvJ4rg44z7BT
	es5Z96qtIZ2Rvlu9tPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJD0-00000000p8h-3vWn;
	Sat, 28 Nov 2026 14:15:22 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCy-00000000p7S-2waG
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:22 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-33fb4680717so6874123eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Nov 2026 06:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875320; x=1796480120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
        b=nKChQhQFoWn8kRHou3V4Ap9y/r3X1eWTGYmFDiZznZudKvptM5enfg9zEev0DU0+sx
         DCXaAMu6K1KDT6q1pzelyg/BVJ8aQHUiXp2gunh7ezK3rE4hXtsh/2G1PnD+zXqDRb02
         8S4QKo45I3keFFaNERFrj5DJ3iTA0aDekSqqz960APRn55DASNfaZ2iHbW22meEnXxvk
         WYaZYhroHm1WV8H8/LRJgyySpFtABfVPhCbuqvg4wJUzSOAhdCZcm3AOLo2+A3I1lVOE
         iqaSGsNUFFGuhUAOR6JunTKi/A1j/d4RFfGhCJNBpmTScudKHe9ymhJSMbLbAlUy3fAi
         yVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875320; x=1796480120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=he4/rKCDgbdZk3ll2x91Vj1rujh0RIHLy9dZg3Zrwz0=;
        b=HfN3aGBhG9m62PBXBA5wEOA8DaWvSmcIip2fj6nOOEdy5LHVHUJlgbNCSVDkR56D4y
         wxztH28q15agWk6XEf7RVllYrEaNgaR4TdgXCwlW1DrZPhPT774SALm7WzUB4S1X+BzT
         +PZyJUWC/v6YDQi214oB9VAq20+b/KeOlW2B4L9m1zInhHdBsJmXbvT6uz+CVzWcXRR4
         6wN9Ad/5y5XW159lypxICOswc40bfriIeRyPZ3f4CPHBTWkA6Dh1fdW1uezNuLT7r1Vl
         qDeucrDf0V1eJhlaDjNMP7eArgYZ+ATmt/nzFPaTuZ2v48IydYV0/11CKvMwGytagCVO
         tvLw==
X-Forwarded-Encrypted: i=1; AL+hErHQ0ISrPx7gtWwW1wJ+azJSPqxFwV8SCe+VHSHrpzMyCb7CQa06+O9Qx83ORaf4AqoRStFksBnugLuoFcs50g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9HlXmuJkPCaVR8vRmMf0NwIBeZINHc7Vni8Zbjj5k8PvPsf5KI
	aDt//m9s81EuTJyL2Gx4qr7Rcv/xCEyxixeWbpOAOwSq/rq8wzqxvVky
X-Gm-Gg: AZFdTZcgPm0G9FsRC/2QxtkPbtgMMP3tgAiIjkHxslFboR42NyCM9umBygSgT2we9E9
	8YvSbRkFaV7kkvpPLBXz1BtbBYOae8bB4KJKcYngjaSSLndEEO7pMo+6i447TaTGk3OoYnh5jQF
	S9vucroWD8IHmmYXohmdDQHwS0uDPf1D2AH2DE//0OdauOp6GbOCf3erq2M3mUghTdjVrgGzhd3
	O0Oi2bEsQRDZHOs35Izng9cMLEfme1sNAGK4o2UGebr+Uu0jz/Y9D7EYLpqQ18cmPfoDmrDPMSJ
	1mZqmLXeA+VKu30cDQ0o2aTDfLuf49jBIJJGFkZ6DLBLpTeA4ypbEX1gqBrVJqcmAQpPR7nM/M0
	tvs+r/0w+Yi4RSB4y9mlJSIg580bx6A5EaCLN0b+v4gn4Vfhl2HLC8gqvAXWSQKk2nrTMWw2qOP
	UGIqXc1DypBXANWMqg/R1nKjXBnJdzhLM4PaCrIU/EEiGhL4bTIc8IP4GkIdsoN+T5i3HhsZLYd
	Xy4/OJvki14EJb+G8fFpk159bmnNg1GCY7lcX6UWxDlRGA97cy/oXz/gsK1nTZ7YGyBYyZtNfpT
	IcPZzDuTVlp6CZ+i+tTy79MDJw0c616XvJ85Q1sViJMiSZ98ljsMKyvkYbygZLzH01dFdNXYn6z
	TlC4qkS5T1vOsxdvanJaZErY+mJzh
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id 5a478bee46e88-386b82605b9mr16717778eec.7.1795875319705;
        Sat, 28 Nov 2026 06:15:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:19 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 2/6] arm64: dts: mediatek: mt8189: Add SPI controllers
Date: Sat, 28 Nov 2026 19:44:26 +0530
Message-ID: <20261128141443.13065-3-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061520_766875_F3F3B9C2 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT8189 has six SPI controllers. Add them, disabled, so boards can enable
the ones they use. Chromebooks need this for the EC, which sits on SPI0.

The nodes follow the downstream ChromeOS kernel's mt8189.dtsi, with the
clock providers renamed to match this file.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8189.dtsi | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index b64882a93..e0883da15 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -484,6 +484,90 @@ uart3: serial@11004000 {
 			status = "disabled";
 		};
 
+		spi0: spi@11010800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11010800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI0_SEL>,
+				 <&peri_ao CLK_PERAO_SPI0_B>,
+				 <&peri_ao CLK_PERAO_SPI0_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@11011800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11011800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI1_SEL>,
+				 <&peri_ao CLK_PERAO_SPI1_B>,
+				 <&peri_ao CLK_PERAO_SPI1_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@11012800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11012800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI2_SEL>,
+				 <&peri_ao CLK_PERAO_SPI2_B>,
+				 <&peri_ao CLK_PERAO_SPI2_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi3: spi@11013800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11013800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI3_SEL>,
+				 <&peri_ao CLK_PERAO_SPI3_B>,
+				 <&peri_ao CLK_PERAO_SPI3_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi4: spi@11014800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11014800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI4_SEL>,
+				 <&peri_ao CLK_PERAO_SPI4_B>,
+				 <&peri_ao CLK_PERAO_SPI4_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi5: spi@11015800 {
+			compatible = "mediatek,mt8189-spi", "mediatek,mt6991-spi";
+			reg = <0 0x11015800 0 0x100>;
+			#address-cells = <1>;
+			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
+				 <&topckgen CLK_TOP_SPI5_SEL>,
+				 <&peri_ao CLK_PERAO_SPI5_B>,
+				 <&peri_ao CLK_PERAO_SPI5_H>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk", "hclk";
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH 0>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		auxadc: adc@11019000 {
 			compatible = "mediatek,mt8189-auxadc", "mediatek,mt8173-auxadc";
 			reg = <0 0x11019000 0 0x1000>;
-- 
2.46.0


