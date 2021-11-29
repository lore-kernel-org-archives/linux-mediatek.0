Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D53C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AQpv/++W+z9NnEaNbgiO3/9hvz+yfqBlTBVxlUngH4=; b=TqhmlpRR+o6qC1
	YG683+ACKIEHrTR2FncAdes51BX1k/gvHzUBPOPDmdZaTeHqhOGtrAhLOwNbxn3glRwpJJxqWk2Zp
	uahmR1PGwmV3r6gC/zjtXEhAdXyXZZEIvoREbODXeJbF+jv5+9lMxB+Y2w/6tyUUBOY8VKMS48F72
	UQykZ7e6mv+wW2dktvbddpzQtGFX8deruwONiHKA2gqbrkVVD9ousA7wlXcXZRpWnc4Qrl490MrHK
	vw99g85jsXXLDpotw30um0T2aDifWTTXmkFM2M1rm7OlRqgcjUjY+d/ncObcqex/DarT4zA0vxiIn
	YFVMahWPLPfDypuPmlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrhNY-000xGw-KS; Mon, 29 Nov 2021 14:11:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrhNH-000xFl-TE; Mon, 29 Nov 2021 14:11:23 +0000
X-UUID: 3ea965aa0e474a76992e02bc86d241ab-20211129
X-UUID: 3ea965aa0e474a76992e02bc86d241ab-20211129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1914117721; Mon, 29 Nov 2021 07:11:14 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 06:11:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Nov 2021 22:11:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 22:11:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>,
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8195: add sof support on
 mt8195-mt6359-rt1019-rt5682
Date: Mon, 29 Nov 2021 22:10:56 +0800
Message-ID: <20211129141057.12422-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129141057.12422-1-trevor.wu@mediatek.com>
References: <20211129141057.12422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_061119_982757_962E9478 
X-CRM114-Status: GOOD (  25.13  )
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

In the patch, widgets, routes and dai-link requrird by SOF are included,
and late_probe is introduced for SOF route connection.

Only when adsp phandle could be retrieved from DTS, the SOF related part
of machine driver is executed.

Additionally, supported dai-links could be specified from DTS, so that
we can disable AP side hardware controls when DSP SOF controls the same
audio FE.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 317 +++++++++++++++++-
 1 file changed, 305 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 7209c70acf6e..06e60fea2ca7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
-//
-// mt8195-mt6359-rt1019-rt5682.c  --
-//	MT8195-MT6359-RT1019-RT6358 ALSA SoC machine driver
-//
-// Copyright (c) 2021 MediaTek Inc.
-// Author: Trevor Wu <trevor.wu@mediatek.com>
-//
+/*
+ * mt8195-mt6359-rt1019-rt5682.c  --
+ *	MT8195-MT6359-RT1019-RT5682 ALSA SoC machine driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ *	   YC Hung <yc.hung@mediatek.com>
+ */
 
 #include <linux/input.h>
 #include <linux/module.h>
@@ -13,6 +14,7 @@
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/rt5682.h>
+#include <sound/sof.h>
 #include <sound/soc.h>
 #include "../../codecs/mt6359.h"
 #include "../../codecs/rt5682.h"
@@ -28,8 +30,21 @@
 #define RT5682S_CODEC_DAI	"rt5682s-aif1"
 #define RT5682S_DEV0_NAME	"rt5682s.2-001a"
 
+#define SOF_DMA_DL2 "SOF_DMA_DL2"
+#define SOF_DMA_DL3 "SOF_DMA_DL3"
+#define SOF_DMA_UL4 "SOF_DMA_UL4"
+#define SOF_DMA_UL5 "SOF_DMA_UL5"
+
+struct sof_conn_stream {
+	const char *normal_link;
+	const char *sof_link;
+	const char *sof_dma;
+	int stream_dir;
+};
+
 struct mt8195_mt6359_rt1019_rt5682_priv {
 	struct device_node *platform_node;
+	struct device_node *adsp_node;
 	struct device_node *hdmi_node;
 	struct device_node *dp_node;
 	struct snd_soc_jack headset_jack;
@@ -42,6 +57,10 @@ static const struct snd_soc_dapm_widget
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL4, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL5, SND_SOC_NOPM, 0, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
@@ -51,6 +70,16 @@ static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
 	{ "IN1P", NULL, "Headset Mic" },
+	/* SOF Uplink */
+	{SOF_DMA_UL4, NULL, "O034"},
+	{SOF_DMA_UL4, NULL, "O035"},
+	{SOF_DMA_UL5, NULL, "O036"},
+	{SOF_DMA_UL5, NULL, "O037"},
+	/* SOF Downlink */
+	{"I070", NULL, SOF_DMA_DL2},
+	{"I071", NULL, SOF_DMA_DL2},
+	{"I020", NULL, SOF_DMA_DL3},
+	{"I021", NULL, SOF_DMA_DL3},
 };
 
 static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
