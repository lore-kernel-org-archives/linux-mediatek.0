Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA7C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B5A61A46
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B5A61A46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=muVsH0Ho/5l3BgIRFdtEsi0J7w/OtbrW3xWa4L+hn1U=; b=WhQXUVb/E2gttZ
	2ZL0cx3FHkkRIVwY0IeP0BV5+oabQNI36Z+j7gzGiupY7zyB66YTMqSMgYoSVM4RXtVH9+jxHThvg
	7S1yyQ0NpKZVioNB4bw92g0TscqtTA9y7EQ8dd7Sz6f0/MSk0x9CTirDLhvC/zuUdU1f0LOlu56r6
	RGuhC0WgPPim2u807k1TiGODdVEaqPmEn558W9WAnlBlpdkLtiSCs4odUgVEErNA8PaCJG3PQ0i6t
	mjR6RVvGjrvykEnPaQJwnv/WSndXBkNY6IU6/7p6ejyP1hhjCYoIgT5dgtkdohpSfOzdiaI5iOEDE
	JraSBEHknkR9bmbAldPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0iv6-00BBLs-EL; Tue, 06 Jul 2021 11:07:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0iv3-00BBKT-5G
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:07:15 +0000
X-UUID: 70cc72ce5da44e94a9dd9f1540e609c3-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fySLpMv1btIaAU30kbuqvjoMxsndC4XVwJAZOxYQYGA=; 
 b=Izir+vJ/aEkO2rEuajX54bDheErDs19tad0zqcW9tB4GDgibTCGAa0SC1kaHXPVp7NB6Qsn/C+No0GzPgi/wzYJEPfHoA1U3eR2LrYJCxCstF/nI9bBBSmXkae8IPLpgg8VjKmPzKIdf9o5S3lVMWMiLHjG8JxJvpVhFFWjtpuw=;
X-UUID: 70cc72ce5da44e94a9dd9f1540e609c3-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2082130816; Tue, 06 Jul 2021 04:07:10 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 03:57:08 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Jul 2021 18:56:57 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 6 Jul 2021 18:56:57 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Bo Jiao
 <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix calling mt76_wcid_alloc with incorrect
 parameter
Date: Tue, 6 Jul 2021 18:56:54 +0800
Message-ID: <20210706105654.4044-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B28D185ECE3A57D2545846F76292825BB233DA99F37DE772B60AACE3605F5B792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040713_249088_A32D8718 
X-CRM114-Status: GOOD (  10.11  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

It will cause maximum connectable STA to be one less
when calling mt76_wcid_alloc with parameter MT7915_WTBL_STA - 1.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 4798d6344305..1d2214519f5a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -480,7 +480,7 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 	}
 
 	/* Beacon and mgmt frames should occupy wcid 0 */
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA - 1);
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
 	if (idx)
 		return -ENOSPC;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index c25f8da590dd..d8abebcffe4b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -613,7 +613,7 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	int ret, idx;
 
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA - 1);
+	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
 	if (idx < 0)
 		return -ENOSPC;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
