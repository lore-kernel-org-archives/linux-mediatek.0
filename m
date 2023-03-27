Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFABC7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOqreX7XF8DKvjr7/VqipD5E1R/31uSR58zGdE5OIT0=; b=fmBRE7Tu7imoQ+T0iQ6DhIvxGc
	C1pDR/pnIqevLrme8LNeXZMS0i6F6OL0onFcOjeAWDkgeVLwpXQMPMcE870FWHiXLqA9Ho4JSGGQU
	e5Er7JutegQ+lAvebfeYojlGknblDYGp8fpHjXmhvgT4FtAp6XhEJxs1u91Le7OWywMmLdJ4lMlGx
	Rj0A+HoQIvA74WNK8KkYpyuuoeLdepG2pluIWFbH/WcvaWQUP66QgZBtnh7ukiaPbXTh3uypI3rqi
	Um3Jnhpcnjp20J2PS7ONHMjYwNZuMjDI0dPI+mgokNc4voRgeY5NDjQla5w+hWiIVeSU349HzqM2L
	5KBe25kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiNC-00AI1W-0G;
	Mon, 27 Mar 2023 08:38:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLh-00AH9R-0z;
	Mon, 27 Mar 2023 08:37:09 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A808660308B;
	Mon, 27 Mar 2023 09:37:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906224;
	bh=torr26qWRhLp7GlQbJK2hxugth9DFBivC+4DPBvc1uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wk0z7cSA+5QH6UO0SEtwj5YV+Q6ghHgeIvbWzRnlrSRVgFuCoA7Jb9SylJQdrTpnX
	 ywbaUylFeF0dTGp5h6RGvzQsR0qj7eo/CHNDszdhZrhVC4Y2noSuOA6InfrTnGIX7h
	 EsoP0ivO2rk42ZBBi0mIJc5ixiUnUxjafIGrxdmPTZ6QesDwJ3J8DB96+CGJo53jEA
	 JksamVJlgMJDbQsnjJMk1njEbDqGsyyAfbYVoZS5PncSU+QZGOG8C7KEq+KKAomlMF
	 fAh2w8keakcSz3ifevBsAs3zBsD17rOoTasMfxyeR/WAMsOBTbp0W00PWaAI62Gz7a
	 UbASQolZxo8Vw==
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
Subject: [PATCH v2 11/17] arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
Date: Mon, 27 Mar 2023 10:36:41 +0200
Message-Id: <20230327083647.22017-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013705_474311_B424B335 
X-CRM114-Status: UNSURE (   9.11  )
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
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index a8b2c4517e79..a580ddb51a0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -390,6 +390,17 @@ systimer: timer@10200670 {
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
@@ -648,16 +659,64 @@ mmsys: syscon@14000000 {
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


