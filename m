Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8364C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 02:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E567021D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 02:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8O+y9VR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t4sJoMLm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E567021D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/srVaXLRQRcqXDRa0z0eTIUBSYL9F7+zgAX8l2JU3M=; b=r8O+y9VR8l/4BGoKt6EtKSZBSe
	sGA0gWzpC0rpj8JDw4wwobrL5GXIN3ChdDY86TQPjjqh9rU/wrX9LWfRCVYsxa5ZEwRFa/nIlIyYC
	qzGCokykAEdR6sQ2kahUyQ2/8S6RLl0j6HU9CJ1rK0SyYp6mMoXmA2iig25DYou2mT0DMhEQ6Jlye
	mEFi0ktePdtJz1K61dbejXbQ6XOr6jLRjdBjf4+r3vh4mazBndcSX9GICmdU3Hf1FIxf0zuE+2JLF
	3cpmRFhmrg2W9K3DGNtKlABDH3oqs7CCY03FnGj1kMHbtB6c371LUMA4qsQ0ODtQVSoWZY8xQYQ9S
	TljYYGRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXbK3-0007NX-Uk; Wed, 28 Oct 2020 02:36:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXbK2-0007N2-1i
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 02:36:23 +0000
X-UUID: e48081b094c34f8f9a438b3e0d29b633-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rHnJvyRuC+Q6pEX9APo1cQzlBAu7Gfh0TtiXRxOMke0=; 
 b=t4sJoMLmTaSNMjGxYGT36gb8V4jmd7M7Sx4VD6yu2pSJe4dorv+4Z++1cJXXZDky9h8u6ICbUNqlEZYwiUsgik80AQJLmmgj+20FuWc5d/DO1TZHYtzQSLFv954izE9DVOb5uimfUivTRoksa557GneSApZHlKfQqixe3au7tsU=;
X-UUID: e48081b094c34f8f9a438b3e0d29b633-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 742903809; Tue, 27 Oct 2020 18:36:17 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 19:36:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 10:36:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Oct 2020 10:36:14 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/2] mt76: mt7915: use BIT_ULL for omac_idx
Date: Wed, 28 Oct 2020 10:36:11 +0800
Message-ID: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603852250.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_223622_290078_8982AFAA 
X-CRM114-Status: GOOD (  11.27  )
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

The omac_idx variable is u64 so we should use the 64-bit BIT_ULL().

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 650dcad432de..254db8a6e1df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -231,7 +231,7 @@ static void mt7915_remove_interface(struct ieee80211_hw *hw,
 
 	mutex_lock(&dev->mt76.mutex);
 	phy->mt76->vif_mask &= ~BIT(mvif->idx);
-	phy->omac_mask &= ~BIT(mvif->omac_idx);
+	phy->omac_mask &= ~BIT_ULL(mvif->omac_idx);
 	mutex_unlock(&dev->mt76.mutex);
 
 	spin_lock_bh(&dev->sta_poll_lock);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
