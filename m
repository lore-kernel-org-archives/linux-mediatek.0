Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0D8C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+IuxvMnobEvIOSPfxLzitjAj/zyGghsWarqDqoyqPc=; b=sdCqkcy3BnyJp0YHhltqs1n1Ah
	zVP3XYBva74dL3yvEWCQlsz5+C5dsLavkz6Nva+8lXvJ8SGiWR2M9NFDTyJNA5gELJxc+0UK8KK8o
	p5tl6r7d17nggcW/T/0V4fPZQfpPOWTXPgGote/k3qcsFvWLQLbyyseYyVbutwrW/gifW8Z1vDk3h
	i1+wEykLHiZVBErMqTyAN/zvr+vjl5vuOwht4rf0dfs8S9kedyI3zxGYG4WusImAr3L6I72teQcU6
	IkV0o9ONh9mmPWQrSCBOwFjtmR8/Y9DmiDA1ssfpWJ/Mn4OZ/x9kqclRSWsaOKLgiVa6+td1mv8tN
	LQAWYfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB8PJ-006Cxc-UH; Fri, 30 Dec 2022 05:58:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB8Oa-006CgZ-GP; Fri, 30 Dec 2022 05:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i+IuxvMnobEvIOSPfxLzitjAj/zyGghsWarqDqoyqPc=; b=R3Va8R+GeP7DCLtGxbXs3tjq8+
	clJxVAQhnDBTpPV6/zhhTddh8zZxTrWtEuq+BmzWuIhLj104/P3HyqTJLSahv/jH4h46LMVO+hE9P
	vHsJigy/hdtWxu34BOpTovylb+R3t7x08jn34nhnIDn8D/75XXOWtXbyc1Ec8AC5tXcpUQ5/bpxEy
	O9kOCV1pmfG9bB2Tb9K3sleaiTpxLIv8frvsOG1nSRuLP/BW5tfr8wYWK6LN+FObS5IN3vh4GxGTR
	wOIc9TyqNYUHEg3pqYeI4JRiV0IEWQd3oE6/WkttZWfhZ0TBhZWv4KlVdFNfhGaujL/OD80w6ilFy
	kGmEqcEw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pB8OM-00GjOA-38;
	Fri, 30 Dec 2022 05:57:24 +0000
X-UUID: aab6f2cae61d4fd8b8886914afbbf28e-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i+IuxvMnobEvIOSPfxLzitjAj/zyGghsWarqDqoyqPc=;
	b=bNQVazKHWZ5EwYqwlv5dtoMcbS/Qneh2sA1kI2Folnvo7btLSlXiEBjBZ/iHig4H7YKfRSUAyXXzjMlef00UyncnjWVFOQqXkkdkZ1VYDvcOmlxcgL5qYDPsxn6xqLDWczhV9ukd05Oijqz0s0xgg6U01+IvA5QYSWlME7Kk/t4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:a5e948a9-847b-424c-8bdb-37f5a909a5fa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:1644d18a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: aab6f2cae61d4fd8b8886914afbbf28e-20221229
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 34174515; Thu, 29 Dec 2022 22:57:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 13:54:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 13:54:49 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v4 09/13] ASoC: mediatek: mt8188: add control for timing select
Date: Fri, 30 Dec 2022 13:54:39 +0800
Message-ID: <20221230055443.16024-10-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221230055443.16024-1-trevor.wu@mediatek.com>
References: <20221230055443.16024-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_055721_451672_256071EE 
X-CRM114-Status: GOOD (  11.56  )
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


