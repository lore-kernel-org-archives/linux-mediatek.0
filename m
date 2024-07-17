Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9569C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r/22qRq2rDyqBdtcRZwZYGTCCJdS2DXh5RxU1MqEZzE=; b=Guk28fFNfMCezz+uNO06Pj+lu3
	ghACMYg3tYTESA9eFyXpd24rPDgLpVRqz16fDxNY2N4PhSIIhXcyfagj/D4UW1K9SMCQSmuEsBFf2
	MK1qz80dEais/HTJ2Z8JTS07/Q/NEUMG1p51xw1cM2V7PCdTbDRpd/1l4cqsJsXlqXH4xo1huEm3O
	KZssLt9X7sreFL54l+8CjsgTdL4O+ZdapJAq0JaFm/b3KRQ0CCLXsc5nQtgHUBRFaYqguR47oiOEt
	PB6sTG7bOFRF+Wj0ncSTh8DPolYGmgxAb9y9Cz/3tK0+8rHAfqy9F8to9e1FAi8jlp4Rcz4lb1x9x
	0aJpNIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU0KC-0000000DCZp-0zyb;
	Wed, 17 Jul 2024 08:47:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU0Jq-0000000DCUu-1C41;
	Wed, 17 Jul 2024 08:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFCAA61662;
	Wed, 17 Jul 2024 08:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EF8C32782;
	Wed, 17 Jul 2024 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721206045;
	bh=KH7lMEIWSZuYFrVjZzqlywLaovvhMmEPrNQkmA+0g/U=;
	h=From:To:Cc:Subject:Date:From;
	b=gtMYmIOMLm+z/+2OLUgPvDzoDUhF/feWRieVSc8VELPXm95xRwbTexLkptPTBkO8e
	 gieMy09N9lfXGVnHxbYNL+9+0xuzAGap6K6eXtes1I1TiLdqw55H4u7yKYDLUWiOFC
	 Qbfu8M7wEW+EIrAcEac7KqFlq9+n0+5RiPm1rIrH3SxPxoet73xEgEmMT2YGjeEgAp
	 U3BcNh4E2qcrwPSIhD1qolfBV1yGm4vMad2Ii5AGdKGzxuk8bJRn8JFOKwPn/eLoug
	 yjD8hyYRukyGu+8BkiPRG/Njk4SrIAkNfSJSa+ImoFPAOn7D/2bYMeA5rfBFROXSA4
	 b39Ggsh6BC1lg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com
Subject: [PATCH net] net: airoha: Fix NULL pointer dereference in airoha_qdma_cleanup_rx_queue()
Date: Wed, 17 Jul 2024 10:47:19 +0200
Message-ID: <7330a41bba720c33abc039955f6172457a3a34f0.1721205981.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_014726_387529_0B49D199 
X-CRM114-Status: UNSURE (   9.24  )
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

Move page_pool_get_dma_dir() inside the while loop of
airoha_qdma_cleanup_rx_queue routine in order to avoid possible NULL
pointer dereference if airoha_qdma_init_rx_queue() fails before
properly allocating the page_pool pointer.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index cc1a69522f61..16761fde6c6c 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -1585,7 +1585,6 @@ static int airoha_qdma_init_rx_queue(struct airoha_eth *eth,
 
 static void airoha_qdma_cleanup_rx_queue(struct airoha_queue *q)
 {
-	enum dma_data_direction dir = page_pool_get_dma_dir(q->page_pool);
 	struct airoha_eth *eth = q->eth;
 
 	while (q->queued) {
@@ -1593,7 +1592,7 @@ static void airoha_qdma_cleanup_rx_queue(struct airoha_queue *q)
 		struct page *page = virt_to_head_page(e->buf);
 
 		dma_sync_single_for_cpu(eth->dev, e->dma_addr, e->dma_len,
-					dir);
+					page_pool_get_dma_dir(q->page_pool));
 		page_pool_put_full_page(q->page_pool, page, false);
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
-- 
2.45.2


