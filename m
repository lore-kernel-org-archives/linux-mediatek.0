Return-Path: <SRS0=K2BI=IC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F405C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:35:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04AE64F43
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Mar 2021 13:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B04AE64F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZ3+UByjMtImByBqd0ahtmF2XsTyz61FYkrafQGz41A=; b=YD65yAV/HNuw7hu+dKdIWmIhQ
	/qznrN4dqLHrcbYtpzdPMqBbYlO0FhxYeeqrIBFSChNzLEzZxnhjRc5hyj4erRYtapObQRn8PVGrn
	bZ1XgCBBGrm8hLhfVGAUU7wB5e1m47CwdwxKs55G4oWVZuBuakiY2LkMi8JEMrI+XgZR4F4FJFC28
	Swzk6bM4JCS0YLSDxjh49oQ/BsYrJ3zMn6X1xIeK0e+yVIG4sHUdasgTfpE/NRxclvEot0UPMAHhJ
	IHtEPVJOaucCe1EnVQ+R7sADGchWOufyvfueJMVBRxmxvKbRGruHOWrG73m0M8J6E6RhDcoD3PHvI
	SmYpWoFCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHo8i-008lZV-3W; Thu, 04 Mar 2021 13:35:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHo8c-008lY1-Re
 for linux-mediatek@lists.infradead.org; Thu, 04 Mar 2021 13:35:38 +0000
X-UUID: 47ec2122b4ef4b808d81a53586d19ba7-20210304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qpt7mK9+6UdB6YiUWW6FGwMifHUQkMCII30VTDrvVg0=; 
 b=Dnb+dehm4UBsp94Bc11tq4mtlM4PV32JZIXbi2T0z8a6UBcc3+2Z88EOellteuvhbgvasJlFjqSx80iX5+NmQ9i0UIfhKbodF+VJDCqsJmQBNind4wwZ39eRf6231ygxGeUsQZg7IgmJ+zWui2PPTWhIXnMNfODX0s4On0SD+K8=;
X-UUID: 47ec2122b4ef4b808d81a53586d19ba7-20210304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 398324641; Thu, 04 Mar 2021 05:35:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Mar 2021 05:25:27 -0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Mar 2021 21:25:26 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/3] mt76: mt7663s: make all of packets 4-bytes aligned in
 sdio tx aggregation
Date: Thu, 4 Mar 2021 21:25:22 +0800
Message-ID: <8f6807d6161efbed6d585a2ca041d4b126b30451.1614863741.git.objelf@gmail.com>
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

Each packet should be padded with the additional zero to become 4-bytes
alignment in sdio tx aggregation.

Fixes: 1522ff731f84 ("mt76: mt7663s: introduce sdio tx aggregation")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
index 9fb506f2ace6..2d3b7d1e2c92 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
@@ -218,6 +218,7 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
 	int qid, err, nframes = 0, len = 0, pse_sz = 0, ple_sz = 0;
 	bool mcu = q == dev->q_mcu[MT_MCUQ_WM];
 	struct mt76_sdio *sdio = &dev->sdio;
+	u8 pad;
 
 	qid = mcu ? ARRAY_SIZE(sdio->xmit_buf) - 1 : q->qid;
 	while (q->first != q->head) {
@@ -234,7 +235,8 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
 			goto next;
 		}
 
-		if (len + e->skb->len + 4 > MT76S_XMIT_BUF_SZ)
+		pad = roundup(e->skb->len, 4) - e->skb->len;
+		if (len + e->skb->len + pad + 4 > MT76S_XMIT_BUF_SZ)
 			break;
 
 		if (mt7663s_tx_pick_quota(sdio, mcu, e->buf_sz, &pse_sz,
@@ -252,6 +254,9 @@ static int mt7663s_tx_run_queue(struct mt76_dev *dev, struct mt76_queue *q)
 			len += iter->len;
 			nframes++;
 		}
+
+		memset(sdio->xmit_buf[qid] + len, 0, pad);
+		len += pad;
 next:
 		q->first = (q->first + 1) % q->ndesc;
 		e->done = true;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
