Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468B1C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcK7h2xkUrxUohGfOB4HeHVOM4D/ccmRrqqf2D1YNtw=; b=waToJ+BIgN/pp/eJQ5ozEoY+oa
	CM8OitEZ05wCcNGhiCgb7CWupVJWZJgQkFsN7YwNi9kdFbcJDHX+r7/pxjKCTOZNxbsmGnRdEcH9V
	1gqdAKjBAncuRMEbaIKfyeuxZKh8aMYcarGMbdIVtnfpkZt9p02FBwb9z2H7OXlqc0yBE3bzAqWDH
	1eaS9TLvtKA+5V5SS1T1IxFlGVU3o5L2J06Vz+3euHP8N8LkA3XlvilWrbycCJN+/tE5MWd4Bhf62
	CGKr6gQqtDjdNOomyu3ymYbe68opBUhDyjdUEBNQw+T8DnG8nG0qwAUmUNI5WTsxSjARb9bZx+Puj
	Gp5aBzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBC3-00CyaH-Md; Mon, 06 Mar 2023 13:47:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBBz-00CyWN-Nj
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 13:47:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id o12so38704820edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678110472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcK7h2xkUrxUohGfOB4HeHVOM4D/ccmRrqqf2D1YNtw=;
        b=fW7ieA2VtbQSXR/suVGVtqo7MTfevxllSiYiFW5Zk89Q7MScV0OjCFgu4+Em1fsi/O
         UzBw4m5Z992ZSVHDlW1lHBuKKeECpPTx05I5ov7UkY41H79F15Ao1YhlOr8DYaPsGKvg
         FxbOzXkO95eLDBoIhg1aJ2C8vCngB1jpMEMbwveEcrsiGfBq9HAUeHh5iSjMlK8v4NlI
         qDIyadEOSVjkmZTK1jim/teFzEiWGS6eRYYm2HI2+hcx2znmWEC5EBPKwxtgV9YfjSy0
         lvqnMXEUz8G9BgDdxZEaofZW2g8IDq4G8z0b5BGxztiapbuEhv8g2GiC+SK0bz6n2+jF
         ZQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcK7h2xkUrxUohGfOB4HeHVOM4D/ccmRrqqf2D1YNtw=;
        b=aXVPy9TtBD/fZ1KXWvplHUcoNnR1PSNHrQtby6HxXplI7upqMRGeQHlQWZOYAplgXI
         kCX0Oz6LAOd6enxkiT9/gDXWIrwUK0khXWyp/bihHzFIrc9C+YeRa/MJEeTKnwhEVrMf
         1WKlPJSTtwTi40P01HwrAquVo/A1SYqS1UswHsN5POaN9NUetac+U+AVX4MI/2hw2caN
         AnFfAfjS+APiObqJUm29zj4qsJYOlWMfg9E6Akx7G5dJ8LXw64l6Cy8mUVMhEL19pGMF
         j+x7NTMOUA5LD5ncASmA+pylDzremoyWO1XcFIvHZY0iKhlg9SkMREDvUjR+bOGYsBt/
         cDUg==
X-Gm-Message-State: AO0yUKUPwROK3kPR5co7zva+KUqPtsumg5jbbSIoEcanLQrKDErYbbDQ
	4R4ITymtkJwBXiMEbsf4C0f5rw==
X-Google-Smtp-Source: AK7set/niWTx+/FkDBG0ezz53/7cuKUc9uzQRtbJoXySOD5FBDqrF1VJRvaSp12rekQmppglmalcFQ==
X-Received: by 2002:a05:6402:31fb:b0:4ac:c3c0:24d7 with SMTP id dy27-20020a05640231fb00b004acc3c024d7mr11173837edb.42.1678110471955;
        Mon, 06 Mar 2023 05:47:51 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id y64-20020a50bb46000000b004bc2d1c0fadsm5193293ede.32.2023.03.06.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:47:51 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 06 Mar 2023 14:47:43 +0100
Subject: [PATCH v3 1/2] arm64: dts: mediatek: add i2c support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v3-1-ad9bb1076d7f@baylibre.com>
References: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=t815h3bcisWjGhNlfDMBygPs+0iQIdrU/JE4wcgy8+c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBe8FtR5yhYovHKM8DPrMH2h8B0A5A/gAN/vk8uke
 XNWXTH6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAXvBQAKCRArRkmdfjHURdPIEA
 Cbr9uvKwbizgB2J5nELpOhPwwOvYiyG8u+jIMewk8MlWhE7q29GmhNFWiXs201CGEtZXhsSLyeMp5R
 Jd1HWGAdQBX+MvYQVccikUYnmhMOm+8ajzZvlj9LEAc4Glxe5GC2/OrQ0JJ1ejzvKzv78lpVgjGwOo
 85+6pMkCoA75p6w0FvojzGPFmjvApr6kMfn0CAxG5+3kP6XyHilKm4YfKLCTdAHYQmIo83bUcMAImp
 TVsgXSFavb2xB9YL/4EUHTbzxdKmhL4fLCx0dHJ665lP/tzzJt5CpnsS8W/mCHW8HI6+hMx5QEb9Db
 jBpI1jha2wSNVc2uEzGlswE9Tq3SIjHeWHGlLpOD5/kSDjf0y9dsYDcKh3P9Cn8na9sEb5YlzVQiie
 uAn/F7VNwN3qXQJch1n/qjYJRak9pdWTlRXRo5vL3PSH1+ZnictdH7Eb3UnJ+266qlD/5h/bmMLfOD
 EYvh8gTa32rYXyj1sol34fnLqx/fkkzqKtjpHuscpoICCEguHJhB7zf3ieZUcO1yDuNDASkdJMt4yM
 OO1fsd8OAXqu55KsT4f/WfAyYf1m/kJkmGgolObXM9MrBQ2dzuG6RdNXP4fiPEyVvMSdlkpmwWIGUl
 ODxAUEq6gNbvHEdnRu77Va3f2l9ts7mhC3/RKKtyfOE/KmEkDxHqea14IpoQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_054755_781568_99109495 
X-CRM114-Status: UNSURE (   8.93  )
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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 15ac4c1f0966..553c7516406a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,45 @@ pwm: pwm@11006000 {
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
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
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>, <0 0x11000100 0 0x80>;
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
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>, <0 0x11000180 0 0x80>;
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
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;
@@ -295,6 +334,19 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
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
 		ssusb: usb@11201000 {
 			compatible = "mediatek,mt8365-mtu3", "mediatek,mtu3";
 			reg = <0 0x11201000 0 0x2e00>, <0 0x11203e00 0 0x0100>;

-- 
b4 0.10.1

