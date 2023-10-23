Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECB1C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jkw7gW1AVmrX/Nr58wDn+UzhFqI704qvqC+4AjLfSfk=; b=N9bsYSqP70+oiRqxqJBzlSSMFo
	kQF/75/KImfVcFlkrQ8PgvXtTeO3yj3t2bqSCmO409I9C4KzY5MFJttNGPt/+iauAdTDe1sK+9DcO
	emlNOIHPYrIcwiUFZIZWrbxZxILFF8ZDOqjhHm1OBeAPHXN/2jgkIe6m//cQA/XMoRa4QT0fADmjb
	GFYVclUEsCNb7Pd3QUJpCghSjh/0ZPYD0DYApFge7DaI3ERApFugwCKNrwl91XQH6/cmFByvz6BBV
	/HlRZpjS2ezGZ1VO+Nvw9YOKbeJD896O6Yk1RHQpFLbmj4KYI7tsepGvDipJv22Lu/jfwC/rkB+r3
	NVq/3V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurg7-006xsL-1S;
	Mon, 23 Oct 2023 09:56:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfD-006xEu-1E;
	Mon, 23 Oct 2023 09:56:00 +0000
X-UUID: 58b21490718a11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Jkw7gW1AVmrX/Nr58wDn+UzhFqI704qvqC+4AjLfSfk=;
	b=XA0HCV06g16G5cGuD7lwpieNY/w9MmEQD40b36NsbEBaDZcQQJphhre0qOIktGsewPPzD7H2wdInihYEfx0zjMBDwNpWHl39jFMfx6EdO5qrQ+vbnxAGHfHX8jYOxrG9K5BbXP04mFRcZwI9ZpRUevLfxKcXFO9IDyaL+DQemH0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:476704d0-9b06-46b4-9c59-121d2b140c7d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:3bb68594-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 58b21490718a11ee9b7791016c24628a-20231023
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 800272147; Mon, 23 Oct 2023 02:55:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 17:55:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 17:55:15 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt7986: add sample rate checker
Date: Mon, 23 Oct 2023 17:54:53 +0800
Message-ID: <20231023095453.4860-3-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023095453.4860-1-maso.huang@mediatek.com>
References: <20231023095453.4860-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.222300-8.000000
X-TMASE-MatchedRID: xvSVK/1RoEatDMl6rQjWQgPZZctd3P4B9DuzN5Up01sOUs4CTUgKyzDK
	cAWm/vH3OfAiJ/eonC1mJS6k736MTF+1yB6ph7kzngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPI34T
	9cYMsdwzHaTdqG3iWhhuHbDe2QawKVRjg2m4p6wZby31Am35MsCb7uY8ruzzlbTNil8EW6FkBjo
	g7tEcVQ80AvBonNwk5yqhYRUc589COh+wyNBrFXDJiNuKohDcKzKSG3JdyKAPqtV2AGMNPaiHWP
	YzouJUy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.222300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4D0FF03452DC1FE5C8A4082C1A7BBA4D960451FB6C3A5B663ADC3AABEF886F3E2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025559_444543_31F123B4 
X-CRM114-Status: GOOD (  10.97  )
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
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 22 +++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index e523d33846fe..270852ce3dd9 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -237,12 +237,26 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
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
+		dev_warn(afe->dev, "%s(), sample rate: %d is not supported\n", __func__, rate);
+		dev_warn(afe->dev, "%s(), only support 8/12/16/24/32/48/96/192 kHz\n", __func__);
+		return -EINVAL;
+	}
 }
 
 static int mtk_dai_etdm_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.18.0


