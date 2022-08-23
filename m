Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9844EC32792
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MPhg5MOWbYmYVs1bBrMrpr8e/chIS7h4LzSeJkbnWM8=; b=m3BxTSA3lIJdH+WKvPkSCRInhW
	ClgQmfEXD/tTBAI2/2vGEXwUk5Bgu3SMoEHnkKNQENC9fscbnNBgM3TJY8bDshentY2S8RS+i/lit
	O9j2mp0TE+8YMhZgHVC356x13+21+3HKnXVDCTjJggfQeULyhSkBngwh0Mg87w7M7sp0mhsjgVUlz
	XcTim+rLnVZuA2DLevRUn6/cOEFovNysNt9on0xQKK3cI08d+5Vn4Dtq6bhuIPICKkbRxuwBL0IMl
	eUfSKP03GSwc79uI/w4Xr+pUiDBYMKDsFrOGspOR1AYzYomMxY1rqYG5XlANgxpkOnje88k3ilXOZ
	Btoel43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQT2G-005sTg-4L; Tue, 23 Aug 2022 12:29:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQSxA-005prU-R5
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 12:24:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 41967B81D00;
	Tue, 23 Aug 2022 12:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4CBC433C1;
	Tue, 23 Aug 2022 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661257457;
	bh=8nD764F8pk/bCJr7lH8SB9JebDWs0dWq+LVCVleKEiI=;
	h=From:To:Cc:Subject:Date:From;
	b=qRh+zTLYUJb9bh9KwhEOVH/OjwKNBKYlERoRNLd3SKo+qp2g0O7CfTl7/7IgHZGVL
	 FGM94eri6TQsT//VHJhQApYvRCciF0vQLmPET7xsVeVhrVijUNkAQU4u+bY3prvyLe
	 cMey5NnS2VVT1NSMhHFPPucRhwgEAk4JFIzI6fADLwyLdYB0HKCmlEMeBqqfnBsEqy
	 welYKh8JG+SjRmaxtSUDpVML46NxDPkmkxQGWA+qBjKlGRYqQ2I4FiuTWtu9w+Qzzk
	 y+MRcsOAY5VTtvpHPPZUXw2ltwBn+xf5c5IHcJfxLCsampxhCFfZ3bvzSwoz/Rkdqx
	 viHFt/ZpwXDRg==
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
Subject: [PATCH v2 net] net: ethernet: mtk_eth_soc: fix hw hash reporting for MTK_NETSYS_V2
Date: Tue, 23 Aug 2022 14:24:07 +0200
Message-Id: <091394ea4e705fbb35f828011d98d0ba33808f69.1661257293.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_052421_273771_3DAAB2C7 
X-CRM114-Status: GOOD (  13.22  )
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

Properly report hw rx hash for mt7986 chipset accroding to the new dma
descriptor layout.

Fixes: 197c9e9b17b11 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- fix typo in a comment
- target net tree instead of net-next
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 +++++++++++----------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 +++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 8aff4c0c28bd..5ace4609de47 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1891,10 +1891,19 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->dev = netdev;
 		bytes += skb->len;
 
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
+			hash = trxd.rxd5 & MTK_RXD5_FOE_ENTRY;
+			if (hash != MTK_RXD5_FOE_ENTRY)
+				skb_set_hash(skb, jhash_1word(hash, 0),
+					     PKT_HASH_TYPE_L4);
 			rxdcsum = &trxd.rxd3;
-		else
+		} else {
+			hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
+			if (hash != MTK_RXD4_FOE_ENTRY)
+				skb_set_hash(skb, jhash_1word(hash, 0),
+					     PKT_HASH_TYPE_L4);
 			rxdcsum = &trxd.rxd4;
+		}
 
 		if (*rxdcsum & eth->soc->txrx.rx_dma_l4_valid)
 			skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -1902,16 +1911,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			skb_checksum_none_assert(skb);
 		skb->protocol = eth_type_trans(skb, netdev);
 
-		hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
-		if (hash != MTK_RXD4_FOE_ENTRY) {
-			hash = jhash_1word(hash, 0);
-			skb_set_hash(skb, hash, PKT_HASH_TYPE_L4);
-		}
-
 		reason = FIELD_GET(MTK_RXD4_PPE_CPU_REASON, trxd.rxd4);
 		if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
-			mtk_ppe_check_skb(eth->ppe, skb,
-					  trxd.rxd4 & MTK_RXD4_FOE_ENTRY);
+			mtk_ppe_check_skb(eth->ppe, skb, hash);
 
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX) {
 			if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7405c97cda66..ecf85e9ed824 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -314,6 +314,11 @@
 #define RX_DMA_L4_VALID_PDMA	BIT(30)		/* when PDMA is used */
 #define RX_DMA_SPECIAL_TAG	BIT(22)
 
+/* PDMA descriptor rxd5 */
+#define MTK_RXD5_FOE_ENTRY	GENMASK(14, 0)
+#define MTK_RXD5_PPE_CPU_REASON	GENMASK(22, 18)
+#define MTK_RXD5_SRC_PORT	GENMASK(29, 26)
+
 #define RX_DMA_GET_SPORT(x)	(((x) >> 19) & 0xf)
 #define RX_DMA_GET_SPORT_V2(x)	(((x) >> 26) & 0x7)
 
-- 
2.37.2


