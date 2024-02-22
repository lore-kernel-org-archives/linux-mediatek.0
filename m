Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65758C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrfnvtEETKyA7JCfJ502ChZKTIbLBKz6Spbq7uKIgS4=; b=wfCi0zmYZSsAVjpoIdN23sojdD
	XGeCn5iI5GybsSnWYCcElTxQPqZVdNymaTJR3IAkT3DpsgeM7/I4sSA2kgQqRON5YM4BDgarJ3FLB
	VM3o984OoTdKZbC9IuMPwy6RkmuFR35mZjWEE3pTGh12WWIsWV9u0wEZSQkbh0X5/oGB0MI2kP6PF
	NbY25lUrZ34WclLWsa77PMy2OGTQRquk/w/LODBElEABO9k8Ft7CVQuvJnzCQutCYhIG6S6b0F4Gp
	oLSZb9q9nKixLQKvQnOMHVJP9B5X8l49npq0m6/HaEniAhw6fsHz2GDMFKyHEuGAh+h10OBGEt4O3
	gcHSbu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBES-00000005Skr-3O09;
	Thu, 22 Feb 2024 15:43:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBD3-00000005Rt8-2MYv;
	Thu, 22 Feb 2024 15:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D104618D5;
	Thu, 22 Feb 2024 15:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC892C433C7;
	Thu, 22 Feb 2024 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616524;
	bh=KgDcscSofoiJ56aGo6M+RgNx0sKZfbHtKRJhpGa5w9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bMRvnplWNr4x0m1A+BadooEBnvlrCUQoEAi8eDvoZ+gs9jt023jMYy/vdPgGMCIKI
	 x33RQJpFw+SxNgNabT81f1WfKax8FGGnF9UJnY9lu3j/U2X71coiWNQsTaXgfBGHWN
	 THMaQqWamo0XU3LXS/PgxKfbWZ6Cn0uYEsQb3XAE9MjtUtxVX79jxi6AwUMj8jKLuI
	 u82Q/MhXrWsx7vu0l+55IQ73dIjtFyP85ep2vjjpNpk9LnM9j2BlsKF7ZGvtnr4io2
	 psVBM4eLtJgkJ4EepXV4lNx0tVKVKwb0SK3RSNDeI419yC5tLFi4m/1f/Nu2HEDccJ
	 fN6JTn/mWt9Fw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 11/12] media: platform: mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()
Date: Thu, 22 Feb 2024 15:41:19 +0000
Message-Id: <20240222154120.16959-12-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074205_884875_CD6B37BD 
X-CRM114-Status: GOOD (  10.70  )
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

Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
instead of implementing mdp3 version.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 45 ++-----------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index b720e69b341d..c7a9f142102d 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -287,43 +287,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
 	return 0;
 }
 
-static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
-			       size_t size)
-{
-	struct device *dev;
-	dma_addr_t dma_addr;
-
-	pkt->va_base = kzalloc(size, GFP_KERNEL);
-	if (!pkt->va_base)
-		return -ENOMEM;
-
-	pkt->buf_size = size;
-	pkt->cl = (void *)client;
-
-	dev = client->chan->mbox->dev;
-	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
-				  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
-		kfree(pkt->va_base);
-		return -ENOMEM;
-	}
-
-	pkt->pa_base = dma_addr;
-
-	return 0;
-}
-
-static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
-{
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
-			 DMA_TO_DEVICE);
-	kfree(pkt->va_base);
-	pkt->va_base = NULL;
-}
-
 static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cmd *cmd;
@@ -341,7 +304,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 	atomic_dec(&mdp->job_count);
 	wake_up(&mdp->callback_wq);
 
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 	kfree(cmd->comps);
 	cmd->comps = NULL;
 	kfree(cmd);
@@ -388,7 +351,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		atomic_dec(&mdp->job_count);
 		wake_up(&mdp->callback_wq);
 
-		mdp_cmdq_pkt_destroy(&cmd->pkt);
+		cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 		kfree(cmd->comps);
 		cmd->comps = NULL;
 		kfree(cmd);
@@ -418,7 +381,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_cancel_job;
 	}
 
-	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K);
+	ret = cmdq_pkt_create(mdp->cmdq_clt, &cmd->pkt, SZ_16K);
 	if (ret)
 		goto err_free_cmd;
 
@@ -513,7 +476,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 err_free_comps:
 	kfree(comps);
 err_destroy_pkt:
-	mdp_cmdq_pkt_destroy(&cmd->pkt);
+	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
 err_free_cmd:
 	kfree(cmd);
 err_cancel_job:
-- 
2.34.1


