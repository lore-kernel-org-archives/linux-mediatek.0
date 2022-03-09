Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC6DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aaooZqvgX9dwslpV3D4yFlioE0wRI7bgcevksXoi4wM=; b=xkLdJtJSYyAZbq
	UUWb/Uphd/U1QPptAcN3wjwKKzCLfv1L5IbLhttbxYJhCSYArlpepOwRCcBmJONBZZCB4Ek/nuSus
	a/unqP0a8FrKMWounpzanwXOoUCdOGS0iMqAKfHrJFcJjriigTa7G1k7Mp+hGtxSHTM6fVWqnp3Bf
	LFbNzt72HmQzVzYc1aGlC+gbdpq+P+onIvzBzGT38+mfoLMsQGuLStjIDUIni+rSMjPt+d9Rqz6lL
	1JaUnGP92sXpp02y6BuPgvaTSz6bxd9Tf7PXoW6NkVs8YOPHiP4uIrfLXwsYTk6Lv23ytnjB/MWkr
	nvarJTquFIKChmgsid7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRwuD-008sAe-UH; Wed, 09 Mar 2022 14:03:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRwuB-008s8z-5A
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 14:03:08 +0000
X-UUID: d719e60b00084654b806d1d3c8ef5e80-20220309
X-UUID: d719e60b00084654b806d1d3c8ef5e80-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <evelyn.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 266827815; Wed, 09 Mar 2022 07:03:01 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 06:03:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 22:02:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 22:02:52 +0800
From: Evelyn Tsai <evelyn.tsai@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Bo Jiao <bo.jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix MBSS index condition in DBDC mode
Date: Wed, 9 Mar 2022 22:02:49 +0800
Message-ID: <20220309140249.10285-1-evelyn.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_060307_227024_EDEB07F9 
X-CRM114-Status: GOOD (  11.48  )
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

MT7915_MAX_INTERFACES is per-band declartion.

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 5e10fe156926..c60af144f611 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -727,7 +727,7 @@ struct mt76_dev {
 	u32 wcid_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
 	u32 wcid_phy_mask[DIV_ROUND_UP(MT76_N_WCIDS, 32)];
 
-	u32 vif_mask;
+	u64 vif_mask;
 
 	struct mt76_wcid global_wcid;
 	struct mt76_wcid __rcu *wcid[MT76_N_WCIDS];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index c3f44d801e7f..9eefc132d77a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -205,7 +205,7 @@ static int mt7915_add_interface(struct ieee80211_hw *hw,
 		phy->monitor_vif = vif;
 
 	mvif->mt76.idx = ffs(~dev->mt76.vif_mask) - 1;
-	if (mvif->mt76.idx >= MT7915_MAX_INTERFACES) {
+	if (mvif->mt76.idx >= (MT7915_MAX_INTERFACES << dev->dbdc_support)) {
 		ret = -ENOSPC;
 		goto out;
 	}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
