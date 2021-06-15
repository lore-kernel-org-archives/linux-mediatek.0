Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5C7C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C729861078
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C729861078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxNs4t3qSHh1YRNjWTQST49DZJ0ePLIzyt5fjL+Ums0=; b=39XsjsShD/JUe+
	1baHvh8qAuNh6/JQKfoCdCF+EZ9Pg3BzfnFBhamfeO0HGZDz8mhmiOYGvL+3Gw7SMT2W+gjZNU4PV
	5n8RseddRT9eTBGQefcb886/Ym/p/CoD2MCswfrceR35AbumH7/mX7qhFiDW4McFcQS5DUELq9x5y
	GDpsx3GGDL7wMJUmqhy4eUqvDktGMAkKbtqpVEDYJ9fesSAr7BMv6jc3HvKAkaaihywtRG2M73t+N
	VIfgxwAmfiO/Ytul70xRaEynMyo1uPd5Z7Sof6afD/DdLUlmKb1gIEplyPFaylt4bbBPdlOcHQtB9
	zc+5GsZHBjU7qCN2JY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGag-0038yi-EV; Tue, 15 Jun 2021 21:27:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvm-001lHp-FG; Tue, 15 Jun 2021 17:32:56 +0000
X-UUID: 06044b6002ac4e3ba1e9352d14d6d8f4-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OBpqDGCMmO9SgGClqc+sBsKMUgN9HjiUhrEHkbm1oHY=; 
 b=EV7gcaGO4x6vJf1zWreuTcd5hKKlsBOrpDzg/ce1nNt1DjErAf95IsBAHDb3E2RvcM2Pmt6foD/HDwB72KijrNN5DTLtjBBOxWsTzSsQp8mXHJIn158ev2oiOkwEX114VR/dIcopA8GIMqRJGg/566EGVnx5AN8ghkwqc3HMPGM=;
X-UUID: 06044b6002ac4e3ba1e9352d14d6d8f4-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2133791800; Tue, 15 Jun 2021 10:32:49 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Trevor Wu
 <trevor.wu@mediatek.com>
Subject: [PATCH 21/27] arm64: dts: mt8195: add audio related nodes
Date: Wed, 16 Jun 2021 01:32:27 +0800
Message-ID: <20210615173233.26682-21-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103254_615401_8113DB4D 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Trevor Wu <trevor.wu@mediatek.com>

add audio related nodes on dts and dtsi

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 286 ++++++++++++++++++++++-
 1 file changed, 285 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d78cd4d4201b..256818c4c0bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -230,6 +230,12 @@
 		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
 	};
 
