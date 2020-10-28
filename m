Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96711C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 02:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0E222282
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 02:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N2ej5NNw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oAAo+69y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0E222282
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/srVaXLRQRcqXDRa0z0eTIUBSYL9F7+zgAX8l2JU3M=; b=N2ej5NNwa0xpoGOkKh21VJLwZq
	GgqCNn8oXjGqL4VLIHh/xdcstbhbDn5T3mbtXBobUyCDxrokUgyascC+8ZZrK7V3OT/f2ZHz+jKM9
	hbmpgBZmJCKGmkwnHlhK+xZjkQXQMONKKpfo/kacUEeM+75JwD6sRQeRqhuFHupddhDVLZNqDEiNB
	GAMc0ZOTcmRMyU9IHPJzodIvodR8NfT11dZllyb74/C+IjxFdhXn7bQpYlY9/TxqZpjmmYVV1hRnM
	gMUPQ3334JlEAqSjfwUxSEFgju9lFKFcW6wOF42mk6yR4rOdBPoBpg0f5wv9aAZcjquQApdC5C5cb
	Knobqtfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXb4a-0006cV-6E; Wed, 28 Oct 2020 02:20:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXb4W-0006c0-In
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 02:20:22 +0000
X-UUID: 5cb9d33abb9d478c83d2fb0f6794a057-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rHnJvyRuC+Q6pEX9APo1cQzlBAu7Gfh0TtiXRxOMke0=; 
 b=oAAo+69yKKPEJ5m981vZmokqSOimmmXlc/FlHnSR+sFLx856p4SpoDdmaTR1zGcTYVuwFZbK0L5XSG0If2LMce0TXtiq3b1+2I4+MBwGo24ACYq2tYCUcswHLi0+kSLtt7mQHLkEjwXAplWWwwpqdzoOzYJ55/EHWnRxDZjhs/U=;
X-UUID: 5cb9d33abb9d478c83d2fb0f6794a057-20201027
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1646772298; Tue, 27 Oct 2020 18:20:13 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 19:20:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 10:20:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Oct 2020 10:20:09 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7915: use BIT_ULL for omac_idx
Date: Wed, 28 Oct 2020 10:20:08 +0800
Message-ID: <879705a8af8fa44c711feb3aa0351c1138aeef6c.1603850919.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_222020_831205_A6F96E48 
X-CRM114-Status: GOOD (  10.98  )
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
