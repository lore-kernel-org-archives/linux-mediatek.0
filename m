Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F410EC61DB9
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU1XZAsA74zqD1vhKywchfC+Fb+gsyBczwTGvyR7vCU=; b=RCrGqjfZhxk9te7q3pIHaqJFkG
	CpnWIefqTrYaMB0pxJycjxChewad9XR/0xmWjrxws/urFabimJmx6UsBawc3/gOip1eYkdEpejN8d
	K03vsoWbYuSIlD+7k7vwUJsTzddQ4IgnqnL/3NZBzU/UcCeH4Xgclm2WQ1dGk3ZiL3UiLPR0F34Qv
	91pwCvOUPt6qlZYyEYLx4WFu2ehhju6OvyqQVLpeRePx61QuK8A2A72/Qx4O/kvs6E5sd+J3GXAeK
	SyhQR1ZpeYEOfXtiVnnJiuVJIOZeMhGfZznOw0rUSxkijrj1rrMGCgz/HkAgAnQe2mKZno2r/syag
	E4zb9GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ZF6-00000007WlM-3pW8;
	Sun, 30 Aug 2026 06:42:12 +0000
Received: from out-222.mta0.migadu.com ([2001:41d0:1004:224b::de] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ZF3-00000007WkM-0qyq
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 06:42:11 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=lwntEoPEeZ5hIqcQzszGuiaXI6UrB+4Mx0DCavUnjvY=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788072127; v=1; x=1788676927;
 b=UyWQoejHSz51qxz9XOBa5R/Xx/X5mQEsJmp+pckQwUXuSmTTw8bECZ7h8LnsXxq/VD9/9bOZ
 ZOy/TjnEsjHYHFAQtpynK6xhYjsXxCsK3ADjGg7FRH4ZbqkiEBGz5mbuyKG5jCXq+w1I9RKmJjt
 UOUMEvwkNmPraa3mBd+w3brdzGcmp9DWaG7SMcefcvRY+V4zyYr1UwZnRy4CBXlV0vXE8EoV5Bj
 P8fcyChULt1r9yv+9Zx6+UQsSGYhToE7d7qf1nLP7OC0w0uhYAvplJR7G9LrF23pz9+p5ay6M3C
 UoaBxYqsnjBI++DEwAj3T1s2jNQuKABuaNyI/9ieomh9A==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a55ad1e27de18dd5;
	Sun, 30 Aug 2026 06:42:06 +0000
X-Mizu-Trace-ID: a55ad1e27de18dd5
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH wireless 1/2] wifi: mt76: mt7921: fix the lock inversion in suspend and resume
Date: Sat, 29 Aug 2026 23:42:00 -0700
Message-ID: <20260830064201.92285-2-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830064201.92285-1-lucid_duck@justthetip.ca>
References: <20260830064201.92285-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_234209_381358_A6A0F28D 
X-CRM114-Status: UNSURE (   7.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Same inversion as the config path, same one word fix, missed the
first time. Both are called with the wiphy mutex held, so the walk
can rely on that instead of taking the list mutex.

No new splat: same class pair as the accepted fix, and lockdep
reports a pair once per boot.

Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
Link: https://patch.msgid.link/20260810045338.118923-2-lucid_duck@justthetip.ca
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 68a059504e83..bd8d969dfee5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1156,10 +1156,10 @@ static int mt7921_suspend(struct ieee80211_hw *hw,
 	mt792x_mutex_acquire(dev);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
-	ieee80211_iterate_active_interfaces(hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7921_mcu_set_suspend_iter,
-					    &dev->mphy);
+	ieee80211_iterate_active_interfaces_mtx(hw,
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt7921_mcu_set_suspend_iter,
+						&dev->mphy);
 
 	mt792x_mutex_release(dev);
 
@@ -1174,10 +1174,10 @@ static int mt7921_resume(struct ieee80211_hw *hw)
 	mt792x_mutex_acquire(dev);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
-	ieee80211_iterate_active_interfaces(hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt76_connac_mcu_set_suspend_iter,
-					    &dev->mphy);
+	ieee80211_iterate_active_interfaces_mtx(hw,
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt76_connac_mcu_set_suspend_iter,
+						&dev->mphy);
 
 	ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 				     MT792x_WATCHDOG_TIME);
-- 
2.55.0


