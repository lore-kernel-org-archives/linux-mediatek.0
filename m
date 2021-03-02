Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23E4C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:37:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B84601FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B84601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/tvydeOH4T12zdhiK5wx1QSqhjD7e6uvqerPEZQhBxE=; b=zSaIh8WqnzFuOxjZp4zxF/Hrx4
	bSjnR8Qx6dBhwX7hAbs4v4xBlxbh2kCUJGFDwwD+IUzRjjLJzAc2V24QlMGhkf6gQ4H4H4S/B5j4y
	AM9QgRMJp78gpny0+uZpDXtxMqE4jIwbNp4aF26Sx5woLj/dg8mws1rZeUtdLBJY3jJuB3wIxzrrn
	udVvTuezFoO1fvtXxL7oKwYNzYPuYy/4wjBWKbMbwNIkaOsaV7rbpEOzxb++jlqvsdjvAfHW9d/Ml
	rpVBiM6bMkKRlR+fWls4lySlotl7bl0fUxuAWizqc33jESGh2UI4vt4n2gOJOwT7sxDlJBmM/of2X
	1bqQs/4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGvr3-0000by-Ir; Tue, 02 Mar 2021 03:37:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGvr1-0000bH-26; Tue, 02 Mar 2021 03:37:48 +0000
X-UUID: 8a2b2b4d7e3f4a95a85dfe6b5b5abf71-20210301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9Ntw8F9+mo7xplZAEM7zSGaNwYNi9/APmgD08lWfC7o=; 
 b=A8Li1SWvwbjsQ3a7tWnw3oFv1kTlBN6o4rMEjcU3gY9TxfYPCRQXmYuoOKzU0kfHCTRyaTFCtmwxrG/e9LkEs1SNuHS+V90GHQpCw8OXdwEtVXGXyvpa/voyOIjVRtNeQ2hsC9PDoqypZGZ7WgEZij3o2jPp9vriTtQc5h5jSOo=;
X-UUID: 8a2b2b4d7e3f4a95a85dfe6b5b5abf71-20210301
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2140865027; Mon, 01 Mar 2021 19:33:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Mar 2021 19:33:32 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 11:33:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 11:33:28 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] net: ethernet: mtk-star-emac: fix wrong unmap in RX handling
Date: Tue, 2 Mar 2021 11:33:23 +0800
Message-ID: <20210302033323.25830-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_223747_309192_7E07CFCD 
X-CRM114-Status: GOOD (  11.43  )
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
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index a8641a407c06..96d2891f1675 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1225,8 +1225,6 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
 		goto push_new_skb;
 	}
 
-	desc_data.dma_addr = new_dma_addr;
-
 	/* We can't fail anymore at this point: it's safe to unmap the skb. */
 	mtk_star_dma_unmap_rx(priv, &desc_data);
 
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
