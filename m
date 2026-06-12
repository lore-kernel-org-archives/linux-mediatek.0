Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D129ACD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW9s2uK4yqEEKil/Yz4y+xvIzPhvNufGHRY46xQ6Vk8=; b=atNc49CvyLtKngmyURePDCRz4D
	f8a09PM7MnwatdwGPGkfpkSJ7QQwONXIkx4qAGKlMMLZToNBw7YHBuXHuLyupKvIy9D8bZ0oKEDj9
	4KBrlMo2F/SOu0cl5YW0ZlXG3Xt48x1wo4clvsV+NJ1rmot1E8BXkuRCBC8eVI9qsITUXDwWSmpZC
	aRd3yR3y32q5a9D/11DZbK3YiVSZdm30xygYXpejN2Ji7voB+XqSgHTzDFjn0swb+5Eb4NsQPS8W9
	5IaWa6P+sgR3XH6Eo06DUyZu3QbFYE2ohIM/9QIQfGL4ki9LWnxnWFebsd7BMhup5TvWzv32IO1Sr
	Rq3nowTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwgT-0000000AVRJ-3ko4;
	Fri, 12 Jun 2026 07:52:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwgO-0000000AVQK-3Aco
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:52:08 +0000
X-UUID: 975aabf8663311f1afed4741b24580c9-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vW9s2uK4yqEEKil/Yz4y+xvIzPhvNufGHRY46xQ6Vk8=;
	b=BImHrCvsofQUfC3aaxvrK7NirDQEOm2bRlnjw8RHhHvuK4GgFRl9eooRmA7Ok7F1z5u+AmzhMmQHaOWgukxjjmNdoaWxXCM/kcxT7buhG5Cy9j0qj3zjrK9ybJrdFzy961IZ30oenPHPz2BZgDmz2MhAfP4wd7Rc31bmyHoRMJU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:8f68eeef-e13c-40ee-84e1-af61d99c9a44,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:764e6397-22d1-4176-b420-d0d82ac3f01a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 975aabf8663311f1afed4741b24580c9-20260612
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 62561018; Fri, 12 Jun 2026 00:51:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:51:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:51:40 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 10/20] wifi: mt76: mt792x: add tx_done ring to common DMA queue allocation
Date: Fri, 12 Jun 2026 15:51:36 +0800
Message-ID: <20260612075136.2577553-5-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075136.2577553-1-jb.tsai@mediatek.com>
References: <20260612075136.2577553-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005204_796254_0CC07EB5 
X-CRM114-Status: GOOD (  10.76  )
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

From: Emery Hsin <emery.hsin@mediatek.com>

Add a tx_done field to mt792x_dma_layout and extend
mt792x_dma_alloc_queues() to allocate the MT_RXQ_MCU_WA queue when
tx_done.ring_base is configured.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h     |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index eacee63e13f3..b8dc7ce38c87 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -217,6 +217,7 @@ struct mt792x_dma_layout {
 	struct mt792x_dma_ring tx_data0;
 	struct mt792x_dma_ring tx_mcu;
 	struct mt792x_dma_ring tx_fwdl;
+	struct mt792x_dma_ring tx_done;
 	struct mt792x_dma_ring rx_data;
 	struct mt792x_dma_ring rx_mcu;
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index b090ba9cd676..4d4c62bb0a77 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -122,6 +122,17 @@ int mt792x_dma_alloc_queues(struct mt792x_dev *dev,
 	if (ret)
 		return ret;
 
+	/* tx done */
+	if (layout->tx_done.ring_base) {
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+				       layout->tx_done.qid,
+				       layout->tx_done.n_desc,
+				       MT_RX_BUF_SIZE,
+				       layout->tx_done.ring_base);
+		if (ret)
+			return ret;
+	}
+
 	/* rx event */
 	ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU],
 			       layout->rx_mcu.qid,
-- 
2.45.2


