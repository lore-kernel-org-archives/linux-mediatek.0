Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A2DC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enp8+k53zZNO3mOQI9L8FtkcYSdTpwDeQcTM39YWFvY=; b=4eIAoSmatTAvkg5kIgBg2Zo3WV
	qjp4HGn5SOgS2BSXgbX6D/JnR2UWT2eFJyOEexq/MnfBhgB7c7JLzl48BLXWST/7kKRnOVzj8/gMp
	xAgpEyE1cH2MF+TBPblP8hEKP7tQIbWz+9RLIPVn9fxx4IuJjRnO0v9U6tsDlTN8MivRUBljDebhE
	aGyjXJXJ2IW3BwF/8MTA2LpLA7jFoCcRyOYsI/JK4tR1z9V0UUwQwlXOSmmmCqfc81xmWWpZBySNq
	dkbdJGKDSNnvkHmbORjD5qOkSJnvygFnPc6RJA5h104+jDOE1YzPhw54SSzCl3E6vx+P4xpt9mHZ1
	xJb9xK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfle2-005Atd-0q;
	Fri, 24 Mar 2023 17:56:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld8-005AJW-1Y;
	Fri, 24 Mar 2023 17:55:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9891D6603132;
	Fri, 24 Mar 2023 17:55:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680505;
	bh=+C19HY45yz9Sl0OrylkeSlqeTXjPBT2+I9ZB7T/mxXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mUyYmZkjPt15oypSkEsngDvZ/RDWtpwT5TLj3nZMFoVqYB8jeT/iiBLY6FSU6OZdn
	 sjm0jptoppCrpZoXxxlnSnL+GAlcox4Htxi/O0x7mW0l+HqiWow9G9+PkLnZXx/i3x
	 Csc6ViAtkayXowL6BhJVgcNYkn2O3a7ez5qt19rsz3TQXVcvw4TS6Osd3/Or1soxDf
	 kB/IFYh3CZX3hpm2OFo4GcAkOKe1n1vCSSklvwYdR3JTuGiSJUHShBoKIIDlx0zyrU
	 iYHIk93ZltXcbI76Xl+68CvJ8J8DRPn3nsR7/PA1WbnjmMIOx4ClC4SgAemIGn7M1M
	 +qPxtKdSsGsdw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 05/18] arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
Date: Fri, 24 Mar 2023 18:54:43 +0100
Message-Id: <20230324175456.219954-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105510_706379_BA6696CB 
X-CRM114-Status: UNSURE (   8.27  )
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

Add all four I2C controller nodes but keep them in disabled state as
usage is board-dependant.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 26d640e1bfb6..ceb6fc948d8a 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -445,6 +445,66 @@ uart3: serial@11005000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11007000 0 0x70>, <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C0>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11008000 0 0x70>, <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C1>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11009000 0 0x70>, <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C2>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@11010000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11010000 0 0x70>, <0 0x11000280 0 0x80>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C3>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@11011000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11011000 0 0x70>, <0 0x11000300 0 0x80>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C4>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt6795-mmc";
 			reg = <0 0x11230000 0 0x1000>;
-- 
2.40.0


