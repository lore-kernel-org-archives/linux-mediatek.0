Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C5CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rR1IvYLKkhdhAuc4mpC/G54enk/4PKOU4bkaXoplfFQ=; b=HiJXKgRRzLE/nL
	2S/Q2mxdZWGxhe3a88zHRNSCjhK9SK6K8NSidPZ4eLU+9A/BCopyw+fsOzXoBHyDnipOE/4ManPIS
	G7gvRgUIL/lyFfvpsfR8Ikv/OdcCUoO0FJ5TFGIwsFTUgo1ZHkJJ1aTpqlwCDNR3EHNXXFWuftp0O
	OtaavDl/CjmVoJH97U7LBQX47djyRodWrCXaVmHlAiNbOMWTipXzMlN/4Qew2ke22iLFp/BmF7hl6
	RkgwVAAVKgzoKA8CMqJuycI+7xXH7+sM5I8BAjdtLMDSgT2ssw+I0n+IdTEAQlzvuRneznygB7TTZ
	2RiFj23GrfXzf6tAaOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXM-00BsCm-HM; Wed, 04 May 2022 17:11:40 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWk-00BrWl-C5
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:05 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqI001835;
 Wed, 4 May 2022 12:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ejYgje9HqagfwzoIL31BPNfwXTOmSUzwvqRO0TyAMOw=;
 b=nphv6fWaL4wqwDYrYaUaK8atDXUbAjZY6lpZI9b0Yo32v4IZKHbI0ceQCxEkHBBCIWGw
 0m9qHjbGlRMMS6jzqmquoP5xXSXQ4dUWp2obbkq+ck0jLKcy7orqLPMZkPFn91nuZy8v
 N5vWByxx77M3Hva1eb9IJ/2j0N/jNZQewYyVh4IYMJs4pXmHtEJ6yhOjX8e4po88x7Pw
 BIRUuXJVKHwbtguU/u9KFAnfRw0eyk31kZiPPqPolE7jBG/VDiK2N/b0exweQz8XWznp
 EwTt1MaBJzaiPsbEJ/krHtNCya1YzMm4mgzQCWq8A0PNafiG/dfTH4dQazgONfPZlemT fQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BE61B11DA;
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
Subject: [PATCH 28/38] ASoC: wcd9335: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:55 +0100
Message-ID: <20220504170905.332415-29-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: J_K4O-QsKEZMDWeHjNL3gxPfJwaIhO_K
X-Proofpoint-GUID: J_K4O-QsKEZMDWeHjNL3gxPfJwaIhO_K
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101102_539383_35BDA4AA 
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
link. This device receives audio over a SLIMbus DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wcd9335.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1e60db4056ada..617a36a89dfed 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4924,6 +4924,7 @@ static const struct snd_soc_component_driver wcd9335_component_drv = {
 	.num_dapm_widgets = ARRAY_SIZE(wcd9335_dapm_widgets),
 	.dapm_routes = wcd9335_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wcd9335_audio_map),
+	.endianness = 1,
 };
 
 static int wcd9335_probe(struct wcd9335_codec *wcd)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
