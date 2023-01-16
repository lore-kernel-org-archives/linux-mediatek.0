Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E1EC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 03:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPlLIL6Jqf64qHEk6gvXazUQP7Nowl8/Sq0B4Ez2dYs=; b=oJl8D3S7zyY3EcU0fxJNQHXXkF
	Lduq1vjbXkAhOgsx+nFGj2OmxHzFJ+gOPRzd0UGz9yUcpwT9BIpi/zgxbBtDcZwxcEo8Cuk4D3nmj
	UIKWxA3xL6ic2e0DjdTU5a1y+Cz4LD14CA6FW4DvEG1G9KbILZWE6mOvHBb6EwnqdbeF7LAAGcE2M
	72DTDiCBPzyeYGp2+0+R0Q1rVje7LFl2icZXZLKnp1V4IeCzM/YMT/3BXLlHjvNIWbb8Mztvc/c09
	PTBz88Vk0ZO1uEcTSzzQm+tOLHLtrm01q2nzpNsIakd+d9feKKDQ4a7AmL6PIAjw2ziRn8xh7vNeB
	/pdj+hUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGRZ-008Xho-00; Mon, 16 Jan 2023 03:45:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHGO1-008Vzy-OO; Mon, 16 Jan 2023 03:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LPlLIL6Jqf64qHEk6gvXazUQP7Nowl8/Sq0B4Ez2dYs=; b=i800dpDr2G7syfIs9msOJcQvmx
	X245e6Vy2xB4aNppcLUH6kNNBM9oBJkm72wC7JntSUaZg8zbIUYqCfEyfGDiDttjx7xFxd3PUtWe4
	ZgFocVmvOUpbnGPIcle1D3w4R5cegGXSLRh8WeSyuUxvbFebnnYXgJlovk5d10S78UqmX4ZLHNknI
	bRszV3tGyVK03oOSCmnQPxgekvFlDesySr6pMN1kpIDwvHF09kIdbURPn1lbI+MUdZfBRBNhlOocn
	/ZuMVbdGaFcKZwz1SSmIebIOSxy4Q8eQGlEARq/BAzpiqvCKxJMCRTexPrkZZ5AxYEmO8V4u9JK9C
	ISqJJqJQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHGNj-005Syx-05;
	Mon, 16 Jan 2023 03:42:05 +0000
X-UUID: af7570b4954f11edbbe3f76fe852e059-20230115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LPlLIL6Jqf64qHEk6gvXazUQP7Nowl8/Sq0B4Ez2dYs=;
	b=RAmU+TrYIISZdTfWUswywHQxHnCDahgjogxxyg+08aojI357uFAot3AfklcP2i9UF7cndLqXON7PgB8EGVUtycNsxz7YOROUkw6/KvLf+vi6vNSHCSDW1RXNPUVXCgnkduwpjYrIU+PQiG9dvmFlKT79PVJ6njDeHLWsghWmsk0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:add7c12c-d3c4-4edd-8754-71a4a2058f78,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:9ccae5f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: af7570b4954f11edbbe3f76fe852e059-20230115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 625053808; Sun, 15 Jan 2023 20:41:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 11:41:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 11:41:37 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RESEND,v5 09/13] ASoC: mediatek: mt8188: add control for timing select
Date: Mon, 16 Jan 2023 11:41:27 +0800
Message-ID: <20230116034131.23943-10-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116034131.23943-1-trevor.wu@mediatek.com>
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_034159_451049_A9B49BE7 
X-CRM114-Status: GOOD (  11.38  )
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

Add mixer control for irq and memif timing selection.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 506 +++++++++++++++++++++
 1 file changed, 506 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 6bef980846fa..57a31330e5f4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -1394,6 +1394,510 @@ static const struct snd_soc_dapm_route mt8188_memif_routes[] = {
 	{"O041", "I169 Switch", "I169"},
 };
 
