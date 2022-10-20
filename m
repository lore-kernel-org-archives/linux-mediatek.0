Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AE4C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu8CkHwHdOQOx7g9RjxSew+cd3IBxJ5lzu2JmyM7sys=; b=cfmwzbv0Xguy3RI2wTv4OxQ5p3
	T4D1/6AHnkhcw9GTDWhF1PlwFUj93AvJtQUDs/lmeR/k4hDedB+cleBYrWbYjg+83rGzvk4Xojof8
	CW9ZekyuO3dSYrsi6GFblyln9oZAhMHOwuJ6OeRSuYiSrSaHxzFzEcefXyY+axcwwQzGIOhYtuNqu
	96IrFSolbzsHTJwJ0+aVEgNRSoEl4RGvJfoBhpdAudhhw9og3K3gmfJqztF7XW7DyevvUfo6C2iaA
	qpnkOS3ucTvLCDyhzeo5xvm2WTHuCWKnnae/XGFl1ePyrCnQAUE3MYNInelFQAio3RiTYzCp2ZM4D
	h8BmDWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPpD-00BaQt-BU; Thu, 20 Oct 2022 07:18:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPp9-00BaPF-Am
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 07:18:40 +0000
X-UUID: 90b5bf5ea6dd409f87e1a81ece61bf0d-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Nu8CkHwHdOQOx7g9RjxSew+cd3IBxJ5lzu2JmyM7sys=;
	b=phAgXv7GnpmYWnKoLipNW/je0X4bJyaPQwZz5czIkl0T2j8AUHsWDFIAEFpLHRZwlcFUV5eeSteYAIXojKe1lPaH6Hi5h9FFlu2OQO2GGxYtWSAt6Jvweqzj77Uu1QD8feFrWVPnY0JSnQLIWm8MaqI8G+isKPBypnDrthoVOCI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:24f77798-53b1-4c0f-9261-13df77773692,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:a6d264a3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 90b5bf5ea6dd409f87e1a81ece61bf0d-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 541881208; Thu, 20 Oct 2022 00:18:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 15:18:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:18:02 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 2/3] media: platform: mtk-mdp3: fix error handling about components clock_on
Date: Thu, 20 Oct 2022 15:17:59 +0800
Message-ID: <20221020071800.20487-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221020071800.20487-1-moudy.ho@mediatek.com>
References: <20221020071800.20487-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_001839_392940_78F63BB9 
X-CRM114-Status: GOOD (  15.07  )
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

Add goto statement in mdp_comp_clock_on() to avoid error code not being
propagated or returning positive values.
This change also performs a well-timed clock_off when an error occurs, and
reduces unnecessary error logging in mdp_cmdq_send().

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  4 +---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24 ++++++++++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index e194dec8050a..124c1b96e96b 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -433,10 +433,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	cmd->mdp_ctx = param->mdp_ctx;
 
 	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd->num_comps);
-	if (ret) {
-		dev_err(dev, "comp %d failed to enable clock!\n", ret);
+	if (ret)
 		goto err_free_path;
-	}
 
 	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
 				   cmd->pkt.pa_base, cmd->pkt.cmd_buf_size,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index d3eaf8884412..7bc05f42a23c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -699,12 +699,22 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
 				i, comp->type, comp->id);
-			pm_runtime_put(comp->comp_dev);
-			return ret;
+			goto err_revert;
 		}
 	}
 
 	return 0;
+
+err_revert:
+	while (--i >= 0) {
+		if (IS_ERR_OR_NULL(comp->clks[i]))
+			continue;
+		clk_disable_unprepare(comp->clks[i]);
+	}
+	if (comp->comp_dev)
+		pm_runtime_put_sync(comp->comp_dev);
+
+	return ret;
 }
 
 void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
@@ -723,11 +733,13 @@ void mdp_comp_clock_off(struct device *dev, struct mdp_comp *comp)
 
 int mdp_comp_clocks_on(struct device *dev, struct mdp_comp *comps, int num)
 {
-	int i;
+	int i, ret;
 
-	for (i = 0; i < num; i++)
-		if (mdp_comp_clock_on(dev, &comps[i]) != 0)
-			return ++i;
+	for (i = 0; i < num; i++) {
+		ret = mdp_comp_clock_on(dev, &comps[i]);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.18.0


