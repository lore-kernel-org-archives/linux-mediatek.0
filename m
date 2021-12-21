Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 02:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nE9b/LMrL9bZScnln58Rgwqb+AsY8uBl+92cMm/vAA=; b=HTuB3bsLVe9adN
	L1hTNcVtKJQGF+jYHjVBkJ35TWxOlf4NO89bTABCMh38AMYTyLEKbVjhF63Mc62rOmNWDtyL4HBc0
	Z0zfLziXhtlzheKQSxv95M9ECjTiHLLX/bkMVZQK8LnyGh0vpBMmiQmHaLp5H7QeYbFkZfhoYMk9Y
	oA+YESpTARuZ2qxE2+W6H78yRd8AT1A0e+7cXR111woju+bfo7sZdWR/Kri1I7QxKrglVWIcX+1vN
	7jAYN+oONs1bLMQzDvgmQmMwoxWF5gPc+c2flmvp4QLfUCEEVyE6X8HihegeTRPIHMZvjA8pjyIam
	hWxv2XTz/16BRZ6IXFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzUWI-005BLi-63; Tue, 21 Dec 2021 02:04:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzUSo-0059Aa-FN; Tue, 21 Dec 2021 02:01:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DFF261355;
 Tue, 21 Dec 2021 02:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236F3C36AEA;
 Tue, 21 Dec 2021 02:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640052069;
 bh=Gn5PrEvDv30Xc7gb6k7s4pXjL3CCq+uxMHEjB0A5ABM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JS4Yx5D3vi7+0bGLntLdpsxee+IFKl3fyJOWvSBO80TIJhAtaFvo1oS6C7o0ISVbU
 ojPXXC+XwBRond5mVqPe9x3hFec/ZQhOAabr9Uqv4IaCkoOUU9/1EMI0z+zgtF6LJs
 luWMIIXCTGLwKYBfIgx1fKy6yUsaJezqM6Kz+n9xxgf+x6mMHVV1HIeH+jxj1Yt4Xs
 Sa8OSh+ZmfqTPgC12EowWnHSz18GM+b9TMvkyZ0O75HAjvH4R4g47NflSY0nYz4vrJ
 qaUbUPmMJJ6tsaRUAdrGkkVOCHYN8GvmsLXDKYy5pHDRdZRlBaF6QA7x7IAP9jOJ7c
 ujpaXseABojog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/11] mac80211: set up the fwd_skb->dev for mesh
 forwarding
Date: Mon, 20 Dec 2021 21:00:21 -0500
Message-Id: <20211221020030.117225-2-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221020030.117225-1-sashal@kernel.org>
References: <20211221020030.117225-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_180114_671162_C83C1E03 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: Sasha Levin <sashal@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
 Xing Song <xing.song@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kuba@kernel.org, johannes@sipsolutions.net,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xing Song <xing.song@mediatek.com>

[ Upstream commit 942bd1070c3a39d1302fc5db73d60c86e3033c81 ]

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
Tested-By: Frank Wunderlich <frank-w@public-files.de>
Link: https://lore.kernel.org/r/20211123033123.2684-1-xing.song@mediatek.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/mac80211/rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index e0baa563a4dea..7ef1fcb9529e8 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -2801,6 +2801,7 @@ ieee80211_rx_h_mesh_fwding(struct ieee80211_rx_data *rx)
 	if (!fwd_skb)
 		goto out;
 
+	fwd_skb->dev = sdata->dev;
 	fwd_hdr =  (struct ieee80211_hdr *) fwd_skb->data;
 	fwd_hdr->frame_control &= ~cpu_to_le16(IEEE80211_FCTL_RETRY);
 	info = IEEE80211_SKB_CB(fwd_skb);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
