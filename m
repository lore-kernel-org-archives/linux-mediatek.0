Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F62C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTnxtp6hN8hNECyGyeAIWXn7uB5lZFLas1G7S96mRtQ=; b=26ghiUlWPOV1Og/BO8cMFI0ECn
	pyz3LvxYSphR5OyORHef+wNL4eZohiaDQgrF6KkHl7QlI93Z/ntJ6KKJgufrV5NhWuAUkUdPXhy1w
	KcTIdcUuyQUpdCq9thCfM+jWthSjVVdFsuT2+tqeFEahN7Ex/p+Ks8qSLY13A/ShOxvqvN5cTUsBn
	qrGA7z3C0tcukx58hriGMx9aczpnu74O0L7PPRwDet/hyJ0Tdpf2wjncHSDUIQY7TUjEpT1vJR5mF
	tL9Hzr410VqMi1QXC3MlTi/bpH4wJofMQVL+1Q+NwVtpp4BUDOnv99uyy4XeV9GOs5zVd7WsxJMw6
	TOsrjpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppoyc-00AiaV-1W;
	Fri, 21 Apr 2023 11:30:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnrm-00ATDT-32;
	Fri, 21 Apr 2023 10:19:48 +0000
X-UUID: 0956fec6e02e11ed8687db9d93187ff1-20230421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zTnxtp6hN8hNECyGyeAIWXn7uB5lZFLas1G7S96mRtQ=;
	b=rCV3cqgnQjxmsar9+rDUtm5E3PAZoONcHmVEKpiDeYhRm2Q7mQUfFvf2s9jeVDxteKYf8AT855kZIChGKJwM3uzlBquiGKtJhGw2baHsk1umcZDZjDyiEZ7+YJQUAF1KA2WRoJgxjp7R8xwpqp+d/LYhEPVSW/3YPwQ5htVkps0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:71b8609c-41ac-4760-a8c8-6c4b273332e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:2f17b9eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 0956fec6e02e11ed8687db9d93187ff1-20230421
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1795868208; Fri, 21 Apr 2023 03:19:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 21 Apr 2023 18:09:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 21 Apr 2023 18:09:07 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/7] ASoC: mediatek: mt8188: complete set_tdm_slot function
Date: Fri, 21 Apr 2023 18:09:00 +0800
Message-ID: <20230421100905.28045-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230421100905.28045-1-trevor.wu@mediatek.com>
References: <20230421100905.28045-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_031946_989065_A29749E8 
X-CRM114-Status: GOOD (  13.15  )
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

User can configures slot number of TDM mode via set_tdm_slot callback.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 7a37752d4244..fddecf5bf7c6 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -1909,6 +1909,10 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
 		if (!is_valid_etdm_dai(mst_dai_id))
 			return -EINVAL;
 
+		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
+		if (mst_etdm_data->slots)
+			channels = mst_etdm_data->slots;
+
 		ret = mtk_dai_etdm_mclk_configure(afe, mst_dai_id);
 		if (ret)
 			return ret;
@@ -1918,7 +1922,6 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
 		if (ret)
 			return ret;
 
-		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			ret = mtk_dai_etdm_configure(afe, rate, channels,
@@ -1931,6 +1934,12 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 	} else {
+		if (!is_valid_etdm_dai(dai->id))
+			return -EINVAL;
+		mst_etdm_data = afe_priv->dai_priv[dai->id];
+		if (mst_etdm_data->slots)
+			channels = mst_etdm_data->slots;
+
 		ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
 		if (ret)
 			return ret;
@@ -2073,10 +2082,16 @@ static int mtk_dai_etdm_set_tdm_slot(struct snd_soc_dai *dai,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int dai_id;
 
-	if (!is_valid_etdm_dai(dai->id))
+	if (is_cowork_mode(dai))
+		dai_id = get_etdm_cowork_master_id(dai);
+	else
+		dai_id = dai->id;
+
+	if (!is_valid_etdm_dai(dai_id))
 		return -EINVAL;
-	etdm_data = afe_priv->dai_priv[dai->id];
+	etdm_data = afe_priv->dai_priv[dai_id];
 
 	dev_dbg(dai->dev, "%s id %d slot_width %d\n",
 		__func__, dai->id, slot_width);
-- 
2.18.0


