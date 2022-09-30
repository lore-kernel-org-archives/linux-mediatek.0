Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0ySrsQvX/Wo/GYn54UpVIAQzmqtSZoDIzWKqNm1SsQ=; b=l92oUqzyI8jgLy0dEGDnmkpNtX
	bJlpoXwKfargKXqboUXET7K4aKnSX/S2M5Re6mVuBjdCJ5OsxjBxzMtF3Lz9/aYAdBoqwl6meqT2O
	M70rWWqiXd9r2vTiNsS2BEbYbyxTXeO9GYnktMQ5b8iQh+gqveZXqbkmHoOE7NpaCefgA+ftoUHNg
	GQocxVMRjI1+f0fm49YoJ0dVr28ZpwWdMtVX9shNaOfRVJzlOIApElMam4b9P2tsi2EkelHtoLQOy
	D665qPxS6Vn9j5jVRVhdsxxnsNZCii5BEfkh348hG//J8U54V+YQ0VU30pgN8RDntUs7VMcgGM7lt
	XBtEQOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4LA-006UA7-72; Fri, 30 Sep 2022 00:57:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe4L7-006U6n-Mf
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 00:57:19 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1oe4Kt-0004si-0S;
	Fri, 30 Sep 2022 02:57:04 +0200
Date: Fri, 30 Sep 2022 01:56:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen Minqiang <ptpt52@gmail.com>,
	Thomas =?iso-8859-1?Q?H=FChn?= <thomas.huehn@hs-nordhausen.de>
Subject: [PATCH v2] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear
Message-ID: <YzY+1Yg0FBXcnrtc@makrotopia.org>
References: <20220928190939.3c43516f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928190939.3c43516f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_175717_755768_DEC22988 
X-CRM114-Status: GOOD (  11.41  )
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
on older MTK_NETSYS_V1 SoCs, OpenWrt users have confirmed the bug on
MT7622 and MT7621 systems.
Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.

Tested on MT7622 (Linksys E8450) and MT7986 (BananaPi BPI-R3).

Suggested-by: Felix Fietkau <nbd@nbd.name>
Fixes: 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear")
Fixes: 33fc42de33278b ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: rebased on top of netdev/net.git;main

 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index cfe804bc8d2055..148ea636ef9794 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -412,7 +412,7 @@ __mtk_foe_entry_clear(struct mtk_ppe *ppe, struct mtk_flow_entry *entry)
 	if (entry->hash != 0xffff) {
 		ppe->foe_table[entry->hash].ib1 &= ~MTK_FOE_IB1_STATE;
 		ppe->foe_table[entry->hash].ib1 |= FIELD_PREP(MTK_FOE_IB1_STATE,
-							      MTK_FOE_STATE_UNBIND);
+							      MTK_FOE_STATE_INVALID);
 		dma_wmb();
 	}
 	entry->hash = 0xffff;
-- 
2.37.3


