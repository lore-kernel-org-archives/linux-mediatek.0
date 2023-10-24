Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A61CC00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 03:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hzi+kjq1QCG+TxJwfKjMZ8NZ7VLcxkHOjhgyuRv3grs=; b=owN0u85hZonOWAfNTdd6Zfh57a
	/5qebmLlJFMod32O8IfGy7OmlAaNx4tzwthPH1UdemFi3szoGLQpdf4YmE5k1RkOoCR8mktgaq+tE
	h8W7X6pZ/KiOhl0LcmgA6R121KQ1JBD/edzj4ZyjRAKa6mCvvqDhXkaKXUPIspshSt4c5lKuRl6u5
	h4tkwjQ/BX1L8b+4BF0F0mvZhOIVoZrSACTR44M0c3ELVZ3BKAhGEvVR6DUzvSjcfhHlA8p9+ZrmN
	fBd6bZBG0X6ikpSQdZoEUgfkaV0tnJRdKpEUCt8IiyZV3LeHxEUAJqoVfJSf2qNN5/fcUUwaU7Umx
	6GzUdm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8S7-008kIg-17;
	Tue, 24 Oct 2023 03:51:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8S4-008kH3-2W;
	Tue, 24 Oct 2023 03:51:34 +0000
X-UUID: 99da1b0c722011ee86758d4a7c00f3a0-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hzi+kjq1QCG+TxJwfKjMZ8NZ7VLcxkHOjhgyuRv3grs=;
	b=ZAtbjqhLEC3Phj/sfE1wRmh7bYNDNxDQDQabtBKbODJfpmQkSqAbe7YLSOCz1/2tStXGtxgmFew7lArJYnNG1eS+NZIp6Mo44oeKdiQbZ4B+tDg8l+qplYQ0Nq8kurcegbjaYAr1x/n70y7HMAH7gzidwsF4mRHVsZup+q1xYZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6c2fec76-1e17-4970-883e-5c98665635b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:f3f1d428-cb22-4fa7-8134-287af20ad1fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 99da1b0c722011ee86758d4a7c00f3a0-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2076606135; Mon, 23 Oct 2023 20:51:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 11:50:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 11:50:50 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt7986: add sample rate checker
Date: Tue, 24 Oct 2023 11:50:19 +0800
Message-ID: <20231024035019.11732-4-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024035019.11732-1-maso.huang@mediatek.com>
References: <20231024035019.11732-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.254500-8.000000
X-TMASE-MatchedRID: WkwGkWg/ZspKHSI+NapVgED6z8N1m1ALjZfFaL+4qfbfUZT83lbkEEFN
	G6vV64NpO3riJykx75rW3uke8Pv2jOF/B1jEjV+6syw+ZJnFumSO7tU+Bv65zZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXCZj5fT4j8U275XnfFOTeSbM3sLfmvJJnL8byqNXfKSxrcR
	mc7SDNwoCTKY6V6aLxs+jdM0RxJufk5os5jdQqLeFh/bIV6nmTF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.254500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D6FCDEDC649C83FF83C52FDACE0A28DEEB531C3639EE048AE42732BB07E90FCF2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_205132_833973_2034DA4B 
X-CRM114-Status: GOOD (  11.52  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7986 only supports 8/12/16/24/32/48/96/192 kHz

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index e523d33846fe..d57971413a04 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -237,12 +237,27 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
+	unsigned int rate = params_rate(params);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 
-	mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_PLAYBACK);
-	mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_CAPTURE);
-
-	return 0;
+	switch (rate) {
+	case 8000:
+	case 12000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+	case 96000:
+	case 192000:
+		mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_PLAYBACK);
+		mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_CAPTURE);
+		return 0;
+	default:
+		dev_err(afe->dev,
+			"Sample rate %d invalid. Supported rates: 8/12/16/24/32/48/96/192 kHz\n",
+			rate);
+		return -EINVAL;
+	}
 }
 
 static int mtk_dai_etdm_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.18.0


