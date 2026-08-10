Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4701C5AD55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 04:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wwr5kmWf5hpa0pEkxAw4sYvKXnvwgXIL/4/Lx7PCg6s=; b=IthV0ZsvuNzIZjeqD/pzZnH1+4
	BA9ISx+2ioieolXpNBcGY4jQgEnJcscIBoWBJNVgMJXwmuPfe/CPv7lh7LRgnlo/qlm9T96KNaEww
	L+qux0Kgqew5llP6P3vLwBibxEznUvLZbXi2ZPvJqmvwVST/Zsgvf+yOKJ4zFdVyRIpaWG+9DLcdG
	XkZHhlRJ1ROngtt1AnwHTM/8091VH3cJ6YsMbjERRN2jnoPjhsaAxAG0vXbxtqOrPid1+0Qkp9gJH
	ID0o5Tn2qo+OKUEJjN4maszQiDIjelE/1i3Y5obSRJDdQrK+sfu6T28LFRxrtyCmlHZ1jeww+leAD
	KDzSUNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1d-0000000B0jz-1Rxl;
	Mon, 10 Aug 2026 04:54:13 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-171.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtI1W-0000000B0hv-2au4
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 04:54:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786337642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wwr5kmWf5hpa0pEkxAw4sYvKXnvwgXIL/4/Lx7PCg6s=;
	b=Fj8CkSJc/vKPgVC95rOhBx9fgZm28mEge18/Jb7H0EjKCV3xdJnI7xOv8LbmJTm45ffPJL
	NuLAtu3CucZrBLuXUx9wECa49oiH9rPRU6My26Xa56MWShcI3NqC23MzMIINB7luJhMbVx
	ZR9fkbke0NLNl4gZ7u3Q5er6BenCIW1Vqna7O/H/EsPlDHWdVZr/NKar3d3UcFEx0Juw6P
	XFKR3xUgA8Kkq6OSYcz3co7n4pLCL+48n/RjCUt4G/Nxw1C4g5vjeURt7MweSK9+yVo0sV
	xz2GTv1Re67deBPHUB1NJqSJDvCya1fCnaqcF0G7JG+qyu+Izq8/iSN/2EAxEQ==
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
Subject: [PATCH wireless 2/2] wifi: mt76: mt7925: fix lock inversion between dev->mutex and iflist_mtx
Date: Sun,  9 Aug 2026 21:53:38 -0700
Message-ID: <20260810045338.118923-3-lucid_duck@justthetip.ca>
In-Reply-To: <20260810045338.118923-1-lucid_duck@justthetip.ca>
References: <20260810045338.118923-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_215406_804037_57573E12 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt7925_config() has the same inversion as mt7921_config(): it holds
dev->mutex across ieee80211_iterate_active_interfaces(), which takes
local->iflist_mtx, while mac80211 calls drv_unassign_vif_chanctx() with
iflist_mtx already held.

.config is only reached through drv_config(), which asserts the wiphy
mutex, so use ieee80211_iterate_active_interfaces_mtx() here too.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2b6cc8e253c0..b42564283a01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -816,9 +816,9 @@ static int mt7925_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 	}
 
 	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
-		ieee80211_iterate_active_interfaces(hw,
-						    IEEE80211_IFACE_ITER_RESUME_ALL,
-						    mt7925_sniffer_interface_iter, dev);
+		ieee80211_iterate_active_interfaces_mtx(hw,
+							IEEE80211_IFACE_ITER_RESUME_ALL,
+							mt7925_sniffer_interface_iter, dev);
 	}
 
 out:
-- 
2.55.0


