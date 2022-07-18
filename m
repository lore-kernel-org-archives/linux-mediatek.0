Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8E1C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+F4x10IjyxretcKRx60pX8yHQOY0YFaeiJuL2+mExpo=; b=kV5Odp/SALrNAgR4mrpj/q0h1L
	pd9EyhjISsCjmcn+h2pVstf8XNQWEzSgbn2u+Cr2/6gv+4DVkMZBMWfe2pFZwmzdGHFbTTDKKrnsM
	g8eCGNMg5qBzvg0G8G9//cr7+9MO1wQRr+rywavdz6ml1XzXBvwD87JnwI5CzLqgNus6QKZzW9tYz
	iQ77V2qMvcU3x1n6a+RyKF4Zxmsn163j0uNPwTT7B+r6Mk35FxBCsFrXv/7BbtyW+zJOzFJT570wo
	2PzukHxQ07OdDmWJCFHvHjihaMomDY6V0VSWlTUO2MW7i+8P/wMa8T7w/n0ehox/sE8y8yL9B6cHt
	uE7gFUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVbw-0002rz-G0; Mon, 18 Jul 2022 18:36:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDVbt-0002qC-S8
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 18:36:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56AC4B816CF;
	Mon, 18 Jul 2022 18:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAD7C341C0;
	Mon, 18 Jul 2022 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658169407;
	bh=pbLxD1a6FhlDvxC0DWqCHHgNPbqWwkoxz5mjbtCWIro=;
	h=From:To:Cc:Subject:Date:From;
	b=sgwGW9zaXFlOIYPF/qTzr9cVcUTrxt6wk2jdzahKvyqkEMHKfyop0RuKrqTyWJJy7
	 dfEkH9ZF3FNRqzd8AH6wOLyNXs2RtjCTiYi+eicaoaUJ/vWbquvAx2JylKeUxo2FbS
	 1Jf1bIOyKWJ4VZmJ0SXs5IlupPzvcSZ/6jBdO9XpQtNrfUu+5updHHTVw4y9nDUjmC
	 5lsC9g7/MmrNIPjYZr4LC75Zs4VSxVkgUcUuMfFyLKXaObCphI8TC3fB0vvkIUOAcQ
	 6U3dyDUELbzrNbS87sl/nWwa0xueHrAubMgKUgx2NMhpPrjEzZl8O7QiAajIkDnXhl
	 qcwlib9CU9PSQ==
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
	Evelyn.Tsai@mediatek.com
Subject: [PATCH net-next] net: ethernet: mtk-ppe: fix traffic offload with bridged wlan
Date: Mon, 18 Jul 2022 20:36:39 +0200
Message-Id: <7fa3ce7e77fb579515e0a7c5a7dee60fc5999e2b.1658168627.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_113650_094878_677BE23D 
X-CRM114-Status: GOOD (  13.73  )
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 90e7dfd011c9..25dc3c3aa31d 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -88,29 +88,28 @@ mtk_flow_offload_mangle_eth(const struct flow_action_entry *act, void *eth)
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
 
-	memcpy(ctx.daddr, addr, sizeof(ctx.daddr));
+	if (!dev)
+		return -ENODEV;
 
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


