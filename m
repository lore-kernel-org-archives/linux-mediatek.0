Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B29C5AE49
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 04:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIejKVdJ5f9l9V+gM9JKEr6hyxVA4B5zV7tAh4ot/R8=; b=MicGQsA2M4eYrmclKWytFGuc3F
	GLXkHgvRQsSWc6oqmmfrMSpEN9av/TqAz/t505ohyyAX8yVUQR3/fEAFW+60WHTqEm6GqtKgJsdM6
	zFPPpmtmjMEd/T6kV8osQnbxuoAKs6xFxPU4rHwIoc/CrSqOr5JrvAKHp+fi5cPS/pyk3av6vfjpf
	KYptw4s0nrNC9zX8+rB3zYmg6OQ9Hnf14L2ALXjOU7i97vp9U85PaMjcKCVqdcpn0Vsbty8EzWbPx
	jfthlI0QzR0SNiD2F+tehBODD82ZTnbtoHAYdBC8jPbYr/gEC8cvdPFvrrsykxZJl9zLjdwH+FJ4S
	iikTdvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1b-0000000B0jX-0yaF;
	Mon, 10 Aug 2026 04:54:11 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1V-0000000B0hp-48vN
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 04:54:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786337640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIejKVdJ5f9l9V+gM9JKEr6hyxVA4B5zV7tAh4ot/R8=;
	b=foOvnZKgHs27wI3z77g7WH2RrxzQ6Mp57s9IReQuuyOhXmFC4MmwzgXxn8LL03j4S9eE6h
	ZfDyA6E8CidcIoEpm2Wod2H9wHJNwwkpb97dG2cb293+NcyXhuhPYqwC8+vfus186cVuTA
	h3gItTXewKEqUil5PFKmrtMrQgXY7cekGhkDkBD/2Y2fQdNFydI0cd2bUdgT0E8S7eie1g
	x/avyyLVILbMnVsuqRkpgALboySG6bm1qyNNue44aLanW4dRm2vE7QVyNnqF+19M/DxsOM
	FCVkDplOHZxDO7HQJt90mug0EkYTFb0tpag4lPsWAUhzakXd//JeYks5KKmkUA==
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
Subject: [PATCH wireless 1/2] wifi: mt76: mt7921: fix lock inversion between dev->mutex and iflist_mtx
Date: Sun,  9 Aug 2026 21:53:37 -0700
Message-ID: <20260810045338.118923-2-lucid_duck@justthetip.ca>
In-Reply-To: <20260810045338.118923-1-lucid_duck@justthetip.ca>
References: <20260810045338.118923-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215406_286260_8ACEF35D 
X-CRM114-Status: UNSURE (   9.05  )
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

mt7921_config() holds dev->mutex across
ieee80211_iterate_active_interfaces(), which takes local->iflist_mtx.
mac80211 uses the opposite order: ieee80211_del_virtual_monitor() holds
iflist_mtx while calling drv_unassign_vif_chanctx(), and
mt792x_unassign_vif_chanctx() takes dev->mutex.

Deleting a monitor interface that has a channel assigned reaches the
second order and lockdep reports the cycle. The driver side of it:

  -> #1 (&local->iflist_mtx){+.+.}-{4:4}:
         __mutex_lock+0xda/0x1070
         ieee80211_iterate_interfaces+0x34/0x70 [mac80211]
         mt7921_config+0xb8/0xe0 [mt7921_common]
         drv_config+0x63/0x1d0 [mac80211]

.config is only reached through drv_config(), which asserts the wiphy
mutex, so ieee80211_iterate_active_interfaces_mtx() can be used. It walks
the same list under the wiphy mutex and never takes iflist_mtx, which
drops the driver's dev->mutex -> iflist_mtx edge.

Fixes: cbaa0a404f8d ("mt76: mt7921: fix up the monitor mode")
Link: https://lore.kernel.org/linux-wireless/20260730053916.109426-1-lucid_duck@justthetip.ca/
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3480205d5fb9..a3d06992cc17 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -652,9 +652,9 @@ static int mt7921_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 	}
 
 	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
-		ieee80211_iterate_active_interfaces(hw,
-						    IEEE80211_IFACE_ITER_RESUME_ALL,
-						    mt7921_sniffer_interface_iter, dev);
+		ieee80211_iterate_active_interfaces_mtx(hw,
+							IEEE80211_IFACE_ITER_RESUME_ALL,
+							mt7921_sniffer_interface_iter, dev);
 	}
 
 out:
-- 
2.55.0


