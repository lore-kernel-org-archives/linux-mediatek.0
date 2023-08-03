Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE975C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkR+gqGCuuesY9WOQbPQ2Y2ld+iDLFnZPn/SNaXxV5E=; b=xBV8oV9pTFwG01+cYMf9S9WVY9
	lJJ9CYAJYFsoBRwVQasLV7oSOeiKv1V0xBFPm+K3nWHnDDSqKj1lX/8AmOSFOrydK3dvx+1RSfMSH
	clS7i+hoNovx/2HbFavJe0r5QiTUFoLCrDSpcP2GerX4Nz01WRjLu33CT0S5t1tyOBolZeEVOiTWo
	pL4jI68DXdnmXvmGB/9TpNPWSA5hru5b5Z88xy0XbrZCSKD4OxYYQqcEKOiKNXw9GrLIjQUemPKr2
	ss03JP+p9ZFzk7jQZXpQgpNMApQkPEwAlIyEJ7KFSAuwyue1qTCtebeGRof1C/n2KQC0J0sP8DZTf
	NBxtSGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQqv-006gxg-1u;
	Thu, 03 Aug 2023 05:26:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQqs-006gvr-0c;
	Thu, 03 Aug 2023 05:26:23 +0000
X-UUID: 4230efae31be11ee912e1518a6540028-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FkR+gqGCuuesY9WOQbPQ2Y2ld+iDLFnZPn/SNaXxV5E=;
	b=D/+DfHPZ2FU502wGNVO1XdW+UcLF27SZTd9nIZDHJpJ0jKfUSW6U79/XwyoleGuGJ9Wav3CLORxCNygJM5+EwEsH7idnP9ZmtE97cpDZ0zn11GCI+D527D0lRfbOadLtnUEo+5YTUqEcsIySWDgmNRxwT8mFe0/ao7aokCKTFEs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:92dc23ad-b2f4-410c-8bc2-93636abaf2c2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.30,REQID:92dc23ad-b2f4-410c-8bc2-93636abaf2c2,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:1fcc6f8,CLOUDID:47eb18b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:230803132614KLIWEBZD,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_SNR
X-UUID: 4230efae31be11ee912e1518a6540028-20230802
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2051053392; Wed, 02 Aug 2023 22:26:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 13:26:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 13:26:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
Date: Thu, 3 Aug 2023 13:26:05 +0800
Message-ID: <20230803052607.25843-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230803052607.25843-1-trevor.wu@mediatek.com>
References: <20230803052607.25843-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_222622_244560_E91228CF 
X-CRM114-Status: GOOD (  13.91  )
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

To avoid power leakage, it is recommended to replace the default pinctrl
state with dynamic pinctrl since certain audio pinmux functions can
remain in a HIGH state even when audio is disabled. Linking pinctrl with
DAPM using SND_SOC_DAPM_PINCTRL will ensure that audio pins remain in
GPIO mode by default and only switch to an audio function when necessary.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 7c9e08e6a4f5..e7ac2b6671d3 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -246,6 +246,11 @@ static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SINK("HDMI"),
 	SND_SOC_DAPM_SINK("DP"),
+
+	/* dynamic pinctrl */
+	SND_SOC_DAPM_PINCTRL("ETDM_SPK_PIN", "aud_etdm_spk_on", "aud_etdm_spk_off"),
+	SND_SOC_DAPM_PINCTRL("ETDM_HP_PIN", "aud_etdm_hp_on", "aud_etdm_hp_off"),
+	SND_SOC_DAPM_PINCTRL("MTKAIF_PIN", "aud_mtkaif_on", "aud_mtkaif_off"),
 };
 
 static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
@@ -267,6 +272,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dapm_widget *pin_w = NULL, *w;
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
 	struct mtkaif_param *param;
@@ -306,6 +312,18 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		return 0;
 	}
 
+	for_each_card_widgets(rtd->card, w) {
+		if (!strcmp(w->name, "MTKAIF_PIN")) {
+			pin_w = w;
+			break;
+		}
+	}
+
+	if (pin_w)
+		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_PRE_PMU);
+	else
+		dev_dbg(afe->dev, "%s(), no pinmux widget, please check if default on\n", __func__);
+
 	pm_runtime_get_sync(afe->dev);
 	mt6359_mtkaif_calibration_enable(cmpnt_codec);
 
@@ -403,6 +421,9 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	for (i = 0; i < MT8188_MTKAIF_MISO_NUM; i++)
 		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
 
+	if (pin_w)
+		dapm_pinctrl_event(pin_w, NULL, SND_SOC_DAPM_POST_PMD);
+
 	dev_dbg(afe->dev, "%s(), end, calibration ok %d\n",
 		__func__, param->mtkaif_calibration_ok);
 
-- 
2.18.0


