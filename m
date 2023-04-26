Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB34C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 05:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQxj2f8v6Hq2mM43K9p34deiZ+cOeCScETZMUSLPaL4=; b=YjyAJkT4OJiJ5TCZ0SxGt62SCo
	OlkiNEqI81J070bTnIjFOF93ArCG1a8Y8mWI5imm8pfrXRulKUCu4pUWmxhwfJwx6XCopJ/djfnfP
	ajKlRYDJC78D25kenK4idBlWOQl5hwMDVy9Rb/iYkO3sCkDgtEUcnrp0btDwiAmzG5UW+fW1oVQcO
	TyxX1P2SR9KBjoOix4rfJ8h42Ypx5v8KJIReJSod79kVFUh29YBs4DEq9T6ii0N3SO3zHywbgjIuQ
	gAsgXsU29OELf2N7dWlHLT3D0qI3/IZkCjzGyZb5oxNwOWcpLh2xq7shAqAfLC7vaXyyG8pYDnydm
	otqatdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prY4F-002rSX-1d;
	Wed, 26 Apr 2023 05:51:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prY3z-002rLk-0v;
	Wed, 26 Apr 2023 05:51:36 +0000
X-UUID: 63aba2dee3f611ed8687db9d93187ff1-20230425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iQxj2f8v6Hq2mM43K9p34deiZ+cOeCScETZMUSLPaL4=;
	b=kiIuCLckKOtluUlWv9w4O4pYIjgeulrzYmF4cPXRtyUKiaVwDFA8cgGFg8PQa6Ar6YgUEScvWvV1/5QaNCZtCElkmeBfrb56GJoKOZo5/GXDyXdgH9voY9v93e3kdQfcy5FP5QTSikif4aDrFCAi7hb41++RjJ8+4EM67saR1J8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:ab86e165-ed76-41c3-b058-ebe5fd656a23,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.22,REQID:ab86e165-ed76-41c3-b058-ebe5fd656a23,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:120426c,CLOUDID:b7678ba2-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230426135128WJPHPIVF,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 63aba2dee3f611ed8687db9d93187ff1-20230425
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877179025; Tue, 25 Apr 2023 22:51:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Apr 2023 13:51:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 13:51:26 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 5/7] ASoC: mediatek: mt8188: combine afe component registration
Date: Wed, 26 Apr 2023 13:51:22 +0800
Message-ID: <20230426055124.16529-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230426055124.16529-1-trevor.wu@mediatek.com>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_225135_328596_0E1089D8 
X-CRM114-Status: GOOD (  15.11  )
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


