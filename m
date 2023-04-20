Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD23C7618E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CEIIxz47kughbPq/IHjwOs7hBKb5DVOHOPKww/Vy0Ww=; b=TM6esdHpDX3t3gIzsqGoy6BwGQ
	yVihM4ppqLeT62jd7i4LTCK4KiZdXn1apoXd4cDkYbtAE8OoL9TaS5QfY1iTtnCaHA1aFBVgnkNQz
	yd6Wb3s/kxfM0tu1CFffBnPcW/+VOmpvyDlFg1SIR8LV/xAWF0zJTqG8pCDei73kZu5x7m/S3dhl0
	Zgg1Irs7mj9FEVB6pS2aKpitmDWij72Bi6nUgpP8H/M8CfHBEubrvvC7D3ydy//JTpTno8JFB++xo
	bSgCJIL89E6jw7ADi9dUln6vZMZ3RjMhSPwvbUwhYSQ4yw0tI6II0DxUd+oow4hHXrY3+2S2QsJW/
	nsh5id1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppbUY-0090QT-18;
	Thu, 20 Apr 2023 21:06:58 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppbUW-0090PR-1o;
	Thu, 20 Apr 2023 21:06:57 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppbUP-0002gY-0C;
	Thu, 20 Apr 2023 23:06:49 +0200
Date: Thu, 20 Apr 2023 22:06:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next] net: mtk_eth_soc: mediatek: fix ppe flow accounting
 for v1 hardware
Message-ID: <d8474a95a528a4bec5121252205d179f357c7124.1682024624.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_140656_600015_D859635D 
X-CRM114-Status: GOOD (  11.82  )
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

From: Felix Fietkau <nbd@nbd.name>

Older chips (like MT7622) use a different bit in ib2 to enable hardware
counter support. Add macros for both and select the appropriate bit.

Fixes: 3fbe4d8c0e53 ("net: ethernet: mtk_eth_soc: ppe: add support for flow accounting")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c | 10 ++++++++--
 drivers/net/ethernet/mediatek/mtk_ppe.h |  3 ++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index dd9581334b054..9129821f3ab8f 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -601,6 +601,7 @@ __mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
 	struct mtk_eth *eth = ppe->eth;
 	u16 timestamp = mtk_eth_timestamp(eth);
 	struct mtk_foe_entry *hwe;
+	u32 val;
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
 		entry->ib1 &= ~MTK_FOE_IB1_BIND_TIMESTAMP_V2;
@@ -617,8 +618,13 @@ __mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_foe_entry *entry,
 	wmb();
 	hwe->ib1 = entry->ib1;
 
-	if (ppe->accounting)
-		*mtk_foe_entry_ib2(eth, hwe) |= MTK_FOE_IB2_MIB_CNT;
+	if (ppe->accounting) {
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
+			val = MTK_FOE_IB2_MIB_CNT_V2;
+		else
+			val = MTK_FOE_IB2_MIB_CNT;
+		*mtk_foe_entry_ib2(eth, hwe) |= val;
+	}
 
 	dma_wmb();
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index e1aab2e8e2629..e51de31a52ec6 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -55,9 +55,10 @@ enum {
 #define MTK_FOE_IB2_PSE_QOS		BIT(4)
 #define MTK_FOE_IB2_DEST_PORT		GENMASK(7, 5)
 #define MTK_FOE_IB2_MULTICAST		BIT(8)
+#define MTK_FOE_IB2_MIB_CNT		BIT(10)
 
 #define MTK_FOE_IB2_WDMA_QID2		GENMASK(13, 12)
-#define MTK_FOE_IB2_MIB_CNT		BIT(15)
+#define MTK_FOE_IB2_MIB_CNT_V2		BIT(15)
 #define MTK_FOE_IB2_WDMA_DEVIDX		BIT(16)
 #define MTK_FOE_IB2_WDMA_WINFO		BIT(17)
 
-- 
2.40.0


