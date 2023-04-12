Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82999C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ksb7cidYARjDsa/7A0yswz8kVPrna1cye02soqpc6M=; b=rQCTrz0iPwc6/7/TQ9rw+rQJbt
	P3OqbcgnaEfRQXxwkVZxXi7A8fJ83JEkw+dJT9O5X5ulJlUriwtf2rxt13EYoBDcG81Dsmo52x/pV
	G3O85EGFmXrznL91A+KREkedIAS1nh8gr5aJmLUOrqdijRFvZ2AiG9m32ryOYYk8RwemA4AL67Qy/
	bYdt1ZfoNvhOCvWfonTncoJ4N67y1/tNgx5UrheuW06VTBs/Df5OwC2iztQy1stMo/AsBXffS4dAF
	f8O0Ofu10MzNhK1uitmUXC0vM04E2iWDVtDxTaV9AdRDgcjh9ctjnoYO/ef5eksQRsGIVb8BeY45C
	OFFSSWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYgD-002q2W-1R;
	Wed, 12 Apr 2023 11:30:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYe4-002nu2-04;
	Wed, 12 Apr 2023 11:28:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 992EB660328C;
	Wed, 12 Apr 2023 12:28:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298890;
	bh=udYJL7+D0nU6SsvUw/ySN6/rdg1po5P1pPwUOP6NJ6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRVBOn4mP7A1tf5caIZVGKmwr24CaJNDm/AbiTnyf7L9hCauZ+fKHDnUCvpnlh2Gu
	 hCLw6+5k9fn1t0edotlNf/dR1l6epND/bmS641hTNUfYEPSt2dgZoDLcmHxL1UE1Vr
	 naKfvmShNyWBfXVB5qx2KZXnCOUqNcZ3VwTWYaSb8ig7dvXi/CBcw5HfmqJLg6HIWU
	 qSFlSsB5xi4n+GdRG3N6WFbdYgA63kBtxZ85d5V97ynMiZ04EK2HkDhncPjrxM2gg9
	 GhM2i8GMulrF35oLSgxcJxz62pQNvA0zZ6uGfgbuyMBhw+06Eyiz3Q7lEQP+u1cQQt
	 bjjb7seRYMYkg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 18/27] arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
Date: Wed, 12 Apr 2023 13:27:30 +0200
Message-Id: <20230412112739.160376-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042812_325606_AB2C06B9 
X-CRM114-Status: UNSURE (   9.87  )
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

Add nodes for the multimedia IOMMU and its LARBs: this includes all but
the MJC LARB, which cannot currently be used and will be added later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index a8b2c4517e79..9cfa02085f61 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
 #include <dt-bindings/gce/mediatek,mt6795-gce.h>
+#include <dt-bindings/memory/mt6795-larb-port.h>
 #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
 #include <dt-bindings/power/mt6795-power.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
@@ -390,6 +391,17 @@ systimer: timer@10200670 {
 			clock-names = "clk13m";
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt6795-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			clocks = <&infracfg CLK_INFRA_M4U>;
+			clock-names = "bclk";
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			#iommu-cells = <1>;
+		};
+
 		apmixedsys: syscon@10209000 {
 			compatible = "mediatek,mt6795-apmixedsys", "syscon";
 			reg = <0 0x10209000 0 0x1000>;
@@ -648,16 +660,64 @@ mmsys: syscon@14000000 {
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		larb0: larb@14021000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x14021000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <0>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+		};
+
+		smi_common: smi@14022000 {
+			compatible = "mediatek,mt6795-smi-common";
+			reg = <0 0x14022000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			clocks = <&infracfg CLK_INFRA_SMI>, <&mmsys CLK_MM_SMI_COMMON>;
+			clock-names = "apb", "smi";
+		};
+
+		larb2: larb@15001000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&infracfg CLK_INFRA_SMI>;
+			clock-names = "apb", "smi";
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <2>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_ISP>;
+		};
+
 		vdecsys: clock-controller@16000000 {
 			compatible = "mediatek,mt6795-vdecsys";
 			reg = <0 0x16000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb1: larb@16010000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <1>;
+			clocks = <&vdecsys CLK_VDEC_CKEN>, <&vdecsys CLK_VDEC_LARB_CKEN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT6795_POWER_DOMAIN_VDEC>;
+		};
+
 		vencsys: clock-controller@18000000 {
 			compatible = "mediatek,mt6795-vencsys";
 			reg = <0 0x18000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		larb3: larb@18001000 {
+			compatible = "mediatek,mt6795-smi-larb";
+			reg = <0 0x18001000 0 0x1000>;
+			clocks = <&vencsys CLK_VENC_VENC>, <&vencsys CLK_VENC_LARB>;
+			clock-names = "apb", "smi";
+			mediatek,smi = <&smi_common>;
+			mediatek,larb-id = <3>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_VENC>;
+		};
 	};
 };
-- 
2.40.0


