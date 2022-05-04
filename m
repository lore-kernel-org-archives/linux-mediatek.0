Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD03C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiHimY9Urnfyqf4CqXA1gGuOJedPHdwn6ucoXBbRpTc=; b=jflLgh5Ug7mOtx
	l26llXBfniODU4jYjlGrmtwJBK32wbcocsKQHhwFtU73SG+KMDqh3OrvsdDP1T8m/7Ejq7PFfgj41
	Dr+rGUHB9PNptCxFyeMVSIIcLRj+LyIsjkO/Pdqyn2XtAMTZZG0KKz8EKOU6jJx4iD3HXKCSR6TFC
	m4NuFFSv+Bu+WWDGAVjarAeWr7n3VkIGGNRD0T0AOb0sOJdYq3u2oa3pSqn2tW0WEWCgZutvjpflg
	zE2bxQdwDc56laSS4nFN3Jv3YHMHxU3UtNsQ3FF7tGoFAVvPGaNzH9u3RMOo4xdQCSSBSGWv6p2ek
	7dEjZ8kLQPqmua0Tvfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXO-00BsEV-5x; Wed, 04 May 2022 17:11:42 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWp-00BrcZ-7F
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:08 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446OEr8006119;
 Wed, 4 May 2022 12:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mAHKad8X+1+L4FC+yaN/mYzlx80mBwQkn26ftLkKwPE=;
 b=X8jrjSd8qDgdkoWGVwQCT6Ah7Kc5/k/ZgCbUwNhxo8kzkUzUVQCQyNLgWpp7udO/STBE
 +CfIbng8vxrgFp8IY2aHhp5x7sDIiXPDWYpKvA7p92RQIF+jWZQgwZKVO1D4ke5Sihgx
 x7R/m0lIwf7fVwDMusA31+HtocCiBgyx94GbEiein69AN0z72KQbR0fkEMcdlu2oB4l1
 Zv5GXObM08RSJ3/Ei+D50qITsEpEG5N+LyxTNq72ZcCkifQ4RiGm3k6o7FlK3sEdfBZr
 n1TV16aLa55gr1wpdZeCENNeq+kfUIM2NRgjamR7deUDBkiZwCK1uguU+dm/v6Vqp33w 9g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxsh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 50B8411D3;
 Wed,  4 May 2022 17:09:07 +0000 (UTC)
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
Subject: [PATCH 36/38] ASoC: wcd938x: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:03 +0100
Message-ID: <20220504170905.332415-37-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: b4aRipyfjEXIKCAMHxPK_lr3uRnyMKYm
X-Proofpoint-GUID: b4aRipyfjEXIKCAMHxPK_lr3uRnyMKYm
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101107_449150_62FCF36C 
X-CRM114-Status: GOOD (  14.32  )
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
link. This device receives audio over a SoundWire DAI and as such
should have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wcd938x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 898b2887fa637..c1b61b997f696 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4168,6 +4168,7 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
 	.dapm_routes = wcd938x_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wcd938x_audio_map),
 	.set_jack = wcd938x_codec_set_jack,
+	.endianness = 1,
 };
 
 static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
