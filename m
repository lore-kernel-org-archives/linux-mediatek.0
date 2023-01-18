Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB8C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y17TmDmZzJ4uREjBGg1ymgXuWt+fPVJmNlFq7S8gsaI=; b=bfRz58mIXr/MlJoM7ZNFNl4xVw
	tnGD6lNXPSRKcdj9YfXDeneTvlPm9QLmeG/BeFvHdFglFRvaVTKxXuocjMW35ZM16Fplmu/56ix4x
	3ja1ljpT5eRFhZRH3w+teQx2sbFI1OnKEVQCFGechQm9tL7H0VkbZN8NnrOMPVrgDiuruCxOmZcdb
	g0GPO8SwBz2oKPfQlB54dUfvTAPbGgXgHiO02sIXddACQwE9FjLTj4wsZOftGiRqqjAb0jwCnVp83
	dMSkwHOD5Y2plBVZvrjCy+V3boZ8mX67FFHdrh/QohOk/kZhRqDv2dEEafDvrwPFvc8GnMtVZDdt0
	BOO8B8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4cu-0004Gf-JA; Wed, 18 Jan 2023 09:21:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4bC-0003Ms-RG; Wed, 18 Jan 2023 09:19:16 +0000
X-UUID: 2c292be2971111eda08d4d6090ec5a5c-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y17TmDmZzJ4uREjBGg1ymgXuWt+fPVJmNlFq7S8gsaI=;
	b=JqUc7zmCtzD/vPGbPC8bN0ia/rPZ5ZMV16/YPt/FOne0JPSD+SSfQ0cUplFvXcHKnbm3A7OFatZCq1FqrX9joVWYaMDA/7WTWPtJy9RqyI1/A5KNpjijiNL9VEjg062uOpytgXAL/qLDGazUNGTH8AU/tb0WaDSY6Q/eTHA2ex0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:423dd387-f902-4499-b712-84146e190bc9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:3ca2d6b,CLOUDID:e71e2af6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 2c292be2971111eda08d4d6090ec5a5c-20230118
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1817441780; Wed, 18 Jan 2023 02:19:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:34 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 6/9] arm64: dts: mediatek: mt8186: Add audio controller node
Date: Wed, 18 Jan 2023 17:18:26 +0800
Message-ID: <20230118091829.755-7-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_011914_926587_5FCFC109 
X-CRM114-Status: GOOD (  11.47  )
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

Add audio controller node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 2700c830316f..c52f9be1e750 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -998,6 +998,68 @@
 			};
 		};
 
+		afe: audio-controller@11210000 {
+			compatible = "mediatek,mt8186-sound";
+			reg = <0 0x11210000 0 0x2000>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AUDIO>,
+				 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_BCLK>,
+				 <&topckgen CLK_TOP_AUDIO>,
+				 <&topckgen CLK_TOP_AUD_INTBUS>,
+				 <&topckgen CLK_TOP_MAINPLL_D2_D4>,
+				 <&topckgen CLK_TOP_AUD_1>,
+				 <&apmixedsys CLK_APMIXED_APLL1>,
+				 <&topckgen CLK_TOP_AUD_2>,
+				 <&apmixedsys CLK_APMIXED_APLL2>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1>,
+				 <&topckgen CLK_TOP_APLL1_D8>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2>,
+				 <&topckgen CLK_TOP_APLL2_D8>,
+				 <&topckgen CLK_TOP_APLL_I2S0_MCK_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_MCK_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_MCK_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S4_MCK_SEL>,
+				 <&topckgen CLK_TOP_APLL_TDMOUT_MCK_SEL>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
+				 <&topckgen CLK_TOP_APLL12_CK_DIV_TDMOUT_M>,
+				 <&topckgen CLK_TOP_AUDIO_H>,
+				 <&clk26m>;
+			clock-names = "aud_infra_clk",
+				      "mtkaif_26m_clk",
+				      "top_mux_audio",
+				      "top_mux_audio_int",
+				      "top_mainpll_d2_d4",
+				      "top_mux_aud_1",
+				      "top_apll1_ck",
+				      "top_mux_aud_2",
+				      "top_apll2_ck",
+				      "top_mux_aud_eng1",
+				      "top_apll1_d8",
+				      "top_mux_aud_eng2",
+				      "top_apll2_d8",
+				      "top_i2s0_m_sel",
+				      "top_i2s1_m_sel",
+				      "top_i2s2_m_sel",
+				      "top_i2s4_m_sel",
+				      "top_tdm_m_sel",
+				      "top_apll12_div0",
+				      "top_apll12_div1",
+				      "top_apll12_div2",
+				      "top_apll12_div4",
+				      "top_apll12_div_tdm",
+				      "top_mux_audio_h",
+				      "top_clk26m_clk";
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,apmixedsys = <&apmixedsys>;
+			mediatek,infracfg = <&infracfg_ao>;
+			mediatek,topckgen = <&topckgen>;
+			resets = <&watchdog MT8186_TOPRGU_AUDIO_SW_RST>;
+			reset-names = "audiosys";
+			status = "disabled";
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8186-mmc",
 				     "mediatek,mt8183-mmc";
-- 
2.18.0


