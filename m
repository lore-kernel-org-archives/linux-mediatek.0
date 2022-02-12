Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3476C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2x3ScYad1OYtHQozEFR+n8iXAJD3xPq3RVH+CHsReo=; b=SMI5WEqZX/xNkS
	NKSACHnTX+3ANzoxQbgtwrR/jb9h+f5k7isMr1fENp+qkmreZEJlPMr3ro8j5Tn9EYRU7jGPJYk23
	yUI51TDB8tO4Yz7ETNIYAjoRHGH8ksVcdDkXDB2+Dl1LTLBJcgDTCMMIDsbd2wHVN5Zp8NvH2ZKE0
	g5MaYg8PXfd4XODDGFmGHvAsu5iGD2QdNuH3SLs39QJYJSb7fUx4DgnJcN0qKKGy0ER5QI5qgWYwx
	8qufReTU4eX0AjVhvX+wqAfW1c7e7kMCs59Mwm7vrl9KD4HY/0A5ro0EmvhGuTzmrkNEaKvjksEfH
	ai7FACM8v5jxKIiO3vFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIvJ8-00AAbI-Ol; Sat, 12 Feb 2022 16:31:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIvJ4-00AAaQ-Fc
 for linux-mediatek@lists.infradead.org; Sat, 12 Feb 2022 16:31:33 +0000
X-UUID: f52ac80d8e26469f9cd7dd696cbe322c-20220212
X-UUID: f52ac80d8e26469f9cd7dd696cbe322c-20220212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 237154907; Sat, 12 Feb 2022 09:31:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Feb 2022 08:21:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Feb 2022 00:21:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 13 Feb 2022 00:21:11 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Sean Wang <sean.wang@mediatek.com>, Soul Huang
 <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, Leon Yen
 <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, Deren Wu
 <Deren.Wu@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mac80211: fix EAPoL rekey fail in 802.3 rx path
Date: Sun, 13 Feb 2022 00:20:15 +0800
Message-ID: <6889c9fced5859ebb088564035f84fd0fa792a49.1644680751.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_083130_549645_C8C015F8 
X-CRM114-Status: GOOD (  10.90  )
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

From: Deren Wu <deren.wu@mediatek.com>

mac80211 set capability NL80211_EXT_FEATURE_CONTROL_PORT_OVER_NL80211
to upper layer by default. That means we should pass EAPoL packets through
nl80211 path only, and should not send the EAPoL skb to netdevice diretly.
At the meanwhile, wpa_supplicant would not regist sock to listen EAPoL skb
on the netdevice.

However, there is no contorl_port_protocol handler in mac80211 for 802.3 RX
packets, mac80211 driver would pass up the EAPoL rekey frame to netdevice
and wpa_supplicant would be never interactive with this kind of packets,
if SUPPORTS_RX_DECAP_OFFLOAD is enabled. This causes STA always rekey fail
if EAPoL frame go through 802.3 path.

To avoid this problem, align the same process as 802.11 type to handle
this frame before put it into network stack.

Fixes: 80a915ec4427 ("mac80211: add rx decapsulation offload support")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 net/mac80211/rx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 0544563ede52..57f5d5500282 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -4509,12 +4509,7 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
 
 	/* deliver to local stack */
 	skb->protocol = eth_type_trans(skb, fast_rx->dev);
-	memset(skb->cb, 0, sizeof(skb->cb));
-	if (rx->list)
-		list_add_tail(&skb->list, rx->list);
-	else
-		netif_receive_skb(skb);
-
+	ieee80211_deliver_skb_to_local_stack(skb, rx);
 }
 
 static bool ieee80211_invoke_fast_rx(struct ieee80211_rx_data *rx,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
