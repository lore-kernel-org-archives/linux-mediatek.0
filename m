Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57120C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEvUQRyEjuyLGOQSr30JCL5wkoldAB6QzYq6vNAehBw=; b=AIYiypKtGKH6Jd
	PVnCW67hz5RdrjzG/wa/blyieZ4Efk9WmuRCKyjujfMLrqv3jLT+xcxAszscNG0l6C1bYbIQNrwoo
	g1xEQMKBWW98KTgx4GlvgUA1qHWkYQDxehANfhxZRDZdKWrfjPokYRLhJ4HdrUeZcCuHNJ7P/mTBS
	kq/0PCGEGD4ebpXnfzA7oqFE2V6OU/a0al1UA8x9MCGCEG6rTj9qKGn6TkNbrR5XpeS0KMpzkiEAg
	vcFUVl3G5A0JhVDdyKeH4r250+orpaS0bd2BPfDZRW4835X+YaiN1MvP8ZluvptKETKiDWCq+aEsM
	w9AdDxJiZGGFK3Yn2MLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jip-00BfB9-0I;
	Mon, 29 May 2023 20:44:07 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jiR-00BexU-0g;
	Mon, 29 May 2023 20:43:46 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 7DDDE60546;
	Mon, 29 May 2023 20:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685393013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEvUQRyEjuyLGOQSr30JCL5wkoldAB6QzYq6vNAehBw=;
	b=Ggy3yFGo9RI2DwMHZRxHsxRHAsUBt7zxYpA8e8klBos0XjeYwjPmH8jggN7xKnpZNi3Z7R
	WNc2QGG4kdOjlB90GtKZt2OYxB56ZbVC2cmb2RlX5QjfDAYPEvclLT+gYN7+wGSoXyNw7v
	clBAJBEkDCWQrUB37mKxZx7H9O4v6so=
Received: from frank-G5.. (fttx-pool-217.61.156.2.bambit.de [217.61.156.2])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 95DD31006D1;
	Mon, 29 May 2023 20:43:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/4] arm64: dts: mt7986: add thermal and efuse
Date: Mon, 29 May 2023 22:42:56 +0200
Message-Id: <20230529204258.65238-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529204258.65238-1-linux@fw-web.de>
References: <20230529204258.65238-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: c0f3b566-cefa-4a02-b786-1cb62287543d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_134343_455751_E1190626 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Golle <daniel@makrotopia.org>

Add thermal related nodes to mt7986 devicetree.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 37 ++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index aa9e679b78e2..a409d5e845c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -337,6 +337,15 @@ spi1: spi@1100b000 {
 			status = "disabled";
 		};
 
+		auxadc: adc@1100d000 {
+			compatible = "mediatek,mt7986-auxadc";
+			reg = <0 0x1100d000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_ADC_26M_CK>;
+			clock-names = "main";
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
+
 		ssusb: usb@11200000 {
 			compatible = "mediatek,mt7986-xhci",
 				     "mediatek,mtk-xhci";
@@ -375,6 +384,21 @@ mmc0: mmc@11230000 {
 			status = "disabled";
 		};
 
+		thermal: thermal@1100c800 {
+			#thermal-sensor-cells = <1>;
+			compatible = "mediatek,mt7986-thermal";
+			reg = <0 0x1100c800 0 0x800>;
+			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_THERM_CK>,
+				 <&infracfg CLK_INFRA_ADC_26M_CK>,
+				 <&infracfg CLK_INFRA_ADC_FRC_CK>;
+			clock-names = "therm", "auxadc", "adc_32k";
+			mediatek,auxadc = <&auxadc>;
+			mediatek,apmixedsys = <&apmixedsys>;
+			nvmem-cells = <&thermal_calibration>;
+			nvmem-cell-names = "calibration-data";
+		};
+
 		pcie: pcie@11280000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
@@ -426,6 +450,18 @@ pcie_port: pcie-phy@11c00000 {
 			};
 		};
 
+		efuse: efuse@11d00000 {
+			compatible = "mediatek,mt7986-efuse",
+				     "mediatek,efuse";
+			reg = <0 0x11d00000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			thermal_calibration: calib@274 {
+				reg = <0x274 0xc>;
+			};
+		};
+
 		usb_phy: t-phy@11e10000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
@@ -567,5 +603,4 @@ wifi: wifi@18000000 {
 			memory-region = <&wmcpu_emi>;
 		};
 	};
-
 };
-- 
2.34.1


