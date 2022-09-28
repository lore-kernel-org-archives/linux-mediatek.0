Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE2EC07E9D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+vcQPBkBeQ7JaBifSpdE8pOq4VaZyWMON9r7U4nkSnY=; b=xooSh/svmVo5zm9PNwrjWMaUH3
	Z42Xlq82tOTBbOLBTeoefEBx5lmzAKzcK5oOvF7+lkn5eQYC0cXvzSVEjK5YnYsKnZ9+1pxARvyrn
	efnt4iwR9mhPB+fQSHPeKgVQXZXFfQoCe9+Y6b76NAeuBdv0bijvn3tDObCQmcSNI2N9p9ZFd/t0l
	he7A7p7hbmO3adS/MS+iqeURg5DCYVhq4IhMTdItMnu1CvLOND7xHj2eqWMSMKZcukuITfuHVef7q
	NQ/y8oKZ5EitP7Yu2y9bZoUcfursm9NDCH790ZyVGKike0vi/VKAD+OVjrNKL2My4eqj2Rpb8STj9
	YumrxfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odLpQ-00DQzw-A6; Wed, 28 Sep 2022 01:25:36 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odLpN-00DQzb-MM
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 01:25:35 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1odLpE-0001wU-0j;
	Wed, 28 Sep 2022 03:25:24 +0200
Date: Wed, 28 Sep 2022 02:25:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sujuan Chen <sujuan.chen@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>,
	Thomas =?iso-8859-1?Q?H=FChn?= <thomas.huehn@hs-nordhausen.de>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear
Message-ID: <YzOie0dkiQ43EPnu@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_182533_766481_4FE8ADE6 
X-CRM114-Status: GOOD (  10.20  )
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

Setting ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear
routine as done by commit 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc:
fix typo in __mtk_foe_entry_clear") breaks flow offloading, at least
on older MTK_NETSYS_V1 SoCs; OpenWrt users have confirmed the bug on
MT7622 and MT7621 systems.
Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.

Tested on MT7622 (Linksys E8450) and MT7986 (BananaPi BPI-R3).

Suggested-by: Felix Fietkau <nbd@nbd.name>
Fixes: 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear")
Fixes: 33fc42de33278 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 887f430734f747..ae00e572390d7b 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -442,7 +442,7 @@ __mtk_foe_entry_clear(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 		struct mtk_foe_entry *hwe = mtk_foe_get_entry(ppe, entry->hash);
 
 		hwe->ib1 &= ~MTK_FOE_IB1_STATE;
-		hwe->ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_UNBIND);
+		hwe->ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE, MTK_FOE_STATE_INVALID);
 		dma_wmb();
 	}
 	entry->hash = 0xffff;
-- 
2.37.3


