Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37967C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 07:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09fqyA4k2RD8tjkCxo1wu/f6mjLilCjhB+OIWkZxcCk=; b=O7irP6eq3zTqO4xJL3cx9USeqQ
	W6MQz/R5pz11bykEqmCqNMAUaCvz9+Eohv8QP27AjIwL2swSvXH7ViNb9yJjusCo9p8BDTk9T/cTz
	n+fF43SZvNuEHJ+xqMCMi4xNa6aN0xzBQiveMPWdLBfmOjZ3FybHYz2IwOaw/XuqSJ/cpY6LSF98p
	FbTM+AbbvszU3H7uaaYHt3AKY3wu/z+cMSvIxq7kGAq8cEVwHS/VhJYgiQUQZsNcIXvo3qJfjfILd
	vFJm976c7KpsOVc7J5/C1ut7L+eg6gPUTQx5Do5J0zw+mmxa3qt8jZDT3NWOil1YgpwKfHwVku/J3
	uOgqloYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPoq-00BaDk-I9; Thu, 20 Oct 2022 07:18:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olPol-00Ba9Z-65
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 07:18:18 +0000
X-UUID: 1120a7d754794056a68a00d6f34911b9-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=09fqyA4k2RD8tjkCxo1wu/f6mjLilCjhB+OIWkZxcCk=;
	b=Tec+wAEfv8p3MEkYzmgLDReTECBLfBRftse0fFBSnUSrGm3VBKvSuVaS5KrPXFuVNi+Zv1PqLyN/cXLSn0JP+EPQq1PFACe8aEPf455SlCq8rQvq0FthvZ/0uAYZcidhqyxDY97Q5e/W/t8zUDJn9aHjXXwahB++1NTMRxCttLI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:a565c521-1ded-42a2-a2bb-c53006ea2db3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:724fe0ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1120a7d754794056a68a00d6f34911b9-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 4118670; Thu, 20 Oct 2022 00:18:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 15:18:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:18:01 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 1/3] media: platform: mtk-mdp3: fix error handling in mdp_cmdq_send()
Date: Thu, 20 Oct 2022 15:17:58 +0800
Message-ID: <20221020071800.20487-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221020071800.20487-1-moudy.ho@mediatek.com>
References: <20221020071800.20487-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_001815_269495_E5FF09F6 
X-CRM114-Status: GOOD (  13.28  )
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

Increase and refine the goto label in mdp_cmdq_send() to avoid
double free and facilitate traceability.
Also, remove redundant work queue event in blocking function
mdp_cmdq_send().

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 47 ++++++++++---------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 86c054600a08..e194dec8050a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -252,10 +252,9 @@ static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
 	dma_addr_t dma_addr;
 
 	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base) {
-		kfree(pkt);
+	if (!pkt->va_base)
 		return -ENOMEM;
-	}
+
 	pkt->buf_size = size;
 	pkt->cl = (void *)client;
 
@@ -368,25 +367,30 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
 	if (!cmd) {
 		ret = -ENOMEM;
-		goto err_cmdq_data;
+		goto err_cancel_job;
 	}
 
-	if (mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K)) {
-		ret = -ENOMEM;
-		goto err_cmdq_data;
-	}
+	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K);
+	if (ret)
+		goto err_free_cmd;
 
 	comps = kcalloc(param->config->num_components, sizeof(*comps),
 			GFP_KERNEL);
 	if (!comps) {
 		ret = -ENOMEM;
-		goto err_cmdq_data;
+		goto err_destroy_pkt;
 	}
 
 	path = kzalloc(sizeof(*path), GFP_KERNEL);
 	if (!path) {
 		ret = -ENOMEM;
-		goto err_cmdq_data;
+		goto err_free_comps;
+	}
+
+	ret = mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
+	if (ret) {
+		dev_err(dev, "Fail to enable mutex clk\n");
+		goto err_free_path;
 	}
 
 	path->mdp_dev = mdp;
@@ -406,15 +410,13 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	ret = mdp_path_ctx_init(mdp, path);
 	if (ret) {
 		dev_err(dev, "mdp_path_ctx_init error\n");
-		goto err_cmdq_data;
+		goto err_free_path;
 	}
 
-	mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
-
 	ret = mdp_path_config(mdp, cmd, path);
 	if (ret) {
 		dev_err(dev, "mdp_path_config error\n");
-		goto err_cmdq_data;
+		goto err_free_path;
 	}
 	cmdq_pkt_finalize(&cmd->pkt);
 
@@ -433,7 +435,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	ret = mdp_comp_clocks_on(&mdp->pdev->dev, cmd->comps, cmd->num_comps);
 	if (ret) {
 		dev_err(dev, "comp %d failed to enable clock!\n", ret);
-		goto err_clock_off;
+		goto err_free_path;
 	}
 
 	dma_sync_single_for_device(mdp->cmdq_clt->chan->mbox->dev,
@@ -450,17 +452,20 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	return 0;
 
 err_clock_off:
-	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
-err_cmdq_data:
+err_free_path:
+	mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
 	kfree(path);
-	atomic_dec(&mdp->job_count);
-	wake_up(&mdp->callback_wq);
-	if (cmd && cmd->pkt.buf_size > 0)
-		mdp_cmdq_pkt_destroy(&cmd->pkt);
+err_free_comps:
 	kfree(comps);
+err_destroy_pkt:
+	mdp_cmdq_pkt_destroy(&cmd->pkt);
+err_free_cmd:
 	kfree(cmd);
+err_cancel_job:
+	atomic_dec(&mdp->job_count);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mdp_cmdq_send);
-- 
2.18.0


