Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603ACC7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=; b=v8WCF917aQKwQ2c5mnTbzgH14o
	Z88AiYjtq/iB+FFJENY3yg3NR5aIVuf2/we7l9YUxIP5VR3riZ30C+BEeVJK/lPNM5VW1j9cyfPrE
	fM1yDQZDEE+H9Q2bAH3kw0eP3kMiQm2eftvxwcEY1V5aHeSU4DOsOIEyeN2Fx22qmNZtNXsva2WZq
	7/8KMkuP7kvE8nfRV1ZRYMVe9kF0VLEHZflKRDIdHrEZGagM9jmv4oOl9IcpWdtzQtf6/6RviqCAq
	m0/fQBagAVY7v0czIM20wtQEmK3KK8xHX5m7CrjMuze+Rq6x1yEe8wghPaBahrj6RQXl7S7KOi6Cs
	i5P8FxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiDJ-00AFRt-1y;
	Mon, 27 Mar 2023 08:28:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiD5-00AFMG-2B
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 08:28:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l12so7735750wrm.10
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 01:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679905688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=;
        b=S5n//Coqt3eK6hTbYqwxt/5WkHDLgGU2MjJeM9qjPkKwQFPnAAEYOaBW/cB5WaRrJT
         Duu+PMHef3+ik97F8aADeF/nhfTXFkd+s7cbz2GeOHWNxy1riuK8lHBnFPbuLwPMCGUM
         LXh2BOCbChBA6p+JbOmURwuFfBHbXGdS0oLjrxnklo6Y5/F8gH0Gud2IJiz8AM8S9+6Q
         kbC/o9x0RQNYHCrA4E6tpaEah3Wcb3J5L4XWQKAPbZiLRVrPRmuXF0+PiNdtEP58yjrT
         Lr/obQs7g+exQtdATGBrn3c+N9m3hk7Iw+yPG/HhoruT0Jm/jmF8ih5fhy+FW2PlW1mo
         Btug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679905688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=;
        b=K06h5oZllc0J7fqzalJd6BbiYDhTNGiVR3Cx2dhAF6pEgbGBOuT57BhI7Fmx/WyFN7
         QZnW5EvqO3BOY3BqoITTix3e6E+EDZ11F5++cCJhZH5f36MPKbUsBbJtQr9rTlTsSvgh
         ZlLxGjznLkEzpHwn7tWiigYkea51449DwVmKBHuPWlxpxxL5ZFjxvnBWdugYCHZWyqUC
         S/A4clnDmytccxBbGSETKpycx14UFVtdOjk8PlXathA9liy7kFyJa3P101b2amHgAqDX
         8W+Q0icOfWo2nZE/oEmnh6gYvsNQz1ttcb+e8CwNtmHM5hK+xGCLSazKPAPk/uUQUZhy
         Yvcg==
X-Gm-Message-State: AAQBX9eRJqO4wNaFnVhu6Br0cL7j7B4TaDkOCpQ0pOyLmuU1PH26vrL1
	X9SDf4JQVXWd52Ry1GtXMYOVCg==
X-Google-Smtp-Source: AKy350YB3hUjVcz0HOV1xxqPG0tO8HVJ4mGr2zVXdfCBPNZ+4aF8LZfZ1VQeKrnHcLZ/uW+VJANqNg==
X-Received: by 2002:a5d:67cd:0:b0:2d7:babe:104c with SMTP id n13-20020a5d67cd000000b002d7babe104cmr8240818wrw.15.1679905687738;
        Mon, 27 Mar 2023 01:28:07 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm19192398wrn.111.2023.03.27.01.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:28:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 27 Mar 2023 10:27:57 +0200
Subject: [PATCH v5 1/2] arm64: dts: mediatek: add i2c support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221122-mt8365-i2c-support-v5-1-6e4f3b54937f@baylibre.com>
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIVOVvwFm7qKdwZ5fqAIYMGktI6dKizeGbo8hx4Vw
 M+z3ib6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCFTlQAKCRArRkmdfjHURS6mD/
 91U/H9o3Iw//cFCuK0mX1vV/fLdKa97DGN2ufyavXj+EIOEP2fyuPl99rsk+I75f22AWZL7Huchr7/
 7Un6yH9x0pgxIeA6btYsxNmcfSTNxKV0Zpm2yyBAZu5S2Il9b24eC7QuUWpQnoZekAhQDJnAomDyqI
 c+yAwJgszvZyeSnARrUzyjFAM1E9hiB46/VxBomQmS4qUF+8Jokk+xY6RvEr46TZysSA3jhvWn7uJY
 IJNa7E6IQUST8XWeTmZH86DwJukLcZcSz5hDLPvjO4IseLFF5zYaL1O12kdRaMxX3juJSBvBh6vlDF
 Yl9DrF3uNa9bHaGO5pigeTm7xKXSLAeAYv/FS5k+ILRQGOselZlEocceg9Fu+O11ssCHe6ArS7EZdD
 qHxmmG3DBIk43L2RCfqYom4rDrBx6QANBbzc1WfXqwGi4ncBs/6AdxzZE5s8Ok9EyHvBR9Ea2/g3WI
 4U0/ifwyO/bEGQHoIAVkdNvDGptUOHAVcXznUtB8V93G5ju3Lu38EjBU7BgCd7UKfOfooX355KkkDi
 siiDNUnNQdAWTsX3oxqmYp5tHirvCCQsEenvPO9xQirAiZRd+g85tPqx+A/m2L+HkW/RNeYbCZV0Rk
 CjLndADLN2vSn53AaED+wNEfeCqswSy4rdhKDK5hG9UYEg/fvc9B60hdtc1w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_012811_711411_58E5F8CF 
X-CRM114-Status: UNSURE (   9.44  )
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


