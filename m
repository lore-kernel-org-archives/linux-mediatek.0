Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28905C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmBJUvIm42JePb+4GcXKety2JMChIqcWjYdL258BpwE=; b=B50r8WcM6gVrex
	Jod1CKZIvtZLUjmOqGCOdoPR3ulkEtT1b6rI7oAf60j28O59NgxYt3VhtRggz+cEOZw7PiSCro46e
	koE6sPoopnw4wBhW9bw+4gD+FNchHIR7Xf9A5Ouhis4LAaxK+qUBAdaQH5xOKQRZoaUBjDkDc78yd
	PbCEozAN0p0KxKWZMIgPruwRLjuWliPLJXPvGnV1K8/4rKyiRLr3L4fZ/KyUjXy9ywYELotXBNz7B
	QpCWVMHLO6paV6NB3C9BMToSZrAmRa1rbMlDTmDh80W5x+YKoXZuN1+dWVP+YEmq8Jm3IFzSWSQbe
	4ROtoI3OzS7a+LnSV/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWh-00BrTc-Cl; Wed, 04 May 2022 17:10:59 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWb-00BrLf-Rg
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:55 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAG021058;
 Wed, 4 May 2022 12:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uYui3GUDReHMEoWVOJgVxZHHd2RXTViPFt1wsoGQ19o=;
 b=Re7yfdkslZnIrb1pNPjJSH9s+n+1xHAE9/IXko/1POV1sqG9bXZC9oSNz7m5xAb1is5A
 hRdwJX8OviE5RFZmfnt26trniYExXeqzUmE11e6En+8Em8t8UsagNsL8Q59NTnLeNgc4
 2X15BFHYbkc4UamVDGStWVCKg7ffm+xpMyG4gxEK8biwZ3cHZ9oo87VDIPrUg97kjRGX
 s0oGcn63RQy9ooAb/92UHKrb8If/SEUyVoeiI+6GLbWi8ENdBAEJ77grNJ38u+atL6ft
 pYAxkVB8bNwLrzj5XQMsxZAPswaeQikhbFLw4G9ROaHzPfr908FdSISxkcVpYFxIm83E 2A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 72A2811D1;
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
Subject: [PATCH 22/38] ASoC: rt1019: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:49 +0100
Message-ID: <20220504170905.332415-23-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: SkOcWsdXVRIzmtixodHsTRnGBSLVo9f5
X-Proofpoint-GUID: SkOcWsdXVRIzmtixodHsTRnGBSLVo9f5
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101054_057162_6C6988D9 
X-CRM114-Status: GOOD (  15.85  )
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
 sound/soc/codecs/rt1019.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index d45d14fe5c427..f3f15fbe85d0e 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -515,7 +515,7 @@ static struct snd_soc_dai_driver rt1019_dai[] = {
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
-	.probe = rt1019_probe,
+	.probe			= rt1019_probe,
 	.controls		= rt1019_snd_controls,
 	.num_controls		= ARRAY_SIZE(rt1019_snd_controls),
 	.dapm_widgets		= rt1019_dapm_widgets,
@@ -523,6 +523,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
 	.dapm_routes		= rt1019_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(rt1019_dapm_routes),
 	.non_legacy_dai_naming	= 1,
+	.endianness		= 1,
 };
 
 static const struct regmap_config rt1019_regmap = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
