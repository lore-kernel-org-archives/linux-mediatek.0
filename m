Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CD3C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 06:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGavVwy7EYlT4pA18t1y7E0shYNsVQvTr6AYao2gGZg=; b=PRIKwcNWnp+GhkIT97nZywQFUJ
	+jCA/5iPa/AaCY0I96lp4bp2oquVhT5JgYxUPFb1S91UcaQ6a7IBAmfS52sKHPD35PbDKamrpcsrS
	SDuh7GtEKuvJCRRkqY+Xd8ONSfG5vbjrTJRG7f7tpDuq+VsqWeR55yxmXznA/kB9Q08abA1by+aNG
	BUYL0LpEQfk7uZxYf9ozfhr7hrwWMF5E8w/2m0YWyjpiAvQ6bjLDl90j9mCgZtnuU+ajhENhWdpAq
	752g2JyL7Q2iOXs6fb2lK1QYOcaBXAzFRtla7tQ8J3KFwUP4cO3O5iMCexy3kLiLgo16N6EDRSZNK
	piACsIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJcA-0027R7-O7; Fri, 29 Jul 2022 06:36:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJZy-0025MQ-Tu; Fri, 29 Jul 2022 06:34:36 +0000
X-UUID: f09eca388b6d47e2a14636cabcc9fd8a-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b4c1e476-a8eb-429d-b6b7-cd42b34aa5b9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:cc0bb324-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f09eca388b6d47e2a14636cabcc9fd8a-20220728
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1858018367; Thu, 28 Jul 2022 23:34:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 14:32:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 14:32:14 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"MandyJH Liu" <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Trevor Wu
	<trevor.wu@mediatek.com>
Subject: [PATCH v4 15/20] arm64: dts: mt8195: Add audio related nodes
Date: Fri, 29 Jul 2022 14:32:03 +0800
Message-ID: <20220729063208.16799-16-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220729063208.16799-1-tinghan.shen@mediatek.com>
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_233435_008956_FF3FD684 
X-CRM114-Status: UNSURE (   9.40  )
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

Add audio related nodes for mt8195.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d10db01a360aa..bbea0acff3d2f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -226,6 +226,17 @@
 		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
 	};
 
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		wakeup-delay-ms = <50>;
+	};
+
+	sound: mt8195-sound {
+		mediatek,platform = <&afe>;
+		status = "disabled";
+	};
+
 	clk26m: oscillator-26m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -728,6 +739,53 @@
 			#clock-cells = <1>;
 		};
 
+		afe: mt8195-afe-pcm@10890000 {
+			compatible = "mediatek,mt8195-audio";
+			reg = <0 0x10890000 0 0x10000>;
+			mediatek,topckgen = <&topckgen>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>,
+				<&apmixedsys CLK_APMIXED_APLL1>,
+				<&apmixedsys CLK_APMIXED_APLL2>,
+				<&topckgen CLK_TOP_APLL12_DIV0>,
+				<&topckgen CLK_TOP_APLL12_DIV1>,
+				<&topckgen CLK_TOP_APLL12_DIV2>,
+				<&topckgen CLK_TOP_APLL12_DIV3>,
+				<&topckgen CLK_TOP_APLL12_DIV9>,
+				<&topckgen CLK_TOP_A1SYS_HP>,
+				<&topckgen CLK_TOP_AUD_INTBUS>,
+				<&topckgen CLK_TOP_AUDIO_H>,
+				<&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
+				<&topckgen CLK_TOP_DPTX_MCK>,
+				<&topckgen CLK_TOP_I2SO1_MCK>,
+				<&topckgen CLK_TOP_I2SO2_MCK>,
+				<&topckgen CLK_TOP_I2SI1_MCK>,
+				<&topckgen CLK_TOP_I2SI2_MCK>,
+				<&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
+				<&scp_adsp CLK_SCP_ADSP_AUDIODSP>;
+			clock-names = "clk26m",
+				"apll1_ck",
+				"apll2_ck",
+				"apll12_div0",
+				"apll12_div1",
+				"apll12_div2",
+				"apll12_div3",
+				"apll12_div9",
+				"a1sys_hp_sel",
+				"aud_intbus_sel",
+				"audio_h_sel",
+				"audio_local_bus_sel",
+				"dptx_m_sel",
+				"i2so1_m_sel",
+				"i2so2_m_sel",
+				"i2si1_m_sel",
+				"i2si2_m_sel",
+				"infra_ao_audio_26m_b",
+				"scp_adsp_audiodsp";
+			status = "disabled";
+		};
+
 		uart0: serial@11001100 {
 			compatible = "mediatek,mt8195-uart",
 				     "mediatek,mt6577-uart";
-- 
2.18.0


