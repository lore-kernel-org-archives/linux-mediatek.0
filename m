Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9494EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 18:29:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE7B61A39
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 18:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE7B61A39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rFQmEUeTXV5/Bllj9qkmZETl5PqW+ZHR0B1oXtbdAEY=; b=Lq30nPjVj7LYEwGUzpwsScjiw
	KIwyT332sSCMlTieGXE+JFj9ranDNPe5n4VPDENGbMFAvwzy3OMuILL7iAMAeu7O2yd77tui22okl
	onSYm7706RYh+RXGj1GdZNqeeENK4Yg3CXuX1x8RX/IPZ4i2aCva/Ko+jQLgAqMLiJhBqYkG4VdyF
	fT+PNwMRK27RKcE9OQxuCEELeMVOKU/Mlj45Ers8YckTXXShUOsQf/+eu2sg01Tp0at9blsbDRUVa
	nY78aZnaANvbZ/Lj9izz0oYiUtA63WVcWuv7PJLRo6dDJZaMnSwtEA+j020kMorDnq/kLpkzdDn1R
	+yaBmRZDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPUjH-0021A8-Q2; Thu, 25 Mar 2021 18:29:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPUjC-00219c-Pq
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 18:29:10 +0000
X-UUID: f57ac868b501462c8f8315d74314c103-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yklE+dTnFnmtVt2AlTSJHbLb9rBk0CoEr5Lb5z26imU=; 
 b=sim4CgjxnqaymhplIondPW8mvOhOmZhLii3/EgASv0ZTlWqPhQpGPZ2bllupWoudxcAi2pcmtNbBdObVdC65uQbm0BZBplHNLBSLxyzXCGnLz1V4xbvep5TlFkkO3+4/w3gaDyyfO0NEvRM4lgHyTxJnbGNHqyadcFe2kkdhtHc=;
X-UUID: f57ac868b501462c8f8315d74314c103-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 647972614; Thu, 25 Mar 2021 10:29:01 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 11:28:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 02:28:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Mar 2021 02:28:57 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/2] mt76: mt7915: cleanup mcu tx queue in
 mt7915_dma_reset()
Date: Fri, 26 Mar 2021 02:28:56 +0800
Message-ID: <70cadb225568bd81b6e7927f3a1db3565c4c3adf.1616696376.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fdde0eb8c6dea0e81b5f5ae528085f1ccf53fef3.1616696376.git.ryder.lee@mediatek.com>
References: <fdde0eb8c6dea0e81b5f5ae528085f1ccf53fef3.1616696376.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_182907_397584_06646021 
X-CRM114-Status: GOOD (  10.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cleanup mcu queues in mt7915_mac_reset_work().

Fixes: mt76: e637763b606 ("move mcu queues to mt76_dev q_mcu array")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index d3a6312c058c..0924ae074db2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1515,9 +1515,8 @@ mt7915_update_beacons(struct mt7915_dev *dev)
 }
 
 static void
-mt7915_dma_reset(struct mt7915_phy *phy)
+mt7915_dma_reset(struct mt7915_dev *dev)
 {
-	struct mt7915_dev *dev = phy->dev;
 	struct mt76_phy *mphy_ext = dev->mt76.phy2;
 	u32 hif1_ofs = MT_WFDMA1_PCIE1_BASE - MT_WFDMA1_BASE;
 	int i;
@@ -1534,18 +1533,20 @@ mt7915_dma_reset(struct mt7915_phy *phy)
 			   (MT_WFDMA1_GLO_CFG_TX_DMA_EN |
 			    MT_WFDMA1_GLO_CFG_RX_DMA_EN));
 	}
+
 	usleep_range(1000, 2000);
 
-	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WA], true);
 	for (i = 0; i < __MT_TXQ_MAX; i++) {
-		mt76_queue_tx_cleanup(dev, phy->mt76->q_tx[i], true);
+		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
 		if (mphy_ext)
 			mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[i], true);
 	}
 
-	mt76_for_each_q_rx(&dev->mt76, i) {
+	for (i = 0; i < __MT_MCUQ_MAX; i++)
+		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
 		mt76_queue_rx_reset(dev, i);
-	}
 
 	/* re-init prefetch settings after reset */
 	mt7915_dma_prefetch(dev);
@@ -1630,7 +1631,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 	idr_init(&dev->token);
 
 	if (mt7915_wait_reset_state(dev, MT_MCU_CMD_RESET_DONE)) {
-		mt7915_dma_reset(&dev->phy);
+		mt7915_dma_reset(dev);
 
 		mt76_wr(dev, MT_MCU_INT_EVENT, MT_MCU_INT_EVENT_DMA_INIT);
 		mt7915_wait_reset_state(dev, MT_MCU_CMD_RECOVERY_DONE);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
