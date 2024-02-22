Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9373AC54788
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AqcDnRl7iouMRyjBtEQhyEfZKzO3Bq9O+oha54W/Ek=; b=PPJLnu2CrrcIRacS7JWZ6gF6VW
	NEharLQbUy3758QziKdGVo05j5ZmiACg8Gcw+e0Gv8VL5NI5gsw3rUFKsynBTO6eu4xnd5cKRU+tD
	0Jm48KJq498DrGaM9HK57jOOeFbQONSMYsLvsJoRAox1RYZX/xxi2SzVmOtodFIWevublwPl8OPeD
	G9A2QyNhtD9PJryn9P/yvOH0NthTa1deKP1WLB0M2z7UJRZDuJ1JyXAhU9FR9poRYhgswACMAvbUy
	69lsj9DxYSYqj+gSTi7Q6cj1aLCLQxZN6ujstu8Jy+6d1f3Jvnp1YvdkJnoLq8SpbH4xAe7Gm5drH
	A3l2K/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBEd-00000005Sqa-3pJb;
	Thu, 22 Feb 2024 15:43:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBD6-00000005RvG-3eLM;
	Thu, 22 Feb 2024 15:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59D7A618D5;
	Thu, 22 Feb 2024 15:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307CBC433F1;
	Thu, 22 Feb 2024 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616528;
	bh=KO0UKLqm+OddAhcTdqHcm9JrDeUZKFWO1dn/YTdiCjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ULvRevFmAJDU77CXRU8vM7MQqLlnOOa+4MS6HSmJUK1Dv3q5StBZqUarVmP1cNx/s
	 NPOPZz6LnWNa5c4SE/6hHkp7Ph+8W10fK7lSZoAad6b6MsKKFoWxNxxunTGmNHN7MJ
	 1e15LcfeelpJqpw5z6ME5jy9sUOsDeNj/r2x+YuH3bL7pehvhKcB/s6Ct8J7L+AQ7h
	 7REHqiFQB5M/nnabCq1Ef5H733QyWF27OeHuZE3GuudfYe2NVK1JW1GOVjArfOQRBs
	 tRY0ceNI+8LI/Bsg3op9OFroEYzKfSiwGTvtVBhG1nd/XN6D4Bou9doj+WPlj+XK3z
	 jD+HeaPMqs6CQ==
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
Subject: [PATCH v2 12/12] soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function
Date: Thu, 22 Feb 2024 15:41:20 +0000
Message-Id: <20240222154120.16959-13-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074208_978993_C76A77BE 
X-CRM114-Status: GOOD (  11.13  )
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
 drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ----------------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 13 -------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 1a1f1b260a06..d8fe98338bf2 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -414,26 +414,4 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_eoc);
 
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	struct cmdq_instruction inst = { {0} };
-	int err;
-
-	/* insert EOC and generate IRQ for each command iteration */
-	inst.op = CMDQ_CODE_EOC;
-	inst.value = CMDQ_EOC_IRQ_EN;
-	err = cmdq_pkt_append_command(pkt, inst);
-	if (err < 0)
-		return err;
-
-	/* JUMP to end */
-	inst.op = CMDQ_CODE_JUMP;
-	inst.value = CMDQ_JUMP_PASS >>
-		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
-	err = cmdq_pkt_append_command(pkt, inst);
-
-	return err;
-}
-EXPORT_SYMBOL(cmdq_pkt_finalize);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index d9d0ee5ecb7a..6bdb9c0d6a29 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -291,14 +291,6 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
  */
 int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- */
-int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
-
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -409,11 +401,6 @@ static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1


