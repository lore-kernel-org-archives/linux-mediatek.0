Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA25C54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 22:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odSyffoOi5zlU5841SIXYWTujBrltUe6RwuClRfOD2Q=; b=lgVzexrtUuB2QrX60cSUwJvfCE
	ZVDVKbh/Jov++5cROWtvUN3FwOo2o+L6FULrVXz8xXzwNpcE0af1J/CanO0NPm+BURGdSJ0njhtpc
	elQS9nqWDH5z3r4IGAEjIfJpEb4m2E4kzfBVL5d2Rm5KXWtW9hD8ZHC5+PLP3vw3l4hzqPIS0BoBu
	YwQtsJ4vSGGtNR4oZPAk5fwMIVHbwCwg/kqs33xiVZe9fei0T0eAeN3Ztn9AlTY+Kt7MlxByRNqE8
	PejfwlPDNOGbHTj7lo7qs6APGtOQlUzHWucXk0JteNDgc1z0UVkH5fSRjC0pLIQixqQLRvQcSDVO/
	ylKE1i/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkXR2-0000000CAya-3Bli;
	Wed, 13 Mar 2024 22:50:56 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkXQy-0000000CAvX-27mp;
	Wed, 13 Mar 2024 22:50:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rkXQp-0003yg-2i;
	Wed, 13 Mar 2024 22:50:43 +0000
Date: Wed, 13 Mar 2024 22:50:40 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chad Monroe <chad.monroe@adtran.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>
Subject: [PATCH net 2/2] net: ethernet: mtk_eth_soc: fix PPE hanging issue
Message-ID: <82fd25be48f869969b22ef439b8ea403f7e188a0.1710367570.git.daniel@makrotopia.org>
References: <7205ca7d3c5433214256df4672f7c1a49815a5a5.1710367570.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7205ca7d3c5433214256df4672f7c1a49815a5a5.1710367570.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_155052_573710_A7CDE7A9 
X-CRM114-Status: GOOD (  12.62  )
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

A patch to resolve an issue was found in MediaTek's GPL-licensed SDK:
In the mtk_ppe_stop() function, the PPE scan mode is not disabled before
disabling the PPE. This can potentially lead to a hang during the process
of disabling the PPE.

Without this patch, the PPE may experience a hang during the reboot test.

Link: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/b40da332dfe763932a82f9f62a4709457a15dd6c
Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
Suggested-by: Bc-bocun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index b2a5d9c3733d4..6ce0db3a1a920 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -994,7 +994,7 @@ void mtk_ppe_start(struct mtk_ppe *ppe)
 			 MTK_PPE_KEEPALIVE_DISABLE) |
 	      FIELD_PREP(MTK_PPE_TB_CFG_HASH_MODE, 1) |
 	      FIELD_PREP(MTK_PPE_TB_CFG_SCAN_MODE,
-			 MTK_PPE_SCAN_MODE_KEEPALIVE_AGE) |
+			 MTK_PPE_SCAN_MODE_CHECK_AGE) |
 	      FIELD_PREP(MTK_PPE_TB_CFG_ENTRY_NUM,
 			 MTK_PPE_ENTRIES_SHIFT);
 	if (mtk_is_netsys_v2_or_greater(ppe->eth))
@@ -1090,17 +1090,21 @@ int mtk_ppe_stop(struct mtk_ppe *ppe)
 
 	mtk_ppe_cache_enable(ppe, false);
 
-	/* disable offload engine */
-	ppe_clear(ppe, MTK_PPE_GLO_CFG, MTK_PPE_GLO_CFG_EN);
-	ppe_w32(ppe, MTK_PPE_FLOW_CFG, 0);
-
 	/* disable aging */
 	val = MTK_PPE_TB_CFG_AGE_NON_L4 |
 	      MTK_PPE_TB_CFG_AGE_UNBIND |
 	      MTK_PPE_TB_CFG_AGE_TCP |
 	      MTK_PPE_TB_CFG_AGE_UDP |
-	      MTK_PPE_TB_CFG_AGE_TCP_FIN;
+	      MTK_PPE_TB_CFG_AGE_TCP_FIN |
+		  MTK_PPE_TB_CFG_SCAN_MODE;
 	ppe_clear(ppe, MTK_PPE_TB_CFG, val);
 
-	return mtk_ppe_wait_busy(ppe);
+	if (mtk_ppe_wait_busy(ppe))
+		return -ETIMEDOUT;
+
+	/* disable offload engine */
+	ppe_clear(ppe, MTK_PPE_GLO_CFG, MTK_PPE_GLO_CFG_EN);
+	ppe_w32(ppe, MTK_PPE_FLOW_CFG, 0);
+
+	return 0;
 }
-- 
2.44.0

