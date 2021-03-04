Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDA7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:26:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B209E64F2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B209E64F2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1AYW7N3X7528VsO2UiWuTML2EDU4xMoxHyC9frB9eOc=; b=lXYwUnvqvSB+WRmYK2mWCpXlk
	XwKliR4R5iSRAwDIZK3YjcjQb5Bmw+2fVOZJPDAVtckbsV+qFrHnWQNESgmJWpX8rRBPzdXNd63UW
	5BehMVCNNY84hXXF5fl9KV1DzgGEftZX4TMauQx/T+MZrNWt4jmxrxokpRLBAFPNqv5tPGnojX2Yt
	otaPuH8Mgdp1AxRPhc7aEaiwpuQdkHnS5b50OUvy9dFsJTWVVbhrOGN0+B2DUT7u9oSSBs6Fcayf8
	RY15AiNX4t+1GzKqe8dSpDoyGpXZBnYLl7AvCrmDQhO/vWkXAT/XCJTz1634oLd/NVZgymOISmgxf
	Q5vzqD+6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHnzA-008jsT-N5; Thu, 04 Mar 2021 13:25:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHnz0-008jqC-Qx
 for linux-mediatek@lists.infradead.org; Thu, 04 Mar 2021 13:25:43 +0000
X-UUID: d92f81cf3e5045359395da695bb2deda-20210304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fRxxVM9hTCT8akBnptA/Vvb5Yp+hcTyvfgtIvrleoRA=; 
 b=rp80SOUKBaNzJOFq0LaIQYTedTYLoyktRc6VnOCZeC14QyyQuJLr1XEtjVscKL4MAyxN8oNpwoChOalyEmxg6zzGvylMrYRT7tFcVTY2f9SqgYld6UDpr9D8Z5E6t70iN6rIH6GEXzbXpa9/verJJ7lWEIq0V5Caz56prNdhtP0=;
X-UUID: d92f81cf3e5045359395da695bb2deda-20210304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1935348573; Thu, 04 Mar 2021 05:25:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Mar 2021 05:25:28 -0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Mar 2021 21:25:28 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/3] mt76: mt7663s: fix the possible device hang in high
 traffic
Date: Thu, 4 Mar 2021 21:25:23 +0800
Message-ID: <99976d786b85749243af3a3a32886d5fe94d11ac.1614863741.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <801a2aa986f5486a0e789065feef7b77c612ea7b.1614863741.git.objelf@gmail.com>
References: <801a2aa986f5486a0e789065feef7b77c612ea7b.1614863741.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
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

From: Sean Wang <sean.wang@mediatek.com>

Use the additional memory barrier to ensure the skb list up-to-date
between the skb producer and consumer to avoid the invalid skb content
written into sdio controller and then cause device hang due to mcu assert
caught by WR_TIMEOUT_INT.

Fixes: 1522ff731f84 ("mt76: mt7663s: introduce sdio tx aggregation")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c | 2 ++
 drivers/net/wireless/mediatek/mt76/sdio.c             | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
index 2d3b7d1e2c92..29e510d263fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
@@ -225,6 +225,8 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		struct mt76_queue_entry *e = &q->entry[q->first];
 		struct sk_buff *iter;
 
+		smp_rmb();
+
 		if (!test_bit(MT76_STATE_MCU_RUNNING, &dev->phy.state)) {
 			__skb_put_zero(e->skb, 4);
 			err = __mt7663s_xmit_queue(dev, e->skb->data,
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 0b6facb17ff7..a18d2896ee1f 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -256,6 +256,9 @@ mt76s_tx_queue_skb(struct mt76_dev *dev, struct mt76_queue *q,
 
 	q->entry[q->head].skb = tx_info.skb;
 	q->entry[q->head].buf_sz = len;
+
+	smp_wmb();
+
 	q->head = (q->head + 1) % q->ndesc;
 	q->queued++;
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
