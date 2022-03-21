Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA92C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6JRn7FCtqnAY/5k5jsTqDqdCiUjqCIgY/aaXyO/rcY=; b=SB4yJShkb8l06t
	4BGCpyORcT2a7pVzV0CfD7N1Akf/SCrnBMnu8Ge5DVZjSDUlXvf2Q3XN7MMVE+627JcrTIAWbKfLG
	S//pdDMHfHN1COoqhonLXNKJrLZjs46yhKCdA/eqPXUoQseX5gbXFosJunqDv89e1ReSBuFDIDHoR
	hM6OQpM/VLubz1Oz1S2khyMKvO2pgkWuGLkZvjuT8qPuBidTrAlgstxDywqTXB1/dL2ywRto/t2jI
	Mj84S5ppA+dYePdOXXNwAk84lJm3hZzf6+buMgI+fale136aJIDfBMrj3/XdYUwFBER7zH8/fWiIO
	H9+JYxCzGCaaJ/yIC6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWCTQ-006prd-UU; Mon, 21 Mar 2022 07:29:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWCSk-006pfJ-GF; Mon, 21 Mar 2022 07:28:25 +0000
X-UUID: 3f646cffc3ca4fb8bf345b87ba57376c-20220321
X-UUID: 3f646cffc3ca4fb8bf345b87ba57376c-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 378918962; Mon, 21 Mar 2022 00:28:20 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 00:23:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Mar 2022 15:23:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Mar 2022 15:23:15 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <angelogioacchino.delregno@collabora.com>,
 <tzungbi@google.com>, <yc.hung@mediatek.com>
Subject: [PATCH v3 4/6] ASoC: mediatek: mt8195: rename card controls
Date: Mon, 21 Mar 2022 15:23:10 +0800
Message-ID: <20220321072312.14972-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220321072312.14972-1-trevor.wu@mediatek.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_002822_557271_279F8E0F 
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
index 0291b3bec84d..60279eee22c8 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -64,7 +64,7 @@ struct mt8195_mt6359_priv {
 };
 
 static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -74,8 +74,8 @@ static const struct snd_soc_dapm_widget mt8195_mt6359_widgets[] = {
 
 static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
 	/* headset */
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },
 	{ "IN1P", NULL, "Headset Mic" },
 	/* SOF Uplink */
 	{SOF_DMA_UL4, NULL, "O034"},
@@ -90,35 +90,35 @@ static const struct snd_soc_dapm_route mt8195_mt6359_routes[] = {
 };
 
 static const struct snd_kcontrol_new mt8195_mt6359_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
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
