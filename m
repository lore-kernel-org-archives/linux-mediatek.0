Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE8C021AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2025 03:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zz7Mmdy05VxZzuiPAVmizlpSB3py7dFzt1wvRz06cJA=; b=ugnfZEMKpPaKGKah8M3jfnhMmC
	tWraW1Hw3nLq1gwAfE3mKPi2DkZMzj2f42CDKswSDWpLPU5WiC9Cq9Tfew3WlD4U6rIpyvV81vtsG
	4xnLh+mCclkbOGRaqp5pbFLii11GbkNYpVBB8cf8wKscWrNcz4XvarrBkdzWcI86rgNVn5VvZ5Hky
	v0dSihVUlryLT0kMC4OhXZkN+n5aEadSS69BbDjv8H+GshE1E33Gr5dIIoXQYQ3OqicxpOkJ5RBBg
	PASHtRyPkxUW/T8f8B149+F63gfTkyqiCCEjt9WIE5Mn1BSApcekJ4MqdgXBZ5uScCjNScn6NPnvS
	cvohARdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkDxa-00000006aEr-3uPv;
	Tue, 18 Feb 2025 03:07:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkDxY-00000006aE0-1x6W
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Feb 2025 03:07:45 +0000
X-UUID: 8310199ceda511ef83f2a1c9db70dae0-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zz7Mmdy05VxZzuiPAVmizlpSB3py7dFzt1wvRz06cJA=;
	b=SSDa8/6tFd7pEN1yOuu5cCn3C9lPxUpKvfXwggAxrySilzvzoazvoqd2jYVPRUKK8zaRkiFPXPBlDnmt3dis+oMgXiBklrZHfxg/UK2kg23yeiyAxlFTPi7JktAuzsXpAZEi3ZMszU0DHIuMDoZ/6cVWphE4cqtzOlvZIIsILOw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f59f11e0-8fbc-4917-8dbf-e3cf3cff028d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:81a479a3-3e52-4e5b-a515-5e42bbdb1515,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-7|-6|0|50,EDM:-3
	,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,USB
X-CID-BAS: 2,USB,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8310199ceda511ef83f2a1c9db70dae0-20250217
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 768850260; Mon, 17 Feb 2025 20:07:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 11:07:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 11:07:36 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>, <kvalo@kernel.org>,
	<kuba@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Nick Morrow <usbwifi2024@gmail.com>,
	<stable@vger.kernel.org>, Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Salah
 Coronya <salah.coronya@gmail.com>
Subject: 
Date: Tue, 18 Feb 2025 11:07:35 +0800
Message-ID: <20250218030736.1995895-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_190744_517288_E48A01F3 
X-CRM114-Status: UNSURE (   9.49  )
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


From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Date: Tue, 18 Feb 2025 09:44:54 +0800
Subject: [net-next, v2] wifi: mt76: mt7921: fix kernel panic due to null pointer
 dereference

This patch addresses a kernel panic caused by a null pointer dereference in the
`mt792x_rx_get_wcid` function. The issue arises because the `deflink` structure
is not properly initialized with the `sta` context. This patch ensures that the
`deflink` structure is correctly linked to the `sta` context, preventing the
null pointer dereference.

[   32.098574] BUG: kernel NULL pointer dereference, address: 0000000000000400
[   32.098620] #PF: supervisor read access in kernel mode
[   32.098634] #PF: error_code(0x0000) - not-present page
[   32.098647] PGD 0 P4D 0
[   32.098665] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   32.098683] CPU: 0 UID: 0 PID: 470 Comm: mt76-usb-rx phy Not tainted 6.12.13-gentoo-dist #1
[   32.098703] Hardware name:  /AMD HUDSON-M1, BIOS 4.6.4 11/15/2011
[   32.098717] RIP: 0010:mt792x_rx_get_wcid+0x48/0x140 [mt792x_lib]
[   32.098776] RSP: 0018:ffffa147c055fd98 EFLAGS: 00010202
[   32.098792] RAX: 0000000000000000 RBX: ffff8e9ecb652000 RCX: 0000000000000000
[   32.098806] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8e9ecb652000
[   32.098819] RBP: 0000000000000685 R08: ffff8e9ec6570000 R09: 0000000000000000
[   32.098832] R10: ffff8e9ecd2ca000 R11: ffff8e9f22a217c0 R12: 0000000038010119
[   32.098845] R13: 0000000080843801 R14: ffff8e9ec6570000 R15: ffff8e9ecb652000
[   32.098860] FS:  0000000000000000(0000) GS:ffff8e9f22a00000(0000) knlGS:0000000000000000
[   32.098876] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   32.098889] CR2: 0000000000000400 CR3: 000000000d2ea000 CR4: 00000000000006f0
[   32.098903] Call Trace:
[   32.098918]  <TASK>
[   32.098932]  ? __die_body.cold+0x19/0x27
[   32.098955]  ? page_fault_oops+0x15a/0x2f0
[   32.098975]  ? search_module_extables+0x19/0x60
[   32.098995]  ? search_bpf_extables+0x5f/0x80
[   32.099012]  ? exc_page_fault+0x7e/0x180
[   32.099030]  ? asm_exc_page_fault+0x26/0x30
[   32.099054]  ? mt792x_rx_get_wcid+0x48/0x140 [mt792x_lib]
[   32.099084]  mt7921_queue_rx_skb+0x1c6/0xaa0 [mt7921_common]
[   32.099114]  mt76u_alloc_queues+0x784/0x810 [mt76_usb]
[   32.099140]  ? __pfx___mt76_worker_fn+0x10/0x10 [mt76]
[   32.099172]  __mt76_worker_fn+0x4f/0x80 [mt76]
[   32.099203]  kthread+0xd2/0x100
[   32.099221]  ? __pfx_kthread+0x10/0x10
[   32.099237]  ret_from_fork+0x34/0x50
[   32.099254]  ? __pfx_kthread+0x10/0x10
[   32.099269]  ret_from_fork_asm+0x1a/0x30
[   32.099290]  </TASK>
[   32.099719] ---[ end trace 0000000000000000 ]---

Reported-by: Nick Morrow <usbwifi2024@gmail.com>
Closes: https://github.com/morrownr/USB-WiFi/issues/577
Cc: stable@vger.kernel.org
Fixes: 90c10286b176 ("wifi: mt76: mt7925: Update mt792x_rx_get_wcid for per-link STA")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Tested-by: Salah Coronya <salah.coronya@gmail.com>
---
v2:
 - Change the Nick from "Tested-by" to "Reported-by"
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 13e58c328aff..78b77a54d195 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -811,6 +811,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->deflink.wcid.phy_idx = mvif->bss_conf.mt76.band_idx;
 	msta->deflink.wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	msta->deflink.last_txs = jiffies;
+	msta->deflink.sta = msta;
 
 	ret = mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 	if (ret)
-- 
2.45.2


