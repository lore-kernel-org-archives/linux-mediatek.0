Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C263BC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LY8wrhZT2/j08yzF+EkdR+9clkRxKx5d8E6tPh9GQkg=; b=yC9s5O/Mbiw4HBiCHWoP/NCFmg
	uFtT4SVTcL41JpNJB46zHv0mH9fOb9bUUH+vKdgFt78DSU3Fo8baCRJFiL+UBBiZYYHsZ63CK6ntr
	KA99QA6R45ygiJpbZS6igC3L0eGIeAJ6Cr4RC8hBmGhZUiFOpJ4UyLMksE0I/0q2OohhzmlIlFSz3
	ayHMesTRRUmzDm6b+3FHSVblBHT08eJD2pc+km36YPIv9gvQgxFdhMX+xR8EVSys4HbF9NBqXikc7
	RaiYEefMuJkemGnfGcYAHbodjkYkkV0cLQiAXHMxH1ZDB/I/PTSBEadfRwRLBywCBw4lWrwlAtDEy
	cg6mydlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZF4b-00000002IS5-3JP5;
	Wed, 31 Jul 2024 19:33:21 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZF4Z-00000002IQl-0iDe
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 19:33:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LY8wrhZT2/j08yzF+EkdR+9clkRxKx5d8E6tPh9GQkg=; b=MywBFxEi/hYLhq9u4gO91F2Hyq
	ugg2kXZrjiuMuXyIyASAjAGkCYfp04YBX9z6btvT/k60wRBq7aplkl+l6DRRT6UKQywWk9Pr2Jq3p
	0iFA24+G5G5eYUp1UyduACmg/ixA/nSeAqD+BzTTwWdLJH+Zdld79jX1BftyeH+p0uA0afbD4Cic4
	QlS9Rc1GdgAoNBVw4MxThZcUm6zR3CSmxmxMYZgMyyYlIHoDzrQzHz23xqGbwCmSolHUYf387KlOJ
	+4C3eXtWPvR/UNX02YA+wiPY5uSSlAUzvO1PPZpi0MvVEtu+0uqa5N7cV4HWALD6ihvoiLgMY6m0y
	JQXDXT2A==;
Received: from 179-125-70-184-dinamico.pombonet.net.br ([179.125.70.184] helo=quatroqueijos.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sZEby-0067OU-3q; Wed, 31 Jul 2024 21:03:46 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-bluetooth@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jing Cai <jing.cai@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	kernel-dev@igalia.com,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH] Bluetooth: btmtk: avoid UAF in btmtk_process_coredump
Date: Wed, 31 Jul 2024 16:03:30 -0300
Message-Id: <20240731190330.1619718-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_123319_216674_806EDCDB 
X-CRM114-Status: GOOD (  11.64  )
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

hci_devcd_append may lead to the release of the skb, so it cannot be
accessed once it is called.

==================================================================
BUG: KASAN: slab-use-after-free in btmtk_process_coredump+0x2a7/0x2d0 [btmtk]
Read of size 4 at addr ffff888033cfabb0 by task kworker/0:3/82

CPU: 0 PID: 82 Comm: kworker/0:3 Tainted: G     U             6.6.40-lockdep-03464-g1d8b4eb3060e #1 b0b3c1cc0c842735643fb411799d97921d1f688c
Hardware name: Google Yaviks_Ufs/Yaviks_Ufs, BIOS Google_Yaviks_Ufs.15217.552.0 05/07/2024
Workqueue: events btusb_rx_work [btusb]
Call Trace:
 <TASK>
 dump_stack_lvl+0xfd/0x150
 print_report+0x131/0x780
 kasan_report+0x177/0x1c0
 btmtk_process_coredump+0x2a7/0x2d0 [btmtk 03edd567dd71a65958807c95a65db31d433e1d01]
 btusb_recv_acl_mtk+0x11c/0x1a0 [btusb 675430d1e87c4f24d0c1f80efe600757a0f32bec]
 btusb_rx_work+0x9e/0xe0 [btusb 675430d1e87c4f24d0c1f80efe600757a0f32bec]
 worker_thread+0xe44/0x2cc0
 kthread+0x2ff/0x3a0
 ret_from_fork+0x51/0x80
 ret_from_fork_asm+0x1b/0x30
 </TASK>

