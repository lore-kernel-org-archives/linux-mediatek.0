Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC933C48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gDlZsYzSYffdtx1la/FNhRlTDlkb5YIvVty12LIpcE=; b=ySGHLBUhhSC4x1xhqBcLzTPi4F
	TYt3VN9NJ7Jnff6MBsqqTsVGm8UvyVZwuT2pYn8rqUNU5Qvk5fQ+Q76frH3Srh2W9tPJx6CtZpZ2v
	Jk4ICFyV2YIk94H6Y13Wei3Ro9WlWX+ADvX8bViEEzDBSJwRnXjUveh0HA05Mnq6AtuY+l3logcfz
	CGv9bB3H5ZF+AN1+j2U6FkFNNGNq60KwD1dCvLTSTUX5VPNI/SzPvtI/UM486U8Qr6+VtOd5UOPgR
	nWH3sN4fS3BY81pS+aXD0/0noA7CWdAMGJG2uplILXT+TAfJMBYFo3p9L58vy+b+5lMC9PMQcayWX
	GzbdS1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBDc-00000005SFH-10ll;
	Thu, 22 Feb 2024 15:42:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBCn-00000005Rd4-0TyY;
	Thu, 22 Feb 2024 15:41:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 813DE618F5;
	Thu, 22 Feb 2024 15:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A070C43394;
	Thu, 22 Feb 2024 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616508;
	bh=nGIP2vJqkcuTspXXlk6nKjt5v1e19Z7ObipqHsmxyZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jqhMuhuMr3ZVz+g+vLndCqRLYsyQZ4IinHR1grM3SGkXk45xdHov7i6pbWL1tNzC7
	 ytz8QU3K6Q8kVwdoQJpx01oWPHIIQ8S3+lz9k1QGQ1qhy9Xz+chv3XLLm+pq4YUA2z
	 7m9plYDKkAc53EjNpO6qtn2WsZJBIYtB58RkgZ5cW8ouNZRjR7aOCVCs5iB8/lyGEq
	 1sp8GncUj0cT5w2oga4GHKDdONNXrwk2yZtsKNlEht08xZtyjjwZLbN2WyQNTugeN5
	 TriCyLboxKdX/bgFn6GItjoW3pQUoEupiVACgnfU+CtbJBYQ5kbqA5oN31Fi4/SAG4
	 y0fKqeK49d0ZA==
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
Subject: [PATCH v2 06/12] soc: mediatek: cmdq: Remove cmdq_pkt_flush_async() helper function
Date: Thu, 22 Feb 2024 15:41:14 +0000
Message-Id: <20240222154120.16959-7-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222154120.16959-1-chunkuang.hu@kernel.org>
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_074149_463285_6DED172C 
X-CRM114-Status: GOOD (  11.58  )
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

cmdq_pkt_flush_async() is not used by all client drivers (MediaTek
drm driver and MediaTek mdp3 driver), so remove it.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 15 ---------------
 include/linux/soc/mediatek/mtk-cmdq.h  | 18 ------------------
 2 files changed, 33 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 766dbafaef62..bbe41302210a 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -446,19 +446,4 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
-{
-	int err;
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	err = mbox_send_message(client->chan, pkt);
-	if (err < 0)
-		return err;
-	/* We can send next packet immediately, so just call txdone. */
-	mbox_client_txdone(client->chan, 0);
-
-	return 0;
-}
-EXPORT_SYMBOL(cmdq_pkt_flush_async);
-
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 45110494ee9d..f82e789550ae 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -297,19 +297,6 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
-/**
- * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
- *                          packet and call back at the end of done packet
- * @pkt:	the CMDQ packet
- *
- * Return: 0 for success; else the error code is returned
- *
- * Trigger CMDQ to asynchronously execute the CMDQ packet and call back
- * at the end of done packet. Note that this is an ASYNC function. When the
- * function returned, it may or may not be finished.
- */
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
-
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -425,11 +412,6 @@ static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
-static inline int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
-{
-	return -EINVAL;
-}
-
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.34.1


