Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87372D1A45A
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8gowHYbuxx6ajKeMSKdIS9xXVh4dCKY7Fuj1K/ltWI8=; b=2BqpSwQjdkUaOpWzUP2GL9W0PJ
	q8Df5qfyie1W8Idjp1Rn6pTv9W7e6mWaYfPWx8XNPgMd8NzOSCoDgtywE8R/Tt6Ee660NJbCvgko+
	iwY+I0AoUkBrLDzEcNEj4SBTOPPUn59d9HpPBgEKjr4752e8pxxAS8olxQdMCbn5yO1eiY8QhyryM
	1LzpYNj2zZQJH1laEU5IJ3/maLREzD3HTUF9A45l3CYzuK2jjaKQekjWwBwFvU6FTUzoTYdMwSQV7
	HatmTn8J8YQIaKZkAPL6xxrfAVvMZ8a9e0Q6cKHeEyxaa3uaQjUsE6tnA4Qef9i/+Nw3g9N7IjXm2
	QN02KabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szY1e-00000000sJI-2qvL;
	Sat, 12 Oct 2024 09:03:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szY0G-00000000sA0-2ZRY;
	Sat, 12 Oct 2024 09:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26EB0A403BB;
	Sat, 12 Oct 2024 09:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139C7C4CEC6;
	Sat, 12 Oct 2024 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728723694;
	bh=4MmynX/AysKkMiYdD4/GQzTG1z/a1+Cno9IDU58CJYs=;
	h=From:Date:Subject:To:Cc:From;
	b=sJyrHNWNAeSlanX6hQHbYI24lCB7g8cmmf6Cr5nG3a56lX7y8yXj6i1ovMyynAyx7
	 xG1aW4iO8GLLq/CEDRj0RUb1Xd1nXOPQtoU6vMUrQzxa4BJV2pUkdzYKK3w/3uvfBn
	 K74ZKURNCNgWK7j93kHkxjV1iJDcfcku3vzoN/AqHTcmaTn+bfFowVTtOQZdfcGcHZ
	 gdigfFiAKJfRa7he3sliMYsYOEGxLV6SKV6cSw/K6Y6QqvGRDKhOlj2ruXRzy03qNT
	 9mV8eMRrVQ1NMW8IptDKiCCfkuZGz9/nRF1UakcwTmrxXFrYsmtiBLtKn5/AesinwF
	 TkECnvVpy5FNw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 12 Oct 2024 11:01:11 +0200
Subject: [PATCH net-next v2] net: airoha: Implement BQL support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
X-B4-Tracking: v=1; b=H4sIANY6CmcC/23Myw6CMBCF4Vchs7ZmWulFV76HYaEwwETSamsaD
 em7W1m7/E9yvhUSRaYEp2aFSJkTB19D7Rro56ufSPBQGxSqFo8HFOStdlLcnovQWmljRoXWEdT
 DI9LI7w27dLVnTq8QP5ud5W/9y2QppEDT9sOgLaJx5ztFT8s+xAm6UsoXSKZoT6UAAAA=
X-Change-ID: 20240930-en7581-bql-552566f2078e
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_020136_753506_86F96161 
X-CRM114-Status: GOOD (  10.92  )
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

Introduce BQL support in the airoha_eth driver reporting to the kernel
info about tx hw DMA queues in order to avoid bufferbloat and keep the
latency small.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- simplify BQL support and rebase on top of net-next main
- Link to v1: https://lore.kernel.org/r/20240930-en7581-bql-v1-1-064cdd570068@kernel.org
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index e037f725f6d3505a8b91815ae26322f5d1b8590c..836a957aad77bec972c536567a4ee7d304ac7b52 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -1709,9 +1709,11 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 			WRITE_ONCE(desc->msg1, 0);
 
 			if (skb) {
+				u16 queue = skb_get_queue_mapping(skb);
 				struct netdev_queue *txq;
 
-				txq = netdev_get_tx_queue(skb->dev, qid);
+				txq = netdev_get_tx_queue(skb->dev, queue);
+				netdev_tx_completed_queue(txq, 1, skb->len);
 				if (netif_tx_queue_stopped(txq) &&
 				    q->ndesc - q->queued >= q->free_thr)
 					netif_tx_wake_queue(txq);
@@ -2487,7 +2489,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	q->queued += i;
 
 	skb_tx_timestamp(skb);
-	if (!netdev_xmit_more())
+	netdev_tx_sent_queue(txq, skb->len);
+
+	if (netif_xmit_stopped(txq) || !netdev_xmit_more())
 		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
 				TX_RING_CPU_IDX_MASK,
 				FIELD_PREP(TX_RING_CPU_IDX_MASK, q->head));

---
base-commit: c531f2269a53db5cf64b24baf785ccbcda52970f
change-id: 20240930-en7581-bql-552566f2078e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


