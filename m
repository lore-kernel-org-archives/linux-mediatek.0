Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B0EC48BEC
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 00:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWhPwNVsEg/1QoH03Vp98EnAjJm6qL80DsCwBXaI3Bk=; b=0njwk6Ta4zvtqhN+FFMz4l8vJU
	4nzVwLSvy8hxoVKt5iRbTJTQS8oJ3TWC39wVX2KRi6lcAjAAnW4h3yuM5e9lh4X3FLUirqJWTol00
	+p8GIRV8pH6aosdFSXjRnAGfN4T5XYsbNnJmf2pszMiKgXVWh3KlqPuUoG1OGuhtj4Qo5v22WaDqb
	qyVRbSF6uPCDNj9pST0fi2E/pKJ8SxskhzGYSWEtmoVWHSwU6HMOZQeXoHLSIFZsnkZfB1R3zJXF5
	vu1OiYolXnvzDc6+VtJFIx7sasJIH5bPppbh3dpQ/9KsJC26RXNpRqS7LxgjXEmEzRWJrY/VaJhUH
	Ylv1kmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxO-0000000EhKQ-3iRm;
	Thu, 15 Feb 2024 00:50:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raPxA-0000000Eh7D-2dYK;
	Thu, 15 Feb 2024 00:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 065AF6123C;
	Thu, 15 Feb 2024 00:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BD0C433F1;
	Thu, 15 Feb 2024 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707958215;
	bh=onMwpEpCvYyOOnD0Sp7hg/kBPts5AP1MXCVhCIOJE+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rdh5+2zvRc2LrJ6l7s6QBojxeuh17PxDFF//fFMjlTKe4GlzMFXuYgDn4SS4CeTvG
	 Cg0jiURwzgUCaWtz4G7vDnpGmbFm7FidT01rTbFNq12U4NTJNVhi4651ZrPc48xHL1
	 tEz/vnnU9EIK5/w7svcP7QwcnZaP8deSPze1Zd6a1g7S2dWSPwSsAXbxX8b42+ROpJ
	 bizzenBgdgrkXSQDrUEK1H6yOr9pFLNEDjKhBxuHf0+vhbK4hB56nI3tEA0SbKC6UV
	 bniF2OQ4FkCupI0d7WX3Ax/2s9V3VGLUmRVzs78rz8LR3Qb0U/i37izMdpnfUb4d9X
	 8hp6oNK359O0A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 6/9] media: platform: mtk-mdp3: drop calling cmdq_pkt_finalize()
Date: Thu, 15 Feb 2024 00:49:28 +0000
Message-Id: <20240215004931.3808-7-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215004931.3808-1-chunkuang.hu@kernel.org>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_165016_721373_674E4936 
X-CRM114-Status: GOOD (  12.82  )
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

Because client driver has the information of struct cmdq_client, so
it's not necessary to store struct cmdq_client in struct cmdq_pkt.
cmdq_pkt_finalize() use struct cmdq_client in struct cmdq_pkt, so it's
going to be abandoned. Therefore, use cmdq_pkt_eoc() and cmdq_pkt_nop()
to replace cmdq_pkt_finalize().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 6adac857a477..a420d492d879 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		dev_err(dev, "mdp_path_config error\n");
 		goto err_free_path;
 	}
-	cmdq_pkt_finalize(&cmd->pkt);
+	cmdq_pkt_eoc(&cmd->pkt);
+	cmdq_pkt_nop(&cmd->pkt, mdp->cmdq_shift_pa);
 
 	for (i = 0; i < num_comp; i++)
 		memcpy(&comps[i], path->comps[i].comp,
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 94f4ed78523b..2214744c937c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -231,6 +231,8 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_put_scp;
 	}
 
+	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
+
 	init_waitqueue_head(&mdp->callback_wq);
 	ida_init(&mdp->mdp_ida);
 	platform_set_drvdata(pdev, mdp);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 7e21d226ceb8..ed61e0bb69ee 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -83,6 +83,7 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt;
+	u8					cmdq_shift_pa;
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
-- 
2.34.1


