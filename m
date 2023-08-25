Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6831AC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 02:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O109voinB4i42hzf7+Gca1AfZl5TFAeRyQ+uKbGY2GE=; b=sE//r+Qnj37+329t88jxC9ZEo0
	NDn9Doh2B0tiKju+sCqJYVGCdNCKrHmF1WuKR1EabfddXyI8vkvPgOqz61KB0O2gu4VKjY1mjl8nz
	rptRGKnLerIWZ3HGBR4ADOGX9LEXppCXtyThOBHloIPk+GR8RTPefamqJ08Scl+K5XlRjpxFj/18Q
	QFIYrE+O5ixmXKauBXyl9Dk9FqfcUUrO14E4565zmp7EUrGUffhkb52AzyQRI0aLoS9NclDdpLtKA
	6+FS4B4kFkD/XJoJwSITzuuhDftH1l5adXwW+SqzzWTiWltQMf8Gwp2gkc9ZXHHm8JyP3ndIrTtNc
	DMOq4Ueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZMtk-0049aL-0K;
	Fri, 25 Aug 2023 02:50:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZMtP-0049Ui-39;
	Fri, 25 Aug 2023 02:49:50 +0000
X-UUID: 09628e5e42f211ee912e1518a6540028-20230824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O109voinB4i42hzf7+Gca1AfZl5TFAeRyQ+uKbGY2GE=;
	b=KXvAzDf5ioQuR/nhx7ngLyGKitisFQIf4R6OtJFpSxzYTLvYNRu5pT0PPDAPQUC86e0XQb3ukofIkBZGIXqMb9pttp/9r1LHP2VFxKihP5ypmp1zP/89PL09xCzr4TGedymGjDlz34JUYDr/rPIoBbEof4dvpwJz191j0KScfrs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:62215aae-4fc1-4096-b053-61563e853989,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:62215aae-4fc1-4096-b053-61563e853989,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:0dd32a13-4929-4845-9571-38c601e9c3c9,B
	ulkID:230825104941LR43M9KM,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 09628e5e42f211ee912e1518a6540028-20230824
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 961018019; Thu, 24 Aug 2023 19:49:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Aug 2023 10:49:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Aug 2023 10:49:36 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND,v3 2/3] ASoC: mediatek: common: revise SOF common code
Date: Fri, 25 Aug 2023 10:49:34 +0800
Message-ID: <20230825024935.10878-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230825024935.10878-1-trevor.wu@mediatek.com>
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_194948_014207_DF19589B 
X-CRM114-Status: GOOD (  23.68  )
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

Originally, normal dai link fixup callback is overwritten by sof fixup
callback on mtk_sof_card_late_probe and it relies on the mapping defined
on struct sof_conn_stream.

It's not flexible. When a new hardware connection is adopted, user needs
to update struct sof_conn_stream defined in machine driver which is used
to specify the mapping relationship of normal BE and SOF BE.

In the patch, mtk_sof_check_tplg_be_dai_link_fixup() is introduced for
all normal BEs. In mtk_sof_late_probe, back up normal BE fixup if it
exists and then overwrite be_hw_params_fixup by the new callback.

There are two cases for FE and BE connection.

case 1:
SOF FE -> normal BE
       -> SOF_BE

case 2:
normal FE -> normal BE

In the new fixup callback, it tries to find SOF_BE which connects to the
same FE, and then reuses the fixup of SOF_BE. If no SOF_BE exists,
it must be case 2, so rollback to the original fixup if it exists.

As a result, the predefined relation is not needed anymore. Hardware
connection can be controlled by the mixer control for AFE interconn.
Then, DPCM finds the BE mapping at runtime.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../soc/mediatek/common/mtk-dsp-sof-common.c  | 113 +++++++++++++++---
 .../soc/mediatek/common/mtk-dsp-sof-common.h  |   8 ++
 2 files changed, 106 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index 6fef16306f74..f3894010f656 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -54,6 +54,8 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
 {
 	int i;
 	struct snd_soc_dai_link *dai_link;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 
 	/* Set stream_name to help sof bind widgets */
 	for_each_card_prelinks(card, i, dai_link) {
@@ -61,10 +63,81 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
 			dai_link->stream_name = dai_link->name;
 	}
 
+	INIT_LIST_HEAD(&sof_priv->dai_link_list);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_sof_card_probe);
 
