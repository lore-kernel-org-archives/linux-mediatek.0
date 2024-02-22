Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1CFC54788
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg/ThM+TLiVE6WJbjtMjLEFTXXF/HE62xjrwPLpeINM=; b=3dS/4KaUW5M53OvWRUI9+U3WUG
	n1Vp/5KgIijQ/GkYzRbsE21Q3u8seQXW/k/BO7bHm6ZjFAE2oWW1633NC6pfRiUizj+ttNSaIuISP
	QAJUw+OjbNbNpdcjl6Oaq2X9hK5ScKKcOKnMqYlugaEXKk6D6AqK2frPfm3apUtygbLnxo7jPhC8D
	1DqgiWGtjecWo4MG/oarOr/PjLM/M5cnk1yc/0167mnsZ9c5hc7Zlbjm+hbF0u2pL6nFRNCo9E5H/
	HEvCs8zXBnCHrSTstT5V728DV0qeVWWEtZr/PO0ubeXL9NuLY7wptO0iSsE8Z+aWt6vcetQ2SMZME
	C3W98/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBEJ-00000005SgR-40h1;
	Thu, 22 Feb 2024 15:43:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBD0-00000005Rpn-1OCi;
	Thu, 22 Feb 2024 15:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDF29618E6;
	Thu, 22 Feb 2024 15:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA22C43390;
	Thu, 22 Feb 2024 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616521;
	bh=EnlDgbrVCRzMk/5nA8phcXNSHmHCcO7T/tMtxNbprvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uQUAk1TBgeFaNwoHocfLvos2nHMyvH2XhcOjildr5QnbcV2KxngArqmqNWBVDSjzG
	 Rr60cmb1GL7P5guQAhUHdGl8n17FvfS14znBK6SuHtcLOmjQsLqT2VfryOM5b/Go2k
	 qvY/6/yWtPNrJMKmilSD9hky8QFKJeipX5pfeh0Y1TbPyjeogfzMvz3m1TPJC/wIey
	 tZPcuuf0Ae6zfvyrJZVfN8knDfILwu/d/n51eDiRcZXDk7HFoOl967jQFc5CJCRXwB
	 DWUEHXISRfU+C9fjoVXBr8lpUtKNb83AGQLg31Gy3Prv41xtoGM9+GoekwBQvm5prS
	 muIVquBk9yXQA==
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
Subject: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
Date: Thu, 22 Feb 2024 15:41:18 +0000
Message-Id: <20240222154120.16959-11-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074202_525194_950FBD44 
X-CRM114-Status: GOOD (  12.03  )
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
index 6adac857a477..b720e69b341d 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		dev_err(dev, "mdp_path_config error\n");
 		goto err_free_path;
 	}
-	cmdq_pkt_finalize(&cmd->pkt);
+	cmdq_pkt_eoc(&cmd->pkt);
+	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa);
 
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


