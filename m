Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AC1C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kq3fxPmyPxw0nJTherBUsZEQDy7iP5h2RMscsulCSdY=; b=BF1r3uwHBMw2WBA1GCoGtC+kwv
	4fl3nBQTeBzsdKneeyJqybV9T4w47Vbb3yeOFmFCQNPhLB7hVZ+7TVsv9cUcEz68PHoX5PbSGdL7S
	AEfEbtGgf3oL/bss7RKGfxJxMqEiQQTiwq6mhylShh8b0xl4dtlBS5stwT4LBTintKH1+xnSyPhhH
	KrXyd8zVdPjvPVrN5kdqye8BQjtii3iKWWs7khIwaBm1APmjPbfEHxBGNBgp0fX6XL/TCt54CWwpK
	TpTJTQjNUIAIWe7SFJvDJwE5m1IEP1jAbMkwWnnEzHzn7R/+gjrjHZSBKlMzjINurXL19vn1pMJVf
	/0DGluNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZEL-001qjz-1P;
	Thu, 01 Jun 2023 03:44:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZEH-001qj4-1t;
	Thu, 01 Jun 2023 03:44:03 +0000
X-UUID: 88cf4d78002e11ee912e1518a6540028-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kq3fxPmyPxw0nJTherBUsZEQDy7iP5h2RMscsulCSdY=;
	b=Gy4e2H7tNR035Gvr5hR3swXO26b8NYZAgGbkZZPdBELzLH7Yn9QtRpfAgu93FcGdJ26MSDCsl62US82R6pk+E+fISAREjnBD883lT0+NXYnJnwxNNmjU2sYPbEC9igC769I9uUR2L5Xpl2kIeWwnzZS2XjWbfL0N580e3bmIe6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:57ddbcd3-b597-49a6-aadf-7df4a78e878e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:c534043d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 88cf4d78002e11ee912e1518a6540028-20230531
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 72562100; Wed, 31 May 2023 20:43:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:33:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:33:19 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <dianders@chromium.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] ASoC: mediatek: mt8195: fix use-after-free in driver remove path
Date: Thu, 1 Jun 2023 11:33:18 +0800
Message-ID: <20230601033318.10408-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230601033318.10408-1-trevor.wu@mediatek.com>
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_204401_637804_C7FE03E2 
X-CRM114-Status: GOOD (  18.21  )
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

During mt8195_afe_init_clock(), mt8195_audsys_clk_register() was called
followed by several other devm functions. At mt8195_afe_deinit_clock()
located at mt8195_afe_pcm_dev_remove(), mt8195_audsys_clk_unregister()
was called.

However, there was an issue with the order in which these functions were
called. Specifically, the remove callback of platform_driver was called
before devres released the resource, resulting in a use-after-free issue
during remove time.

At probe time, the order of calls was:
1. mt8195_audsys_clk_register
2. afe_priv->clk = devm_kcalloc
3. afe_priv->clk[i] = devm_clk_get

At remove time, the order of calls was:
1. mt8195_audsys_clk_unregister
3. free afe_priv->clk[i]
2. free afe_priv->clk

To resolve the problem, we can utilize devm_add_action_or_reset() in
mt8195_audsys_clk_register() so that the remove order can be changed to
3->2->1.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  5 --
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c | 47 ++++++++++---------
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |  1 -
 5 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 9ca2cb8c8a9c..f35318ae0739 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -410,11 +410,6 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 	return 0;
 }
 
-void mt8195_afe_deinit_clock(struct mtk_base_afe *afe)
-{
-	mt8195_audsys_clk_unregister(afe);
-}
-
 int mt8195_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
 {
 	int ret;
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
index 40663e31becd..a08c0ee6c860 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.h
@@ -101,7 +101,6 @@ int mt8195_afe_get_mclk_source_clk_id(int sel);
 int mt8195_afe_get_mclk_source_rate(struct mtk_base_afe *afe, int apll);
 int mt8195_afe_get_default_mclk_source_by_rate(int rate);
 int mt8195_afe_init_clock(struct mtk_base_afe *afe);
-void mt8195_afe_deinit_clock(struct mtk_base_afe *afe);
 int mt8195_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
 void mt8195_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
 int mt8195_afe_prepare_clk(struct mtk_base_afe *afe, struct clk *clk);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index d22cf1664d8a..a0f2012211fb 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3224,15 +3224,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
-
 	snd_soc_unregister_component(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
-
-	mt8195_afe_deinit_clock(afe);
 }
 
 static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
index e0670e0dbd5b..38594bc3f2f7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
@@ -148,6 +148,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "top_asm_h", 19),
 };
 
+static void mt8195_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	if (!afe_priv)
+		return;
+
+	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
+		cl = afe_priv->lookup[i];
+		if (!cl)
+			continue;
+
+		clk = cl->clk;
+		clk_unregister_gate(clk);
+
+		clkdev_drop(cl);
+	}
+}
+
 int mt8195_audsys_clk_register(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
@@ -188,27 +211,5 @@ int mt8195_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return 0;
-}
-
-void mt8195_audsys_clk_unregister(struct mtk_base_afe *afe)
-{
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	struct clk *clk;
-	struct clk_lookup *cl;
-	int i;
-
-	if (!afe_priv)
-		return;
-
-	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
-		cl = afe_priv->lookup[i];
-		if (!cl)
-			continue;
-
-		clk = cl->clk;
-		clk_unregister_gate(clk);
-
-		clkdev_drop(cl);
-	}
+	return devm_add_action_or_reset(afe->dev, mt8195_audsys_clk_unregister, afe);
 }
diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
index 239d31016ba7..69db2dd1c9e0 100644
--- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
+++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
@@ -10,6 +10,5 @@
 #define _MT8195_AUDSYS_CLK_H_
 
 int mt8195_audsys_clk_register(struct mtk_base_afe *afe);
-void mt8195_audsys_clk_unregister(struct mtk_base_afe *afe);
 
 #endif
-- 
2.18.0