Allocated by task 82:
 stack_trace_save+0xdc/0x190
 kasan_set_track+0x4e/0x80
 __kasan_slab_alloc+0x4e/0x60
 kmem_cache_alloc+0x19f/0x360
 skb_clone+0x132/0xf70
 btusb_recv_acl_mtk+0x104/0x1a0 [btusb]
 btusb_rx_work+0x9e/0xe0 [btusb]
 worker_thread+0xe44/0x2cc0
 kthread+0x2ff/0x3a0
 ret_from_fork+0x51/0x80
 ret_from_fork_asm+0x1b/0x30

Freed by task 1733:
 stack_trace_save+0xdc/0x190
 kasan_set_track+0x4e/0x80
 kasan_save_free_info+0x28/0xb0
 ____kasan_slab_free+0xfd/0x170
 kmem_cache_free+0x183/0x3f0
 hci_devcd_rx+0x91a/0x2060 [bluetooth]
 worker_thread+0xe44/0x2cc0
 kthread+0x2ff/0x3a0
 ret_from_fork+0x51/0x80
 ret_from_fork_asm+0x1b/0x30

The buggy address belongs to the object at ffff888033cfab40
 which belongs to the cache skbuff_head_cache of size 232
The buggy address is located 112 bytes inside of
 freed 232-byte region [ffff888033cfab40, ffff888033cfac28)

The buggy address belongs to the physical page:
page:00000000a174ba93 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33cfa
head:00000000a174ba93 order:1 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0x4000000000000840(slab|head|zone=1)
page_type: 0xffffffff()
raw: 4000000000000840 ffff888100848a00 0000000000000000 0000000000000001
raw: 0000000000000000 0000000080190019 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888033cfaa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
 ffff888033cfab00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
>ffff888033cfab80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff888033cfac00: fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc
 ffff888033cfac80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

Check if we need to call hci_devcd_complete before calling
hci_devcd_append. That requires that we check data->cd_info.cnt >=
MTK_COREDUMP_NUM instead of data->cd_info.cnt > MTK_COREDUMP_NUM, as we
increment data->cd_info.cnt only once the call to hci_devcd_append
succeeds.

Fixes: 0b7015132878 ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/bluetooth/btmtk.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index b7c348687a77..46f605249df7 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -395,6 +395,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btmtk_data *data = hci_get_priv(hdev);
 	int err;
+	bool complete = false;
 
 	if (!IS_ENABLED(CONFIG_DEV_COREDUMP)) {
 		kfree_skb(skb);
@@ -416,19 +417,22 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case HCI_DEVCOREDUMP_ACTIVE:
 	default:
+		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
+		if (data->cd_info.cnt >= MTK_COREDUMP_NUM &&
+		    skb->len > MTK_COREDUMP_END_LEN)
+			if (!memcmp((char *)&skb->data[skb->len - MTK_COREDUMP_END_LEN],
+				    MTK_COREDUMP_END, MTK_COREDUMP_END_LEN - 1))
+				complete = true;
+
 		err = hci_devcd_append(hdev, skb);
 		if (err < 0)
 			break;
 		data->cd_info.cnt++;
 
-		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
-		if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
-		    skb->len > MTK_COREDUMP_END_LEN)
-			if (!memcmp((char *)&skb->data[skb->len - MTK_COREDUMP_END_LEN],
-				    MTK_COREDUMP_END, MTK_COREDUMP_END_LEN - 1)) {
-				bt_dev_info(hdev, "Mediatek coredump end");
-				hci_devcd_complete(hdev);
-			}
+		if (complete) {
+			bt_dev_info(hdev, "Mediatek coredump end");
+			hci_devcd_complete(hdev);
+		}
 
 		break;
 	}
-- 
2.34.1


