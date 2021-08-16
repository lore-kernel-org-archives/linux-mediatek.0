Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BF1C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 00:35:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D546139E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 00:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31D546139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YT23V3wgVhCcHVzkPjnqTprkJhGL90W0YPLxHxV4984=; b=sdahl1bnzpvlHG
	Sm6+gcnmvqjjmEulH6wiGzi30DBUcXNlxQ1bKWOTIfTjIvAuDIKLcozCz5UFKfJ8AwcOKbq/gMd38
	ASjgOeov49Xny4ixbVpZQTni94Qyjc4lgyj0PKxFsAumM0tCnG7mVl0mkuKzDGcmAlev4oO67HbsB
	S/iF3+F/ZaC19SDSavkMu730bW/eZjnRTI3ie6UhR/bsCIo5pfH4IWUTXcXs1fSphM0ZznzV8ie+z
	X2YFKaPVM9PSSauAuK0a28A4cIQfAUwxKmIjDBgbScpig3HVDrQ2sgKF3dau+C88BmqMkdt0Y2Ccu
	TpexPf4KEoo/qRFnX8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFQam-00FtMH-A4; Mon, 16 Aug 2021 00:35:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFQad-00FtId-Rq
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 00:35:02 +0000
X-UUID: a607700867ce4ae1880fbd524d7c4448-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SzuqjEk5ExkSN6ZWK5ODCejJ4Z9C+5128yNv/P5asWM=; 
 b=E3j0jbm8NwYYFMC7foq6H/0flOyY5fUC+gfXde5KbgpK4mqZRZl8PYFg84wV/5UKuDFFBFw2yyP/DHXslIw/v3wTwarJHfCWRbsEbQAxgc7cgxnm10BpHcHoy0JZINz0Ro7iTN1XTtn7eS80J+Bc0eL8jRQfaq4Kzo0vTCnLPxQ=;
X-UUID: a607700867ce4ae1880fbd524d7c4448-20210815
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 142824777; Sun, 15 Aug 2021 17:34:51 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 17:34:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 08:34:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Aug 2021 08:34:48 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 3/3] mt76: mt7915: rename debugfs tx-queues
Date: Mon, 16 Aug 2021 08:32:28 +0800
Message-ID: <20ff58d2856ca5f3ee45250ee0dbc7d517134a3a.1629073504.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3f393508b9ed8251f4e2408356110af092c8ad3e.1629073504.git.ryder.lee@mediatek.com>
References: <3f393508b9ed8251f4e2408356110af092c8ad3e.1629073504.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_173456_960062_9A0228E1 
X-CRM114-Status: UNSURE (   8.86  )
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

Rename "queues" to "tx-queues" and remove a duplicated MT_TXQ_BE.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index fdb4017e1ff9..f626e367151a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -379,12 +379,11 @@ mt7915_queues_read(struct seq_file *s, void *data)
 		struct mt76_queue *q;
 		char *queue;
 	} queue_map[] = {
-		{ dev->mphy.q_tx[MT_TXQ_BE],	 "WFDMA0" },
-		{ ext_q,			 "WFDMA1" },
-		{ dev->mphy.q_tx[MT_TXQ_BE],	 "WFDMA0" },
+		{ dev->mphy.q_tx[MT_TXQ_BE],	 "MAIN" },
+		{ ext_q,			 "EXT" },
 		{ dev->mt76.q_mcu[MT_MCUQ_WM],	 "MCUWM"  },
 		{ dev->mt76.q_mcu[MT_MCUQ_WA],	 "MCUWA"  },
-		{ dev->mt76.q_mcu[MT_MCUQ_FWDL], "MCUFWQ" },
+		{ dev->mt76.q_mcu[MT_MCUQ_FWDL], "MCUFWDL" },
 	};
 	int i;
 
@@ -451,7 +450,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	if (!dir)
 		return -ENOMEM;
 
-	debugfs_create_devm_seqfile(dev->mt76.dev, "queues", dir,
+	debugfs_create_devm_seqfile(dev->mt76.dev, "tx-queues", dir,
 				    mt7915_queues_read);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "hw-queues", dir,
 				    mt7915_hw_queues_read);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
