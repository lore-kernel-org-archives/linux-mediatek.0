Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E08BC25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k18gZZtJzmZvqNl8i3Ya7rXrvPKynwRxfzsHL1sapf4=; b=j+oSvP0o08qh1DCD7BnDK0T/+1
	r5ZgFxfLVytFsxW54xksM5xmm46amtseZL16TJ4LUy862UagK5JUDCN04Qcmc6OzqEA7CF8/19D4c
	kB5qjn2U9mplfDxcgN7Oe7NSiIg/Wa4JIO+VUKQ7h9BFMF5ZepV4kAwU9D10HiuilG6O9qbT5dI4C
	t7NfcbGslQk31yq26Fr1m2KydUCGXzV1KM9Txqrx30e/2ujDpJDB5FiahIMyU40uLwK9R17JUirmg
	o7enIU7rmDrcK+leTDxB9Yhc6Kq0ZXISGfdi01TBLRIcmpF3yC2NNjbe+IXzj0uoHPhF+aHHA0QMJ
	SdtuEa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPRJp-00B3gr-Sb; Sat, 20 Aug 2022 16:27:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPRJn-00B3fo-Cu
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 16:27:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 76E3A601BF;
	Sat, 20 Aug 2022 16:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FACFC433C1;
	Sat, 20 Aug 2022 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661012844;
	bh=ry1rJGS+tAV7CrIY2HE6Mce9Me0XeJsVeGNnnGAJqsk=;
	h=From:To:Cc:Subject:Date:From;
	b=cTduyxFQleIgnjDrMaTOoHUCCEE/fsKdlzWCZQol6Bq7z69GcCp7P1NurkRtdyNQ+
	 qo45JffAiSWX1C7iez6kSBoPWU80+HLH6NezZu3uz1FcL3FTJlBWC/q3T8Cz+OgqYj
	 UKuRsVG2G+5xqYMwrLTmZx58tMOt2zEixq4aeWdQYebol74usVmZhZv2wIfHmDL9up
	 X+LiZbizhThKMhA5NV3L67JQjYdq19OBGCz/EBON4XARHm1CTAnytCIvWuYJqKTPt1
	 v+5PV88NqJuhFJZg9G/UNlGhFo+fJ36qw1LSghJA0miuy75nD3TtEmpSclSQ3XTMr1
	 ciNqEuT6JQdXQ==
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
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: fix hw hash reporting for MTK_NETSYS_V2
Date: Sat, 20 Aug 2022 18:27:17 +0200
Message-Id: <890fc9b747e7729fb6b082a1f7fd309a58768cca.1661012748.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_092727_576170_4F9F6AF1 
X-CRM114-Status: GOOD (  11.75  )
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
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 +++++++++++----------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 +++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f1f1742e79e1..96c856ceb0f9 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1893,10 +1893,19 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
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
@@ -1904,16 +1913,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
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
index 7405c97cda66..92e116cfc778 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -314,6 +314,11 @@
 #define RX_DMA_L4_VALID_PDMA	BIT(30)		/* when PDMA is used */
 #define RX_DMA_SPECIAL_TAG	BIT(22)
 
+/* QDMA descriptor rxd5 */
+#define MTK_RXD5_FOE_ENTRY	GENMASK(14, 0)
+#define MTK_RXD5_PPE_CPU_REASON	GENMASK(22, 18)
+#define MTK_RXD5_SRC_PORT	GENMASK(29, 26)
+
 #define RX_DMA_GET_SPORT(x)	(((x) >> 19) & 0xf)
 #define RX_DMA_GET_SPORT_V2(x)	(((x) >> 26) & 0x7)
 
-- 
2.37.2