+static const char * const mt8188_afe_1x_en_sel_text[] = {
+	"a1sys_a2sys", "a3sys", "a4sys",
+};
+
+static const unsigned int mt8188_afe_1x_en_sel_values[] = {
+	0, 1, 2,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dl2_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 18, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl3_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 20, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl6_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 22, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl7_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 24, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl8_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 26, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl10_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 28, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl11_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 30, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul1_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 0, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul2_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 2, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul3_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 4, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 6, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul5_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 8, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul6_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 10, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul8_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 12, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul9_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 14, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul10_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL1, 16, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq1_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 0, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq2_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 2, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq3_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 4, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq4_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 6, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq5_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 8, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq6_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 10, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq7_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 12, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq8_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 14, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq9_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 16, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq10_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 18, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq11_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 20, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq12_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 22, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq13_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 24, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq14_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 26, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq15_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 28, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(asys_irq16_1x_en_sel_enum,
+				  A3_A4_TIMING_SEL6, 30, 0x3,
+				  mt8188_afe_1x_en_sel_text,
+				  mt8188_afe_1x_en_sel_values);
+
+static const char * const mt8188_afe_fs_timing_sel_text[] = {
+	"asys",
+	"etdmout1_1x_en",
+	"etdmout2_1x_en",
+	"etdmout3_1x_en",
+	"etdmin1_1x_en",
+	"etdmin2_1x_en",
+	"etdmin1_nx_en",
+	"etdmin2_nx_en",
+};
+
+static const unsigned int mt8188_afe_fs_timing_sel_values[] = {
+	0,
+	MT8188_ETDM_OUT1_1X_EN,
+	MT8188_ETDM_OUT2_1X_EN,
+	MT8188_ETDM_OUT3_1X_EN,
+	MT8188_ETDM_IN1_1X_EN,
+	MT8188_ETDM_IN2_1X_EN,
+	MT8188_ETDM_IN1_NX_EN,
+	MT8188_ETDM_IN2_NX_EN,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(dl2_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl3_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl6_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl8_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(dl11_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul2_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul4_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul5_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul9_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul10_fs_timing_sel_enum,
+				  SND_SOC_NOPM, 0, 0,
+				  mt8188_afe_fs_timing_sel_text,
+				  mt8188_afe_fs_timing_sel_values);
+
+static int mt8188_memif_1x_en_sel_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	if (val == memif_priv->asys_timing_sel)
+		return 0;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	memif_priv->asys_timing_sel = val;
+
+	return ret;
+}
+
+static int mt8188_asys_irq_1x_en_sel_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	unsigned int id = kcontrol->id.device;
+	long val = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	if (val == afe_priv->irq_priv[id].asys_timing_sel)
+		return 0;
+
+	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
+
+	afe_priv->irq_priv[id].asys_timing_sel = val;
+
+	return ret;
+}
+
+static int mt8188_memif_fs_timing_sel_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	ucontrol->value.enumerated.item[0] =
+		snd_soc_enum_val_to_item(e, memif_priv->fs_timing);
+
+	return 0;
+}
+
+static int mt8188_memif_fs_timing_sel_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_memif_priv *memif_priv;
+	unsigned int dai_id = kcontrol->id.device;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int prev_item = 0;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	memif_priv = afe_priv->dai_priv[dai_id];
+
+	prev_item = snd_soc_enum_val_to_item(e, memif_priv->fs_timing);
+
+	if (item[0] == prev_item)
+		return 0;
+
+	memif_priv->fs_timing = snd_soc_enum_item_to_val(e, item[0]);
+
+	return 1;
+}
+
+static const struct snd_kcontrol_new mt8188_memif_controls[] = {
+	MT8188_SOC_ENUM_EXT("dl2_1x_en_sel",
+			    dl2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL2),
+	MT8188_SOC_ENUM_EXT("dl3_1x_en_sel",
+			    dl3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL3),
+	MT8188_SOC_ENUM_EXT("dl6_1x_en_sel",
+			    dl6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL6),
+	MT8188_SOC_ENUM_EXT("dl7_1x_en_sel",
+			    dl7_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL7),
+	MT8188_SOC_ENUM_EXT("dl8_1x_en_sel",
+			    dl8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL8),
+	MT8188_SOC_ENUM_EXT("dl10_1x_en_sel",
+			    dl10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL10),
+	MT8188_SOC_ENUM_EXT("dl11_1x_en_sel",
+			    dl11_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_DL11),
+	MT8188_SOC_ENUM_EXT("ul1_1x_en_sel",
+			    ul1_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL1),
+	MT8188_SOC_ENUM_EXT("ul2_1x_en_sel",
+			    ul2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL2),
+	MT8188_SOC_ENUM_EXT("ul3_1x_en_sel",
+			    ul3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL3),
+	MT8188_SOC_ENUM_EXT("ul4_1x_en_sel",
+			    ul4_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL4),
+	MT8188_SOC_ENUM_EXT("ul5_1x_en_sel",
+			    ul5_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL5),
+	MT8188_SOC_ENUM_EXT("ul6_1x_en_sel",
+			    ul6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL6),
+	MT8188_SOC_ENUM_EXT("ul8_1x_en_sel",
+			    ul8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL8),
+	MT8188_SOC_ENUM_EXT("ul9_1x_en_sel",
+			    ul9_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL9),
+	MT8188_SOC_ENUM_EXT("ul10_1x_en_sel",
+			    ul10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_memif_1x_en_sel_put,
+			    MT8188_AFE_MEMIF_UL10),
+	MT8188_SOC_ENUM_EXT("asys_irq1_1x_en_sel",
+			    asys_irq1_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_13),
+	MT8188_SOC_ENUM_EXT("asys_irq2_1x_en_sel",
+			    asys_irq2_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_14),
+	MT8188_SOC_ENUM_EXT("asys_irq3_1x_en_sel",
+			    asys_irq3_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_15),
+	MT8188_SOC_ENUM_EXT("asys_irq4_1x_en_sel",
+			    asys_irq4_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_16),
+	MT8188_SOC_ENUM_EXT("asys_irq5_1x_en_sel",
+			    asys_irq5_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_17),
+	MT8188_SOC_ENUM_EXT("asys_irq6_1x_en_sel",
+			    asys_irq6_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_18),
+	MT8188_SOC_ENUM_EXT("asys_irq7_1x_en_sel",
+			    asys_irq7_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_19),
+	MT8188_SOC_ENUM_EXT("asys_irq8_1x_en_sel",
+			    asys_irq8_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_20),
+	MT8188_SOC_ENUM_EXT("asys_irq9_1x_en_sel",
+			    asys_irq9_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_21),
+	MT8188_SOC_ENUM_EXT("asys_irq10_1x_en_sel",
+			    asys_irq10_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_22),
+	MT8188_SOC_ENUM_EXT("asys_irq11_1x_en_sel",
+			    asys_irq11_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_23),
+	MT8188_SOC_ENUM_EXT("asys_irq12_1x_en_sel",
+			    asys_irq12_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_24),
+	MT8188_SOC_ENUM_EXT("asys_irq13_1x_en_sel",
+			    asys_irq13_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_25),
+	MT8188_SOC_ENUM_EXT("asys_irq14_1x_en_sel",
+			    asys_irq14_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_26),
+	MT8188_SOC_ENUM_EXT("asys_irq15_1x_en_sel",
+			    asys_irq15_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_27),
+	MT8188_SOC_ENUM_EXT("asys_irq16_1x_en_sel",
+			    asys_irq16_1x_en_sel_enum,
+			    snd_soc_get_enum_double,
+			    mt8188_asys_irq_1x_en_sel_put,
+			    MT8188_AFE_IRQ_28),
+	MT8188_SOC_ENUM_EXT("dl2_fs_timing_sel",
+			    dl2_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL2),
+	MT8188_SOC_ENUM_EXT("dl3_fs_timing_sel",
+			    dl3_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL3),
+	MT8188_SOC_ENUM_EXT("dl6_fs_timing_sel",
+			    dl6_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL6),
+	MT8188_SOC_ENUM_EXT("dl8_fs_timing_sel",
+			    dl8_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL8),
+	MT8188_SOC_ENUM_EXT("dl11_fs_timing_sel",
+			    dl11_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_DL11),
+	MT8188_SOC_ENUM_EXT("ul2_fs_timing_sel",
+			    ul2_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL2),
+	MT8188_SOC_ENUM_EXT("ul4_fs_timing_sel",
+			    ul4_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL4),
+	MT8188_SOC_ENUM_EXT("ul5_fs_timing_sel",
+			    ul5_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL5),
+	MT8188_SOC_ENUM_EXT("ul9_fs_timing_sel",
+			    ul9_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL9),
+	MT8188_SOC_ENUM_EXT("ul10_fs_timing_sel",
+			    ul10_fs_timing_sel_enum,
+			    mt8188_memif_fs_timing_sel_get,
+			    mt8188_memif_fs_timing_sel_put,
+			    MT8188_AFE_MEMIF_UL10),
+};
+
 static const struct snd_soc_component_driver mt8188_afe_pcm_dai_component = {
 	.name = "mt8188-afe-pcm-dai",
 };
@@ -2583,6 +3087,8 @@ static int mt8188_dai_memif_register(struct mtk_base_afe *afe)
 	dai->num_dapm_widgets = ARRAY_SIZE(mt8188_memif_widgets);
 	dai->dapm_routes = mt8188_memif_routes;
 	dai->num_dapm_routes = ARRAY_SIZE(mt8188_memif_routes);
+	dai->controls = mt8188_memif_controls;
+	dai->num_controls = ARRAY_SIZE(mt8188_memif_controls);
 
 	return init_memif_priv_data(afe);
 }
-- 
2.18.0


