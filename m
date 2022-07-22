Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1289C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e0t9Q6XpV/VuvaKKU0/0uSeNj/n1C5tIF0M0HahBUJY=; b=i4oYwhywZVsBmS7ggiQKTeKB4p
	0KF4cXYL0S9OYnJD7MZdR7nL9igNsFudLhLdxN95bzrOpxrR8L+rTpgCZ//gcsh7XCHH0hn6iy9ms
	L7nI59NZpr/4ovdOem5gH+/Kw+12wrnyBagZVyWbHy4VEI84dYfXpr21zVT0ZYi8N9eUMs9oS5ex+
	1FQXRep/hLnF5xfQTG6IkohCF6CnkPcQctshNrJ8IEyY1dHjCpL1LVC1amvycw9ZCK4Nn2KLFtCxt
	yeg9a/DSUy/vJKU87LNTACCzPyc4wjlLCNuG22MuS0AAjb20m0gF4f5MQHnvuD5qQgbESupuxbwV8
	/uPP3jPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmk4-000WZx-Kk; Fri, 22 Jul 2022 07:06:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmk2-000WYB-DI
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 07:06:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 483A4B82746;
	Fri, 22 Jul 2022 07:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81462C341C7;
	Fri, 22 Jul 2022 07:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658473587;
	bh=XLTTjhAlQU069Q80S9sF/4wyl2wZ60rupcBZIJL+82o=;
	h=From:To:Cc:Subject:Date:From;
	b=eU/3tN8N4knUKcEZutX4jeq20xwrzGo+R5X3//rKt5rou4QiMrn2fOC65HjimauHh
	 cBve2PEIxTEcZYMDkUza2bSHfkidsGVJmqs0cKXoWnykhTFeZj+IzSsdqCS8JY3JH7
	 zyMFGVPL/5BeVb9qb56IDMwH2sviq/1Gz+kVKd8vt3sqROWHauwpMX5vpedhDs7PvW
	 IBMcQoPnU6MKF2Fios4i2ZK1atWIjKLGylkzPoBeuMj2dtySP1Wmp/a/6QFvlnQlPj
	 xfoT0iHhQ5NKeQJlrGWYxI1nACN+aaeMdDrTGPUziK6ep1749DqjU3z+Ku6djy4lVc
	 wd0L2uLVNFy0g==
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
	pablo@netfilter.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Ryder.Lee@mediatek.com,
	Evelyn.Tsai@mediatek.com,
	pvalerio@redhat.com
Subject: [PATCH v2 net-next] net: ethernet: mtk-ppe: fix traffic offload with bridged wlan
Date: Fri, 22 Jul 2022 09:06:19 +0200
Message-Id: <c79ed39af42540a6ce2cd145c4ddbcb98491630b.1658473427.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_000630_638463_D59B3AF3 
X-CRM114-Status: GOOD (  14.44  )
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

A typical flow offload scenario for OpenWrt users is routed traffic
received by the wan interface that is redirected to a wlan device
belonging to the lan bridge. Current implementation fails to
fill wdma offload info in mtk_flow_get_wdma_info() since odev device is
the local bridge. Fix the issue running dev_fill_forward_path routine in
mtk_flow_get_wdma_info in order to identify the wlan device.

Tested-by: Paolo Valerio <pvalerio@redhat.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- rebase on top of net-next master
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 30 ++++++++-----------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 5d457bc9acc1..25dc3c3aa31d 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -88,32 +88,28 @@ mtk_flow_offload_mangle_eth(const struct flow_action_entry *act, void *eth)
 static int
 mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_info *info)
 {
-	struct net_device_path_ctx ctx = {
-		.dev = dev,
-	};
-	struct net_device_path path = {};
+	struct net_device_path_stack stack;
+	struct net_device_path *path;
+	int err;
 
-	if (!ctx.dev)
+	if (!dev)
 		return -ENODEV;
 
-	memcpy(ctx.daddr, addr, sizeof(ctx.daddr));
-
 	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
 		return -1;
 
-	if (!dev->netdev_ops->ndo_fill_forward_path)
-		return -1;
-
-	if (dev->netdev_ops->ndo_fill_forward_path(&ctx, &path))
-		return -1;
+	err = dev_fill_forward_path(dev, addr, &stack);
+	if (err)
+		return err;
 
-	if (path.type != DEV_PATH_MTK_WDMA)
+	path = &stack.path[stack.num_paths - 1];
+	if (path->type != DEV_PATH_MTK_WDMA)
 		return -1;
 
-	info->wdma_idx = path.mtk_wdma.wdma_idx;
-	info->queue = path.mtk_wdma.queue;
-	info->bss = path.mtk_wdma.bss;
-	info->wcid = path.mtk_wdma.wcid;
+	info->wdma_idx = path->mtk_wdma.wdma_idx;
+	info->queue = path->mtk_wdma.queue;
+	info->bss = path->mtk_wdma.bss;
+	info->wcid = path->mtk_wdma.wcid;
 
 	return 0;
 }
-- 
2.36.1


