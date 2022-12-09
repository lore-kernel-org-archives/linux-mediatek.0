Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039A6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 03:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0IUYP1FMYMYrYJClJDGBDoSMePz+IPYu2tTV/hqTIg4=; b=O6yonhZ2aPPYNuHmY1v2zcwUBy
	JwsBLOLSO3WZDAR0X2kIyXOF0bGfziCsHANBiK5QIonuOnMhfMXRjOnl2lO/C22iVVjcJl+Q69mOf
	aOdiVjwQC5j3flY+ufrrXmdkVmOYW+xYOUaZfwI6nEL6nNXBCC3h+RYk9oLo8mS73ArcRpNd6eIB6
	Bb8VLQ2xcElDwahVn9ImMX2HOZMHSi/MZKiBaG6eUrrdegMEzqYsQmIDA6OhV1sUuYlEVz7bx8hN4
	iIK7jFb7X6xeWSqud4ED6hgUnRNcSGOe/mk+WdS4DkPcEckja+GktvV4ReFi6g8/j8jYkAT7hJCnX
	wNI2tIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3TnZ-001pxp-6Y; Fri, 09 Dec 2022 03:11:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3TnV-001ppv-QB; Fri, 09 Dec 2022 03:11:40 +0000
X-UUID: cefc593f2fee4f1a9719d0a3b03a6686-20221208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0IUYP1FMYMYrYJClJDGBDoSMePz+IPYu2tTV/hqTIg4=;
	b=jEcYxOzAoNoSBkLUSERUCtUaMruZag/aG/ZvjITUyuxv6zTVXPoQdFbgwrKyKgZVovE0EW69zY38t+HGVGM1dy70mIvt6RfmJ0xKco38ujCG66VTtvor29grs/RZtFiRZgZnQAE9k8F9T/hlpbdYdUVBEwmBoenK1X8J7lYNXLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a31c5206-b924-4968-a5ee-4485bb417c2b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:041a15d2-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: cefc593f2fee4f1a9719d0a3b03a6686-20221208
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yc.hung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 781544344; Thu, 08 Dec 2022 20:11:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Dec 2022 11:10:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 9 Dec 2022 11:10:58 +0800
From: YC Hung <yc.hung@mediatek.com>
To: 
CC: <yc.hung@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Trevor Wu
	<trevor.wu@mediatek.com>, "Nicolas F . R . A . Prado"
	<nfraprado@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Curtis
 Malainey" <cujomalainey@chromium.org>, <whalechang@google.com>
Subject: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio active
Date: Fri, 9 Dec 2022 11:10:53 +0800
Message-ID: <20221209031053.8444-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_191138_043262_3E9B8DBC 
X-CRM114-Status: GOOD (  12.59  )
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

In MT8195 SOF design, both DSP and audio driver would access audio
registers. Before DSP accesses audio registers, audio power and clock
should be enabled. DSP will hang up if DSP access audio register but
audio power and clock are disabled. Therefore, we add audio pm runtime
active checking before accessing audio registers in SOF BE's callback
hw_params function to avoid this situation.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 61be66f47723..4682748d82be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -633,6 +633,32 @@ static const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
 	.hw_params = mt8195_rt1011_etdm_hw_params,
 };
 
+static int mt8195_sof_be_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_component *cmpnt_afe = NULL;
+	struct snd_soc_pcm_runtime *runtime;
+
+	/* find afe component */
+	for_each_card_rtds(rtd->card, runtime) {
+		cmpnt_afe = snd_soc_rtdcom_lookup(runtime, AFE_PCM_NAME);
+		if (cmpnt_afe)
+			break;
+	}
+
+	if (cmpnt_afe && !pm_runtime_active(cmpnt_afe->dev)) {
+		dev_err(rtd->dev, "afe pm runtime is not active!!\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8195_sof_be_ops = {
+	.hw_params = mt8195_sof_be_hw_params,
+};
+
 static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -1272,24 +1298,28 @@ static struct snd_soc_dai_link mt8195_mt6359_dai_links[] = {
 		.name = "AFE_SOF_DL2",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
 	},
 	[DAI_LINK_SOF_DL3_BE] = {
 		.name = "AFE_SOF_DL3",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_DL3),
 	},
 	[DAI_LINK_SOF_UL4_BE] = {
 		.name = "AFE_SOF_UL4",
 		.no_pcm = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL4),
 	},
 	[DAI_LINK_SOF_UL5_BE] = {
 		.name = "AFE_SOF_UL5",
 		.no_pcm = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8195_sof_be_ops,
 		SND_SOC_DAILINK_REG(AFE_SOF_UL5),
 	},
 };
-- 
2.18.0