@@ -562,8 +591,17 @@ enum {
 	DAI_LINK_PCM1_BE,
 	DAI_LINK_UL_SRC1_BE,
 	DAI_LINK_UL_SRC2_BE,
+	DAI_LINK_REGULAR_LAST = DAI_LINK_UL_SRC2_BE,
+	DAI_LINK_SOF_START,
+	DAI_LINK_SOF_DL2_BE = DAI_LINK_SOF_START,
+	DAI_LINK_SOF_DL3_BE,
+	DAI_LINK_SOF_UL4_BE,
+	DAI_LINK_SOF_UL5_BE,
+	DAI_LINK_SOF_END = DAI_LINK_SOF_UL5_BE,
 };
 
+#define	DAI_LINK_REGULAR_NUM	(DAI_LINK_REGULAR_LAST + 1)
+
 /* FE */
 SND_SOC_DAILINK_DEFS(DL2_FE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
@@ -702,6 +740,154 @@ SND_SOC_DAILINK_DEFS(UL_SRC2_BE,
 						   "mt6359-snd-codec-aif2")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static const struct sof_conn_stream g_sof_conn_streams[] = {
+	{ "ETDM2_OUT_BE", "AFE_SOF_DL2", SOF_DMA_DL2, SNDRV_PCM_STREAM_PLAYBACK},
+	{ "ETDM1_OUT_BE", "AFE_SOF_DL3", SOF_DMA_DL3, SNDRV_PCM_STREAM_PLAYBACK},
+	{ "UL_SRC1_BE", "AFE_SOF_UL4", SOF_DMA_UL4, SNDRV_PCM_STREAM_CAPTURE},
+	{ "ETDM2_IN_BE", "AFE_SOF_UL5", SOF_DMA_UL5, SNDRV_PCM_STREAM_CAPTURE},
+};
+
+/* fixup the BE DAI link to match any values from topology */
+static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai_link *sof_dai_link = NULL;
+	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_dai *cpu_dai;
+	int i, j, ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
+		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
+
+		if (strcmp(rtd->dai_link->name, conn->normal_link))
+			continue;
+
+		for_each_card_rtds(card, runtime) {
+			if (strcmp(runtime->dai_link->name, conn->sof_link))
+				continue;
+
+			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
+				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
+					sof_dai_link = runtime->dai_link;
+					break;
+				}
+			}
+			break;
+		}
+
+		if (sof_dai_link && sof_dai_link->be_hw_params_fixup)
+			ret = sof_dai_link->be_hw_params_fixup(runtime, params);
+
+		break;
+	}
+
+	if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
+	    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
+		mt8195_etdm_hw_params_fixup(runtime, params);
+	}
+
+	return ret;
+}
+
+static int mt8195_mt6359_rt1019_rt5682_card_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_component *sof_comp;
+	int i;
+
+	/* 1. find sof component */
+	for_each_card_rtds(card, runtime) {
+		for (i = 0; i < runtime->num_components; i++) {
+			if (!runtime->components[i]->driver->name)
+				continue;
+			if (!strcmp(runtime->components[i]->driver->name, "sof-audio-component")) {
+				sof_comp = runtime->components[i];
+				break;
+			}
+		}
+	}
+
+	if (!sof_comp) {
+		dev_info(card->dev, " probe without component\n");
+		return 0;
+	}
+	/* 2. add route path and fixup callback */
+	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
+		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
+		struct snd_soc_pcm_runtime *sof_rtd = NULL;
+		struct snd_soc_pcm_runtime *normal_rtd = NULL;
+		struct snd_soc_pcm_runtime *rtd = NULL;
+
+		for_each_card_rtds(card, rtd) {
+			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
+				sof_rtd = rtd;
+				continue;
+			}
+			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
+				normal_rtd = rtd;
+				continue;
+			}
+			if (normal_rtd && sof_rtd)
+				break;
+		}
+		if (normal_rtd && sof_rtd) {
+			int j;
+			struct snd_soc_dai *cpu_dai;
+
+			for_each_rtd_cpu_dais(sof_rtd, j, cpu_dai) {
+				struct snd_soc_dapm_route route;
+				struct snd_soc_dapm_path *p = NULL;
+				struct snd_soc_dapm_widget *play_widget =
+					cpu_dai->playback_widget;
+				struct snd_soc_dapm_widget *cap_widget =
+					cpu_dai->capture_widget;
+				memset(&route, 0, sizeof(route));
+				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE &&
+				    cap_widget) {
+					snd_soc_dapm_widget_for_each_sink_path(cap_widget, p) {
+						route.source = conn->sof_dma;
+						route.sink = p->sink->name;
+						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+					}
+				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK &&
+						play_widget){
+					snd_soc_dapm_widget_for_each_source_path(play_widget, p) {
+						route.source = p->source->name;
+						route.sink = conn->sof_dma;
+						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+					}
+				} else {
+					dev_err(cpu_dai->dev, "stream dir and widget not pair\n");
+				}
+			}
+			normal_rtd->dai_link->be_hw_params_fixup = mt8195_dai_link_fixup;
+		}
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 	/* FE */
 	[DAI_LINK_DL2_FE] = {
@@ -896,7 +1082,6 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 	/* BE */
 	[DAI_LINK_DL_SRC_BE] = {
 		.name = "DL_SRC_BE",
-		.init = mt8195_mt6359_init,
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		SND_SOC_DAILINK_REG(DL_SRC_BE),
@@ -980,6 +1165,31 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(UL_SRC2_BE),
 	},
+	/* SOF BE */
+	[DAI_LINK_SOF_DL2_BE] = {
+		.name = "AFE_SOF_DL2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
+	},
+	[DAI_LINK_SOF_DL3_BE] = {
+		.name = "AFE_SOF_DL3",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL3),
+	},
+	[DAI_LINK_SOF_UL4_BE] = {
+		.name = "AFE_SOF_UL4",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL4),
+	},
+	[DAI_LINK_SOF_UL5_BE] = {
+		.name = "AFE_SOF_UL5",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL5),
+	},
 };
 
 static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
