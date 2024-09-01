Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B664EC54FC6
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Sep 2024 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czMLRZ4jTEhbrB9Z64DqHkpmmy+v+yicLqiw4wwgoCw=; b=e7ecLznZJ4ZzAcM+p7DORA6iRq
	yRyh5wlHDl+uaoM5ibiQljdA6PbCK0ahNU8HJKPYWNX1yKCoCQtD2cosIhYudnwyJZucG7C+LoP0E
	2wEqAFnOeUyNr52mtKgDW6xKNjN2SwkrWWevlJSs1BkhwiLh98jla3ifaK7+X75I145LRGTi9D7Oq
	wcBu1rcwc6QumQvMGQBIarBcdno0yyVE6w97450IzGYAceX4/Buzc4ojdJld3Sx2GjZkuy12C/PYO
	8Zi+TSBsHlU4o+YZzZ0k+HxcoxuAsNzr1w4BLeO5fDrgEOKpWePY/mNevlvbWmJUg8I2TS2Qc9g4P
	7PnBUm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sklfS-0000000BnFm-1Od6;
	Sun, 01 Sep 2024 14:35:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sklde-0000000BmmJ-3ubw;
	Sun, 01 Sep 2024 14:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5CCB5C56A5;
	Sun,  1 Sep 2024 14:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0D5C4CECD;
	Sun,  1 Sep 2024 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725201190;
	bh=i7Lw4IfBoqo0kG80MnG3Ijy3VYTPrwyYdPOoj92o7xI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FUAKzuVZelACgDJySU4gn3P3OQd5uhWOgy0tz85SCcnN1WeELxJMJXS+GnDHsWRxt
	 wRwi3P5gQkg+4eeRA3YmF+2L2Qea+UaXnUQoNwszDH98VwVoODtZ/lC+gmr9Cn1m7v
	 vIDFgw4+NBLPBrY95Vlx89SKvOrlzHtKzB6x/cbeiEQvdAUkA/+y8GcV6pjlE7WQLR
	 C4tnOxFUXDw6vAQ5IHR4LYDboZs+tdwLf6Yw/bRLuuUPaO1Sdd1aO7buaO5w0WKhVX
	 7gaYRi7Lp8anN1wUlal3HHGgT8XGni8h2NYnHWF76yEdpCltNkDY5FNghtiRH+JPgH
	 WmdiGN68hKj0w==
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
Subject: [PATCH v4 1/3] media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
Date: Sun,  1 Sep 2024 14:32:57 +0000
Message-Id: <20240901143259.16849-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240901143259.16849-1-chunkuang.hu@kernel.org>
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_073311_054053_8FF4C82B 
X-CRM114-Status: GOOD (  12.85  )
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
index ea2ea119dd2a..ef5dade35fd3 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -676,7 +676,8 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		dev_err(dev, "mdp_path_config error %d\n", pp_idx);
 		goto err_free_path;
 	}
-	cmdq_pkt_finalize(&cmd->pkt);
+	cmdq_pkt_eoc(&cmd->pkt);
+	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]);
 
 	for (i = 0; i < num_comp; i++) {
 		s32 inner_id = MDP_COMP_NONE;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 37e7b985d52c..40623c1980bf 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -312,6 +312,8 @@ static int mdp_probe(struct platform_device *pdev)
 			ret = PTR_ERR(mdp->cmdq_clt[i]);
 			goto err_mbox_destroy;
 		}
+
+		mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
 	}
 
 	init_waitqueue_head(&mdp->callback_wq);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 430251f63754..05cade1d098e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -126,6 +126,7 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
+	u8					cmdq_shift_pa[MDP_PP_MAX];
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
-- 
2.34.1


