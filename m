Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E04EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMufsS9CMZKOGI3p5CRTOdNeSLfXT00wZXVkAgvFhnE=; b=1tvCvgDTYmhG5U
	RnGR4itFkkrxxmfjAz59yzRVbT4g/ht8u98Ezuev5UAn2JcPPkMjxc58gWVkWlup5Dt6ifz4QKPr7
	osX6qKyxmzJKNDVNkUrHehwueLbaBTGxCiKlnmD8kuHKPLlUgp/2KMSJRNvfmVmrywQ6fuwfFi18D
	uUbIgmMr42l+NWzdri8h0u2BhGE6IgWKdnhZZWi9fWPHMgcPV0zkh/emUMzFyT//9+SD1ERmwl9Gp
	sbu/pKgEDN3rHg9J1kFHxTaawgZ9hrvvCPbN+ouo9y69ZMgMdJeEKsEWjGTEs+B9+RUkXqBSW+Yma
	GPhkpQcQPe3lwyyb05Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWW-00BrG3-JZ; Wed, 04 May 2022 17:10:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWM-00Br43-Kt
 for linux-mediatek@bombadil.infradead.org; Wed, 04 May 2022 17:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=IvnYN5iszdMNB95VpDFm5ngOBzKLXjW/DwEUt3YcyzE=; b=cbpfIQ8N++HO3rGFum6zE3/ST+
 dpqRnVeXheCJNn7Roww5afs0qVoSbQ4+dQ24+0JJ9FHBd++2UmeQ5UQE+Su83OMK9WtEqNqKCRBaR
 WuMYIvtm6iiZOmJ8HU9BvPx2lF+9cBAOFGuPZdMSBu00wtAs1Gt1fiAMsyu3xGV4ZHI6HZdWD+cdZ
 1OhtiYtbG/hlEy7DXor8e+4oS3dg8kkstVDUBNgLt9MBGOUW8W+PNXcmP3sfEo6YQZHrkV5hRo1uQ
 OYe57hCBIMEWcx2rRTULGM9HD3O0zqi2h/JgCeV5Jgy0uADcG0btwc1uhJq+1HWID6E5+3VT8GTsP
 67yhx2jg==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWG-00B7Zl-7B
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:37 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqE001835;
 Wed, 4 May 2022 12:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=IvnYN5iszdMNB95VpDFm5ngOBzKLXjW/DwEUt3YcyzE=;
 b=WhEdRkczNGpRZZHynb39Q6/hxkNtit6Nhi+356EB8U/w1gmTiW8XQ1e2Jl/uDdeGJnqn
 pY9Ncrx9TBYk00Zff0VRl9TuhHVgkRODbJZVwZ74aQTeaUGcTZ1hlaQx4pE6dJDfBxlq
 Pq7Jl6gihLHJHnDeAobZ+VV4PPSIF5hpOAtLzUH0d4+tr/fpN6UJIj+f52k6pcMi/mq9
 qLxGDycnnMi97H7QyQcLO7VlhznBKghFEpOjPYtc6NL9cN1CK80kpJSxF7kUfPBLo/cx
 RefKA1E7miz+XhfXNPLQfSuSoWjkh5gKRnPIozCzuvEFHYVx8cltGubaFED+t+tOTxka gw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 39D2211D3;
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
Subject: [PATCH 17/38] ASoC: mt6351: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:44 +0100
Message-ID: <20220504170905.332415-18-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 69cUNFJq9v0foua4hJ03N5nO_wPnGX1S
X-Proofpoint-GUID: 69cUNFJq9v0foua4hJ03N5nO_wPnGX1S
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_181033_330132_356CA54F 
X-CRM114-Status: GOOD (  16.94  )
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

As the core will now expand the formats to cover both endian types,
remove the redundant manual specification of both.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/mt6351.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/mt6351.c b/sound/soc/codecs/mt6351.c
index 5c0536eb1044f..d2cf4847eead1 100644
--- a/sound/soc/codecs/mt6351.c
+++ b/sound/soc/codecs/mt6351.c
@@ -282,12 +282,9 @@ static const struct snd_soc_dai_ops mt6351_codec_dai_ops = {
 	.hw_params = mt6351_codec_dai_hw_params,
 };
 
-#define MT6351_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
-			SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |\
-			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
-			SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |\
-			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
-			SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE)
+#define MT6351_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_U16_LE |\
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_U24_LE |\
+			SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_U32_LE)
 
 static struct snd_soc_dai_driver mt6351_dai_driver[] = {
 	{
@@ -1448,6 +1445,7 @@ static const struct snd_soc_component_driver mt6351_soc_component_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(mt6351_dapm_widgets),
 	.dapm_routes = mt6351_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(mt6351_dapm_routes),
+	.endianness = 1,
 };
 
 static int mt6351_codec_driver_probe(struct platform_device *pdev)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
