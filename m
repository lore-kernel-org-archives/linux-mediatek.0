Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0749AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5ZAC0W0kaU9agMyq8UfU2YQlYPNm7SXOBYxP3Cl9bU=; b=HhKkz3oG974lAz
	/eHeVIP63aYHdJRCTcYit5BdxSOy0o64xZ2kVPpwC3ROBmwmmjK/z6/4mjlgOJYlyjUyYvO+vkots
	d4FofW3tnq2SNEq5p9ai9Rmqmmeh2lEncd/ZMaiM7h91ce9DIzSuL6PYPBcNlBIrE5bl799ZeX3Cr
	mKuJSAIb1ZomLLvPIUJj9CDlyfOgts7cQOQSTxfpy+2xVEUueSVHPEVcwpTHUsXy6OECeHJwS0f7L
	R7hLSZTpWXAo/yj1fsvpYkknb1euSKoJ73kgm1BlZYogOTHvP1YiV/yDvCqW3ipbift4b/4+dMdHM
	1y2RithIfzknvxICttbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUMmr-00Bb8C-Mo; Wed, 16 Mar 2022 06:05:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUMmJ-00Bapa-EE; Wed, 16 Mar 2022 06:05:00 +0000
X-UUID: a0cd800502ae4fdf94b76bf025ed38a3-20220315
X-UUID: a0cd800502ae4fdf94b76bf025ed38a3-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 123327721; Tue, 15 Mar 2022 23:04:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 23:01:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 16 Mar 2022 14:01:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 14:01:46 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <yc.hung@mediatek.com>
Subject: [PATCH v2 3/5] ASoC: mediatek: mt8195: rename card controls
Date: Wed, 16 Mar 2022 14:01:37 +0800
Message-ID: <20220316060139.6211-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220316060139.6211-1-trevor.wu@mediatek.com>
References: <20220316060139.6211-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_230459_504869_4A383A59 
X-CRM114-Status: GOOD (  11.90  )
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

In order to be able to reuse the same configurations in user space,
rename the controls to generic names.

"Headphone Jack" -> "Headphone"
"Speakers" -> "Ext Spk"
"Left Speaker" -> "Left Spk"
"Right Speaker" -> "Right SPk"

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 544e99c83f3f..5ad6363e1bc9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -64,7 +64,7 @@ struct sof_conn_stream {
 #define SOF_DMA_UL5 "SOF_DMA_UL5"
 
 static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -73,14 +73,14 @@ static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
 };
 
 static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
 static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
 	/* headset */
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
 	{ "IN1P", NULL, "Headset Mic" },
 	/* SOF Uplink */
 	{SOF_DMA_UL4, NULL, "O034"},
@@ -95,30 +95,30 @@ static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
 };
 
 static const struct snd_soc_dapm_widget mt8195_dual_speaker_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Speaker", NULL),
-	SND_SOC_DAPM_SPK("Right Speaker", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static const struct snd_kcontrol_new mt8195_dual_speaker_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Left Speaker"),
-	SOC_DAPM_PIN_SWITCH("Right Speaker"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
 static const struct snd_soc_dapm_widget mt8195_speaker_widgets[] = {
-	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_SPK("Ext Spk", NULL),
 };
 
 static const struct snd_kcontrol_new mt8195_speaker_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Ext Spk"),
 };
 
 static const struct snd_soc_dapm_route mt8195_rt1011_routes[] = {
-	{ "Left Speaker", NULL, "Left SPO" },
-	{ "Right Speaker", NULL, "Right SPO" },
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
 };
 
 static const struct snd_soc_dapm_route mt8195_rt1019_routes[] = {
-	{ "Speakers", NULL, "Speaker" },
+	{ "Ext Spk", NULL, "Speaker" },
 };
 
 #define CKSYS_AUD_TOP_CFG 0x032c
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
