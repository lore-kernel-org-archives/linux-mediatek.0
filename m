Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707D7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8ar/rvXv0+AJ/6u16hIPRsOXKSBWAG/YcqxvGvr4g4=; b=CEbCHnxzC5Kjyt
	Y+fvxmtc9X7xemUSu28Grjq3KQ3dQTxMntf8oX/+PHt+kAwUREmUsp3PvJms4AIP5ys2k4ZBvj6HN
	y195ZyvpMG44AY9qDUHcBTzJZJSIxqZ9sV5CJ4nzgmNgAlqRR8Ao6MVq9w3UONE0Vzw09ZJMsw+hI
	OYLOek1OIxJAVo4rbbiy+oAZEsUnhwxKiJoVDrjnaYauAI/SM8kHuOr6OEGl8CJhgnt9kTteI38xK
	sOuruZ0XG7M6xO2GVJ32b9tadbxlaaGI6EaFnZF2J8at+/PlVT07iN0os0IDj10RYInK5RVtbvshj
	zZejphuD7Vi0IsjAXR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIX4-00Brt4-5R; Wed, 04 May 2022 17:11:22 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWj-00BrVS-GJ
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:04 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAJ021058;
 Wed, 4 May 2022 12:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oLEq5qNIGN+q85PvBZt+NNw5QE4l8BPWSpJt4RjGFE4=;
 b=ZX0NSyzn7LFkt+mMCxt5Vo+kHHHWx7ZzlvC15yCgZVNTGNaHwj5mefrFpQZIqudh83XW
 +Qy8s7NguQkWmu2f3HXIMK7dQr/gE2m/ah06QwjTnnCfX85Y7njNCi4gk3WYTCqKu/ED
 NSE+apwMXtIfigBipTex1DXqZ6bhf5wr4iad7fZRDbU9s3/9dlQ1bamUhJSliy/di7j9
 ccT/n00BjXOBN3Mw1tHruvompDYYfBo8srVxKsCTQ0p473IMXwTMj70E8GvKuyyLHU2q
 tHfrvSgxcL5JyrbcxpxYgrLvvXTCD3X382wfNXQXby40L7ulF6oMyVyvDrVeFw0Tjpqt FA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CFD011DA;
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
Subject: [PATCH 32/38] ASoC: rt715: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:59 +0100
Message-ID: <20220504170905.332415-33-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: NrWaXMa3qsWsQxUxDE8f5nd2AIXTTMeM
X-Proofpoint-GUID: NrWaXMa3qsWsQxUxDE8f5nd2AIXTTMeM
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101101_725283_598B6545 
X-CRM114-Status: GOOD (  13.83  )
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
 sound/soc/codecs/rt715.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index a64d11a747513..418e006b19ef5 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -745,6 +745,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rt715 = {
 	.num_dapm_widgets = ARRAY_SIZE(rt715_dapm_widgets),
 	.dapm_routes = rt715_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(rt715_audio_map),
+	.endianness = 1,
 };
 
 static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
