Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A117EC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyfBxtGyi7w6ySQswRCNMlxwqGmFNL+QHOAuvpFNOm4=; b=4+aL0D3F0jd4PgEZ6AiRT4K8sP
	vJNtzbOjy5tFAJ+Y+vzrxcB450bUhngq4e1tb+scg0H0RYYOUP2VW41lObCT6bHZ2IWuyexRirBys
	Y21Ih6ktp0hIm0bUxHnJBZu2KJN3KRw7k5WK3ygjtOeUZ3eFKVyIjvDq2a4ueUXFHUltOJwpMrzEf
	NGCY+b8m+0za8PCiasdzaUk+S81BqzpwSmbLPt+50wdyXac8pVMMA409oO65YzNeTp4f+1Q+tsfWv
	SQZSSXX1HTpP/oHBYu+GJO+RNI+iLiwOID/TEifYCM7VNip473JSFf+IZylDXvce8jbW+ncaZ9Gtz
	Fm+fipjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi6O-00FMs2-BZ; Wed, 08 Feb 2023 10:55:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxS-00FHyK-VQ; Wed, 08 Feb 2023 10:45:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 242A466020A5;
	Wed,  8 Feb 2023 10:45:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853145;
	bh=yPSKyJGV4CfVeowUyIzcXpvx5mprmmPaai8S5MuPor0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtG+ghYhmc28RUZCRYXKl1brgqZYlaUCk2nf3HrPkIBtZj5EIdQQ1daKJe8zF3f8O
	 Y2Vodp5wkYjDPXrOQFQkwZl/Vif3rcwaYTXSP/+9nnNvs1UP6B2B92J+yQe9XNFiFb
	 L9lIyO9kpBY8W7H++oVv88w1kzzkoMgkFHgyk0gTKU2bOQlehYlh65Af1QIOfwBw2S
	 q15f0V+FZjFm+nineuEXV6miBylBVtxbyNtcP+DTTrlNeoz99Pnry6/4NL9GOzBohF
	 77qM1sEGttLO/ULPIuj2fe02Pr6vt14xfgd+6qtQ/9dlRV+9EEBCnC5wk0v4KrzBVn
	 8obTfoYY6jKeA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 14/16] arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
Date: Wed,  8 Feb 2023 11:45:25 +0100
Message-Id: <20230208104527.118929-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024547_199297_6996324D 
X-CRM114-Status: GOOD (  10.02  )
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

Add GPU support through panfrost for the Mali-G57 GPU on MT8195
with its OPP table but keep it in disabled state.

This is expected to be enabled only on boards which make use of
the GPU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 90 ++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d116830d6af3..0e4ee7713c30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -333,6 +333,76 @@ performance: performance-controller@11bc10 {
 		#performance-domain-cells = <1>;
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-390000000 {
+			opp-hz = /bits/ 64 <390000000>;
+			opp-microvolt = <625000>;
+		};
+		opp-410000000 {
+			opp-hz = /bits/ 64 <410000000>;
+			opp-microvolt = <631250>;
+		};
+		opp-431000000 {
+			opp-hz = /bits/ 64 <431000000>;
+			opp-microvolt = <631250>;
+		};
+		opp-473000000 {
+			opp-hz = /bits/ 64 <473000000>;
+			opp-microvolt = <637500>;
+		};
+		opp-515000000 {
+			opp-hz = /bits/ 64 <515000000>;
+			opp-microvolt = <637500>;
+		};
+		opp-556000000 {
+			opp-hz = /bits/ 64 <556000000>;
+			opp-microvolt = <643750>;
+		};
+		opp-598000000 {
+			opp-hz = /bits/ 64 <598000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-640000000 {
+			opp-hz = /bits/ 64 <640000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-670000000 {
+			opp-hz = /bits/ 64 <670000000>;
+			opp-microvolt = <662500>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <675000>;
+		};
+		opp-730000000 {
+			opp-hz = /bits/ 64 <730000000>;
+			opp-microvolt = <687500>;
+		};
+		opp-760000000 {
+			opp-hz = /bits/ 64 <760000000>;
+			opp-microvolt = <700000>;
+		};
+		opp-790000000 {
+			opp-hz = /bits/ 64 <790000000>;
+			opp-microvolt = <712500>;
+		};
+		opp-820000000 {
+			opp-hz = /bits/ 64 <820000000>;
+			opp-microvolt = <725000>;
+		};
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <737500>;
+		};
+		opp-880000000 {
+			opp-hz = /bits/ 64 <880000000>;
+			opp-microvolt = <750000>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupt-parent = <&gic>;
@@ -1790,6 +1860,26 @@ ufsphy: ufs-phy@11fa0000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8195-mali", "mediatek,mt8192-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0 0x13000000 0 0x4000>;
+
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_MFG2>,
+					<&spm MT8195_POWER_DOMAIN_MFG3>,
+					<&spm MT8195_POWER_DOMAIN_MFG4>,
+					<&spm MT8195_POWER_DOMAIN_MFG5>,
+					<&spm MT8195_POWER_DOMAIN_MFG6>;
+			power-domain-names = "core0", "core1", "core2", "core3", "core4";
+			status = "disabled";
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt8195-mfgcfg";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.39.1


