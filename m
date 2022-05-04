Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocJrMA9Y0jHLoshpUhF1QpJRJhdelcIaAJ7QueHuTHk=; b=H2cTEyfPEcwpVZ
	o3xN/Ja9RM0csvbZELwiOJt8yTpJMmFDJM9NiaqlTmH6oxwD5jowsd9kO3KdET7MmC4FZxV42TgNV
	OFy1ZvecV9NiD4DRBNdQ74ca4rsaB2jEMFR2tBFBDziEgu2gOCPPjZ90YTOGsh/cSi5PvMgD9q7e1
	vH17IDrwrqQNhaoCIOnqPlUf1WewEpfBCNPIBF4VNifYLbk6j6orNgr823pXEoSNLEyNK4J5NJs/6
	25uxsXFR7OMV7xbaVOk7D9D3Gh85DEWZEwj2ZWljR3gdLFGcWb5afFFkN7j7YXnvjDmN9Of+KjA+6
	ZnWEu048bJJxS8QhVPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXK-00BsAg-I3; Wed, 04 May 2022 17:11:38 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWj-00BrVR-AG
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:03 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqG001835;
 Wed, 4 May 2022 12:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rU32Z/hXECKhDQcQ6sjm5lHmQyR+7jITwp2uafnwgAU=;
 b=BMI0L7S1xaZOJXIwctCo/OdVwUS74imRBsMsmDUUwhnTMRj1IaQUmR2bftLvUy4A4RlE
 /9R/4aVoP9Z25JYvX/ObzWUKnrJHVpvGmLHU+H+vD2nyf54bTKQO+OiIEKunfuE0Eeh3
 KU+OHjSlkLah2jl2LYDLzO9fEhCW29L72yuG5VLX03QllQDi4ZJ8E1NlR1jVpGqJlE5/
 cE0V3H/IHTA+HWySHLemejYmR9CVlHnQFpXt1wghEUyiQH9N4dnAF8EcVz/krC1hDXsT
 9Znh/Bdq2weARk0X4KlDvxvxJSw6Zzp9toLqK42oeLtyzdm1QL9YeklliDjYMo4sO6Mm bQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9D0FA11D3;
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
Subject: [PATCH 25/38] ASoC: tscs454: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:52 +0100
Message-ID: <20220504170905.332415-26-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: aOKoMmFuYbM8eiPKSyWtXQB3wDo0zG_N
X-Proofpoint-GUID: aOKoMmFuYbM8eiPKSyWtXQB3wDo0zG_N
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101101_404810_FFE766ED 
X-CRM114-Status: GOOD (  18.11  )
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

A fixup is also required to use the width directly rather than relying
on the format in hw_params, now both little and big endian would be
supported. It is worth noting this changes the behaviour of S24_LE to
use a word length of 24 rather than 32. This would appear to be a
correction since the fact S24_LE is stored as 32 bits should not be
presented over the bus.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/tscs454.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index b34a8b5164848..38622bc247fc8 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3120,18 +3120,17 @@ static int set_aif_sample_format(struct snd_soc_component *component,
 	unsigned int width;
 	int ret;
 
-	switch (format) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (snd_pcm_format_width(format)) {
+	case 16:
 		width = FV_WL_16;
 		break;
-	case SNDRV_PCM_FORMAT_S20_3LE:
+	case 20:
 		width = FV_WL_20;
 		break;
-	case SNDRV_PCM_FORMAT_S24_3LE:
+	case 24:
 		width = FV_WL_24;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-	case SNDRV_PCM_FORMAT_S32_LE:
+	case 32:
 		width = FV_WL_32;
 		break;
 	default:
@@ -3326,6 +3325,7 @@ static const struct snd_soc_component_driver soc_component_dev_tscs454 = {
 	.num_dapm_routes = ARRAY_SIZE(tscs454_intercon),
 	.controls =	tscs454_snd_controls,
 	.num_controls = ARRAY_SIZE(tscs454_snd_controls),
+	.endianness = 1,
 };
 
 #define TSCS454_RATES SNDRV_PCM_RATE_8000_96000
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
