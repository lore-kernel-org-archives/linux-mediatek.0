Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB747EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 00:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EaqBMG6dhTRevszM9xr76lJpr9BL3nE/id+BIQHYhtc=; b=hZcEaRCCvAFVl5ZcfqAEaNazeq
	IDnJQKRDwBwBoUZnfB+VChZAxfiwN95xLfBodo2BPj2nICrAAEiw0xdjxA1M/WGt/eitXCgX6OKP+
	mrhvf3Keem/79rN/G0w70ghhBN7HHHoFlq3/jSzeYaVa/RQPsMbn3Qu/8WD/yS8NV4Q30y7qjxdnI
	KTR2+IqBvwwP4WVoh3129UV7amajV0AH1f4J80UmxgxQ2LRbbXcPlOLUCrCsAt+XpvF5zpCLubGLe
	Pa1csV58/oYzX114FdOZqCMK+cb1AhpCTFCeDvA6SvJB9Q/xWTVXeubf8S2H3ilEdJpLV1zq7amyU
	YDkI1X7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQGjG-00DDlH-0F;
	Mon, 31 Jul 2023 00:25:42 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQGjB-00DDki-1C;
	Mon, 31 Jul 2023 00:25:39 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qQGip-0005ue-2B;
	Mon, 31 Jul 2023 00:25:16 +0000
Date: Mon, 31 Jul 2023 01:24:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2] net: ethernet: mtk_eth_soc: support per-flow
 accounting on MT7988
Message-ID: <66032a4e2093ef82d2035966212c5a2ef2b6fdc9.1690762860.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_172537_411424_24CA19CC 
X-CRM114-Status: GOOD (  13.10  )
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

NETSYS_V3 uses 64 bits for each counters while older SoCs were using
48 bits for each counter.
Support reading per-flow byte and package counters on NETSYS_V3.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: fix typo bytes_cnt_* -> byte_cnt_*

 drivers/net/ethernet/mediatek/mtk_eth_soc.c  |  1 +
 drivers/net/ethernet/mediatek/mtk_ppe.c      | 18 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h |  2 ++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 05be702f19c5e..1b89f800f6dff 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5064,6 +5064,7 @@ static const struct mtk_soc_data mt7988_data = {
 	.version = 3,
 	.offload_version = 2,
 	.hash_offset = 4,
+	.has_accounting = true,
 	.foe_entry_size = MTK_FOE_ENTRY_V3_SIZE,
 	.txrx = {
 		.txd_size = sizeof(struct mtk_tx_dma_v2),
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index bf1ecb0c1c109..dd2df32b29c3b 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -107,10 +107,20 @@ static int mtk_mib_entry_read(struct mtk_ppe *ppe, u16 index, u64 *bytes, u64 *p
 	cnt_r1 = readl(ppe->base + MTK_PPE_MIB_SER_R1);
 	cnt_r2 = readl(ppe->base + MTK_PPE_MIB_SER_R2);
 
-	byte_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R0_BYTE_CNT_LOW, cnt_r0);
-	byte_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R1_BYTE_CNT_HIGH, cnt_r1);
-	pkt_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R1_PKT_CNT_LOW, cnt_r1);
-	pkt_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH, cnt_r2);
+	if (mtk_is_netsys_v3_or_greater(ppe->eth)) {
+		/* 64 bit for each counter */
+		byte_cnt_low = cnt_r0;
+		byte_cnt_high = cnt_r1;
+		pkt_cnt_low = cnt_r2;
+		pkt_cnt_high = readl(ppe->base + MTK_PPE_MIB_SER_R3);
+	} else {
+		/* 48 bit for each counter */
+		byte_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R0_BYTE_CNT_LOW, cnt_r0);
+		byte_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R1_BYTE_CNT_HIGH, cnt_r1);
+		pkt_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R1_PKT_CNT_LOW, cnt_r1);
+		pkt_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH, cnt_r2);
+	}
+
 	*bytes = ((u64)byte_cnt_high << 32) | byte_cnt_low;
 	*packets = (pkt_cnt_high << 16) | pkt_cnt_low;
 
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_regs.h b/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
index a2e61b3eb006d..3ce088eef0efd 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
@@ -163,6 +163,8 @@ enum {
 #define MTK_PPE_MIB_SER_R2			0x348
 #define MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH		GENMASK(23, 0)
 
+#define MTK_PPE_MIB_SER_R3			0x34c
+
 #define MTK_PPE_MIB_CACHE_CTL			0x350
 #define MTK_PPE_MIB_CACHE_CTL_EN		BIT(0)
 #define MTK_PPE_MIB_CACHE_CTL_FLUSH		BIT(2)
-- 
2.41.0


