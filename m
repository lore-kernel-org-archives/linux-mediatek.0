Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5Veop+/YF1z+yaHDiFcKlSdXHRrFqZ4aWaeUj/C78Y=; b=xaP15uqC76vq/5
	TLTtaKlSnm0JhaFFDbEyqlvbymLeigj/yKVWVoFn+dpbrK4EZjaHqJA03/jKYDsCUZG+Qye8jwAI4
	JuK2fBbOHjXz9QtuqBfh2wrFarPK0zC2y8U4obBRfZY/NdEcVDB8TmHjv+YU75rG7CxYjlXtb17PZ
	omXYm8VvwgViU+ZHfqsmiHz96sOiUExaGYm4M4Ftsp+pNYbU7d/T2y12/n/42PkhENh4pPF4lkpMe
	+7tL2zeovDv6CP1YCXSJnJwShFkaPhH7Mo1VjW6Q3KqAv5DJUoz2S+4A/+Wso+CoQCjMRe7VBt7hO
	EupiJ8oM+4Bh5dOCpqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIW2-00Bqia-7E; Wed, 04 May 2022 17:10:18 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIVy-00Bqd9-MN
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:16 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAB021058;
 Wed, 4 May 2022 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Tg3ds2TsknzqApvf4WTVYt2bZeBwzFfFkRiUrSL6gJY=;
 b=gkcygmgKiaaugO3nX46koxSzpc1GfZfzjO4Uy0V0UOZI6om5iIH2ibpyVAjsqpsJhZVf
 hpjRE1r+hyPp++a6JlLQJIP/h8VdQInc4Q+r+SzHEdyvWCQaS1petQCgRYUtPfttCiaO
 +XUnWhA2zBgB/j08n5w/kzSKuyBcwg21BTfxgayaJADTzCuFHiSiDAtx3tfdhnStEyWi
 cEImWYMBHCSMF3jB/ugVt2FGQDc91EkkQLDJ9rkdlAK0P7YWzsyO5kHCMi122DhzWHj4
 GAskZ6B9zsox6+hkOzqX3drF8kM8aX4pyz+UuT/KHORSYkLqWtCci8h4ujOCGO3RXygo sw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4193B11D1;
 Wed,  4 May 2022 17:09:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <codrin.ciubotariu@microchip.com>,
 <lars@metafoo.de>, <cychiang@chromium.org>, <tzungbi@google.com>,
 <bleung@chromium.org>, <matthias.bgg@gmail.com>,
 <kmarinushkin@birdec.com>, <oder_chiou@realtek.com>,
 <steven.eckhoff.opensource@gmail.com>,
 <srinivas.kandagatla@linaro.org>, <alexandre.belloni@bootlin.com>,
 <kuninori.morimoto.gx@renesas.com>, <jiaxin.yu@mediatek.com>,
 <alsa-devel@alsa-project.org>, <chrome-platform@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 18/38] ASoC: mt6358: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:45 +0100
Message-ID: <20220504170905.332415-19-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: cGxqjj-C8ZGiXM-W6QfdBw16FB5aeu7Y
X-Proofpoint-GUID: cGxqjj-C8ZGiXM-W6QfdBw16FB5aeu7Y
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101014_899211_4D3B50FE 
X-CRM114-Status: GOOD (  16.52  )
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

As the core will now expand the formats to cover both endian types,
remove the redundant manual specification of both.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/mt6358.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 4c7b5d940799b..60b209efe52d1 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -2340,12 +2340,9 @@ static const struct snd_soc_dai_ops mt6358_codec_dai_ops = {
 	.hw_params = mt6358_codec_dai_hw_params,
 };
 
-#define MT6358_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
-			SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |\
-			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
-			SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |\
-			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
-			SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE)
+#define MT6358_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_U16_LE |\
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE |\
+			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
 static struct snd_soc_dai_driver mt6358_dai_driver[] = {
 	{
@@ -2433,6 +2430,7 @@ static const struct snd_soc_component_driver mt6358_soc_component_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(mt6358_dapm_widgets),
 	.dapm_routes = mt6358_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt6358_dapm_routes),
+	.endianness = 1,
 };
 
 static void mt6358_parse_dt(struct mt6358_priv *priv)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
