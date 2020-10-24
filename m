Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50623C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 07:59:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE0B22281
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 07:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6KRxJYJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eHKrTTEO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE0B22281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sCsj7cwppSfyFxpXtpLGCM44HljVXIVCoRVODlQUpqI=; b=d6KRxJYJ50rOpSwcE0qvGQLCv
	ZTalNBqPpF553gUqBTtidT6uPyRPgDQ0RmUWMfOg8sGIR7zNz1Ypn0nDsSLb1eD+RNiwjQKFbgCKZ
	uASuLjBy4bIYp/Q/IuoDK1u4MgerBmV4YWbiZKQvjucfduJMory4gRahdH0SynxnevPM7xV60Ebqt
	GtJZUu9MbyjSZljMi+TsFgQ8ERMJEhXtQGuhwBg4tSkRnvkDbQjWO5Apkda2FbkOUDmWzjYoRgFMT
	T2c3ZGz8K/Nv+lW299KjUe0J4FWJdWb3ddoiQFL/cyp49gmrEXgmUcRSXzbG2LONEfu5jUii81ZMB
	g5bP+HeVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWESe-0000Kk-Js; Sat, 24 Oct 2020 07:59:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWESK-00009f-Uk; Sat, 24 Oct 2020 07:59:21 +0000
X-UUID: 9a00714b7ba446428689afc663a7b912-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YMI2ahoFQ+ekM68MtJKhoBYyxLZ51+5Ktw9lnCzKYpg=; 
 b=eHKrTTEOh7gUmcxrIbHS2SPgP9vnn+Qfk4am/YvLGLnQbmzEz+W7Wd3V+6J9rUEHM523ni+br2qq93azu5UU99IcjrTEvUG40dCRAI/JOkSh0VOcNlOdlT/7UvOw/8naXYXGZNctckZSNio3CvKDwU33Ie8vaZ+FCAAkLHlsyi0=;
