Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D1DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 03:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5uQAXjJTcXgcjfYKD1yfMsrKD/kStcqNaXYf8jV8wfQ=; b=KIsWiHkg4K2FbZ
	cYrclb/QI3FCwphXBeM1MR7oNTDbXusnaihK88qcUcGjG+Nnk3SPcYoJk05n8TabUnvlYYAaHDaZr
	s7xM7KMCQyCxfdnl/Z5dH/Y02rWsEQWzBi9qnxU/DCkrZv/XSbwRfSglfH8fV7hRfBfQYXz5gs6Y+
	tH0jLq5lXRuLmXWg5slA14b0td6IQQJAlLXHk71MHVjdkkOXgpSQsjbzLWDphjSl6frMnZN+Jedg/
	lvj8BV+gGRZ319vYG84R2Uuk/KRjAGN5DDzK846mFjo7dK7MOjlud7dgbU94Z6VjtlYz4+HXPnx6R
	8VI/2mIr9FZzTdK5glKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBq1w-002B6k-GC; Mon, 24 Jan 2022 03:28:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBq1s-002B6M-76
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 03:28:31 +0000
X-UUID: e38da2b5c0604a649e3a208d4ad89665-20220123
X-UUID: e38da2b5c0604a649e3a208d4ad89665-20220123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xing.song@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1922282209; Sun, 23 Jan 2022 20:28:25 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 19:28:23 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 24 Jan 2022 11:28:19 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 24 Jan 2022 11:28:18 +0800
From: Xing Song <xing.song@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Xing
 Song" <xing.song@mediatek.com>
Subject: [PATCH] mt76: stop the radar detector after leaving dfs channel
Date: Mon, 24 Jan 2022 11:28:11 +0800
Message-ID: <20220124032811.47087-1-xing.song@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_192828_301642_BAE0D3D9 
X-CRM114-Status: GOOD (  11.09  )
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

The radar detctor is used for dfs channel. So it will start after switching
to dfs channel and will stop after leaving. The TX will be blocked if radar
detctor isn't stopped in non-dfs channel.

This patch resets the dfs state to indicate the radar detector needs to be
stopped.

Signed-off-by: Xing Song <xing.song@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 9f7ac78f1222..a5432fd5cb93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -291,7 +291,8 @@ static void mt7615_init_dfs_state(struct mt7615_phy *phy)
 	if (hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		return;
 
-	if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR))
+	if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR) &&
+	    !(mphy->chandef.chan->flags & IEEE80211_CHAN_RADAR))
 		return;
 
 	if (mphy->chandef.chan->center_freq == chandef->chan->center_freq &&
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 41b0a4d8b93e..7e03b2a137af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -311,7 +311,8 @@ static void mt7915_init_dfs_state(struct mt7915_phy *phy)
 	if (hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		return;
 
-	if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR))
+	if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR) &&
+	    !(mphy->chandef.chan->flags & IEEE80211_CHAN_RADAR))
 		return;
 
 	if (mphy->chandef.chan->center_freq == chandef->chan->center_freq &&
-- 
2.17.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
