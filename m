Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41592C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 23:28:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9FB60E9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 23:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC9FB60E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YuQ+K0CIDc0zbejzvSvFcnUYOeaxcrPbR/1PEKuyiLw=; b=d56XZwZWxRE+id
	wYpxJ2jtsoNKwDYpXisE/WhbzqbrZXcJeWECC3s+A6MNiEzCB2WQbvDSgDC43/D/Mj5X8dCi2i5Rr
	4Nmx2C+7KSQNw9pOJIwVHO+olzR1WyttzfmHw/MBELwudTzFBEuITDsAi7PDzybj63KKui0cjfxjh
	rjk78ajMgB5TNPWxGD4DN0cZrvs1dzWvNJNiqPsamwTW1azOL7JuPlqxH9j1jAT6KPBmHcvLjKlUB
	rcTuCVtwSZcca5oGsIm34pHOWV2mkIp9QALS6K4fUiEcTBha4XM+pnyiqbFFAYprGDwjaRAvS1+Ux
	rthGWakCvJfhU4jy3MeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQeJg-00A41d-13; Wed, 15 Sep 2021 23:27:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQeJS-00A40G-Uz; Wed, 15 Sep 2021 23:27:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55973610D1;
 Wed, 15 Sep 2021 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631748451;
 bh=/pHZKjT+pK/1LLZ5p5KaN2fpNBbhL7onpG139zCfXuk=;
 h=From:To:Cc:Subject:Date:From;
 b=P2mqL6E1pIgWqMQjOc7xJuwwcb6dp92WJ/J3fSUNbG1pYk1UuHKBwNAKxB81LxnvN
 84m5OYztHBF+jpAQJ5kVIeoRB59Le+iN1uOJmMFu6zlNtllK7lUs9wGaS1W+J/3jZz
 NcISMfDzNI/TQ56d3N7RM3D+amafIsLM5rIbGcNsIRdzbXrQQMp+0FZLhEODibttiJ
 LLwdP3VwDcLyCCdNolLz9MrboDxk9ezePhoEhMxbTTpjpwl6C08YMal2CcU8hUMhJa
 kDdSbqtnYalH21wtKfiMy33dl0AffYS9P94OuhjfkSkdx0oy38/daVEqBXwkfQQaPW
 lwEc92n/qX/fw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] soc: mediatek: cmdq: Use mailbox rx_callback instead of
 cmdq_task_cb
Date: Thu, 16 Sep 2021 07:27:22 +0800
Message-Id: <20210915232722.10031-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_162735_070631_007146EA 
X-CRM114-Status: GOOD (  12.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

rx_callback is a standard mailbox callback mechanism and could cover the
function of proprietary cmdq_task_cb, so use the standard one instead of
the proprietary one. Client has changed to use the standard callback
machanism and sync dma buffer in client driver, so remove the proprietary
callback in cmdq helper.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 25 +------------------------
 include/linux/soc/mediatek/mtk-cmdq.h  |  5 +----
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 3c8e4212d941..c1837a468267 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -425,34 +425,11 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
-static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
-{
-	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
-	struct cmdq_task_cb *cb = &pkt->cb;
-	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
-
-	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
-				pkt->cmd_buf_size, DMA_TO_DEVICE);
-	if (cb->cb) {
-		data.data = cb->data;
-		cb->cb(data);
-	}
-}
-
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
-			 void *data)
+int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
 {
 	int err;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	pkt->cb.cb = cb;
-	pkt->cb.data = data;
-	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
-	pkt->async_cb.data = pkt;
-
-	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
-				   pkt->cmd_buf_size, DMA_TO_DEVICE);
-
 	err = mbox_send_message(client->chan, pkt);
 	if (err < 0)
 		return err;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index ac6b5f3cba95..2b498f4f3946 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -268,8 +268,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
  * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
  *                          packet and call back at the end of done packet
  * @pkt:	the CMDQ packet
- * @cb:		called at the end of done packet
- * @data:	this data will pass back to cb
  *
  * Return: 0 for success; else the error code is returned
  *
@@ -277,7 +275,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
  * at the end of done packet. Note that this is an ASYNC function. When the
  * function returned, it may or may not be finished.
  */
-int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
-			 void *data);
+int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
