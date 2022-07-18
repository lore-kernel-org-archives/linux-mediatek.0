Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f64XmOlLmWc7wjuiUy/v9nGPLNWcvDaK8/nEULfNNXc=; b=creWgittKSPj5yMoIRJg0H5kEP
	V5t2MB81pVczIE1R5mHYZU+ScOQ4c5TWHUXGtmnZszGPFGaI8Vpr+HZcdlXzqJtxZx35+Urnue9Xi
	tTPNV0NtHHeDKB5iliNrW7S7zUV4oGTAlh3XI8b55O7rKj4NXb4mkGsxc8DedfThAX6CCRAKZlQ1J
	ni0OGaC2UYFydE0/J9Y95xTw8G9NcutSrWuSSuD6+9g6/0SDbO0XKrsM4GMFBsxc9VrvCXnTFi/S7
	iNtVj1zrZUN1a3qeVn0IPbaWLX+3/39nR0jC0Qz3AaxruASkV7IeKvxCJ2mLjQ+dE02fxOqKJo8Is
	cEwVFZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNQh-00CGjR-SR; Mon, 18 Jul 2022 09:52:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNQe-00CGdf-LY
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 09:52:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D2224CE1284;
	Mon, 18 Jul 2022 09:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918C2C341C0;
	Mon, 18 Jul 2022 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658137948;
	bh=FvJ30zIBe6teYhvvRTO4Y1PlGza4yd1K3IFdjppMF/g=;
	h=From:To:Cc:Subject:Date:From;
	b=JElPX3qUMrDlcb6A9YI1RPl+F9iekDAlhF0N45C7pFYxei/D/jQWUbYOHUgnCGHYP
	 9MJI8Ec9PVbzCFg2YYGLGp0cl8NeY5GFVBVwe0foaY2kpGeR5PxKjoV9WyVxAaW1Ce
	 CxbBVVi1Y4rND+0Vu8ToulFB67N9nyn4w+BPgRh3HooP1O+exY4pnTEmgpg4KqXxmO
	 2JToIG912eVl0z3vXDxJydwUVA842soi0bkvqJ3cVGvnMjzZdIe7SPxuwxxwUTSrTE
	 dnYyx8He6jQm10rRjcsKhXeJljk43ZMu/Ki5lfvdGEYddmLWV8bct1eBjz2Uv5xco7
	 7Hgy5f9j7LspA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com
Subject: [PATCH net] net: ethernet: mtk_ppe: fix possible NULL pointer dereference in mtk_flow_get_wdma_info
Date: Mon, 18 Jul 2022 11:51:53 +0200
Message-Id: <4e1685bc4976e21e364055f6bee86261f8f9ee93.1658137753.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_025241_008421_55F0EE81 
X-CRM114-Status: UNSURE (   9.11  )
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

odev pointer can be NULL in mtk_flow_offload_replace routine according
to the flower action rules. Fix possible NULL pointer dereference in
mtk_flow_get_wdma_info.

Fixes: a333215e10cb5 ("net: ethernet: mtk_eth_soc: implement flow offloading to WED devices")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 90e7dfd011c9..5d457bc9acc1 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -93,6 +93,9 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
 	};
 	struct net_device_path path = {};
 
+	if (!ctx.dev)
+		return -ENODEV;
+
 	memcpy(ctx.daddr, addr, sizeof(ctx.daddr));
 
 	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
-- 
2.36.1


