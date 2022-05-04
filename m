Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0180FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iR0VAN8j0348bozhxwVRWLrrfJnKn8gdelpK0rky/RY=; b=1RGGInDSxJ86o9
	HHHTEuIB2zsIcxFCfntO8XxZFueQ5SfrWD4LqvArsQIPMkR14GbPjUV3rGzwn4BVdN0zN6gVRmaSJ
	efXsbo4xzAkTogoHBS8sSrz91ohnTtxpzorkmSdA0HWRFnH0kjqMKfVF8uIJ+9bhXuHxCvSrci3Fy
	0fNqRYVFLdmWKrOaMx6aCxChnMjBTzW4D0qXYkvoKIhJ30IVZ0lrD42OorDufBpmoeL6kfj1ovoAn
	65X2SmcEvo8eYXT6Di/Lx/OvASytZ2sYCrFdgtER5D0sGA/AMedElmk1F05KIFCjS41OKhbwYZ8MG
	NqvEFGmLqdoQZNFTtzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWI-00Br03-Pd; Wed, 04 May 2022 17:10:34 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIW1-00Bqgi-K4
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:20 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAC021058;
 Wed, 4 May 2022 12:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EQBSsrCK9FmninMk7VLEQxuA9XpRsxALxOeewRZQoao=;
 b=b1he2BCMq3FrQjZKSafgv/Cet68iZiUXQW6JRiIJhhcT+gXdaYGFoH5mmlNOpoBX4/w7
 C4GjhltbmMDNBh9AyA4uNAidf8TQsuNP8BD9734eRc57ZKMbyinlhNYzFONOmsFpMyMP
 nMz/gKqYSaX8LY07dYUukpc26thBKd9Fi0ErBGk/If1B0/pA7BiJReVAiBTI2Y5FtxDp
 xaE1okeqgYjtR+EVuXkpmWuN+7GJxfmDjCZGqDtiO0Z5xvxMcfe7VimW+E3H7S2wIwqg
 8BSaBVwu30cXGp05rMSgPiZ+TiBFQqDV3yJRJtkD4SWnptkXgZAclL8KBc4Rt6GkIcEf /w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 49873459;
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
Subject: [PATCH 19/38] ASoC: mt6359: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:46 +0100
Message-ID: <20220504170905.332415-20-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: TEWLsLzxhXQI-4fyguL2DG0N1DDYdZav
X-Proofpoint-GUID: TEWLsLzxhXQI-4fyguL2DG0N1DDYdZav
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101017_851180_6903DFB7 
X-CRM114-Status: GOOD (  16.72  )
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
 sound/soc/codecs/mt6359.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index f8532aa7e4aa0..23709b180409c 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2576,12 +2576,9 @@ static const struct snd_soc_dai_ops mt6359_codec_dai_ops = {
 	.shutdown = mt6359_codec_dai_shutdown,
 };
 
-#define MT6359_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
-			SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |\
-			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
-			SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |\
-			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
-			SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE)
+#define MT6359_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_U16_LE |\
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE |\
+			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
 static struct snd_soc_dai_driver mt6359_dai_driver[] = {
 	{
@@ -2739,6 +2736,7 @@ static const struct snd_soc_component_driver mt6359_soc_component_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(mt6359_dapm_widgets),
 	.dapm_routes = mt6359_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt6359_dapm_routes),
+	.endianness = 1,
 };
 
 static int mt6359_parse_dt(struct mt6359_priv *priv)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