@@ -995,12 +1205,61 @@ static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
 	.num_dapm_routes = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_routes),
 };
 
+static int mt8195_dailink_parse_of(struct snd_soc_card *card, struct device_node *np,
+				   const char *propname)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_dai_link *link;
+	const char *dai_name = NULL;
+	int i, j, ret, num_links;
+
+	num_links = of_property_count_strings(np, "mediatek,dai-link");
+
+	if (num_links < 0 || num_links > ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_dai_links)) {
+		dev_dbg(dev, "number of dai-link is invalid\n");
+		return -EINVAL;
+	}
+
+	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	if (!card->dai_link)
+		return -ENOMEM;
+
+	card->num_links = 0;
+	link = card->dai_link;
+
+	for (i = 0; i < num_links; i++) {
+		ret = of_property_read_string_index(np, propname, i, &dai_name);
+		if (ret) {
+			dev_dbg(dev, "ASoC: Property '%s' index %d could not be read: %d\n",
+				propname, i, ret);
+			return -EINVAL;
+		}
+
+		for (j = 0; j < ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_dai_links); j++) {
+			if (!strcmp(dai_name, mt8195_mt6359_rt1019_rt5682_dai_links[j].name)) {
+				memcpy(link, &mt8195_mt6359_rt1019_rt5682_dai_links[j],
+				       sizeof(struct snd_soc_dai_link));
+				link++;
+				card->num_links++;
+				break;
+			}
+		}
+	}
+
+	if (card->num_links != num_links)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv;
 	int is5682s = 0;
+	int init6359 = 0;
+	int sof_on = 0;
 	int ret, i;
 
 	card->dev = &pdev->dev;
@@ -1026,15 +1285,36 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* dai link */
+	priv->adsp_node = of_parse_phandle(pdev->dev.of_node,
+					   "mediatek,adsp", 0);
+	if (priv->adsp_node)
+		sof_on = 1;
+
+	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
+		ret = mt8195_dailink_parse_of(card, pdev->dev.of_node,
+					      "mediatek,dai-link");
+		if (ret) {
+			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
+			return -EINVAL;
+		}
+	} else {
+		if (!sof_on)
+			card->num_links = DAI_LINK_REGULAR_NUM;
+	}
+
 	for_each_card_prelinks(card, i, dai_link) {
-		if (!dai_link->platforms->name)
-			dai_link->platforms->of_node = priv->platform_node;
+		if (!dai_link->platforms->name) {
+			if (!strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")) && sof_on)
+				dai_link->platforms->of_node = priv->adsp_node;
+			else
+				dai_link->platforms->of_node = priv->platform_node;
+		}
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
 			priv->dp_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,dptx-codec", 0);
-
 			if (!priv->dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
@@ -1061,9 +1341,19 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
 			dai_link->codecs->dai_name =
 				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
+		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
+			   strcmp(dai_link->name, "UL_SRC1_BE") == 0 ||
+			   strcmp(dai_link->name, "UL_SRC2_BE") == 0) {
+			if (!init6359) {
+				dai_link->init = mt8195_mt6359_init;
+				init6359 = 1;
+			}
 		}
 	}
 
+	if (sof_on)
+		card->late_probe = mt8195_mt6359_rt1019_rt5682_card_late_probe;
+
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
@@ -1073,6 +1363,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		of_node_put(priv->hdmi_node);
 		of_node_put(priv->dp_node);
 		of_node_put(priv->platform_node);
+		of_node_put(priv->adsp_node);
 	}
 
 	return ret;
@@ -1087,6 +1378,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_remove(struct platform_device *pdev)
 	of_node_put(priv->hdmi_node);
 	of_node_put(priv->dp_node);
 	of_node_put(priv->platform_node);
+	of_node_put(priv->adsp_node);
 
 	return 0;
 }
@@ -1120,5 +1412,6 @@ module_platform_driver(mt8195_mt6359_rt1019_rt5682_driver);
 /* Module information */
 MODULE_DESCRIPTION("MT8195-MT6359-RT1019-RT5682 ALSA SoC machine driver");
 MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
-MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("YC Hung <yc.hung@mediatek.com>");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("mt8195_mt6359_rt1019_rt5682 soc card");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
