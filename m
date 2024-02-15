Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1941C48BC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/kGTTkBNPrJCHYkMUusHdDnrTmca1yjn2qBOierNbU=; b=G2JPcHEIe25QpjKbFEcvTvP0Se
	0614k78SmDKZb+GHAg2u9jiYLTURcCOq0le1owuROoKOphtowrEb0K/dMkj02nf0kmxwCnOlM1G+D
	n4x+7krwDWBUius2YDAxzBGqge+Rq3WmfDSw0Mes1RJWBCG07c9rxnf2aaPDAE5QEsOuKg/CCt1XX
	sSX7yUkbnEBSXjm/wezmAlFFepljfLPLbbJM8G+e65YdEuwLn4vJJ8lPAZoM5z2CCo8RNBzWhbNaE
	XtEpGL+rDU9pGOTkE/6yMQbc//suoesvwO0qpHgUEAsEqDZpESmTBv6DfGl1pVK8B4kmFGVYMxtds
	9Grvxt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxu-0000000EhiR-0nHv;
	Thu, 15 Feb 2024 00:51:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxJ-0000000EhER-3H3K;
	Thu, 15 Feb 2024 00:50:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 805F6CE249A;
	Thu, 15 Feb 2024 00:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3104C43390;
	Thu, 15 Feb 2024 00:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958222;
	bh=Nd1NDjS7PBGCZG08y1pbAZotjpMonshTocV35vaQvPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sA9i2nL58Za9xrOfR+gqXKLVZ0NKkmamnkgCtT0P5X4TWIOo6ibmYISUE7llg9e+u
	 tuCatNrBIrc6+xUJfvduqvXb2nBh0JUYUq2BWQlA4FzjD1bMRLelrwrrTWPmEpWNLK
	 bYN+RU6kIpY5wdWugtL3RfkFhThv/2LMw1ZrO2+iao7mk0JT8t4mdZ8rn9ANWMW0aI
	 eiVdeCSWceN6PO5VZSK7X77B7ZTAYKrmV+OYbPbGl1VcQv1sxoVnJ38OUBET1ZRcSX
	 ewu0//pYNU77x6grOglmUCuv+FYRUODlSfu4xvn24rvLrtDSVbEFee1m7YbLXzFmIw
	 4vO8WodC74HXw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 9/9] media: platform: mtk-mdp3: do not store struct cmdq_client in struct cmdq_pkt
Date: Thu, 15 Feb 2024 00:49:31 +0000
Message-Id: <20240215004931.3808-10-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165026_224676_98768607 
X-CRM114-Status: GOOD (  10.14  )
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

MediaTek mdp3 driver has the struct cmdq_client information, so
it's not necessary to store struct cmdq_client in struct cmdq_pkt.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index a420d492d879..6aa32ab018b4 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -298,7 +298,6 @@ static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
 		return -ENOMEM;
 
 	pkt->buf_size = size;
-	pkt->cl = (void *)client;
 
 	dev = client->chan->mbox->dev;
 	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
@@ -314,10 +313,8 @@ static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
 	return 0;
 }
 
-static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
+static void mdp_cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt)
 {
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
 	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
 			 DMA_TO_DEVICE);
 	kfree(pkt->va_base);
@@ -341,7 +338,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 	atomic_dec(&mdp->job_count);
 	wake_up(&mdp->callback_wq);
 
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	mdp_cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 	kfree(cmd->comps);
 	cmd->comps = NULL;
 	kfree(cmd);
@@ -388,7 +385,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		atomic_dec(&mdp->job_count);
 		wake_up(&mdp->callback_wq);
 
-		mdp_cmdq_pkt_destroy(&cmd->pkt);
+		mdp_cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 		kfree(cmd->comps);
 		cmd->comps = NULL;
 		kfree(cmd);
@@ -513,7 +510,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 err_free_comps:
 	kfree(comps);
 err_destroy_pkt:
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	mdp_cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 err_free_cmd:
 	kfree(cmd);
 err_cancel_job:
-- 
2.34.1


