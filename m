Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1812DC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlUPFT5LnAx9YsUAxMPVVxhEMNKGvpW7llEko3PxJJc=; b=zELijapdSUsC070UqG6yNuWyCj
	7ZeTqnAJoFC1TLEWdmjl3qF1vSbZp+DPXIKPEYvWA+8U845W8ewgzIpK+DYgYVsovUyO8k/rNKECi
	cI6uZKiepIVviL4J13zBUWhlWGuZ0K9TH3pLro1KApDTpYKwPuzX7vSYGH7USLrIVWHNLDHhd69bA
	CHpaLdE9N19/KRonAy4dOyB0ORbxTa+EbmOXdHw5S2AdbnKR4YJemdtYuJltcVIfVIrjcQEAQwfLU
	kLC+qIxwH7phpAEiWX1cOVIw+ZRRUW+AV3htcTdnIBZLf2v3jJwSmi4xwqLcrc90CyEFbGpHPtpMH
	7KDyGTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYQi-006B9V-Am; Thu, 19 Jan 2023 17:10:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYPb-006AhV-PW
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 17:09:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id d2so2507827wrp.8
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 09:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlUPFT5LnAx9YsUAxMPVVxhEMNKGvpW7llEko3PxJJc=;
        b=yhzy7rhZNGRyyFFztwDyv6b+ynsjiqP7Yo3+hZMwQDKqWScxMNvHS9Jtrgg9vOG5Pg
         drnkfX+KeQ1d8Bu+of5dAru12C5P8a6RE7LpUfEC5E06GPKFKYBftxzDxU48byKgWJIx
         zVeBpSVWr/8VeF9O9sRPe8EXOndY5R0rEILIYnqnxBmDt8uqMcE3k+rAZaovz7nj2Elx
         3tX0pKxIl5FqU75PBtGRbcsDLUhHFpuRnQb4JB/0/kWB4adpDBHtIvAaNsPWOyepahI9
         PjSTUPzhBD8ahLymqqY4i3NVhAQwl26hPFWwSoNY7CPEcc7ItYVQo6b/ULDsmDTH7tiy
         IsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlUPFT5LnAx9YsUAxMPVVxhEMNKGvpW7llEko3PxJJc=;
        b=wbEyVUQx/VnlfsvUUcOg6jOQjKQU1ohJab/ZNHgOVF8kwD2o6g1wsvhitN4RiNMBpL
         FNYIKVqViKhMK/u2aj/QUE32dP6TUXCoWzhNo6HDVfZOwkGSM+ytZ9zemMq8gar04pKX
         NTZoL3uujv/MiCvH2JB2EJy6I0S2zmQdhAWWto1uMFcx94AlaoKBY75xANsIh7lSfyV4
         WiplFj3/F4L/UcaLetrScLdAMuEdg/QHQCTHeAghmDekgyHg0oOEQBHPn8nM8jxWBuUc
         gDbCROaRtdAdZ7AI8knsbHUjbyFDPt0Yn2N9wklVJXBRvkLdPBP9sSiJS/DvFk531Ajw
         nDLw==
X-Gm-Message-State: AFqh2krkIj5Edo9KwC9P/+9eUXw74qqs+jc2gJ+42CnOwDZfgYon875m
	26V/Ci81rKbwklLuDyKPJBa50ZFtMwZeJZiN
X-Google-Smtp-Source: AMrXdXvHQSKEQ/RdT4gpmXWZ3OAen7L9xGEUoiYMPNpCEiEUmm1oaSDe9qel5bZaULsKuhg8fBJAgQ==
X-Received: by 2002:adf:a3d9:0:b0:2bd:deaf:6a88 with SMTP id m25-20020adfa3d9000000b002bddeaf6a88mr9992146wrb.17.1674148154050;
        Thu, 19 Jan 2023 09:09:14 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm8738701wrb.9.2023.01.19.09.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:09:13 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 18:08:53 +0100
Subject: [PATCH v2 2/3] arm64: dts: mediatek: add i2c support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v2-2-e4c7c514e781@baylibre.com>
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-i2c@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3qzpqDF5qfsZV4KFvmmkuAuRkJdkE+nj1hKT6VsiEUg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyXk2DWa0vY1hFgtNfd4QTVahKvP0ZkrY5dVux337
 SpiXGkOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l5NgAKCRArRkmdfjHURdyLD/
 0STpm6+z3UnD9cuzRfXOhPP7k4MXyxU7tyhUjhe7GaHnlEHZbXPMJ+L0M05jPyPCla0vFPcMDJJyrM
 9Zg1Mkl3SnkvD2sWiVJg6uvZsqIGnPpBeo33iKV3EmpjMxw6Shw1NPNb61FpEQX0fdriFOnoBvTgC1
 vybtbcFuEFu2QgKKRlhMo2TKUqBb5WlaPBqZD0LpAv0IQM+BR05th9TDcjpREv8WXkgu5s75T/sn8a
 /hq780PeuNb4AC9ququQ7mixh73ajBrCSuCoWBORqsYOkvegWqklX5G/tAd7r43F+6t2inGtnEVVgD
 5Jd3BB9r+Mma7U2VmM7bBCFPMDnem6Q1vg/KBogizDT5EQelJTEsF1QmMxj+yoLjVhTSvNaofvYba1
 GmKKacDExAHvwAMiOkebr26DzK30nEkmsxitcA5mo1QF9RRgAHyuQV0buR2IxZSM/7G2Se3LljeLXu
 EJiYLwjTGrxSWWqkYa024eK0IO0KS//GwNgrm3ckgyiCFnx4848OuqzUF6F8jYBYgmZ5F2o0RBIU7q
 VZ3oTKfPMUgfLatolft/J5pvr9bnz4bK0dr2V4QcQGLjy+5J2VvpPEQj+0haNMoM20gG0G2vebEWE8
 uJ7f2udZP3tXCg8UuXwxInHrgexGGnbYvXgJyMo2g3KHprRrOP5iVKt8TieA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_090918_290666_BC8FB58A 
X-CRM114-Status: UNSURE (   9.09  )
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
index a32f2b7507be..013beb50b4aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,58 @@ pwm: pwm@11006000 {
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
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;

-- 
b4 0.10.1

