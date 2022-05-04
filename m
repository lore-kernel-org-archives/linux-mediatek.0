Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D937DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phQvhCxyiln1xEU+jRQ3yIIh8Ftqd/rDms5IXN/SihM=; b=YsP0Akq6tSQMnY
	iC/Ok807gFJNjE2hBZJ6zmpInd2rE4wO5yJ6EwLi/lEVpoTUXZfb6zwm8TdcLf0KLfAxLwBYQUZMZ
	owDW2IktXDBe6pquI/ExmPPCMzwhYpIuLM2i1a1qVB/8WUNQISU/emAZZG/D4XkY1l0n/lUXyi5xr
	jDJdaI6GzQTFLcVsp7UHnycTwHDdIDNEQwWsvA0yP+1Ue/5Qlh4bOt0eGYUc6JgllNsZam6hnzlSl
	BfZo9wK4j+NzBwaaR43FLdMccnyUV4EnCnF5JXrrKi2dCCW7AqbsXFexA2pBOHhTEONg3fCnUzY5i
	WhnXgCxaUM+gYiNlMECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIVu-00Bqat-Kw; Wed, 04 May 2022 17:10:10 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIVq-00BqZA-Ud
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:09 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsA6021058;
 Wed, 4 May 2022 12:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=aHuAs7oRxlJMwXOjtOQP0ODpEqYrjsUdsI3GYEO1ULc=;
 b=FBeMlMDcfF5AWSiYipicipZwf8E38hmW4s3aDTKD3TV5wbUs8sGh+bnsxR4f5INmoXG1
 I4szRpELwLwz0+20CFV53BDmKefIvSqA+qJo7kM7MGn46OGoFKoIyfMUcxixb7lIyNth
 NRPjrCBPxSw/fB2EcuWO5XU5v+cvPQHHVbfoEOyFUi3gzUszQdKH2aJfJYyjqvAtgaBu
 G5gTtSwjYyz05IO2/Yr9KlDGpMwJoSQP/sPJMKrBWKgsJ26UHS4Zx7CUdNUf3qOKlXnD
 Paym3csNPeleK4NvhXZLsCfMS2v7yE3EwU8ZbOICaL6tiVNK5CwsYV6HETZUnd1bZnxA YQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C56F11D4;
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
Subject: [PATCH 03/38] ASoC: atmel-classd: Remove endianness flag on class d
 component
Date: Wed, 4 May 2022 18:08:30 +0100
Message-ID: <20220504170905.332415-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: tRkVGZGIIvORsxqS9rWGe7_yh7viKreT
X-Proofpoint-GUID: tRkVGZGIIvORsxqS9rWGe7_yh7viKreT
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101007_159504_26976661 
X-CRM114-Status: GOOD (  17.09  )
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

The endianness flag should have been removed when the driver was
ported across from having both a CODEC and CPU side component, to
just having a CPU component and using the dummy for the CODEC. The
endianness flag is used to indicate that the device is completely
ambivalent to the endianness of the data, typically due to the
endianness being lost over the hardware link (ie. the link defines
bit ordering). It's usage didn't have any effect when the driver
had both a CPU and CODEC component, since the union of those equals
the CPU side settings, but now causes the driver to falsely report
it supports big endian. Correct this by removing the flag.

Fixes: 1dfdbe73ccf9 ("ASoC: atmel-classd: remove codec component")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/atmel/atmel-classd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index a9f9f449c48c2..74b7b2611aa70 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -458,7 +458,6 @@ static const struct snd_soc_component_driver atmel_classd_cpu_dai_component = {
 	.num_controls		= ARRAY_SIZE(atmel_classd_snd_controls),
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-	.endianness		= 1,
 };
 
 /* ASoC sound card */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
