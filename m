Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB00CFA775
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vzu2jGKMW5p2ycQXc5IwfGN36670kH/gp1OYEf22dao=; b=BZELlsAkvexv/ZtPP+Qsj3Fknf
	upS135QmV2pt6H0JLnNo9AvJ7RqLsJ1gY6SUtoMWGSJRX5kSYCHej/WNo3BVqRZ2kXuSJBN6FJlsv
	rPmk2uSfosjdcd1Jd6mScO5wrIWlFSzFNxfCmvsMvnX/nwoovkn7s1QgFd6jA/r/C03qvqzjEh96w
	t7q1Gl5Z10mzns+6xqp96ggxvNfJTk9ZKiYVoqL723uYTtODuMZ6n52zmqRkNNxintu/eN4W3EGKq
	oQY7ZnLRYkL51pqOXjRtazcrhC3QLI2/LrH08S6RvTOiL4Obqp4RolSIH43msNRABDkisK4pwkeQS
	7G78wQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swj2F-0000000ChfQ-4048;
	Fri, 04 Oct 2024 14:11:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swiix-0000000CcVW-0qCq;
	Fri, 04 Oct 2024 13:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC56FA449FB;
	Fri,  4 Oct 2024 13:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06EDC4CEC6;
	Fri,  4 Oct 2024 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728049922;
	bh=+SdP+HtNZw0N9Fp+9zSIv3zF1fEXSQajW7KJQerTMnU=;
	h=From:Date:Subject:To:Cc:From;
	b=PRBFuVhhMUH39YrvBGNlcWQ5hC0z+ZgnAZXKZvA89WljcdvE2HhgwtT23ZZTiWl6A
	 Z4XMUp5VCLqft1GVnDtr5KUeq9BHc5N869GCVQ0i7G22tnr1QRcLSFi3Nnr1M8jLxu
	 WWYCw350ZWeeTNMWkwnGBe/QlQmQcx84TY/f1bzUKhBXiTjztD5b6LkQj7f5R50GrR
	 CxBRQc4ei9QHuMipeDFcFGMOR0h7M4Yfpqc21yaeOGWcPjQzjsMLI04UL+ng2SnWk4
	 izSl5Y0lc/MR+QnZQe50sc8uA0Lk9ZNuutBXjaQm9+X8mtoghpUYt/JJl/EwsUeBlx
	 IdJ9+aUScadYw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Oct 2024 15:51:26 +0200
Subject: [PATCH net] net: airoha: Update tx cpu dma ring idx at the end of
 xmit loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-airoha-eth-7581-mapping-fix-v1-1-8e4279ab1812@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN3y/2YC/x3MPQqAMAxA4atIZgONVvy5ijhUjTaDtbQiQvHuF
 sfvDS9B5CAcYSgSBL4lyukyqCxgscbtjLJmQ6UqTUppNBJOa5Avi23TER7Ge3E7bvJgT73uaJn
 nWivIBx845/8+Tu/7ASxmv7xtAAAA
X-Change-ID: 20241004-airoha-eth-7581-mapping-fix-919481cbb340
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_065203_343886_55991D5D 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

Move the tx cpu dma ring index update out of transmit loop of
airoha_dev_xmit routine in order to not start transmitting the packet
before it is fully DMA mapped (e.g. fragmented skbs).

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Reported-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 930f180688e5caf1175481a43d243812bc07be07..2c26eb185283725ff50803437dac5143d7884b5a 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2471,10 +2471,6 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		e->dma_addr = addr;
 		e->dma_len = len;
 
-		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
-				TX_RING_CPU_IDX_MASK,
-				FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
-
 		data = skb_frag_address(frag);
 		len = skb_frag_size(frag);
 	}
@@ -2483,6 +2479,11 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	q->queued += i;
 
 	skb_tx_timestamp(skb);
+	if (!netdev_xmit_more())
+		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
+				TX_RING_CPU_IDX_MASK,
+				FIELD_PREP(TX_RING_CPU_IDX_MASK, q->head));
+
 	if (q->ndesc - q->queued < q->free_thr)
 		netif_tx_stop_queue(txq);
 

---
base-commit: 096c0fa42afa92b6ffa4e441c4c72a2f805c5a88
change-id: 20241004-airoha-eth-7581-mapping-fix-919481cbb340

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


