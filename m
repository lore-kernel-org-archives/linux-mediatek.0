Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5FBC433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 18:29:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF5061A39
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 18:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF5061A39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dIQEsKIJ5N8L+4DVZ2j59CXkQb8iZ/7HBT/n/9TiDrQ=; b=NKEchqjN3O8Xtvz3AXodsUCU9P
	H9wKnzeSzQu5ZbALjBctB4bk2+mtIvfikORfRJCEV8j9j3zmP5Il1iLXxjwwYrXKcKlzADmWY3OQI
	jAGnBHtbuFRCDplUXReeGB3YAFyO59KnvTqXKU7kq5mfnWyNbisDcTQjAquuag2uAJeeG1YHjcXBK
	WRkqQhNIdnMQKGBwIT6qIM/zKA2YvAeFVJrKN/oac0TLM+LDU968liqlSguBUTSLfstOO5e62V3VP
	nLnrJtAVS1k8FpLqzJwr85zgx/nVmKI2N2F92yee38CNT3ERfpADmjWud1e5EHIQjtKFiqxSyp5ZE
	uL+9G+Ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPUjR-0021B6-Pi; Thu, 25 Mar 2021 18:29:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPUjN-0021AG-OZ
 for linux-mediatek@lists.infradead.org; Thu, 25 Mar 2021 18:29:20 +0000
X-UUID: a8134c0783d94c21a58dd81c7eda8f04-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=G1Um2ZRAyy/w8gU+yCA3OoUM/7Q4d9EYKqS6Rgkn9vU=; 
 b=o6xjluGuzd93BbS9RFVLaFCqcxw8r7CalJuvP0Jqban0eVVj1J21k75VGdwGzN6vEtzAnx0QtYgh3uNim3dMHfsNiygnLKvz4GUIAmwlX0Op7ChQ1W1bQyC5NA3kvPqsBWbHEBbsQA1rcgblXGtNjuCtqjhk66yV4Pk9ldB4Nvc=;
X-UUID: a8134c0783d94c21a58dd81c7eda8f04-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1437487549; Thu, 25 Mar 2021 10:29:13 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 11:29:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 02:28:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Mar 2021 02:28:57 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/2] mt76: mt7615: cleanup mcu tx queue in
 mt7615_dma_reset()
Date: Fri, 26 Mar 2021 02:28:55 +0800
Message-ID: <fdde0eb8c6dea0e81b5f5ae528085f1ccf53fef3.1616696376.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0275B13957BD8B2445E5A3E786A6A4A23CB3D92B8D2A1C5DF1F09CFD9856E9692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_182918_240512_77912500 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

Cleanup ext_phy and mcu tx queue so that mt7615_mac_reset_work() can
recover mt7615 normally.

Fixes: mt76: e637763b606 ("move mcu queues to mt76_dev q_mcu array")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - cleanup mphy_ext->q_tx
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index bb3f93d90f4e..4e41c12d08eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2013,20 +2013,26 @@ mt7615_update_beacons(struct mt7615_dev *dev)
 
 void mt7615_dma_reset(struct mt7615_dev *dev)
 {
+	struct mt76_phy *mphy_ext = dev->mt76.phy2;
 	int i;
 
 	mt76_clear(dev, MT_WPDMA_GLO_CFG,
 		   MT_WPDMA_GLO_CFG_RX_DMA_EN | MT_WPDMA_GLO_CFG_TX_DMA_EN |
 		   MT_WPDMA_GLO_CFG_TX_WRITEBACK_DONE);
+
 	usleep_range(1000, 2000);
 
-	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_WM], true);
-	for (i = 0; i < __MT_TXQ_MAX; i++)
+	for (i = 0; i < __MT_TXQ_MAX; i++) {
 		mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[i], true);
+		if (mphy_ext)
+			mt76_queue_tx_cleanup(dev, mphy_ext->q_tx[i], true);
+	}
 
-	mt76_for_each_q_rx(&dev->mt76, i) {
+	for (i = 0; i < __MT_MCUQ_MAX; i++)
+		mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[i], true);
+
+	mt76_for_each_q_rx(&dev->mt76, i)
 		mt76_queue_rx_reset(dev, i);
-	}
 
 	mt76_set(dev, MT_WPDMA_GLO_CFG,
 		 MT_WPDMA_GLO_CFG_RX_DMA_EN | MT_WPDMA_GLO_CFG_TX_DMA_EN |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
