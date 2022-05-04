Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A53CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBZHwDGsjp9wPwQ+8boQLTkGRKes+0TEkcsRhBMb3Bk=; b=hmttBz/iUu4Q0A
	HL19kEuS/qABiIktw3kmBTrQ805rAdKSeTUz2ef+CgCUEJ2evtBZg7VnZUn7iCV+g2W8+T9jm6th6
	o5ax9d6DIYrZbijCZBgMPxDakrWL2d2TEbtelUb0/lg4sIEd81TiKQFYrOmrROuKDcGK52NrGFB0D
	cVZzrDhGZgqy2zv45M/DisFVS33E09theWShuN7liiFml+0XaZaFKjxXTGFtpZYFmdAl2XQHtU9qx
	Nmvi6NhNY87YjVlME6otZT3AHGcbHxn533fQdysJmmQPcqg/4gQiWSsEaOkpkfFQCtxvIuP1z3LUZ
	JDgXmLvu+Dy3rxUSAKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWV-00BrF8-Ly; Wed, 04 May 2022 17:10:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWL-00Br2k-FO
 for linux-mediatek@bombadil.infradead.org; Wed, 04 May 2022 17:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=5CPa81SfyLqdlyC7KvgtFBBAAHzWfo4nMUT95WgRFtM=; b=RWXypzE7ehfecxcU76pUNG4Fra
 +AreVREb5ku4OhKZnp+jyiABPqjEx/5zzjvkp7tFBdv1NlrZvG4s4w8LUPf2SYBE6GsoMbqoWBJEF
 50YC0yWuHKhERySRIMW8kG2JdnV48pSCvreOtOmjoPyayXE1YTJbzlcQ37fM6OxQG10YimTUiNXFu
 WEp3bd55aCMLHDVz63MjtPO5b57GxBOOucLlENOT9UHR71LEIl+5RFGldflNaAJQT/Q71Ni8Z0e2q
 L6JCBXLpgmZ623jSSfFRPXto9uYgBa24lpPFlPQ1/q4naemTK1edKWCDKRdY4mmGkryl79HvDyceR
 rTD9eTyA==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWG-00B7Ze-8O
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:35 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqC001835;
 Wed, 4 May 2022 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5CPa81SfyLqdlyC7KvgtFBBAAHzWfo4nMUT95WgRFtM=;
 b=oV++uEMcS6GDAQvCr6Ok+rNey9GL1A7JErmBI2vfwu7H/enbwx9wpQk7jOBPszC6POFV
 BoFpmMQKMPAoxblmqqt2oDqBgz3gChtkBw4aPLPsvin6/T+rlvh8S/HsNODfZs+1PUVd
 fLlDcBwE0TrfR1ZyTcBqNn4Oc/+K0fQJHm6KK5LwDBRqZ4bUWj6fYGzcr/q+Hojz88/u
 aoRm4p6ide/6Zw92xRHSZps5nyZas8sOwFk3C6W5fr1mrYETRAoo69mjHJmdRcpliQeH
 UwrtMz2bZLUZeeX/buoykvFtSO2Urxfb7naBLPBJ8XRQfHyFjdd5fuIAK6e1bL9erv5d iw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1817F459;
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
Subject: [PATCH 15/38] ASoC: cx2072x: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:42 +0100
Message-ID: <20220504170905.332415-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: VcoAWQ5rCW6ZjtMwCZQy0I8qltyxIIf5
X-Proofpoint-GUID: VcoAWQ5rCW6ZjtMwCZQy0I8qltyxIIf5
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_181033_317040_B8AD911C 
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
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cx2072x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 0d3a00434c6d6..b35debb5818db 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1527,6 +1527,7 @@ static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
 	.num_dapm_widgets = ARRAY_SIZE(cx2072x_dapm_widgets),
 	.dapm_routes = cx2072x_intercon,
 	.num_dapm_routes = ARRAY_SIZE(cx2072x_intercon),
+	.endianness = 1,
 };
 
 /*
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
