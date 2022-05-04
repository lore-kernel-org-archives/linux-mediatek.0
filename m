Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gh+L/KWLC4q6nKW01RK7hCbZHnzJ0XE95UXbwJnfdc=; b=gA8+ZjFyQnrSSh
	rU638kx2OXmu59OvgQIg8XVncBDcgFgt5mAdnf1D7QWxze8wkDRm12CiQxVa2ajSU/FvL+XmKs9hg
	Xp7lFCXM/JRmqDHS/T6/R1QBGumthNq46ALSMyBmmK/lLdAJH+AQZ6fMfMxktn9U1s5GddN7+dAad
	xGmhgEi3mnVB4dS9l3Ehaj9CP4ODPusQ4Y13vxpWfa33FozbeYXueNopPw48NYLhYkoUN/LK1lxHO
	CdJXnJwgG8YeOa8JjvgZ47MIaiUg1mwxu+NWNv4Y7lpHyqCJJ3Dfka8YsaR+4TSLgBk0Aet4708F+
	y6zdVVc2JyuLuTsR5iFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXH-00Bs7K-MO; Wed, 04 May 2022 17:11:35 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWj-00BrVW-EC
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:03 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446OEr7006119;
 Wed, 4 May 2022 12:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Q1qnkI6ceLryS3eun8ThE4m+M79PwQNlKTl9uJLd2Ac=;
 b=rGw6adPGe1H1PmprcepppJMP3rUta5zDdXexfIIG9wWJvj8AbxGdFlQ99zbHfF18fo5+
 bevRmgskuJZ6jyXQlI0CrxrFekQevFKdD1TsCXkuNu+8FLgPAHr50IZB1bmZkKciNgD0
 +jMAislesd0AYxMve7672xfZKNpaAQ412vO/cdo03owUX+oysMZRiT/ZPZlMrDKFv6Sx
 cT3KvtUrrfPYMAzsGJWUzhXrDNcswXkoouNVX9/4en6aBOUvLlK1xTV7bCd2yLT8FKHp
 ezmr7uiLlqb2G4QcnUOCstiO3SRKnCITvIpezpygvf58neWezbN/h0cmNvbOp/1drA24 CQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4007611DA;
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
Subject: [PATCH 35/38] ASoC: rt1316-sdw: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:02 +0100
Message-ID: <20220504170905.332415-36-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: JWytEEIa-LF_Lvgfks0hCBxxwsfj7dPY
X-Proofpoint-GUID: JWytEEIa-LF_Lvgfks0hCBxxwsfj7dPY
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101101_673615_F88E8C05 
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
 sound/soc/codecs/rt1316-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index c66d7b20cb4dd..60baa9ff19070 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -597,6 +597,7 @@ static const struct snd_soc_component_driver soc_component_sdw_rt1316 = {
 	.num_dapm_widgets = ARRAY_SIZE(rt1316_dapm_widgets),
 	.dapm_routes = rt1316_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(rt1316_dapm_routes),
+	.endianness = 1,
 };
 
 static const struct snd_soc_dai_ops rt1316_aif_dai_ops = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
