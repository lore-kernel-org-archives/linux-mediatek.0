Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC8ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrMsqtImkD2B2rzGRAWvIYHVPQW1eiX1GhxHtv73ZDI=; b=pkYDjFvfqSXiefyimyYSCQHwfw
	Pbqi+5n3XLkyElOGBDtpSowrvYorj426o73qFPdv91099ilDeZQVPal/RxqmnzG/WmvBf32/iLGrZ
	H206YNc4uVN5Xvp+FbdcfNMlbRw82LYL6m4CQiKJFsE64VlqhYJhxHtP/XGaMjvj0XToH/UsCxD/F
	gZRh9Z/axNtp9MXoqiGKEvp92eP9pXbNQ8OJjiEPcPAyCb55WjqxixDD7Ba4K34juehCOpq5SLBUq
	h+xXsiGZ0C1SD9ASl0CjIHveZNUKNOkdg/4bDVoVeaKZZefcWCwe+4/le7h4mZDVRiJ0H+f/gDsk+
	4ot76GFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9IM-00Dith-EZ; Tue, 13 Sep 2022 17:01:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9II-00Dilk-Iu
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 17:01:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2BB70B81034;
	Tue, 13 Sep 2022 17:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B2AC433D6;
	Tue, 13 Sep 2022 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663088511;
	bh=HTELgz85dgkOVYCUXWEEGsWAO5SlTj5qt8mMqZOd+0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AIPLtMOIFXlnSd8YxBWQ2nJAE3r092k0rxUxzDfyOWtxQF5pdsUYgijJJbomOhow/
	 LZpGTVYg3jHs7LRSz7dt6xmEooVdru0mG7nzZYhSbIhKhm3cH7SH9jMgSXO5Q1NKo0
	 qsjoN/v+OHJwfZcI29zXH/ZHIucZicOufKd8LHTCr+7K8LbWIXYSOPQ051viXgGWQG
	 LztoeVXv+i8t8kTCp5seVAh7S+jui95zM8aq9HQmag4Q8jV9Jjd7WREwPHsDKTjX0j
	 9hT39MsFGv3+B5iwZ8SKWhQwcEG6KfEyAnJDUJc3VaPtemXTvPUuJ4aLAv2ZRN4aGL
	 S6Tzeq9Htp7OA==
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
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v2 net-next 03/11] net: ethernet: mtk_eth_soc: move gdma_to_ppe and ppe_base definitions in mtk register map
Date: Tue, 13 Sep 2022 19:00:53 +0200
Message-Id: <504ce1157f92013b16c2a3ceb729675852e215d2.1663087836.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1663087836.git.lorenzo@kernel.org>
References: <cover.1663087836.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_100154_973696_B6FA18F8 
X-CRM114-Status: GOOD (  17.47  )
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

This is a preliminary patch to introduce mt7986 hw packet engine.

Tested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 15 +++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  3 ++-
 drivers/net/ethernet/mediatek/mtk_ppe.h     |  2 --
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index c19c67a480ae..b2b92fe2a96a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -73,6 +73,8 @@ static const struct mtk_reg_map mtk_reg_map = {
 		.fq_blen	= 0x1b2c,
 	},
 	.gdm1_cnt		= 0x2400,
+	.gdma_to_ppe		= 0x4444,
+	.ppe_base		= 0x0c00,
 };
 
 static const struct mtk_reg_map mt7628_reg_map = {
@@ -126,6 +128,8 @@ static const struct mtk_reg_map mt7986_reg_map = {
 		.fq_blen	= 0x472c,
 	},
 	.gdm1_cnt		= 0x1c00,
+	.gdma_to_ppe		= 0x3333,
+	.ppe_base		= 0x2000,
 };
 
 /* strings used by ethtool */
@@ -2978,21 +2982,22 @@ static int mtk_open(struct net_device *dev)
 
 	/* we run 2 netdevs on the same dma ring so we only bring it up once */
 	if (!refcount_read(&eth->dma_refcnt)) {
+		const struct mtk_soc_data *soc = eth->soc;
 		u32 gdm_config = MTK_GDMA_TO_PDMA;
 
 		err = mtk_start_dma(eth);
 		if (err)
 			return err;
 
-		if (eth->soc->offload_version && mtk_ppe_start(eth->ppe) == 0)
-			gdm_config = MTK_GDMA_TO_PPE;
+		if (soc->offload_version && mtk_ppe_start(eth->ppe) == 0)
+			gdm_config = soc->reg_map->gdma_to_ppe;
 
 		mtk_gdm_config(eth, gdm_config);
 
 		napi_enable(&eth->tx_napi);
 		napi_enable(&eth->rx_napi);
 		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
-		mtk_rx_irq_enable(eth, eth->soc->txrx.rx_irq_done_mask);
+		mtk_rx_irq_enable(eth, soc->txrx.rx_irq_done_mask);
 		refcount_set(&eth->dma_refcnt, 1);
 	}
 	else
@@ -4098,7 +4103,9 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	if (eth->soc->offload_version) {
-		eth->ppe = mtk_ppe_init(eth, eth->base + MTK_ETH_PPE_BASE, 2);
+		u32 ppe_addr = eth->soc->reg_map->ppe_base;
+
+		eth->ppe = mtk_ppe_init(eth, eth->base + ppe_addr, 2);
 		if (!eth->ppe) {
 			err = -ENOMEM;
 			goto err_free_dev;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index ecf85e9ed824..2617cbecdfca 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -105,7 +105,6 @@
 #define MTK_GDMA_TCS_EN		BIT(21)
 #define MTK_GDMA_UCS_EN		BIT(20)
 #define MTK_GDMA_TO_PDMA	0x0
-#define MTK_GDMA_TO_PPE		0x4444
 #define MTK_GDMA_DROP_ALL       0x7777
 
 /* Unicast Filter MAC Address Register - Low */
@@ -955,6 +954,8 @@ struct mtk_reg_map {
 		u32	fq_blen;	/* fq free page buffer length */
 	} qdma;
 	u32	gdm1_cnt;
+	u32	gdma_to_ppe;
+	u32	ppe_base;
 };
 
 /* struct mtk_eth_data -	This is the structure holding all differences
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 8f786c47b61a..bb079e3c0417 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -8,8 +8,6 @@
 #include <linux/bitfield.h>
 #include <linux/rhashtable.h>
 
-#define MTK_ETH_PPE_BASE		0xc00
-
 #define MTK_PPE_ENTRIES_SHIFT		3
 #define MTK_PPE_ENTRIES			(1024 << MTK_PPE_ENTRIES_SHIFT)
 #define MTK_PPE_HASH_MASK		(MTK_PPE_ENTRIES - 1)
-- 
2.37.3


