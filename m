Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD1BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSyZxpO4d86Pup7lIMLQRFumK7iQVdywCHIOaQICGBA=; b=UBce+H7PY51Ljz
	k0jetfZELfSEKooy5FPkuUd8okTDkF3utT7cqC2Q8U32IdxC71B/LDUSB9AcnJKrrO09VsVHI88Rh
	StKxi3G7q1jrseac1oXQdWrlzpf/4F46ERyFzwVk7UjN8SczpdbVXWIhkqpgIRq/hlf0oFFxWxdBH
	RdlGMdpRTddG7JlAI3zXKOVcqWXkDGZIN8IILHJ9qmu468dRMm7m2FAc4czKur3rclY73cq5VNiav
	Al8FRXEDXNpK9dqkYqz6C8oDHWJ7V7Fm3Tq7+xjF55xtMAoUB8AHECeug4hVBMlF1WrI3sU0dDoTm
	jXEhXL3sM7yg67V+FqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWy-00Brmo-JJ; Wed, 04 May 2022 17:11:16 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWh-00BrTp-Sx
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:01 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAH021058;
 Wed, 4 May 2022 12:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oCip2HMRb+6GaCCm6E5uCoMFu120gkJAqwsYY4rRhjQ=;
 b=Sn/TeRRwZBH748npLu/zcO0TpcXv6f4vI/i3boTv1y87hZooUmKU75Vft/5JrTFsYJRG
 yfkYFfPAzGmpatlsrx6BwDVU7SUoXDb8EWulh8ZPMu/EfludjtLvyLBgrkFhyz0ge9do
 8c8QJQuP11WziGp+wjaGxnE85KLGhf8RXiDGxJIbbqg/vG0dvVlzpDfqt0GT/vqSq/wI
 +W6cPra7fH6gugvRUJQFaRbPXOi0gIbKIa1ah6htxtEDNecP60yi3zgdiARmqc4PvlDn
 84osvRzdRm6bZH1RAOBW9XlKOtZKXRSlAa69M5DCb2cX7JWV0lhafqpEHyM/ONFE7cwk ZA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 952A9B10;
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
Subject: [PATCH 24/38] ASoC: tlv320adc3xxx: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:51 +0100
Message-ID: <20220504170905.332415-25-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: o3QQtQx0-e9urUyMd3PuEVUgKaX2fBxb
X-Proofpoint-GUID: o3QQtQx0-e9urUyMd3PuEVUgKaX2fBxb
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101100_097911_6607FAD7 
X-CRM114-Status: GOOD (  16.43  )
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

A fixup is also required to use the width directly rather than relying
on the format in hw_params, now both little and big endian would be
supported.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index a5e9f80cfa321..82532ad00c3c8 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1152,20 +1152,20 @@ static int adc3xxx_hw_params(struct snd_pcm_substream *substream,
 		return i;
 
 	/* select data word length */
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
+	switch (params_width(params)) {
+	case 16:
 		iface_len = ADC3XXX_IFACE_16BITS;
 		width = 16;
 		break;
-	case SNDRV_PCM_FORMAT_S20_3LE:
+	case 20:
 		iface_len = ADC3XXX_IFACE_20BITS;
 		width = 20;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case 24:
 		iface_len = ADC3XXX_IFACE_24BITS;
 		width = 24;
 		break;
-	case SNDRV_PCM_FORMAT_S32_LE:
+	case 32:
 		iface_len = ADC3XXX_IFACE_32BITS;
 		width = 32;
 		break;
@@ -1335,6 +1335,7 @@ static const struct snd_soc_component_driver soc_component_dev_adc3xxx = {
 	.num_dapm_widgets	= ARRAY_SIZE(adc3xxx_dapm_widgets),
 	.dapm_routes		= adc3xxx_intercon,
 	.num_dapm_routes	= ARRAY_SIZE(adc3xxx_intercon),
+	.endianness		= 1,
 };
 
 static const struct i2c_device_id adc3xxx_i2c_id[] = {
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
