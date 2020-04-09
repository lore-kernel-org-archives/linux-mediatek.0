Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DE1C2BB55
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 11:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 698CA20757
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 11:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXIZ2e/a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2n1J7a/k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 698CA20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJSYHqfO8M3m8IuuCBmUHj6iWFC5PE/iJVBAhh9hirU=; b=lXIZ2e/aGG3+eL
	yBiGhAAoSpscpTcc7dRdl6BLONPdmmETuSVPXaCnwFnJ6tsr37iNpMIhAWrtB4kXNGncdzCB3D7ju
	Mb7kaG9qMlCfHn8jxThYwial+yx2E2l8TOZdkG8HwmWh9Ex+51c862tNC01AUavaz3ZkHIjj+VOfV
	HlEm2ezb2HeoXm/VOP449yiYaHyPusdOi0s2xwCqapduSYZ7XGmTELM/yXUmHBHnRK5Tk/Rc0ild5
	JJPw1cpMQ77v9unmdtXLuPqaNIKN35hsaQvjPZ1rbGC9fPX5h+tiMgsLgtsdyl/SlS+eqT0P/bRYx
	tOjmuh7ymG60QX2i5arg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMV9T-0002Qd-Pp; Thu, 09 Apr 2020 11:15:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMV9Q-0002P4-GJ
 for linux-mediatek@lists.infradead.org; Thu, 09 Apr 2020 11:15:17 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0F7D20757;
 Thu,  9 Apr 2020 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586430916;
 bh=yJAHgHVCZqNaIvQIJJLQMXI01yAcRuvJUBaigYscLr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2n1J7a/kyZOJIZoPo8sOgnOTcwL0Dm6SFTkYzrCvAadDpARYCgCUbkYcR4h4kbaEZ
 IXhtiFVb9l3iLuL/1gtOrXBk6jXalLOlfAPfYNFhGaouabTCzT2hCQ42otXLymwQap
 4R+6cy9JUSuzNWNsgHEAD2SXx+4UDyVU3c4Yg+OA=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 2/2] mt76: mt7663: fix DMA unmap length
Date: Thu,  9 Apr 2020 13:14:57 +0200
Message-Id: <ed96cf2707abdee60890f90414ffef59770d324b.1586430566.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586430566.git.lorenzo@kernel.org>
References: <cover.1586430566.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_041516_591747_930930FC 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 soul.huang@mediatek.com, lorenzo.bianconi@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix DMA unmap length for mt7663e devices in mt7615_txp_skb_unmap_hw

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Soul Huang <soul.huang@mediatek.com>
Signed-off-by: Soul Huang <soul.huang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 20 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  2 ++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index b7a96d514656..c38bc395c5a3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -686,15 +686,18 @@ mt7615_txp_skb_unmap_fw(struct mt76_dev *dev, struct mt7615_fw_txp *txp)
 static void
 mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 {
+	u32 last_mask;
 	int i;
 
+	last_mask = is_mt7663(dev) ? MT_TXD_LEN_LAST : MT_TXD_LEN_MSDU_LAST;
+
 	for (i = 0; i < ARRAY_SIZE(txp->ptr); i++) {
 		struct mt7615_txp_ptr *ptr = &txp->ptr[i];
 		bool last;
 		u16 len;
 
 		len = le16_to_cpu(ptr->len0);
-		last = len & MT_TXD_LEN_MSDU_LAST;
+		last = len & last_mask;
 		len &= MT_TXD_LEN_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf0), len,
 				 DMA_TO_DEVICE);
@@ -702,7 +705,7 @@ mt7615_txp_skb_unmap_hw(struct mt76_dev *dev, struct mt7615_hw_txp *txp)
 			break;
 
 		len = le16_to_cpu(ptr->len1);
-		last = len & MT_TXD_LEN_MSDU_LAST;
+		last = len & last_mask;
 		len &= MT_TXD_LEN_MASK;
 		dma_unmap_single(dev->dev, le32_to_cpu(ptr->buf1), len,
 				 DMA_TO_DEVICE);
@@ -1105,21 +1108,26 @@ mt7615_write_hw_txp(struct mt7615_dev *dev, struct mt76_tx_info *tx_info,
 {
 	struct mt7615_hw_txp *txp = txp_ptr;
 	struct mt7615_txp_ptr *ptr = &txp->ptr[0];
-	int nbuf = tx_info->nbuf - 1;
-	int i;
+	int i, nbuf = tx_info->nbuf - 1;
+	u32 last_mask;
 
 	tx_info->buf[0].len = MT_TXD_SIZE + sizeof(*txp);
 	tx_info->nbuf = 1;
 
 	txp->msdu_id[0] = cpu_to_le16(id | MT_MSDU_ID_VALID);
 
+	if (is_mt7663(&dev->mt76))
+		last_mask = MT_TXD_LEN_LAST;
+	else
+		last_mask = MT_TXD_LEN_AMSDU_LAST |
+			    MT_TXD_LEN_MSDU_LAST;
+
 	for (i = 0; i < nbuf; i++) {
 		u16 len = tx_info->buf[i + 1].len & MT_TXD_LEN_MASK;
 		u32 addr = tx_info->buf[i + 1].addr;
 
 		if (i == nbuf - 1)
-			len |= MT_TXD_LEN_MSDU_LAST |
-			       MT_TXD_LEN_AMSDU_LAST;
+			len |= last_mask;
 
 		if (i & 1) {
 			ptr->buf1 = cpu_to_le32(addr);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index aab6be5f5465..eafb3b91e35a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -256,6 +256,8 @@ enum tx_phy_bandwidth {
 #define MT_TXD_LEN_MASK                 GENMASK(11, 0)
 #define MT_TXD_LEN_MSDU_LAST		BIT(14)
 #define MT_TXD_LEN_AMSDU_LAST		BIT(15)
+/* mt7663 */
+#define MT_TXD_LEN_LAST			BIT(15)
 
 struct mt7615_txp_ptr {
 	__le32 buf0;
-- 
2.25.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
