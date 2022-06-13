Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FCC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owSFO4TWSlf0bPeftmBF8nsrtNH9qDyIaUn6r1h6G+Y=; b=0OdDzBznKhReI1
	SbuGMz1fHfbIxgxWKV1nTAOwYM4okWoG5a9ykYPhVdoY4Vr/za/a6e3M0fNtPrWy6HfBwUMIF3PBQ
	T4sHXqgOYPivFkeHojE8e0MNL2gBvxj9Y6SFq7TGhuTJqLbM4a6x+X0oemPyAiZ+LbX01Ss2TScgN
	KJXLCWTlqb76yDnI41D4nkXXrm+Mq1yx+VgHV9C6IuqhswtGSb0gLBH5eObrO3IzNrtvJzDkSghig
	5+jh403Acws5fYBI4h6T8GncZn6WS+JdVEjmkmFJuqvICnICesyrRUfW8eLOlH5jlLXlG2UBwn6qL
	rry7yBMsI0/e+pb1XM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0mja-004g67-Mw; Mon, 13 Jun 2022 16:16:10 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0mjV-004g30-J7
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 16:16:09 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DBuxUh006945;
	Mon, 13 Jun 2022 11:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oaA7oUhxhYUv3GT9ya+N4kfY6bFaVDi56FfyAbH3CmY=;
 b=TGsnFcqGzzZtTnHDKYCMYRBijkKHSpjBSY5vb/RMpXj1vXoOgQTYsDCIiWVcGO3OsD2l
 eWo15uyZNjCYVraF6AgYar1i6YQWduzXtVE5qop3cegmdixRsNkNPiElDP7h2sEpooXr
 VeSbIyOBa+HEs/ZjE+pmWx7XxpvN6O0reA7lRJdSRsN6tYY2hiQDxfkTgkwwhBuMQby+
 tcHdz5pS7H53eaA234Mrfy/IjGJV0s+3pOFWhb7xPppyvZPbNo5+QTvJYpRewuLNPx11
 ugAw56x4rlr9cZ43MhqHXyKATg9j/ffLvNXtqi4AITGLMeHjI/23DWpjwelr15RvhVUd jQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq24mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Jun 2022 11:15:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 17:15:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 13 Jun 2022 17:15:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D5098458;
	Mon, 13 Jun 2022 16:15:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <samuel@sholland.org>
CC: <matthias.bgg@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <linux-mediatek@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: mediatek: mt8186: Use new direct clock defines
Date: Mon, 13 Jun 2022 17:15:52 +0100
Message-ID: <20220613161552.481337-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: l8ShZbS2HEhRTIrTc26Mw8OO2G2WDCou
X-Proofpoint-GUID: l8ShZbS2HEhRTIrTc26Mw8OO2G2WDCou
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_091605_830387_06EC11C7 
X-CRM114-Status: GOOD (  17.41  )
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

Update this driver to the new direct clock producer/consumer defines. It
appears this driver was added with the inversion taken account of but
still uses the CODEC defines so no inversion of the producer/consumer
is necessary.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Note this patch is completely untested, I don't have hardware and the
mt8186 doesn't seem to be included in any makefiles at the moment so I
can't build test either. But the change is trivial and I am pretty
confident I have read the code correctly. It would be good if someone
from Mediatek could have a quick look over though.

Thanks,
Charles

 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
index dfff209b60da4..c6ead7c252f01 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
@@ -585,10 +585,10 @@ static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
 		tdm_priv->slave_mode = false;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
 		tdm_priv->slave_mode = true;
 		break;
 	default:
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
