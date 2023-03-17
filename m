Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E639EC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 06:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D94WFA3SndeHGVIdcLs2oaCrSr2lE/+uRTmXDF6D3iM=; b=mZFyBD/RqwB4EVH6Z1rO+TI04y
	Gtedf67U675VLxT3789gqRUnjS1qmspJxm6UwoxuSegEqrCIJl+GVI0ofJNXOIZlFjph5l1RKr4Gw
	OvvuPKcS6Xe0RlM5XRKkIF4iGsfZnQrSaIn9Hwl23luXmCWD6kGNGJ1drgtKSf25J52Qz2pVWVPTt
	N+M2q8zLCoguhvZHDdvU7we370SO0/2pzSSV6NurFsPnuKsQoVTmUl0bUmFY4Yfta34ljcdVJMCvx
	2xYZMQV0+8j9FNKdWP2xY0hALPxsCTwDSH3z9wM4tkLutmFSG1puJRNN0A5XpRzjhsA8h+IDCBlKE
	Jyv5qd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3IT-0019PV-2v;
	Fri, 17 Mar 2023 06:10:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3IN-0019M6-2d;
	Fri, 17 Mar 2023 06:10:35 +0000
X-UUID: 68c1b500c48a11edb5598346aad47b14-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D94WFA3SndeHGVIdcLs2oaCrSr2lE/+uRTmXDF6D3iM=;
	b=kzN3NVb6UgMQTlxC8iEnxr3JpbCiKaa5YutgG4RfVGu/zVvb5sm4/IBqUJ5N2cOBvB6t3qxILbhwYB9C5A+MCmaNKKFgt3bk0XQzoJ1XHHojrCh6H2SEuBAXU3TAEhXW7zGfgNinFyTxcR6QN0hNtVBJh/y+6fojOgiQWiQdYHw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:973a72ad-4fc7-4539-8a5a-672bb8ac7792,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:83295aa,CLOUDID:835416f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 68c1b500c48a11edb5598346aad47b14-20230316
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 702068170; Thu, 16 Mar 2023 23:10:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 14:09:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 14:09:21 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 5/7] arm64: dts: mediatek: mt8186: Add audio controller node
Date: Fri, 17 Mar 2023 14:09:15 +0800
Message-ID: <20230317060917.15175-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
References: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_231031_862617_56070526 
X-CRM114-Status: UNSURE (   9.12  )
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

Add audio controller node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 337bcf3c1571..f198fd8abc1d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1046,6 +1046,68 @@
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


