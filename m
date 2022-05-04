Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBFDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSgjlHw6dqIWxH3dzORZvfyojenxdjsZytHFkui5EaM=; b=2mduQxOFrO2iop
	CrsWbCkGAXOXziscwRGoyz/hy1H4T3q8yLi7KWIHC7Q6arhQ4xE25p6Ah91Hxoz4YIeSwDGC1Ula4
	4TkBSPsvVI3yYRBeunlk5xkqvQhxGtBhMFoosGMx/yALxU4kNXmLTnoijs2Yqt2JBb911OYxgnUTK
	bw2iaEqrjcdOwlnGkxnclfFR6gMXr9TLK9j2PX/hAbEmnzDyQMZFJiZWA/cTExd7DS02I0GwZyM5z
	g/80dQWL6JkhRTyD1TRjX1tH/64dVHyfJNLRkiZrdzgJQImxiW++ay8j0Dx43FWNoycyF/NZXYhA7
	LPMR8fy2l5azWt/RTs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXQ-00BsH1-FY; Wed, 04 May 2022 17:11:44 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWq-00Brds-CQ
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:09 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqL001835;
 Wed, 4 May 2022 12:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JqSf8VsPjntcp5+sVo9w9XAP7mcs6Ljk8Rzl1377l6Y=;
 b=GRQzIO3FQbqPnzi/Sl6F8ofmjSVwCQtzikrUVdE4BaAhXpZi6ktFjeO+CXXz8a55M8Tq
 a8YaPGXFkMh8ifa12sLEZ4GLPhvBkXbH4X4emCH3OuXSSqUtnG6d/Rpx/9YpuOOEHvKv
 sYVTkmUyVGyH0Es+JE6wW0vm9F4DU0pl9ovBIVCq7iwEbNvCw8zz1RcTji8BOTiL4ex2
 5YSJzypSGU4nwN+TTvfsZ2TX1/u0Wzh19QyfPRzgwFXjB3XNie/tB9BMYxuIsOZa13iT
 l3HZcmXO6NM/MPBpZXF6fbJovQOmg0iY0J+BTURf9ufA0brRVAxLUhjZTgv90Zyqu6vN Qw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-19
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1E5E511D3;
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
Subject: [PATCH 33/38] ASoC: rt715-sdca: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:00 +0100
Message-ID: <20220504170905.332415-34-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: mznjTn6v-52Iw12vAStACPKiCs_uuPOz
X-Proofpoint-GUID: mznjTn6v-52Iw12vAStACPKiCs_uuPOz
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101108_455382_FF7DDF85 
X-CRM114-Status: GOOD (  14.31  )
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
 sound/soc/codecs/rt715-sdca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index bfa536bd71960..5857d08663073 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -765,6 +765,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rt715_sdca = {
 	.num_dapm_widgets = ARRAY_SIZE(rt715_sdca_dapm_widgets),
 	.dapm_routes = rt715_sdca_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(rt715_sdca_audio_map),
+	.endianness = 1,
 };
 
 static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
