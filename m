Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A11AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQxj2f8v6Hq2mM43K9p34deiZ+cOeCScETZMUSLPaL4=; b=xReBwcQrD3D4s4TbkB1O9RhRxr
	NxHvWDdPCffJwQjWVW18sGouNei0XnSI2HAzN4PBsRkJsTlEZKsRyp8ONMp4IHChrc/F0Awagn58N
	FJeIwSO7TkXpIEhm6cJBGZUeyz9whkcKbR4ts6lLvjijbAGBBZTdWIBhJk/OGIOp98uGU2YRR0HST
	OtN0F4Cfz74banuqEhzI7bxs0wCTYCc+n2NEE1BBW1ELdkP+pbXlYCNUBWTZQG+RNIpkFG+D6dItF
	Yi1qOt5DJWNE7nNel3jOJ7RySoqEVfLCQQcNPRTRynZMO+zjopkB7GkUTkJy36wa39E5aNebk20kM
	HtCmsa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuUH-005uhy-2K;
	Thu, 13 Apr 2023 10:47:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuUD-005ufY-2Q;
	Thu, 13 Apr 2023 10:47:31 +0000
X-UUID: 91567078d9e811edb7d8d11f642b8e78-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iQxj2f8v6Hq2mM43K9p34deiZ+cOeCScETZMUSLPaL4=;
	b=mQlTj9/+hvbU7lV4QzkpboYtY3dQAgbNkV9VJFLg7lxUtAfCa5v82LZDCL5KagkGseOi6Gqz3kY47JS53G/fsc5TnTkdEPj9m/VY0fvZp0F962wD5ASO+FHXHONOFpC2vHgjnBOV6P8kIudE+AIKqjQIQs3wlbpY5gvvRyrSa9M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:966ad3a9-b11d-4000-9b53-fdc7af646f0a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:120426c,CLOUDID:555ed9ea-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 91567078d9e811edb7d8d11f642b8e78-20230413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 339178552; Thu, 13 Apr 2023 03:47:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 18:47:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 18:47:18 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 5/7] ASoC: mediatek: mt8188: combine afe component registration
Date: Thu, 13 Apr 2023 18:47:11 +0800
Message-ID: <20230413104713.7174-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230413104713.7174-1-trevor.wu@mediatek.com>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_034729_787976_7FE83909 
X-CRM114-Status: GOOD (  13.39  )
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

There is no benefit to separate two components for AFE, so DAI driver
registration is moved to dev_snd_soc_register_component to merge these
two components.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 37 ++--------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index e5f9373bed56..fecc891f892d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -1898,10 +1898,6 @@ static const struct snd_kcontrol_new mt8188_memif_controls[] = {
 			    MT8188_AFE_MEMIF_UL10),
 };
 
-static const struct snd_soc_component_driver mt8188_afe_pcm_dai_component = {
-	.name = "mt8188-afe-pcm-dai",
-};
-
 static const struct mtk_base_memif_data memif_data[MT8188_AFE_MEMIF_NUM] = {
 	[MT8188_AFE_MEMIF_DL2] = {
 		.name = "DL2",
@@ -3142,9 +3138,8 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
 	struct device *dev;
-	int i, irq_id, ret;
-	struct snd_soc_component *component;
 	struct reset_control *rstc;
+	int i, irq_id, ret;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
 	if (ret)
@@ -3280,34 +3275,12 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mt8188_afe_component,
-					      NULL, 0);
+					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_put;
 	}
 
-	component = devm_kzalloc(&pdev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component) {
-		ret = -ENOMEM;
-		goto err_pm_put;
-	}
-
-	ret = snd_soc_component_initialize(component,
-					   &mt8188_afe_pcm_dai_component,
-					   &pdev->dev);
-	if (ret)
-		goto err_pm_put;
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = "pcm";
-#endif
-	ret = snd_soc_add_component(component,
-				    afe->dai_drivers,
-				    afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_add_component\n");
-		goto err_pm_put;
-	}
-
 	mt8188_afe_init_registers(afe);
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -3323,11 +3296,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mt8188_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
-}
-
 static const struct of_device_id mt8188_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8188-afe", },
 	{},
@@ -3346,7 +3314,6 @@ static struct platform_driver mt8188_afe_pcm_driver = {
 		   .pm = &mt8188_afe_pm_ops,
 	},
 	.probe = mt8188_afe_pcm_dev_probe,
-	.remove_new = mt8188_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8188_afe_pcm_driver);
-- 
2.18.0


