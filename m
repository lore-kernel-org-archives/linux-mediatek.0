Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D11C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 03:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8KI3J490pHIsk2UI/J9wrfU1xLxUotoOzNqjKTRtBHI=; b=2SXm2N+YMb/azA
	rIbZfSEkqIcCqLkVzivgrC6WgTzYj9fA+nyyySCbkWyfcKiQbrNw9bMFGSBeR0hXUSyyLTBLqCv8l
	a0PFDZTYavivon7mCoZ4gj7o50dBi/ewPmkzClKvySDrsWNGQQORvksEgCMK8Oj9Xd/scSl10uzGf
	60VbM9T3TM+zAVRySYJcihOhPgQRcU8E+c1x6kjhw1eevBhb1DzieA6vgzs/vTygTkf2jDEjJdqnj
	ut0Ame1cscK69Hrcr/ukYsZRj0A6NBdemdREz+TjDS6DsBjpUQaWvxorLA17du8izVEh+BnD0qK1P
	4xRkf0dlQH2EbwV/Y9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMgc-000jqv-Qy; Tue, 23 Nov 2021 03:41:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMgZ-000jq5-Fn
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 03:41:37 +0000
X-UUID: 2eb0de9ea7904de1876671e156cfe27c-20211122
X-UUID: 2eb0de9ea7904de1876671e156cfe27c-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xing.song@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1295924295; Mon, 22 Nov 2021 20:41:31 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 19:31:29 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 11:31:25 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Nov 2021 11:31:25 +0800
From: Xing Song <xing.song@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Xing Song <xing.song@mediatek.com>
Subject: [PATCH] mac80211: set up the fwd_skb->dev for mesh forwarding
Date: Tue, 23 Nov 2021 11:31:23 +0800
Message-ID: <20211123033123.2684-1-xing.song@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_194135_554445_28613921 
X-CRM114-Status: UNSURE (   9.38  )
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

Mesh forwarding requires that the fwd_skb->dev is set up for TX handling,
otherwise the following warning will be generated, so set it up for the
pending frames.

[   72.835674 ] WARNING: CPU: 0 PID: 1193 at __skb_flow_dissect+0x284/0x1298
[   72.842379 ] Modules linked in: ksmbd pppoe ppp_async l2tp_ppp ...
[   72.962020 ] CPU: 0 PID: 1193 Comm: kworker/u5:1 Tainted: P S 5.4.137 #0
[   72.969938 ] Hardware name: MT7622_MT7531 RFB (DT)
[   72.974659 ] Workqueue: napi_workq napi_workfn
[   72.979025 ] pstate: 60000005 (nZCv daif -PAN -UAO)
[   72.983822 ] pc : __skb_flow_dissect+0x284/0x1298
[   72.988444 ] lr : __skb_flow_dissect+0x54/0x1298
[   72.992977 ] sp : ffffffc010c738c0
[   72.996293 ] x29: ffffffc010c738c0 x28: 0000000000000000
[   73.001615 ] x27: 000000000000ffc2 x26: ffffff800c2eb818
[   73.006937 ] x25: ffffffc010a987c8 x24: 00000000000000ce
[   73.012259 ] x23: ffffffc010c73a28 x22: ffffffc010a99c60
[   73.017581 ] x21: 000000000000ffc2 x20: ffffff80094da800
[   73.022903 ] x19: 0000000000000000 x18: 0000000000000014
[   73.028226 ] x17: 00000000084d16af x16: 00000000d1fc0bab
[   73.033548 ] x15: 00000000715f6034 x14: 000000009dbdd301
[   73.038870 ] x13: 00000000ea4dcbc3 x12: 0000000000000040
[   73.044192 ] x11: 000000000eb00ff0 x10: 0000000000000000
[   73.049513 ] x9 : 000000000eb00073 x8 : 0000000000000088
[   73.054834 ] x7 : 0000000000000000 x6 : 0000000000000001
[   73.060155 ] x5 : 0000000000000000 x4 : 0000000000000000
[   73.065476 ] x3 : ffffffc010a98000 x2 : 0000000000000000
[   73.070797 ] x1 : 0000000000000000 x0 : 0000000000000000
[   73.076120 ] Call trace:
[   73.078572 ]  __skb_flow_dissect+0x284/0x1298
[   73.082846 ]  __skb_get_hash+0x7c/0x228
[   73.086629 ]  ieee80211_txq_may_transmit+0x7fc/0x17b8 [mac80211]
[   73.092564 ]  ieee80211_tx_prepare_skb+0x20c/0x268 [mac80211]
[   73.098238 ]  ieee80211_tx_pending+0x144/0x330 [mac80211]
[   73.103560 ]  tasklet_action_common.isra.16+0xb4/0x158
[   73.108618 ]  tasklet_action+0x2c/0x38
[   73.112286 ]  __do_softirq+0x168/0x3b0
[   73.115954 ]  do_softirq.part.15+0x88/0x98
[   73.119969 ]  __local_bh_enable_ip+0xb0/0xb8
[   73.124156 ]  napi_workfn+0x58/0x90
[   73.127565 ]  process_one_work+0x20c/0x478
[   73.131579 ]  worker_thread+0x50/0x4f0
[   73.135249 ]  kthread+0x124/0x128
[   73.138484 ]  ret_from_fork+0x10/0x1c

Signed-off-by: Xing Song <xing.song@mediatek.com>
---
 net/mac80211/rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 9541a4c30aca..0544563ede52 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -2944,6 +2944,7 @@ ieee80211_rx_h_mesh_fwding(struct ieee80211_rx_data *rx)
 	if (!fwd_skb)
 		goto out;
 
+	fwd_skb->dev = sdata->dev;
 	fwd_hdr =  (struct ieee80211_hdr *) fwd_skb->data;
 	fwd_hdr->frame_control &= ~cpu_to_le16(IEEE80211_FCTL_RETRY);
 	info = IEEE80211_SKB_CB(fwd_skb);
-- 
2.17.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
