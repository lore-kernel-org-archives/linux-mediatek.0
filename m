Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA5BC7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXh/enNCt6k/VhDbW4GU/2xM8uza5LciUBEJxVS6EdI=; b=EocwFi1Te7nxvF
	EOO4x+Zqxx0MGtfKD9UnKCHrxGMS+Qz8zqiyNB01ZfzOYmpcUawblFzMkd2vP7HvhRrWWwkD8UYMQ
	/VbOKCdGZMHM1as6k2PAASM7oM7TPI0bJMm+hWjoZQglAAcz0zj+K3eOl9WV7rbzK+aqVhSuDttdC
	aHXW7WvvrJa2lFRbIFDiDrffd57p7LCAAqHL/KHRqRBmhDFDwJ45ykykWKlTB3GdPgAJok4ClDz0V
	3MYOwXHGf19hRiLRic4oUmwqij/GVQah/kC8M55azYkIFno4gNdBR26k5vMAflP3aPiLA4GzWkUDQ
	Y+wDjIwba+sbHB3vv5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45iv-00F4Mj-0v;
	Tue, 30 May 2023 20:13:41 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45iq-00F4J1-1S;
	Tue, 30 May 2023 20:13:37 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 9E38062608;
	Tue, 30 May 2023 20:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685477613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXh/enNCt6k/VhDbW4GU/2xM8uza5LciUBEJxVS6EdI=;
	b=CI8BBcYbvix0dTim705n4OMjImZz6V/xlQ/NOsayZsWYdaz0AMBFPnx4W2blggIxZ/o0QE
	Njfo1MNnEJtOuhKnGyrFzzIdLc3sxhRtuv5vSk5vRDlUurCYgBuof80wfqZi0fplupWlY5
	xzgWfpJE1thUuH9z6qij6vrdS68CrYI=
Received: from frank-G5.. (fttx-pool-217.61.157.145.bambit.de [217.61.157.145])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 649944092B;
	Tue, 30 May 2023 20:13:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] arm64: dts: mt7986: add thermal and efuse
Date: Tue, 30 May 2023 22:12:33 +0200
Message-Id: <20230530201235.22330-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530201235.22330-1-linux@fw-web.de>
References: <20230530201235.22330-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ad369705-4d0d-4dc7-9ee8-39fb1ed9b23d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_131336_680405_78249F93 
X-CRM114-Status: GOOD (  10.86  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes in v3:
- efuse compatibles in one line
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 36 ++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index aa9e679b78e2..ad4fd77b65a7 100644
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
@@ -426,6 +450,17 @@ pcie_port: pcie-phy@11c00000 {
 			};
 		};
 
+		efuse: efuse@11d00000 {
+			compatible = "mediatek,mt7986-efuse", "mediatek,efuse";
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
@@ -567,5 +602,4 @@ wifi: wifi@18000000 {
 			memory-region = <&wmcpu_emi>;
 		};
 	};
-
 };
-- 
2.34.1


