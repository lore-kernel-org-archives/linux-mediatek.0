Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6CAC25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtojGJ0g6aQEToF23H5+Fr+vZwMwKmltV1zNGoZVWt4=; b=OOxpXk79JPHY+H9FtiqXYEONyW
	FyFtmDW46AQYg7S2K0bBrdgL2cfJyEaw69o0T7mwpPkSAGiCC1QrTjdUTj4eWny+68cbNfxG+bIKM
	1J7Pinwt7fuxD5g7I36wUDGYTodskQC1LMxbHC53KR5YrvVqUNd6/kv/RWlgPdK7aJWGOZmtuZWrB
	3tEMM8ad7hInZLlgQks9iaQqnkr08KGsfgoQnuHcTSqgAyCga706xxjV5y2vunfZRVPSedRN/nTtr
	wo8Pjz6m0ugooWhcUuTb8jzBzjhdHCa64I8ZAMmRy0DdgmFcCBKT81lPTEbOBsvdJLDdjxk6xiCv3
	xZWi9nLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWpl-0000000ET4j-47wD;
	Mon, 27 May 2024 09:40:03 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWp4-0000000ESd5-2w8W;
	Mon, 27 May 2024 09:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716802757;
	bh=QRwIRv75yrAf1JRz9MJTa1TTMXZRbOPBpI7smHJhw+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uoOi9mfSjwLdpbFTnW2XcAiSrXvPodUR1TMR+3XWrGE8Mk60RS8OdT64mGSUwfNKU
	 4bxoBtNZbXLUqypa6mocjg88L9dntbreZtekiX4oW/gyV+aXv/oPWO03iNiQMANl/b
	 3CjEer1f8OSK28xQ71MNjUgTqt28DrdbzRoRm7nqWUFuWMd7X01rI52cA/MOWtYlD2
	 JlT5nWY/jZwph5C5xjmkNS3DN08+ABmOoN+fuBaFsu1ZxwPH01K9kmm6cA+kuQivyn
	 Xtrrr1V3lh2u5qmevf9UmhIk3WgyBiYqIGzl9iv6pCKY1+M5m5zNOKauV0VID8CQf7
	 yZiLR2qLolAMw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6BA873782134;
	Mon, 27 May 2024 09:39:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	jpanis@baylibre.com
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8188: Add support for Mali GPU on Panfrost
Date: Mon, 27 May 2024 11:39:08 +0200
Message-ID: <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023919_352504_0EE5B629 
X-CRM114-Status: UNSURE (   9.84  )
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

Add the necessary OPP table for the GPU and also add a GPU node
to enable support for the Valhall-JM G57 MC3 found on this SoC,
using the Panfrost driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 123 +++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 0bca6c9f15fe..29d012d28edb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -294,6 +294,112 @@ clk32k: oscillator-32k {
 		clock-output-names = "clk32k";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-390000000 {
+			opp-hz = /bits/ 64 <390000000>;
+			opp-microvolt = <575000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-431000000 {
+			opp-hz = /bits/ 64 <431000000>;
+			opp-microvolt = <587500>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-473000000 {
+			opp-hz = /bits/ 64 <473000000>;
+			opp-microvolt = <600000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-515000000 {
+			opp-hz = /bits/ 64 <515000000>;
+			opp-microvolt = <612500>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-556000000 {
+			opp-hz = /bits/ 64 <556000000>;
+			opp-microvolt = <625000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-598000000 {
+			opp-hz = /bits/ 64 <598000000>;
+			opp-microvolt = <637500>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-640000000 {
+			opp-hz = /bits/ 64 <640000000>;
+			opp-microvolt = <650000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-670000000 {
+			opp-hz = /bits/ 64 <670000000>;
+			opp-microvolt = <662500>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <675000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-730000000 {
+			opp-hz = /bits/ 64 <730000000>;
+			opp-microvolt = <687500>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-760000000 {
+			opp-hz = /bits/ 64 <760000000>;
+			opp-microvolt = <700000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-790000000 {
+			opp-hz = /bits/ 64 <790000000>;
+			opp-microvolt = <712500>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-835000000 {
+			opp-hz = /bits/ 64 <835000000>;
+			opp-microvolt = <731250>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-880000000 {
+			opp-hz = /bits/ 64 <880000000>;
+			opp-microvolt = <750000>;
+			opp-supported-hw = <0xff>;
+		};
+		opp-915000000 {
+			opp-hz = /bits/ 64 <915000000>;
+			opp-microvolt = <775000>;
+			opp-supported-hw = <0x8f>;
+		};
+		opp-915000000-5 {
+			opp-hz = /bits/ 64 <915000000>;
+			opp-microvolt = <762500>;
+			opp-supported-hw = <0x30>;
+		};
+		opp-915000000-6 {
+			opp-hz = /bits/ 64 <915000000>;
+			opp-microvolt = <750000>;
+			opp-supported-hw = <0x70>;
+		};
+		opp-950000000 {
+			opp-hz = /bits/ 64 <950000000>;
+			opp-microvolt = <800000>;
+			opp-supported-hw = <0x8f>;
+		};
+		opp-950000000-5 {
+			opp-hz = /bits/ 64 <950000000>;
+			opp-microvolt = <775000>;
+			opp-supported-hw = <0x30>;
+		};
+		opp-950000000-6 {
+			opp-hz = /bits/ 64 <950000000>;
+			opp-microvolt = <750000>;
+			opp-supported-hw = <0x70>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupt-parent = <&gic>;
@@ -1167,6 +1273,23 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
+			reg = <0 0x13000000 0 0x4000>;
+
+			clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
+					<&spm MT8188_POWER_DOMAIN_MFG3>,
+					<&spm MT8188_POWER_DOMAIN_MFG4>;
+			power-domain-names = "core0", "core1", "core2";
+			status = "disabled";
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt8188-mfgcfg";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.45.1