X-UUID: 9a00714b7ba446428689afc663a7b912-20201023
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2096841391; Fri, 23 Oct 2020 23:59:07 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 00:59:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 15:59:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 15:59:03 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 5/9] ASoC: mediatek: mt8192: support pcm in platform driver
Date: Sat, 24 Oct 2020 15:58:55 +0800
Message-ID: <1603526339-15005-6-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_035917_243657_FEF63EE2 
X-CRM114-Status: GOOD (  16.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds mt8192 pcm dai driver.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c | 409 +++++++++++++++++++++
 1 file changed, 409 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c b/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
new file mode 100644
index 0000000000000..6e94cfdf06fc1
--- /dev/null
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// MediaTek ALSA SoC Audio DAI I2S Control
+//
+// Copyright (c) 2020 MediaTek Inc.
+// Author: Shane Chien <shane.chien@mediatek.com>
+//
+
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+
+#include "mt8192-afe-common.h"
+#include "mt8192-interconnection.h"
+
+enum AUD_TX_LCH_RPT {
+	AUD_TX_LCH_RPT_NO_REPEAT = 0,
+	AUD_TX_LCH_RPT_REPEAT = 1
+};
+
+enum AUD_VBT_16K_MODE {
+	AUD_VBT_16K_MODE_DISABLE = 0,
+	AUD_VBT_16K_MODE_ENABLE = 1
+};
+
+enum AUD_EXT_MODEM {
+	AUD_EXT_MODEM_SELECT_INTERNAL = 0,
+	AUD_EXT_MODEM_SELECT_EXTERNAL = 1
+};
+
+enum AUD_PCM_SYNC_TYPE {
+	/* bck sync length = 1 */
+	AUD_PCM_ONE_BCK_CYCLE_SYNC = 0,
+	/* bck sync length = PCM_INTF_CON1[9:13] */
+	AUD_PCM_EXTENDED_BCK_CYCLE_SYNC = 1
+};
+
+enum AUD_BT_MODE {
+	AUD_BT_MODE_DUAL_MIC_ON_TX = 0,
+	AUD_BT_MODE_SINGLE_MIC_ON_TX = 1
+};
+
+enum AUD_PCM_AFIFO_SRC {
+	/* slave mode & external modem uses different crystal */
+	AUD_PCM_AFIFO_ASRC = 0,
+	/* slave mode & external modem uses the same crystal */
+	AUD_PCM_AFIFO_AFIFO = 1
+};
+
+enum AUD_PCM_CLOCK_SOURCE {
+	AUD_PCM_CLOCK_MASTER_MODE = 0,
+	AUD_PCM_CLOCK_SLAVE_MODE = 1
+};
+
+enum AUD_PCM_WLEN {
+	AUD_PCM_WLEN_PCM_32_BCK_CYCLES = 0,
+	AUD_PCM_WLEN_PCM_64_BCK_CYCLES = 1
+};
+
+enum AUD_PCM_MODE {
+	AUD_PCM_MODE_PCM_MODE_8K = 0,
+	AUD_PCM_MODE_PCM_MODE_16K = 1,
+	AUD_PCM_MODE_PCM_MODE_32K = 2,
+	AUD_PCM_MODE_PCM_MODE_48K = 3,
+};
+
+enum AUD_PCM_FMT {
+	AUD_PCM_FMT_I2S = 0,
+	AUD_PCM_FMT_EIAJ = 1,
+	AUD_PCM_FMT_PCM_MODE_A = 2,
+	AUD_PCM_FMT_PCM_MODE_B = 3
+};
+
+enum AUD_BCLK_OUT_INV {
+	AUD_BCLK_OUT_INV_NO_INVERSE = 0,
+	AUD_BCLK_OUT_INV_INVERSE = 1
+};
+
+enum AUD_PCM_EN {
+	AUD_PCM_EN_DISABLE = 0,
+	AUD_PCM_EN_ENABLE = 1
+};
+
+/* dai component */
+static const struct snd_kcontrol_new mtk_pcm_1_playback_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN7,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN7,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN7_1,
+				    I_DL4_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_1_playback_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN8,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN8,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN8_1,
+				    I_DL4_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_1_playback_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1", AFE_CONN27,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN27,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN27,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1", AFE_CONN27,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2", AFE_CONN27,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN27_1,
+				    I_DL4_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_2_playback_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN17,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN17,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN17,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN17,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN17_1,
+				    I_DL4_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_2_playback_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN18,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN18,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN18,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN18,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN18_1,
+				    I_DL4_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_2_playback_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN23,
+				    I_ADDA_UL_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_2_playback_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1", AFE_CONN24,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN24,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN24,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1", AFE_CONN24,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2", AFE_CONN24,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN24_1,
+				    I_DL4_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_pcm_2_playback_ch5_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN25,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN25,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2", AFE_CONN25,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN25_1,
+				    I_DL4_CH2, 1, 0),
+};
+
+static int mtk_pcm_en_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol,
+			    int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_info(afe->dev, "%s(), name %s, event 0x%x\n",
+		 __func__, w->name, event);
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mtk_dai_pcm_widgets[] = {
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("PCM_1_PB_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_1_playback_ch1_mix,
+			   ARRAY_SIZE(mtk_pcm_1_playback_ch1_mix)),
+	SND_SOC_DAPM_MIXER("PCM_1_PB_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_1_playback_ch2_mix,
+			   ARRAY_SIZE(mtk_pcm_1_playback_ch2_mix)),
+	SND_SOC_DAPM_MIXER("PCM_1_PB_CH4", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_1_playback_ch4_mix,
+			   ARRAY_SIZE(mtk_pcm_1_playback_ch4_mix)),
+	SND_SOC_DAPM_MIXER("PCM_2_PB_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_2_playback_ch1_mix,
+			   ARRAY_SIZE(mtk_pcm_2_playback_ch1_mix)),
+	SND_SOC_DAPM_MIXER("PCM_2_PB_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_2_playback_ch2_mix,
+			   ARRAY_SIZE(mtk_pcm_2_playback_ch2_mix)),
+	SND_SOC_DAPM_MIXER("PCM_2_PB_CH3", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_2_playback_ch3_mix,
+			   ARRAY_SIZE(mtk_pcm_2_playback_ch3_mix)),
+	SND_SOC_DAPM_MIXER("PCM_2_PB_CH4", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_2_playback_ch4_mix,
+			   ARRAY_SIZE(mtk_pcm_2_playback_ch4_mix)),
+	SND_SOC_DAPM_MIXER("PCM_2_PB_CH5", SND_SOC_NOPM, 0, 0,
+			   mtk_pcm_2_playback_ch5_mix,
+			   ARRAY_SIZE(mtk_pcm_2_playback_ch5_mix)),
+
+	SND_SOC_DAPM_SUPPLY("PCM_1_EN",
+			    PCM_INTF_CON1, PCM_EN_SFT, 0,
+			    mtk_pcm_en_event,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY("PCM_2_EN",
+			    PCM2_INTF_CON, PCM2_EN_SFT, 0,
+			    mtk_pcm_en_event,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_INPUT("MD1_TO_AFE"),
+	SND_SOC_DAPM_INPUT("MD2_TO_AFE"),
+	SND_SOC_DAPM_OUTPUT("AFE_TO_MD1"),
+	SND_SOC_DAPM_OUTPUT("AFE_TO_MD2"),
+};
+
+static const struct snd_soc_dapm_route mtk_dai_pcm_routes[] = {
+	{"PCM 1 Playback", NULL, "PCM_1_PB_CH1"},
+	{"PCM 1 Playback", NULL, "PCM_1_PB_CH2"},
+	{"PCM 1 Playback", NULL, "PCM_1_PB_CH4"},
+	{"PCM 2 Playback", NULL, "PCM_2_PB_CH1"},
+	{"PCM 2 Playback", NULL, "PCM_2_PB_CH2"},
+	{"PCM 2 Playback", NULL, "PCM_2_PB_CH3"},
+	{"PCM 2 Playback", NULL, "PCM_2_PB_CH4"},
+	{"PCM 2 Playback", NULL, "PCM_2_PB_CH5"},
+
+	{"PCM 1 Playback", NULL, "PCM_1_EN"},
+	{"PCM 2 Playback", NULL, "PCM_2_EN"},
+	{"PCM 1 Capture", NULL, "PCM_1_EN"},
+	{"PCM 2 Capture", NULL, "PCM_2_EN"},
+
+	{"AFE_TO_MD1", NULL, "PCM 2 Playback"},
+	{"AFE_TO_MD2", NULL, "PCM 1 Playback"},
+	{"PCM 2 Capture", NULL, "MD1_TO_AFE"},
+	{"PCM 1 Capture", NULL, "MD2_TO_AFE"},
+
+	{"PCM_1_PB_CH1", "DL2_CH1", "DL2"},
+	{"PCM_1_PB_CH2", "DL2_CH2", "DL2"},
+	{"PCM_1_PB_CH4", "DL1_CH1", "DL1"},
+	{"PCM_2_PB_CH1", "DL2_CH1", "DL2"},
+	{"PCM_2_PB_CH2", "DL2_CH2", "DL2"},
+	{"PCM_2_PB_CH4", "DL1_CH1", "DL1"},
+
+	{"PCM_1_PB_CH1", "DL4_CH1", "DL4"},
+	{"PCM_1_PB_CH2", "DL4_CH2", "DL4"},
+	{"PCM_1_PB_CH4", "DL4_CH1", "DL4"},
+	{"PCM_2_PB_CH1", "DL4_CH1", "DL4"},
+	{"PCM_2_PB_CH2", "DL4_CH2", "DL4"},
+	{"PCM_2_PB_CH4", "DL4_CH1", "DL4"},
+	{"PCM_1_PB_CH4", "I2S0_CH1", "I2S0"},
+	{"PCM_2_PB_CH4", "I2S2_CH1", "I2S2"},
+	{"PCM_2_PB_CH5", "DL1_CH2", "DL1"},
+	{"PCM_2_PB_CH5", "DL4_CH2", "DL4"},
+	{"PCM_2_PB_CH5", "I2S0_CH2", "I2S0"},
+	{"PCM_2_PB_CH5", "I2S2_CH2", "I2S2"},
+};
+
+/* dai ops */
+static int mtk_dai_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int rate = params_rate(params);
+	unsigned int rate_reg = mt8192_rate_transform(afe->dev, rate, dai->id);
+	unsigned int pcm_con = 0;
+
+	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d, rate_reg %d, widget active p %d, c %d\n",
+		 __func__,
+		 dai->id,
+		 substream->stream,
+		 rate,
+		 rate_reg,
+		 dai->playback_widget->active,
+		 dai->capture_widget->active);
+
+	if (dai->playback_widget->active || dai->capture_widget->active)
+		return 0;
+
+	switch (dai->id) {
+	case MT8192_DAI_PCM_1:
+		pcm_con |= AUD_BCLK_OUT_INV_NO_INVERSE << PCM_BCLK_OUT_INV_SFT;
+		pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT << PCM_TX_LCH_RPT_SFT;
+		pcm_con |= AUD_VBT_16K_MODE_DISABLE << PCM_VBT_16K_MODE_SFT;
+		pcm_con |= AUD_EXT_MODEM_SELECT_INTERNAL << PCM_EXT_MODEM_SFT;
+		pcm_con |= 0 << PCM_SYNC_LENGTH_SFT;
+		pcm_con |= AUD_PCM_ONE_BCK_CYCLE_SYNC << PCM_SYNC_TYPE_SFT;
+		pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX << PCM_BT_MODE_SFT;
+		pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM_BYP_ASRC_SFT;
+		pcm_con |= AUD_PCM_CLOCK_SLAVE_MODE << PCM_SLAVE_SFT;
+		pcm_con |= rate_reg << PCM_MODE_SFT;
+		pcm_con |= AUD_PCM_FMT_PCM_MODE_B << PCM_FMT_SFT;
+
+		regmap_update_bits(afe->regmap, PCM_INTF_CON1,
+				   0xfffffffe, pcm_con);
+		break;
+	case MT8192_DAI_PCM_2:
+		pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT << PCM2_TX_LCH_RPT_SFT;
+		pcm_con |= AUD_VBT_16K_MODE_DISABLE << PCM2_VBT_16K_MODE_SFT;
+		pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX << PCM2_BT_MODE_SFT;
+		pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM2_AFIFO_SFT;
+		pcm_con |= AUD_PCM_WLEN_PCM_32_BCK_CYCLES << PCM2_WLEN_SFT;
+		pcm_con |= rate_reg << PCM2_MODE_SFT;
+		pcm_con |= AUD_PCM_FMT_PCM_MODE_B << PCM2_FMT_SFT;
+
+		regmap_update_bits(afe->regmap, PCM2_INTF_CON,
+				   0xfffffffe, pcm_con);
+		break;
+	default:
+		dev_warn(afe->dev, "%s(), id %d not support\n",
+			 __func__, dai->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
+	.hw_params = mtk_dai_pcm_hw_params,
+};
+
+/* dai driver */
+#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000 |\
+		       SNDRV_PCM_RATE_16000 |\
+		       SNDRV_PCM_RATE_32000 |\
+		       SNDRV_PCM_RATE_48000)
+
+#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_pcm_driver[] = {
+	{
+		.name = "PCM 1",
+		.id = MT8192_DAI_PCM_1,
+		.playback = {
+			.stream_name = "PCM 1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.capture = {
+			.stream_name = "PCM 1 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_dai_pcm_ops,
+		.symmetric_rates = 1,
+		.symmetric_samplebits = 1,
+	},
+	{
+		.name = "PCM 2",
+		.id = MT8192_DAI_PCM_2,
+		.playback = {
+			.stream_name = "PCM 2 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.capture = {
+			.stream_name = "PCM 2 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mtk_dai_pcm_ops,
+		.symmetric_rates = 1,
+		.symmetric_samplebits = 1,
+	},
+};
+
+int mt8192_dai_pcm_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dev_info(afe->dev, "%s()\n", __func__);
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_pcm_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_pcm_driver);
+
+	dai->dapm_widgets = mtk_dai_pcm_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_pcm_widgets);
+	dai->dapm_routes = mtk_dai_pcm_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_pcm_routes);
+	return 0;
+}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
