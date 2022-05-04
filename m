Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E69DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82Mtl6HRsn1+LB6utUq2WF8H9Kk1vORsLqt/smIWvF8=; b=0kR4QYDcddjvbg
	4Zs3FTfbFqZGhVUfBlxPkknA37j1Ku7XmIriUX+3D70Ep4/xz1MavxydTw8veWxg7qOhWRLJo1SMV
	4FvbCww+AhQbAuujHD8VJeMvelJErJ1m0xJHvteuie1YyQ3nZXRn8c0VVtcIEut74TW4AYDusj+ze
	6fX7hnmAADKkn/N0FuekODOOAF5piSAbDFjCPBStsIDiyMzg4sMC9C0QnWmCWwCiJOAQqAw/wwwjI
	gfSXRpoq4Jn7mzkMPdfnQOa8RDdQKe6s5qLOmRYrEynwmRlNwGsPllJiIsXmC6iNrGfRVTnce8wqT
	dzF81MfrPVYV0mVKCvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWO-00Br54-1i; Wed, 04 May 2022 17:10:40 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIW3-00Bqjr-Fh
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:21 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqA001835;
 Wed, 4 May 2022 12:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VFo8adY/EVpBB1c192su7l3O3wRUxdtXdARZJ7Jzf5M=;
 b=Gs6ESePvbKigjGYu1CEs2Y70PNeZ6jdAz3MAzP73FmKCjruf47CEGR8huvbnG+AKzCpU
 r8/9y0sjVskraEmWbQHzlsZUI4w97cDg0BChd8MsVIBcmdwLdSbLBurvLvF3DRyfum0n
 EuzbjsE8M7KTNjuXywiGkwmEm2EgfZLZ9qVj8O5mkW6hhidHBEXvL5Xg1rUFXGCckny6
 Uz2W4ol6DkBd0MBZirBY83bstG/PQ5ntRd4ibccasv/7ocbjvgEKAxCAJuDp+cw6+1su
 fqO+qzn/8IilRvrbdosLyaEHqCGD8p4qakOC07WDpoTRrp6ItYWR4Ifg9WqY2jQE3UB6 9g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EA87BB10;
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
Subject: [PATCH 13/38] ASoC: cs4234: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:40 +0100
Message-ID: <20220504170905.332415-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: XiaiGSmHMQ3tJ9-n7cIi8vKiqTSjPJ8H
X-Proofpoint-GUID: XiaiGSmHMQ3tJ9-n7cIi8vKiqTSjPJ8H
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101019_614028_215EAB99 
X-CRM114-Status: GOOD (  14.23  )
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

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs4234.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index b44939166e5d8..881c5ba70c0ed 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -663,6 +663,7 @@ static const struct snd_soc_component_driver soc_component_cs4234 = {
 	.non_legacy_dai_naming	= 1,
 	.idle_bias_on		= 1,
 	.suspend_bias_off	= 1,
+	.endianness		= 1,
 };
 
 static const struct regmap_config cs4234_regmap = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
