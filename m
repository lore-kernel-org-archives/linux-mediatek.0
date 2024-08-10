Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5D7C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkH6vWbpFd6dRJHI3S1xF7s/QXbJK+tXHYTSwhUw81c=; b=be9Ux8yIoZBJRDlNOB8JVfScAK
	SOg0x9qeI1goG3oVqE7PeIkqJu+6prTAI2oolDl7Mf5MjmuQZ4OCT7kt2YCYz+dpQX6+nyFQn4Y7K
	IC4BDnVJ2w65MFxGoKfRvrt+/nob4F/YLjbIzmZjFiZGebuj83QRuiByMuSIvRsiBc1s79sBhMsii
	5+lrqtwgWUb1YWat558oJaOyhEq+gF8VEZJr4h0nrK8ubIkY/yxkNPQ4gM8GquJLPXah2tgDd0nd7
	rPxcpZ4ABiceukWa0y71GFziwUPrpbdQ8FY89IjxPLcivRel++IZd9KxCtb9t8klMSMbbM0BYMQbv
	Pqx9g0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci8o-0000000DnY4-1hvU;
	Sat, 10 Aug 2024 09:12:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci6T-0000000DmHG-0NSW;
	Sat, 10 Aug 2024 09:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 840AC60AB1;
	Sat, 10 Aug 2024 09:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7D6C4AF0F;
	Sat, 10 Aug 2024 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280976;
	bh=u4qlRZ2eV0ZOdvBBZQ2siEBLpxLioWPrDZ4+vm8xMBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2iKqV1u/46W7Ll5iVnbj44tPB9aP3U/pkayBcXBilA5DSOhp6yLEOuT+oWxsym1O
	 4NRDySkxhwsDdu5ywRioQVnXTrdVBV3C/Y9RbrxxqSVTa9NM2fUPcNj7qoLniNmjFv
	 qiJwyM91x3vDEqvgnQeWE1hxIenCcLN2+2WK66Okaf8qlZbYfyZ7WESjZXsLnTdoM5
	 H0VkU8CD6zBKI4NNUP1GUf3ovM6pfwOIbsSNtUA8ax4zdaFr9ytWVPnqBdObFls1NN
	 02aPbPUh27JR+HOMNPX7lT/XKfmZGZPzz5yP7EpJ35qB99tX3kEIwJCf2V7iN8VEnN
	 K2CHc0aS1qGew==
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
Subject: [PATCH v3 3/5] media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
Date: Sat, 10 Aug 2024 09:09:16 +0000
Message-Id: <20240810090918.7457-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810090918.7457-1-chunkuang.hu@kernel.org>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_020937_234742_D6B9DDCD 
X-CRM114-Status: GOOD (  12.44  )
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

In order to have fine-grained control, use cmdq_pkt_eoc() and
cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..0cddafedbecc 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -676,7 +676,8 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		dev_err(dev, "mdp_path_config error %d\n", pp_idx);
 		goto err_free_path;
 	}
-	cmdq_pkt_finalize(&cmd->pkt);
+	cmdq_pkt_eoc(&cmd->pkt);
+	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa);
 
 	for (i = 0; i < num_comp; i++) {
 		s32 inner_id = MDP_COMP_NONE;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 37e7b985d52c..22b0aafccb85 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -314,6 +314,8 @@ static int mdp_probe(struct platform_device *pdev)
 		}
 	}
 
+	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
+
 	init_waitqueue_head(&mdp->callback_wq);
 	ida_init(&mdp->mdp_ida);
 	platform_set_drvdata(pdev, mdp);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 430251f63754..78c87c4eaba9 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -126,6 +126,7 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
+	u8					cmdq_shift_pa;
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
-- 
2.34.1


