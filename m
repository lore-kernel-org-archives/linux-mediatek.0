Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F6DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCMIZMjzH19wWZnqAa6K2qXU2gTmwNxK3L8D+1hQ4bM=; b=dg1H/43li+zpm0
	ZW4vmM1crOwyr+b0ArUgkdVujMoTHGPxzNX9sUblzFEbZREGVva11CwZndhO81J9h0/POF9BYglPI
	dTtAema/zeTtNJb1a93FT94NBHLg2l2Hh5f0kIlbUgn4gZfEfao30FRYD1qVh+TkGD13cQm24JQx+
	E8rcZ7wrvI9HFSIQjw9K+lbboazQqgHVS6WfY02ZeX6DbEJglJo5FozRuCrq1Yks4NaCfuVgfEPQX
	kDzEe8Cl5aJbfB9h63B/LP+FXdY3HWTFvBBUvczBNNnA2Uw4AxfoMRBCdvQhPdrUKFrZNL+MPjFnO
	9tQzDWW6FXrBaDMnB3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIW8-00Bqof-FN; Wed, 04 May 2022 17:10:24 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIVz-00Bqcw-Uf
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:17 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq5001835;
 Wed, 4 May 2022 12:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lx5G1mLn6i5rf3kzgv7oaFpdS37F2TBK9vEnOcj3Ri4=;
 b=AtC0PFwolM0vIhbcbv8MClIuMWKge2JlkPTHRGqPfGPIORD5iK63kgJlUhY+5j3sERkn
 rwzI0WBShusWILXgOFSnXr9g+CvJCzyuJBZHajeBfcKE70VeRpxA7YMxr+vbdxBNUs+z
 8nZJ68wBvEX1fvzQy0SO/PLr2/u1hLwq+frdcilmvLCLrbEujOZsodpB1Z9E7FTSnbzx
 9LfjEC9sAWo8tfRfxC78edoluO0YeOS6BxOWJTdtJTXJPD5EWk1pGs0BFTWZFVasCsuB
 Ujw3mufvXQBICL0l9SdhMHVX4NjXBIAqUaDIlSx3Saed05OYTkIwvfgjVYSFOiNfX+Xw sA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7546A459;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
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
Subject: [PATCH 05/38] ASoC: cs42l51: Remove redundant big endian formats
Date: Wed, 4 May 2022 18:08:32 +0100
Message-ID: <20220504170905.332415-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: xOymHY1Tgse7kGH3XIUJK6-IPVnDksSg
X-Proofpoint-GUID: xOymHY1Tgse7kGH3XIUJK6-IPVnDksSg
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101016_053879_1C8E6FEF 
X-CRM114-Status: GOOD (  13.73  )
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

The CODEC already provides the endianness flag on its
snd_soc_component_driver structure, specifying it is ambivalent
to endian. The core will expand the formats to cover both
endian types, as such remove the redundant specification of both
endians.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l51.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index e9c3cb4e2bfcb..aff618513c753 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -51,11 +51,8 @@ struct cs42l51_private {
 	struct regmap *regmap;
 };
 
-#define CS42L51_FORMATS ( \
-		SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S16_BE  | \
-		SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE | \
-		SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE | \
-		SNDRV_PCM_FMTBIT_S24_LE  | SNDRV_PCM_FMTBIT_S24_BE)
+#define CS42L51_FORMATS (SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S18_3LE | \
+			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 static int cs42l51_get_chan_mix(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
