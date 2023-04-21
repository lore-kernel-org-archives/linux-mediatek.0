Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1311C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Chq2A5ZaKQ5AonXzE0cmKnIIyaGF0ZRsNYPxOGHLHdk=; b=LrSlI4sSAOZZ+Q
	7JxSOS3t4Yr6Yzpx3UzvWvYtzPoF7u1dfRu1+lOOdgaCrtUIT5ZpTd4xelRMHcYAJqs5yhBg4DO1/
	Fc+DsmQmizhrSbZ09G5UgsRNG70rKh9Ayp5uqwC7Zp2kL0/TTOF3CHtrgyUY3CAI6ONLTwTdtlWN/
	tUfwDjzbpMZykZhU2MqS3+q+OFo5dqIZ5ARZ42SVmyXAndJdu3HoVIAEdqFeTeOeLyQcv0S441+aq
	hvsty2DYXwqDKpLN8LZr1Wz7sBpEyXbkavP2ufpOm+HaMVja08M+CpewYdoG6vd2+t0gY9Wpbjiej
	zAR6IlZfhV3BWbTexOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqhW-00Axcs-0s;
	Fri, 21 Apr 2023 13:21:22 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppqh9-00AxTH-13;
	Fri, 21 Apr 2023 13:21:01 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 5BFAA401E6;
	Fri, 21 Apr 2023 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1682083256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Chq2A5ZaKQ5AonXzE0cmKnIIyaGF0ZRsNYPxOGHLHdk=;
	b=PruVhIsuYMJcYiD4PID30UKnRStIz7edJS8EZMRdfvOr5ywuRQkVmjEuvFKIzO3dv6Dzpi
	Mp/qF+to4zLBo/1OLIvxF/YRoBpXT5Iy2nWJ0ESrJ00mMzhGfiZTJdsTMxlOiAOxNN+vh7
	Lq3fzI5jnZCu6+TLtadK6m7JVYjHvLQ=
Received: from frank-G5.. (fttx-pool-217.61.159.143.bambit.de [217.61.159.143])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 634601007E3;
	Fri, 21 Apr 2023 13:20:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/7] arm64: dts: mt7986: add thermal and efuse
Date: Fri, 21 Apr 2023 15:20:43 +0200
Message-Id: <20230421132047.42166-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421132047.42166-1-linux@fw-web.de>
References: <20230421132047.42166-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f64cf289-99f5-410a-8bbb-41118ff9e27b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_062059_508153_4FBE605F 
X-CRM114-Status: GOOD (  10.88  )
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
index 51944690e790..a38965e23825 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -323,6 +323,15 @@ spi1: spi@1100b000 {
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
@@ -361,6 +370,21 @@ mmc0: mmc@11230000 {
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
@@ -412,6 +436,18 @@ pcie_port: pcie-phy@11c00000 {
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
@@ -553,5 +589,4 @@ wifi: wifi@18000000 {
 			memory-region = <&wmcpu_emi>;
 		};
 	};
-
 };
-- 
2.34.1


