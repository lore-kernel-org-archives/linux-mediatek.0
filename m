Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB90C5AC82
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 04:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HklBtXT5z2eP6Jd+6xFEIxRxNCWdG9+0mFY5FBdjaSI=; b=nx8I2E8mB6d4SfT1Sf5jy+W6We
	lJwm9z3AjuQoiWP9C6MaYYojpcopmfhQHBAOIn9jockDme8PrmHQSZeXB2MHb2gG3mIjTDYyK4CTx
	taMBAi4NlFXr+knLgXUr+1Nreh88mWig0+TPtKkD5GQdf+AFDowefs9+azFiBIfpezTzd557jvbRb
	AawBpOmsuMZg6RqsRA1Iesa76WVcm2wBUBw6Aueka+wM9L6dsLsGcmBjUpESgi29PZ/MDbZCPDeP3
	9/rXl3Dgnc4s4nU/56ozA9d5tF859vgx0yd9/o1oiM0mPrkWaiXHTj1t7fAY9MHo/XZ+1D8XubhsA
	ButShavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1c-0000000B0jm-1GPf;
	Mon, 10 Aug 2026 04:54:12 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1V-0000000B0hn-3RNN
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 04:54:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786337638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HklBtXT5z2eP6Jd+6xFEIxRxNCWdG9+0mFY5FBdjaSI=;
	b=fMJiT5uZCjkZR53vAo4a1PebCXDYnNbxWsln+Pq4tR9QatR8dK63IidfBkA/8xuJMqS8BO
	rBV3suhM7/KJ13efnKkdbg1uuowXLPKXhqnor4Kj75IRv1txESABM3PXdAp8Kpkd6idxbf
	6OuKZdFo2BfONwOPNrpIX8ZFnquyn/evPpUoNMo+YqDK2++XyoWcJ8+IoolMke+slFvATS
	W+4UNPWjZepLrfVLdekNB/U0thHwMzeiGWOl0vWH0TD2uSnPWIn4Nnd6/xepjN3fB4rB7G
	sRgXqWOrBi9+MH3f1zQuUtLbou8p94Z5XwKPlzUSJLBUaqs8qvBf8zI1O36qnQ==
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
Subject: [PATCH wireless 0/2] wifi: mt76: fix the dev->mutex / iflist_mtx inversion in .config
Date: Sun,  9 Aug 2026 21:53:36 -0700
Message-ID: <20260810045338.118923-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215406_285880_19FAD4E3 
X-CRM114-Status: UNSURE (   6.76  )
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

mt7921_config() and mt7925_config() hold dev->mutex across
ieee80211_iterate_active_interfaces(), which takes local->iflist_mtx.
mac80211 goes the other way round: it calls drv_unassign_vif_chanctx() with
iflist_mtx held, and mt792x_unassign_vif_chanctx() takes dev->mutex.

Deleting a monitor interface that has a channel assigned hits it. On an
MT7922 with lockdep:

  ip link set wlp4s0 down
  iw phy phy0 interface add mon0 type monitor
  ip link set mon0 up
  iw dev mon0 set freq 5180
  iw dev mon0 del

The splat comes on the last line and nowhere earlier. I reported it in July
and had no reply:
https://lore.kernel.org/linux-wireless/20260730053916.109426-1-lucid_duck@justthetip.ca/

Both ops are reached only from drv_config(), which asserts the wiphy mutex,
so ieee80211_iterate_active_interfaces_mtx() applies and never takes
iflist_mtx. Reproduced and fixed on an MT7922 and an MT7925: splat before,
none after, monitor mode configured and capturing on either arm.

Its kerneldoc says the iterator cannot sleep and these two do, since they
send MCU commands. That line is identical to the _atomic variant's directly
above it, and no version of the helper has taken RCU, a spinlock or
disabled preemption. I can send a doc fix separately if you want one.

The other sites from that report are follow-ups.

Devin Wittmayer (2):
  wifi: mt76: mt7921: fix lock inversion between dev->mutex and
    iflist_mtx
  wifi: mt76: mt7925: fix lock inversion between dev->mutex and
    iflist_mtx

 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.55.0


