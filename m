Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F75C61DE2
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 06:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1sfhaV4dMhd4NlzKHXpZLDgoQchdPj43PNlO9pC3s8=; b=wtjTEutOfB0zZ9giLL7OY/d/Cu
	o1ACGY8lhjk3TqktLLnoecHfDffzLYTokg6J+5ySvttVrava0ydSd/Q3cCzrlwjyb40ToyG+KW1pW
	NYlZTuCP+pnfJiYjol2bKLas5a8IQRwBsmMF0265IRex1LYQgY4oirCMo/V+R08kat754mLqW4/pn
	VSbqYMPplYC+Fos829431D9RngjjDxz60MeGahuY9ekcZNBcu6rUSCMVvHkapE8/upHalwjkekpCd
	CBWDCz/9d2Hz75R+ZuWbgIuHOOyMyZgWtW50d1ldXxaBYWdLhiSABwYvL9LQ1HcdhtpEWueNv8ptY
	uFwUEIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ZF8-00000007WmH-0WDI;
	Sun, 30 Aug 2026 06:42:14 +0000
Received: from out-224.mta0.migadu.com ([2001:41d0:1004:224b::e0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ZF5-00000007Wkq-0rOh
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 06:42:12 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7MKfCcBndncjeNxWHOxZyoVYJLtzxHUJwjDBGR4CTDA=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788072129; v=1; x=1788676929;
 b=mEL6NROGtz6yBwONmHHGmGEcQNwXN0Tm1t1JyDHpk81BY6m8tac3aaejKQfgkD30RuPQB96O
 8y65CsJx/IYRbrnEBkhasyGPz58E9n3iXAGL5GvjRQK2ZUXiJEJzlARmtdbFeF/QBBHWNead2Lr
 ZBQmm/BCZ9IbfcJZJeJv+7ks1GbLYshMcgrADbyAjY+xRN5oLCdv+JbvP61rjwHYu6uvtIXMLuQ
 RjHKmsl6ifPp1yzvz1FKn38y1z+KMokGQQYGr2sAa0lZzdhUhFTgvtndlml5FqcbwPC5fSXfhiD
 YmDuNb9azeo0uP4kuFHAwk/qt2gGn2kCQecaOnaNIVaCA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3abbd23f51e05e81;
	Sun, 30 Aug 2026 06:42:09 +0000
X-Mizu-Trace-ID: 3abbd23f51e05e81
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
Subject: [PATCH wireless 2/2] wifi: mt76: mt7925: fix the lock inversion in suspend and resume
Date: Sat, 29 Aug 2026 23:42:01 -0700
Message-ID: <20260830064201.92285-3-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830064201.92285-1-lucid_duck@justthetip.ca>
References: <20260830064201.92285-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_234211_386242_B1489C9C 
X-CRM114-Status: UNSURE (   7.40  )
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

Same as the previous patch, other driver.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 84b55f008b3d..44ac2d5e1bdc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1717,10 +1717,10 @@ static int mt7925_suspend(struct ieee80211_hw *hw,
 	mt792x_mutex_acquire(dev);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
-	ieee80211_iterate_active_interfaces(hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7925_mcu_set_suspend_iter,
-					    &dev->mphy);
+	ieee80211_iterate_active_interfaces_mtx(hw,
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt7925_mcu_set_suspend_iter,
+						&dev->mphy);
 
 	mt792x_mutex_release(dev);
 
@@ -1735,10 +1735,10 @@ static int mt7925_resume(struct ieee80211_hw *hw)
 	mt792x_mutex_acquire(dev);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
-	ieee80211_iterate_active_interfaces(hw,
-					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7925_mcu_set_suspend_iter,
-					    &dev->mphy);
+	ieee80211_iterate_active_interfaces_mtx(hw,
+						IEEE80211_IFACE_ITER_RESUME_ALL,
+						mt7925_mcu_set_suspend_iter,
+						&dev->mphy);
 
 	ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 				     MT792x_WATCHDOG_TIME);
-- 
2.55.0


