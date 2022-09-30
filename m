Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9919EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCeIfBYJvbHF9N/yTcdYAzolGLjNoSJfm/NyFwIg6fg=; b=HNKmxIVrFpuYXM6cUDR4IT4K8S
	wxikQ8MLohctddcCMJQ6RuxfWQwBKo0XISsYfZqDnf6o1qMyw18trohFU9iWmtZAHRevq4FtwRy1N
	moXBD97xqsPu8/Pzq9lJr4hw2TT0CiBKthOwIIJeCkQVu52AfXLRjlrXPosPRwo+PJdLkcBGMK+eZ
	LIRdE+LrvZpUivVbrpieIgc+PEveoc0C1pdDCcFLgBf254UgXO7vbr8nFWz8lKTp9I6PiCWVFGX9N
	6wAU1a9kqawXo42JivxPkZSeZb4s8KOpu6oUxVyQxkNDfg0aXa5stSuMY8msW74ouLUInAPqWIRiC
	nYdOZPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDBH-008ZQm-7n; Fri, 30 Sep 2022 10:23:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDBD-008ZO7-RF
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 10:23:42 +0000
X-UUID: bef1a75551ba46c1b44cc370920b4ea6-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VCeIfBYJvbHF9N/yTcdYAzolGLjNoSJfm/NyFwIg6fg=;
	b=lpojIz3Du4WTNvq97yMniY4UnZ8wf+AExImO969wL6oPz/dNWrrw3ywTjjmgAOVGMziuezAA0xxjudgsDjIySXsQgNvLyu1jarpVUaFuvDatRMbwUBoErn+k4/kAbA+i5OY5q+9I+IspaEcus+D4ADuJDPLyVwPmJAKMJ3nZkQA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:78dd4217-65d4-430a-bcd7-efa1ccf68191,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:78dd4217-65d4-430a-bcd7-efa1ccf68191,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:c2c39307-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:2209301823115VTNFMG1,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: bef1a75551ba46c1b44cc370920b4ea6-20220930
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1222807389; Fri, 30 Sep 2022 03:23:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 18:23:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Sep 2022 18:23:07 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v1 2/2] media: platform: mtk-mdp3: fix error handling about components clock_on
Date: Fri, 30 Sep 2022 18:23:06 +0800
Message-ID: <20220930102306.13201-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930102306.13201-1-moudy.ho@mediatek.com>
References: <20220930102306.13201-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_032339_890591_817BB1E3 
X-CRM114-Status: GOOD (  14.52  )
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
index d3eaf8884412..fe6a39315e88 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -699,12 +699,22 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
 				i, comp->type, comp->id);
-			pm_runtime_put(comp->comp_dev);
-			return ret;
+			goto err_unwind;
 		}
 	}
 
 	return 0;
+
+err_unwind:
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


