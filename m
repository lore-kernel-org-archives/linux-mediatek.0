Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85348C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 17:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAAAE233F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 17:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAAAE233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wtpfr9rSmYJO43QTQBmXPAbaDZR5ETnH0TRM44+x1TM=; b=3PHHgru6erDN/B5dTTT0ki5m0/
	RoD8CvN8ePid9HKQaw+n8wiOGhR18PTrOPAlO/H/AdjPN3IOsbn+/fr/htPrGxK4+CX4wOsIBe4YA
	QiXaF96y9A63cXnqrDlmXGvscKUEhewL+KB54v4yAy1u0mm32wz5z/MdCI3eG1aZEXzLhKB3U4X3L
	hkbdzMH4EqvZkcXTUOhAeOOCVId4A2klHP3pl6Adl8Yi3QDPY5VRLM5rRfwKB3S0V8Uin8rwBPbXw
	H8K+uNAucX/ZEfYvCVDLpIAbdh7vtlrxYS9CuR2eSgoPLkPAwGKfCkxioixPOqR5EpG35t7RaFs0t
	Z6uH/H/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpaXi-0000LO-MG; Wed, 16 Dec 2020 17:24:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpaXf-0000Kt-4J
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 17:24:48 +0000
X-UUID: 8d7b6b9849984105843d92be91133a89-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=36tlgGIDiVLMFSkMD4pQxFyiIkGXdTj5uUEMP0aTCKk=; 
 b=IYaGEctW0Bst90gw+F+EwCG2CjkNSUAFJbg8BFleMcEshAa7tAHUIhFI+5RADpzz79kFLW9cxfsWqLFVQavRGx55FRiVRw/x1d+WjyUUnJYsIdHLrkA6/vG4TJ6tn3rRsSb79P83rJopDXw17udQXwuVJQA84dhLeKDw1eQXdjM=;
X-UUID: 8d7b6b9849984105843d92be91133a89-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 465175192; Wed, 16 Dec 2020 09:24:40 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 09:24:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 01:24:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Dec 2020 01:24:31 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: increase buffer size to receive large MPDUs
Date: Thu, 17 Dec 2020 01:24:33 +0800
Message-ID: <00af8edba9bad0e3635ca6024fcf56b3bcd407f8.1608139125.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 22E80B00BD3160462AC45C12C5C498467279081312E2CABE828927BE4E031CA82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_122447_359783_FE33EEE0 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This improves 5G/HE Rx performance around 70mbps.

Tested-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 8c1f9c77b14f..a8c783be297f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -203,7 +203,7 @@ int mt7915_dma_init(struct mt7915_dev *dev)
 {
 	/* Increase buffer size to receive large VHT/HE MPDUs */
 	struct mt76_bus_ops *bus_ops;
-	int rx_buf_size = MT_RX_BUF_SIZE * 2;
+	int rx_buf_size = MT_RX_BUF_SIZE * 4;
 	int ret;
 
 	dev->bus_ops = dev->mt76.bus;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