+static struct snd_soc_pcm_runtime *mtk_sof_find_tplg_be(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	struct snd_soc_pcm_runtime *fe;
+	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dpcm *dpcm;
+	int i, stream;
+
+	for_each_pcm_streams(stream) {
+		fe = NULL;
+		for_each_dpcm_fe(rtd, stream, dpcm) {
+			fe = dpcm->fe;
+			if (fe)
+				break;
+		}
+
+		if (!fe)
+			continue;
+
+		for_each_dpcm_be(fe, stream, dpcm) {
+			be = dpcm->be;
+			if (be == rtd)
+				continue;
+
+			for (i = 0; i < sof_priv->num_streams; i++) {
+				const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
+
+				if (!strcmp(be->dai_link->name, conn->sof_link))
+					return be;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+/* fixup the BE DAI link to match any values from topology */
+static int mtk_sof_check_tplg_be_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+						struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	struct snd_soc_pcm_runtime *sof_be;
+	struct mtk_dai_link *dai_link;
+	int ret = 0;
+
+	sof_be = mtk_sof_find_tplg_be(rtd);
+	if (sof_be) {
+		if (sof_priv->sof_dai_link_fixup)
+			ret = sof_priv->sof_dai_link_fixup(rtd, params);
+		else if (sof_be->dai_link->be_hw_params_fixup)
+			ret = sof_be->dai_link->be_hw_params_fixup(sof_be, params);
+	} else {
+		list_for_each_entry(dai_link, &sof_priv->dai_link_list, list) {
+			if (strcmp(dai_link->name, rtd->dai_link->name) == 0) {
+				if (dai_link->be_hw_params_fixup)
+					ret = dai_link->be_hw_params_fixup(rtd, params);
+
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
 int mtk_sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -72,6 +145,8 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(card);
 	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	struct snd_soc_dai_link *dai_link;
+	struct mtk_dai_link *mtk_dai_link;
 	int i;
 
 	/* 1. find sof component */
@@ -86,25 +161,37 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 		return 0;
 	}
 
-	/* 2. add route path and fixup callback */
+	/* 2. overwrite all BE fixups, and backup the existing fixup */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->be_hw_params_fixup) {
+			mtk_dai_link = devm_kzalloc(card->dev,
+						    sizeof(*mtk_dai_link),
+						    GFP_KERNEL);
+			if (!mtk_dai_link)
+				return -ENOMEM;
+
+			mtk_dai_link->be_hw_params_fixup = dai_link->be_hw_params_fixup;
+			mtk_dai_link->name = dai_link->name;
+
+			list_add(&mtk_dai_link->list, &sof_priv->dai_link_list);
+		}
+
+		if (dai_link->no_pcm)
+			dai_link->be_hw_params_fixup = mtk_sof_check_tplg_be_dai_link_fixup;
+	}
+
+	/* 3. add route path and SOF_BE fixup callback */
 	for (i = 0; i < sof_priv->num_streams; i++) {
 		const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
 		struct snd_soc_pcm_runtime *sof_rtd = NULL;
-		struct snd_soc_pcm_runtime *normal_rtd = NULL;
 
 		for_each_card_rtds(card, rtd) {
 			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
 				sof_rtd = rtd;
-				continue;
-			}
-			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
-				normal_rtd = rtd;
-				continue;
-			}
-			if (normal_rtd && sof_rtd)
 				break;
+			}
 		}
-		if (normal_rtd && sof_rtd) {
+		if (sof_rtd) {
 			int j;
 			struct snd_soc_dai *cpu_dai;
 
@@ -131,13 +218,9 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 				}
 			}
 
+			/* overwrite SOF BE fixup */
 			sof_rtd->dai_link->be_hw_params_fixup =
 				sof_comp->driver->be_hw_params_fixup;
-			if (sof_priv->sof_dai_link_fixup)
-				normal_rtd->dai_link->be_hw_params_fixup =
-					sof_priv->sof_dai_link_fixup;
-			else
-				normal_rtd->dai_link->be_hw_params_fixup = mtk_sof_dai_link_fixup;
 		}
 	}
 
diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
index dd38c4a93574..4bc5e1c0c8ed 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.h
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
@@ -18,11 +18,19 @@ struct sof_conn_stream {
 	int stream_dir;
 };
 
+struct mtk_dai_link {
+	const char *name;
+	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params);
+	struct list_head list;
+};
+
 struct mtk_sof_priv {
 	const struct sof_conn_stream *conn_streams;
 	int num_streams;
 	int (*sof_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
 				  struct snd_pcm_hw_params *params);
+	struct list_head dai_link_list;
 };
 
 int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
-- 
2.18.0


