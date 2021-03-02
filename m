Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8998EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 10:14:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34DEA64F0E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 10:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34DEA64F0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E06+0mI44BbVFvlvNClW0yu2mF5HTIYeQwppVn4zudQ=; b=fWnX1uBgm3GkqtXjrTFvYvttP
	amCscH63tbr1EOLGj/59vgOrpMGP/qVN6Ma+aJwE/37X3TRK8QHyCEzfZHvArjuRM1sRgB/0cIAOg
	bDLWgVlzJmyL179NzfaNz6sdK9sUi8GfsGPuqKfAoB9yYuu8TyuNkwRbu63RNRlOkTNSZwia9gGCR
	MbwIGC6yNDaYBvYSM0CRI1upt3iG7TYTNYbkuiM7wbM+OHamldnotCb6nrcYpL9/jiDiLE9a9B2Ff
	HfTF/C9L6gI1rV68fhbYkd+o4YonMFw8cQkFM4O97V6ukXSt+GcviOQi7EPjG9xVx2yx5R/i2jB8X
	FzGE4CVfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH22Y-0000iB-3G; Tue, 02 Mar 2021 10:14:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH22P-0000a5-BC; Tue, 02 Mar 2021 10:13:58 +0000
X-UUID: ebce0d68c532474d919a9b8e1314507b-20210302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SwaCNtuiwWnMC7hh8ytVBn1dXhJLqgncDTSRCo9ebpc=; 
 b=tN/5+Pon7iEwDXlfoAI9I6/A/bobRAiqyS/QDfsO/kEyLH3NBkymmeT/SpQL6kOm5s+1uQD28Xo3eRlxJTJMUt06wQPpKBtqnmb0/qbzjoyO9694qXV9r4we61J+M7lcWu8GoGuP7rs9d1d4AWbSJPHXAp7j8UCp5MSmk4DSNJs=;
X-UUID: ebce0d68c532474d919a9b8e1314507b-20210302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 729914662; Tue, 02 Mar 2021 02:13:51 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 02:03:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 18:03:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 18:03:49 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [v2 PATCH] net: ethernet: mtk-star-emac: fix wrong unmap in RX
 handling
Date: Tue, 2 Mar 2021 18:03:45 +0800
Message-ID: <20210302100345.27982-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210302100345.27982-1-biao.huang@mediatek.com>
References: <20210302100345.27982-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_051357_618594_94425358 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: srv_heupstream@mediatek.com, biao.huang@mediatek.com,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_star_dma_unmap_rx() should unmap the dma_addr of old skb rather than
that of new skb.
Assign new_dma_addr to desc_data.dma_addr after all handling of old skb
ends to avoid unexpected receive side error.

Fixes: f96e9641e92b ("net: ethernet: mtk-star-emac: fix error path in RX handling")
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index a8641a407c06..84b3f56a9965 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1225,9 +1225,7 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
 		goto push_new_skb;
 	}
 
-	desc_data.dma_addr = new_dma_addr;
-
-	/* We can't fail anymore at this point: it's safe to unmap the skb. */
+	/* We can't fail anymore at this point: it's safe to unmap the old skb. */
 	mtk_star_dma_unmap_rx(priv, &desc_data);
 
 	skb_put(desc_data.skb, desc_data.len);
@@ -1236,6 +1234,9 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
 	desc_data.skb->dev = ndev;
 	netif_receive_skb(desc_data.skb);
 
+	/* update dma_addr for new skb */
+	desc_data.dma_addr = new_dma_addr;
+
 push_new_skb:
 	desc_data.len = skb_tailroom(new_skb);
 	desc_data.skb = new_skb;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
