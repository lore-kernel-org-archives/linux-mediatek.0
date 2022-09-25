Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ACCC04A95
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tg6uW5SLIsIiOc/VjUWs1nF3LrSzELaqZRS6J0xlVfU=; b=cCXM2dnHq6YUyZCXxSs34rZHPj
	fl7sc7hLI8YejZRl2ym20r0n0W1wVCQXtrUMjUnfuD84Eu3emafri+xNOQ24LEfn6j+oxK8hXcQ0x
	TjCsz3//S4QheS968PzFAGYO+pVCzJJTXUQQlX5L1YykOEwPILEyfQthTptXxBRJS+i0aCG01v/78
	wSYa7n+MuFJngqdhmzJQtKDw3EgepLJW5ZCnxGcTiBGt2H1VEv4+rgchAkr4P/bUkD2I8ZIN3WYiU
	UbcFh7t2iQP8qaSF8zyitq2Z8w1vWNi9iBp+AF+iQaq/KtyQNaQDUuRigvKZ1SDe30mUzx5REe8+j
	Uk8VA4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocSux-00EFzt-SI; Sun, 25 Sep 2022 14:47:39 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocSuu-00EFwW-J2
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 14:47:37 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ocSuk-0002Tw-1a;
	Sun, 25 Sep 2022 16:47:26 +0200
Date: Sun, 25 Sep 2022 15:47:20 +0100
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
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH 1/2] net: ethernet: mtk_eth_soc: fix wrong use of new helper
 function
Message-ID: <YzBp+Kk04CFDys4L@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_074736_644969_135688AB 
X-CRM114-Status: GOOD (  10.17  )
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

In function mtk_foe_entry_set_vlan() the call to field accessor macro
FIELD_GET(MTK_FOE_IB1_BIND_VLAN_LAYER, entry->ib1)
has been wrongly replaced by
mtk_prep_ib1_vlan_layer(eth, entry->ib1)

Use correct helper function mtk_get_ib1_vlan_layer instead.

Reported-by: Chen Minqiang <ptpt52@gmail.com>
Fixes: 03a3180e5c09e1 ("net: ethernet: mtk_eth_soc: introduce flow offloading support for mt7986")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 25f8738a062bd0..4ea2b342f252ac 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -337,7 +337,7 @@ int mtk_foe_entry_set_vlan(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 {
 	struct mtk_foe_mac_info *l2 = mtk_foe_entry_l2(eth, entry);
 
-	switch (mtk_prep_ib1_vlan_layer(eth, entry->ib1)) {
+	switch (mtk_get_ib1_vlan_layer(eth, entry->ib1)) {
 	case 0:
 		entry->ib1 |= mtk_get_ib1_vlan_tag_mask(eth) |
 			      mtk_prep_ib1_vlan_layer(eth, 1);
-- 
2.37.3


