Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638BEC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=biYF5kxNHNXe0XlqfX8dE4ENTyZtqPNgoBq+cFnTO3k=; b=xOLN8t2yA4xoPV
	T28KN1kO79M5gaDNGVW6UdTmAEC+RFSy4/fwje1n9W1ATj/y/fBVzuib7FmXYnHcWc2ncD8ZTHZhc
	5DRl3FUQH/A01CTIQSDK6ykt/Blb2VNfBfMla1dGfY0pgK1cIUfJL7UDG+5OS0c7Veu37dahGTgLE
	6XfUA+MHXFQxLyPQkiNwDjOMKrKFmfQcsPon/8W8PefaEaQMOXtqw6Sw8FkxWjj6RZG0zLytKbSIK
	xhJXBTZKMsgxwhWmbTJVXqqfNwkSEcXdTjkTTIXOJtt4vayaoB+8/DxlNTDXfT6FMADUiTuD6WgL7
	2tfC9+weNrp8yAYh7R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh0rG-0078TM-9G; Wed, 20 Apr 2022 03:18:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh0rD-0078SV-Bb
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 03:18:20 +0000
X-UUID: 52df38bdaf95407886dc4432789fda69-20220419
X-UUID: 52df38bdaf95407886dc4432789fda69-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 603098975; Tue, 19 Apr 2022 20:18:15 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 20:14:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 11:14:54 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 20 Apr 2022 11:14:54 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Bo Jiao
 <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix msta->wcid use-after-free in
 mt76_tx_status_check()
Date: Wed, 20 Apr 2022 11:14:51 +0800
Message-ID: <20220420031451.6770-1-bo.jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_201819_438521_B1D0773C 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

fix msta->wcid use-after-free in mt76_tx_status_check when the sta
has been removed.

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 800f720..160d80e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -701,6 +701,11 @@ void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (!list_empty(&msta->rc_list))
 		list_del_init(&msta->rc_list);
 	spin_unlock_bh(&dev->sta_poll_lock);
+
+	spin_lock_bh(&mdev->status_lock);
+	if (!list_empty(&msta->wcid.list))
+		list_del_init(&msta->wcid.list);
+	spin_unlock_bh(&mdev->status_lock);
 }
 
 static void mt7915_tx(struct ieee80211_hw *hw,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
