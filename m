Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D478C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIz3Tt576S1BMCBJjXUiRXN7dcIySexIdkNHyzEzGPY=; b=d3NpaTADwtNiYC
	lNL6njzL230ZwHC7NkFl/90mHwZygBawTRrZOKTC9mHmKyyMWKyNfI1KIDBTB08rX9OrJdXU1Ds61
	7XXP2tIkr7DXLupZA6ZszirODXtq2Ut26+mETC9rOn+vJHDr3N0xoNRnEjC6k/PUIUUuCUVYbcA4/
	v6hQCzcjpD7EcMov9+DyGBzQgDFviaT1CxgQBg3ZyTSBWAxtVWElFLkk7mWpJbckrlQlaigF+GYFT
	BNvByR9Lrzi6YbW6i47VFdIYKLw47OYkxADZIPyo8KQVJojAZAvXEq8U0dmX/+2TmsMXr0bcgfrjM
	WEYEZtC5lGc//6K3k/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWE-00BquT-LP; Wed, 04 May 2022 17:10:30 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIW2-00BqiY-CA
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:20 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq8001835;
 Wed, 4 May 2022 12:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=epPzlLGEOlrrbGIfh48/Ui6qXv0aQrzvwrAiH5BnENA=;
 b=RBO8PQjREXt0YeT7kt33+UdtJQDUldJrHBOGkufsxD9IDAcKgGmlqZeWgz37c6tMeODG
 r4StQ1PTM2G5k6y5WcrHgaof0dtzK3UnmBZMmBZgHleShBH7YVMJnFVqI8qHVUvoRpmE
 v1sv1LSjDUgfjUdBFQg5+il0K86jq9wJ7XjBf0jLYgxzGiiA0LhmBoC+Nd6l/nkaaTUV
 zOOHkqLtUgrbjFkjeEjYgGQ2JU72O5MFDE310k1ysnqTx6IHF7XILRAbfFBmEy6Ne3Om
 +F0V5gJ5mogsjLrm6zF5vBxTq+Qb1aZtVux4S1TPt6PDcm0kYKWzmZlxRpkaBTPuAmA3 Pg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0D3811D1;
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
Subject: [PATCH 10/38] ASoC: hdac_hda: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:37 +0100
Message-ID: <20220504170905.332415-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 42y-B7VDjPqN7dT7IBD8ETmXk2V1cu2i
X-Proofpoint-GUID: 42y-B7VDjPqN7dT7IBD8ETmXk2V1cu2i
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101018_477879_04396D47 
X-CRM114-Status: GOOD (  14.81  )
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
link. This device receives audio over an HDA DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/hdac_hda.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index a9f61c7e44ee7..8debcee592247 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -571,13 +571,14 @@ static const struct snd_soc_dapm_widget hdac_hda_dapm_widgets[] = {
 };
 
 static const struct snd_soc_component_driver hdac_hda_codec = {
-	.probe		= hdac_hda_codec_probe,
-	.remove		= hdac_hda_codec_remove,
-	.idle_bias_on	= false,
-	.dapm_widgets           = hdac_hda_dapm_widgets,
-	.num_dapm_widgets       = ARRAY_SIZE(hdac_hda_dapm_widgets),
-	.dapm_routes            = hdac_hda_dapm_routes,
-	.num_dapm_routes        = ARRAY_SIZE(hdac_hda_dapm_routes),
+	.probe			= hdac_hda_codec_probe,
+	.remove			= hdac_hda_codec_remove,
+	.dapm_widgets		= hdac_hda_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(hdac_hda_dapm_widgets),
+	.dapm_routes		= hdac_hda_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(hdac_hda_dapm_routes),
+	.idle_bias_on		= false,
+	.endianness		= 1,
 };
 
 static int hdac_hda_dev_probe(struct hdac_device *hdev)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
