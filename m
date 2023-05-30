Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9A1C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlrhZtbxfrc35++jAF11o1f5lYhJQaGzlPdB6IuX7OM=; b=VsDEC/2k7SLIcx3/Hy/g7/u8Ac
	OwtP7LuWPB0AOgG7MtYoP1PIk/HxcAvzskCDYViTnFOMXUxkw5ARoCWhvJ9QXJdF5UT2D9PtzWAWD
	TyaJ3anurLeSr8J3EDDh4eJXhfAzlO4NwOfqjOkysVWGarOgBpja4VLealSilaPBtTbISptluu1ot
	CFAWyPUnF4qQSb3qCE4uryh64td1Zd853HPlJ2xKO0w0VtAGQkWWFHDvAUr+H88GJwhyyWkUCxgcB
	RDYSeoCn95GqYNDBslix16RWjeQTsUwgwgSesJNffgFNbV0BRj/Kc0wTcHUjAIqBO+RAJG0CDeZux
	31i1iUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tt8-00Ckdf-0Y;
	Tue, 30 May 2023 07:35:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tt4-00Ckcm-32;
	Tue, 30 May 2023 07:35:24 +0000
X-UUID: 87196dc4febc11ed83ed1395ce914268-20230530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xlrhZtbxfrc35++jAF11o1f5lYhJQaGzlPdB6IuX7OM=;
	b=LxGw87Y3I1aEAR9bJFNhj4wdOP2rhD0NUVPnKEaZkSz8hDppDTmI3e9MdvR9HNmYjaRKYObF6mWH1yO19tDZeKLFG1HVGWP0lymRKV+X2RiHGSP/+oII4xpPy8mmg3jSuATAtXgXJUuoAW08jtwpVLn+ecPqcqyuN+NnPFbQ2dE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:74c6acc5-c0f2-49fc-82cc-7ea144ca19bf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:d3706e6d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 87196dc4febc11ed83ed1395ce914268-20230530
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 610368571; Tue, 30 May 2023 00:35:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 May 2023 15:25:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 May 2023 15:25:15 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <dianders@chromium.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: mediatek: mt8188: fix use-after-free in driver remove path
Date: Tue, 30 May 2023 15:25:13 +0800
Message-ID: <20230530072514.22001-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230530072514.22001-1-trevor.wu@mediatek.com>
References: <20230530072514.22001-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_003522_987663_13AEC15D 
X-CRM114-Status: GOOD (  18.02  )
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

During mt8188_afe_init_clock(), mt8188_audsys_clk_register() was called
followed by several other devm functions. The caller of
mt8188_afe_init_clock() utilized devm_add_action_or_reset() to call
mt8188_afe_deinit_clock(). However, the order was incorrect, causing a
use-after-free issue during remove time.

At probe time, the order of calls was:
1. mt8188_audsys_clk_register
2. afe_priv->clk = devm_kcalloc
3. afe_priv->clk[i] = devm_clk_get

At remove time, the order of calls was:
1. mt8188_audsys_clk_unregister
3. free afe_priv->clk[i]
2. free afe_priv->clk

To resolve the problem, it's necessary to move devm_add_action_or_reset()
to the appropriate position so that the remove order can be 3->2->1.

Fixes: f6b026479b13 ("ASoC: mediatek: mt8188: support audio clock control")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    |  7 ---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 47 ++++++++++---------
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.h |  1 -
 5 files changed, 24 insertions(+), 36 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index 4c24d0b9e90d..e69c1bb2cb23 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -436,13 +436,6 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 	return 0;
 }
 
-void mt8188_afe_deinit_clock(void *priv)
-{
-	struct mtk_base_afe *afe = priv;
-
-	mt8188_audsys_clk_unregister(afe);
-}
-
 int mt8188_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
 {
 	int ret;
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
index 904505d10841..ec53c171c170 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
@@ -111,7 +111,6 @@ int mt8188_afe_get_default_mclk_source_by_rate(int rate);
 int mt8188_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
 int mt8188_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
 int mt8188_afe_init_clock(struct mtk_base_afe *afe);
-void mt8188_afe_deinit_clock(void *priv);
 int mt8188_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
 void mt8188_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
 int mt8188_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index c3fd32764da0..6a24b339444b 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3256,10 +3256,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "init clock error");
 
-	ret = devm_add_action_or_reset(dev, mt8188_afe_deinit_clock, (void *)afe);
-	if (ret)
-		return ret;
-
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 
 	mutex_init(&afe->irq_alloc_lock);
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index be1c53bf4729..05d6f9d78e10 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -138,6 +138,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD6(CLK_AUD_GASRC11, "aud_gasrc11", "top_asm_h", 11),
 };
 
+static void mt8188_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = (struct mtk_base_afe *)data;
+	struct mt8188_afe_private *afe_priv = afe->platform_priv;
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
 int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
@@ -179,27 +202,5 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return 0;
-}
-
-void mt8188_audsys_clk_unregister(struct mtk_base_afe *afe)
-{
-	struct mt8188_afe_private *afe_priv = afe->platform_priv;
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
+	return devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
 }
diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
index 6c5f463ad7e4..45b0948c4a06 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.h
@@ -10,6 +10,5 @@
 #define _MT8188_AUDSYS_CLK_H_
 
 int mt8188_audsys_clk_register(struct mtk_base_afe *afe);
-void mt8188_audsys_clk_unregister(struct mtk_base_afe *afe);
 
 #endif
-- 
2.18.0


