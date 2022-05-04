Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB58FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tJTrhK+jOB6Fx3DEcxhliIMvSb7vqU7owVH8N55NLw=; b=ZlEEVJjTy5Ujhm
	J99zhw+9MGmcC1X8M3zF9IHg0ooBSgRtvW7fdM8EG+Vn259/ja3mePLVokZ0DdkMw+Fb0l/mNmvcx
	qOEQ8TqRxGHVBnqFRzPpVWR89b1Tv9WzwXNelcGjhVz7SV57usgXXLCBLkk9Ds9awIGqZ4l/AieT7
	80Ht7pEq/BrMMAjO157ZePPqOAURU7rz8Rdu5O6mzKNWtPlbKGSSg11L6tWyG/urSQlXjmuxCjXO7
	Z6Z/mf2batCuWEUD1a1ZxR3dd8gpkjNVrjQEiDlIEdhoLY8VnD57JhCqWhLD/c1R/R15tst5PrwIf
	lr3qy5f1KibjdB+O/a7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIW6-00Bqmj-23; Wed, 04 May 2022 17:10:22 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIVz-00Bqcz-Ue
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:18 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqF001835;
 Wed, 4 May 2022 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=N70CgzfPRFiDL3i/BgnSWsROeIsYdnqRncPM8jMsPxI=;
 b=FEdicFysSh+imBwM3TBkOycRhOWBNda7lKROVcfYUlMEiaMf07uxSuLpJljhJzi+jOoU
 xG3QfkZJjP8l/7hChEsIRNza3kZtc6dZvylWpd7/gM0hENHd9TZgulCRiB8WxBVRGhHB
 ARgRbnzbGFVFDIeHm2RI6ZjLPsUgFo4jdtOpjmB2RJXe3Zu7kn3nSzIg/XkHZkdCwqwv
 ljWQhENoeexVobzlvGUd2W9D9wki0I/oMw2j7VsbGxIapXrK8SlSN7TEzFTqdLUr0KEU
 awjd9zTPrcBcT5AgwUDZFAA8ieLb6AnVHrc1hWjxBpKxMAXU34uuus7lSA9Pm+VB5eJn 1Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A4BB511D4;
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
Subject: [PATCH 26/38] ASoC: cros_ec_codec: Add endianness flag in
 i2s_rx_component_driver
Date: Wed, 4 May 2022 18:08:53 +0100
Message-ID: <20220504170905.332415-27-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: uagaiIz6ub4aNnKz_RIkJXGGBhHmjZbu
X-Proofpoint-GUID: uagaiIz6ub4aNnKz_RIkJXGGBhHmjZbu
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101016_060969_88552CF2 
X-CRM114-Status: GOOD (  16.30  )
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
link. The i2s_rx component receives audio over an I2S DAI and as such
should have endianness applied.

A fixup is also required to use the width directly rather than relying
on the format in hw_params, now both little and big endian would be
supported.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cros_ec_codec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 9b92e1a0d1a3a..8b0a9c788a264 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -232,11 +232,11 @@ static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 	if (params_rate(params) != 48000)
 		return -EINVAL;
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (params_width(params)) {
+	case 16:
 		depth = EC_CODEC_I2S_RX_SAMPLE_DEPTH_16;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case 24:
 		depth = EC_CODEC_I2S_RX_SAMPLE_DEPTH_24;
 		break;
 	default:
@@ -387,6 +387,7 @@ static const struct snd_soc_component_driver i2s_rx_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(i2s_rx_dapm_widgets),
 	.dapm_routes		= i2s_rx_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(i2s_rx_dapm_routes),
+	.endianness		= 1,
 };
 
 static void *wov_map_shm(struct cros_ec_codec_priv *priv,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