+	dmic_codec: dmic-codec {
+		compatible = "dmic-codec";
+		num-channels = <2>;
+		wakeup-delay-ms = <50>;
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupt-parent = <&gic>;
@@ -785,8 +791,280 @@
 
 		audsys: syscon@10890000 {
 			compatible = "mediatek,mt8195-audsys", "syscon";
-			reg = <0 0x10890000 0 0x1000>;
+			reg = <0 0x10890000 0 0x10000>;
 			#clock-cells = <1>;
+
+			afe: mt8195-afe-pcm {
+				compatible = "mediatek,mt8195-audio";
+				topckgen = <&topckgen>;
+				power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+				interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&clk26m>,
+					 <&apmixedsys CLK_APMIXED_APLL1>,
+					 <&apmixedsys CLK_APMIXED_APLL2>,
+					 <&apmixedsys CLK_APMIXED_APLL3>,
+					 <&apmixedsys CLK_APMIXED_APLL4>,
+					 <&apmixedsys CLK_APMIXED_APLL5>,
+					 <&apmixedsys CLK_APMIXED_HDMIRX_APLL>,
+					 <&topckgen CLK_TOP_APLL1>,
+					 <&topckgen CLK_TOP_APLL1_D4>,
+					 <&topckgen CLK_TOP_APLL2>,
+					 <&topckgen CLK_TOP_APLL2_D4>,
+					 <&topckgen CLK_TOP_APLL3>,
+					 <&topckgen CLK_TOP_APLL3_D4>,
+					 <&topckgen CLK_TOP_APLL4>,
+					 <&topckgen CLK_TOP_APLL4_D4>,
+					 <&topckgen CLK_TOP_APLL5>,
+					 <&topckgen CLK_TOP_APLL5_D4>,
+					 <&topckgen CLK_TOP_APLL12_DIV0>,
+					 <&topckgen CLK_TOP_APLL12_DIV1>,
+					 <&topckgen CLK_TOP_APLL12_DIV2>,
+					 <&topckgen CLK_TOP_APLL12_DIV3>,
+					 <&topckgen CLK_TOP_APLL12_DIV4>,
+					 <&topckgen CLK_TOP_APLL12_DIV9>,
+					 <&topckgen CLK_TOP_HDMIRX_APLL>,
+					 <&topckgen CLK_TOP_MAINPLL_D4_D4>,
+					 <&topckgen CLK_TOP_MAINPLL_D5_D2>,
+					 <&topckgen CLK_TOP_MAINPLL_D7_D2>,
+					 <&topckgen CLK_TOP_UNIVPLL_D4>,
+					 <&topckgen CLK_TOP_APLL1_SEL>,
+					 <&topckgen CLK_TOP_APLL2_SEL>,
+					 <&topckgen CLK_TOP_APLL3_SEL>,
+					 <&topckgen CLK_TOP_APLL4_SEL>,
+					 <&topckgen CLK_TOP_APLL5_SEL>,
+					 <&topckgen CLK_TOP_A1SYS_HP_SEL>,
+					 <&topckgen CLK_TOP_A2SYS_SEL>,
+					 <&topckgen CLK_TOP_A3SYS_SEL>,
+					 <&topckgen CLK_TOP_A4SYS_SEL>,
+					 <&topckgen CLK_TOP_ASM_H_SEL>,
+					 <&topckgen CLK_TOP_ASM_M_SEL>,
+					 <&topckgen CLK_TOP_ASM_L_SEL>,
+					 <&topckgen CLK_TOP_AUD_IEC_SEL>,
+					 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+					 <&topckgen CLK_TOP_AUDIO_H_SEL>,
+					 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
+					 <&topckgen CLK_TOP_DPTX_M_SEL>,
+					 <&topckgen CLK_TOP_INTDIR_SEL>,
+					 <&topckgen CLK_TOP_I2SO1_M_SEL>,
+					 <&topckgen CLK_TOP_I2SO2_M_SEL>,
+					 <&topckgen CLK_TOP_I2SI1_M_SEL>,
+					 <&topckgen CLK_TOP_I2SI2_M_SEL>,
+					 <&topckgen CLK_TOP_MPHONE_SLAVE_B>,
+					 <&topckgen CLK_TOP_CFG_26M_AUD>,
+					 <&infracfg_ao CLK_INFRA_AO_AUDIO>,
+					 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
+					 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>,
+					 <&audsys CLK_AUD_AFE>,
+					 <&audsys CLK_AUD_LRCK_CNT>,
+					 <&audsys CLK_AUD_SPDIFIN_TUNER_APLL>,
+					 <&audsys CLK_AUD_SPDIFIN_TUNER_DBG>,
+					 <&audsys CLK_AUD_UL_TML>,
+					 <&audsys CLK_AUD_APLL1_TUNER>,
+					 <&audsys CLK_AUD_APLL2_TUNER>,
+					 <&audsys CLK_AUD_TOP0_SPDF>,
+					 <&audsys CLK_AUD_APLL>,
+					 <&audsys CLK_AUD_APLL2>,
+					 <&audsys CLK_AUD_DAC>,
+					 <&audsys CLK_AUD_DAC_PREDIS>,
+					 <&audsys CLK_AUD_TML>,
+					 <&audsys CLK_AUD_ADC>,
+					 <&audsys CLK_AUD_DAC_HIRES>,
+					 <&audsys CLK_AUD_A1SYS_HP>,
+					 <&audsys CLK_AUD_AFE_DMIC1>,
+					 <&audsys CLK_AUD_AFE_DMIC2>,
+					 <&audsys CLK_AUD_AFE_DMIC3>,
+					 <&audsys CLK_AUD_AFE_DMIC4>,
+					 <&audsys CLK_AUD_AFE_26M_DMIC_TM>,
+					 <&audsys CLK_AUD_UL_TML_HIRES>,
+					 <&audsys CLK_AUD_ADC_HIRES>,
+					 <&audsys CLK_AUD_ADDA6_ADC>,
+					 <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
+					 <&audsys CLK_AUD_LINEIN_TUNER>,
+					 <&audsys CLK_AUD_EARC_TUNER>,
+					 <&audsys CLK_AUD_I2SIN>,
+					 <&audsys CLK_AUD_TDM_IN>,
+					 <&audsys CLK_AUD_I2S_OUT>,
+					 <&audsys CLK_AUD_TDM_OUT>,
+					 <&audsys CLK_AUD_HDMI_OUT>,
+					 <&audsys CLK_AUD_ASRC11>,
+					 <&audsys CLK_AUD_ASRC12>,
+					 <&audsys CLK_AUD_MULTI_IN>,
+					 <&audsys CLK_AUD_INTDIR>,
+					 <&audsys CLK_AUD_A1SYS>,
+					 <&audsys CLK_AUD_A2SYS>,
+					 <&audsys CLK_AUD_PCMIF>,
+					 <&audsys CLK_AUD_A3SYS>,
+					 <&audsys CLK_AUD_A4SYS>,
+					 <&audsys CLK_AUD_MEMIF_UL1>,
+					 <&audsys CLK_AUD_MEMIF_UL2>,
+					 <&audsys CLK_AUD_MEMIF_UL3>,
+					 <&audsys CLK_AUD_MEMIF_UL4>,
+					 <&audsys CLK_AUD_MEMIF_UL5>,
+					 <&audsys CLK_AUD_MEMIF_UL6>,
+					 <&audsys CLK_AUD_MEMIF_UL8>,
+					 <&audsys CLK_AUD_MEMIF_UL9>,
+					 <&audsys CLK_AUD_MEMIF_UL10>,
+					 <&audsys CLK_AUD_MEMIF_DL2>,
+					 <&audsys CLK_AUD_MEMIF_DL3>,
+					 <&audsys CLK_AUD_MEMIF_DL6>,
+					 <&audsys CLK_AUD_MEMIF_DL7>,
+					 <&audsys CLK_AUD_MEMIF_DL8>,
+					 <&audsys CLK_AUD_MEMIF_DL10>,
+					 <&audsys CLK_AUD_MEMIF_DL11>,
+					 <&audsys CLK_AUD_GASRC0>,
+					 <&audsys CLK_AUD_GASRC1>,
+					 <&audsys CLK_AUD_GASRC2>,
+					 <&audsys CLK_AUD_GASRC3>,
+					 <&audsys CLK_AUD_GASRC4>,
+					 <&audsys CLK_AUD_GASRC5>,
+					 <&audsys CLK_AUD_GASRC6>,
+					 <&audsys CLK_AUD_GASRC7>,
+					 <&audsys CLK_AUD_GASRC8>,
+					 <&audsys CLK_AUD_GASRC9>,
+					 <&audsys CLK_AUD_GASRC10>,
+					 <&audsys CLK_AUD_GASRC11>,
+					 <&audsys CLK_AUD_GASRC12>,
+					 <&audsys CLK_AUD_GASRC13>,
+					 <&audsys CLK_AUD_GASRC14>,
+					 <&audsys CLK_AUD_GASRC15>,
+					 <&audsys CLK_AUD_GASRC16>,
+					 <&audsys CLK_AUD_GASRC17>,
+					 <&audsys CLK_AUD_GASRC18>,
+					 <&audsys CLK_AUD_GASRC19>;
+				clock-names = "clk26m",
+					"apll1",
+					"apll2",
+					"apll3",
+					"apll4",
+					"apll5",
+					"hdmirx_apll",
+					"apll1_ck",
+					"apll1_d4",
+					"apll2_ck",
+					"apll2_d4",
+					"apll3_ck",
+					"apll3_d4",
+					"apll4_ck",
+					"apll4_d4",
+					"apll5_ck",
+					"apll5_d4",
+					"apll12_div0",
+					"apll12_div1",
+					"apll12_div2",
+					"apll12_div3",
+					"apll12_div4",
+					"apll12_div9",
+					"hdmirx_apll_ck",
+					"mainpll_d4_d4",
+					"mainpll_d5_d2",
+					"mainpll_d7_d2",
+					"univpll_d4",
+					"apll1_sel",
+					"apll2_sel",
+					"apll3_sel",
+					"apll4_sel",
+					"apll5_sel",
+					"a1sys_hp_sel",
+					"a2sys_sel",
+					"a3sys_sel",
+					"a4sys_sel",
+					"asm_h_sel",
+					"asm_m_sel",
+					"asm_l_sel",
+					"aud_iec_sel",
+					"aud_intbus_sel",
+					"audio_h_sel",
+					"audio_local_bus_sel",
+					"dptx_m_sel",
+					"intdir_sel",
+					"i2so1_m_sel",
+					"i2so2_m_sel",
+					"i2si1_m_sel",
+					"i2si2_m_sel",
+					"mphone_slave_b",
+					"cfg_26m_aud",
+					"infra_ao_audio",
+					"infra_ao_audio_26m_b",
+					"scp_adsp_audiodsp",
+					"aud_afe",
+					"aud_lrck_cnt",
+					"aud_spdifin_tuner_apll",
+					"aud_spdifin_tuner_dbg",
+					"aud_ul_tml",
+					"aud_apll1_tuner",
+					"aud_apll2_tuner",
+					"aud_top0_spdf",
+					"aud_apll",
+					"aud_apll2",
+					"aud_dac",
+					"aud_dac_predis",
+					"aud_tml",
+					"aud_adc",
+					"aud_dac_hires",
+					"aud_a1sys_hp",
+					"aud_afe_dmic1",
+					"aud_afe_dmic2",
+					"aud_afe_dmic3",
+					"aud_afe_dmic4",
+					"aud_afe_26m_dmic_tm",
+					"aud_ul_tml_hires",
+					"aud_adc_hires",
+					"aud_adda6_adc",
+					"aud_adda6_adc_hires",
+					"aud_linein_tuner",
+					"aud_earc_tuner",
+					"aud_i2sin",
+					"aud_tdm_in",
+					"aud_i2s_out",
+					"aud_tdm_out",
+					"aud_hdmi_out",
+					"aud_asrc11",
+					"aud_asrc12",
+					"aud_multi_in",
+					"aud_intdir",
+					"aud_a1sys",
+					"aud_a2sys",
+					"aud_pcmif",
+					"aud_a3sys",
+					"aud_a4sys",
+					"aud_memif_ul1",
+					"aud_memif_ul2",
+					"aud_memif_ul3",
+					"aud_memif_ul4",
+					"aud_memif_ul5",
+					"aud_memif_ul6",
+					"aud_memif_ul8",
+					"aud_memif_ul9",
+					"aud_memif_ul10",
+					"aud_memif_dl2",
+					"aud_memif_dl3",
+					"aud_memif_dl6",
+					"aud_memif_dl7",
+					"aud_memif_dl8",
+					"aud_memif_dl10",
+					"aud_memif_dl11",
+					"aud_gasrc0",
+					"aud_gasrc1",
+					"aud_gasrc2",
+					"aud_gasrc3",
+					"aud_gasrc4",
+					"aud_gasrc5",
+					"aud_gasrc6",
+					"aud_gasrc7",
+					"aud_gasrc8",
+					"aud_gasrc9",
+					"aud_gasrc10",
+					"aud_gasrc11",
+					"aud_gasrc12",
+					"aud_gasrc13",
+					"aud_gasrc14",
+					"aud_gasrc15",
+					"aud_gasrc16",
+					"aud_gasrc17",
+					"aud_gasrc18",
+					"aud_gasrc19";
+				status = "disabled";
+			};
 		};
 
 		audsys_src: syscon@108a0000 {
@@ -2155,4 +2433,10 @@
 		clocks = <&clk26m>;
 		clock-names = "ddc-i2c";
 	};
+
+	sound: mt8195-sound {
+		compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
+		mediatek,platform = <&afe>;
+		status = "disabled";
+	};
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
