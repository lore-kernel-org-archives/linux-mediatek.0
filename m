Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB14CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1G2iuVLIFfMskcE7UQQZSx1WXMQskLuTMIhO0Ja1jxc=; b=f5FhFOmC57X3sRqt84b0d0/to9
	FkZt/RaY688WZ2ae5o2hxYiY6T7HEH07ID5qLwHqcfnld8SCkTbWO3UcHHMotAtcx5Qd+e2TOHQZV
	xyH+rRDjK5unkwPULlNVQUfsfMrocJEW+Pum6bgltZ+VYjBxyFlAvXlHHhK3y0Qu150YhvqpJvUrT
	H9VvoBCjr6NPcHV7AnjxY4pNe/3TNtHs4h///4rxYSglSOWeMwszoDD6eQYo0DMqKFkwre7SWGxX+
	W98z6UgxFvsjGiTP/eYrHduYGVRDXy956l4SRm4igKTx64KrBAj2mU79uYosaJExm8Io+sw92Cla3
	she6E/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5fl-00000008ILj-3wsA;
	Wed, 12 Nov 2025 07:53:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5fj-00000008ILN-0KoC
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 07:53:44 +0000
X-UUID: b3715b7cbf9c11f09f706fa2197c6ceb-20251112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1G2iuVLIFfMskcE7UQQZSx1WXMQskLuTMIhO0Ja1jxc=;
	b=rtgELYZyIN3To4bGUZdsKYjHvWdSHUpkGTc5NSJnOQtwE/YFUp98YP4KyXF58zEXjdVZBZe+luTkySzi9qzv22+/ow3Jah6jquUZ07netUsf5S/EutRE8SDANRLnuVK8aPNHV6ufW0t6HZa7uG3ggsfs27FURXqAxEdiwvvnjIA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0c351974-5d07-4242-9f57-aaa3e9c48607,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d09eb5ba-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b3715b7cbf9c11f09f706fa2197c6ceb-20251112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 382329268; Wed, 12 Nov 2025 00:53:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 12 Nov 2025 15:53:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 12 Nov 2025 15:53:36 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Hao Qin <hao.qin@mediatek.com>, Will
 Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, Steve Lee
	<steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btusb: mediatek: Fix kernel crash when releasing mtk iso interface
Date: Wed, 12 Nov 2025 15:53:34 +0800
Message-ID: <20251112075334.1162328-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_235343_154716_7CAE0980 
X-CRM114-Status: GOOD (  13.71  )
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

When performing reset tests and encountering abnormal card drop issues
that lead to a kernel crash, it is necessary to perform a null check
before releasing resources to avoid attempting to release a null pointer.

<4>[   29.158070] Hardware name: Google Quigon sku196612/196613 board (DT)
<4>[   29.158076] Workqueue: hci0 hci_cmd_sync_work [bluetooth]
<4>[   29.158154] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
<4>[   29.158162] pc : klist_remove+0x90/0x158
<4>[   29.158174] lr : klist_remove+0x88/0x158
<4>[   29.158180] sp : ffffffc0846b3c00
<4>[   29.158185] pmr_save: 000000e0
<4>[   29.158188] x29: ffffffc0846b3c30 x28: ffffff80cd31f880 x27: ffffff80c1bdc058
<4>[   29.158199] x26: dead000000000100 x25: ffffffdbdc624ea3 x24: ffffff80c1bdc4c0
<4>[   29.158209] x23: ffffffdbdc62a3e6 x22: ffffff80c6c07000 x21: ffffffdbdc829290
<4>[   29.158219] x20: 0000000000000000 x19: ffffff80cd3e0648 x18: 000000031ec97781
<4>[   29.158229] x17: ffffff80c1bdc4a8 x16: ffffffdc10576548 x15: ffffff80c1180428
<4>[   29.158238] x14: 0000000000000000 x13: 000000000000e380 x12: 0000000000000018
<4>[   29.158248] x11: ffffff80c2a7fd10 x10: 0000000000000000 x9 : 0000000100000000
<4>[   29.158257] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : 2d7223ff6364626d
<4>[   29.158266] x5 : 0000008000000000 x4 : 0000000000000020 x3 : 2e7325006465636e
<4>[   29.158275] x2 : ffffffdc11afeff8 x1 : 0000000000000000 x0 : ffffffdc11be4d0c
<4>[   29.158285] Call trace:
<4>[   29.158290]  klist_remove+0x90/0x158
<4>[   29.158298]  device_release_driver_internal+0x20c/0x268
<4>[   29.158308]  device_release_driver+0x1c/0x30
<4>[   29.158316]  usb_driver_release_interface+0x70/0x88
<4>[   29.158325]  btusb_mtk_release_iso_intf+0x68/0xd8 [btusb (HASH:e8b6 5)]
<4>[   29.158347]  btusb_mtk_reset+0x5c/0x480 [btusb (HASH:e8b6 5)]
<4>[   29.158361]  hci_cmd_sync_work+0x10c/0x188 [bluetooth (HASH:a4fa 6)]
<4>[   29.158430]  process_scheduled_works+0x258/0x4e8
<4>[   29.158441]  worker_thread+0x300/0x428
<4>[   29.158448]  kthread+0x108/0x1d0
<4>[   29.158455]  ret_from_fork+0x10/0x20
<0>[   29.158467] Code: 91343000 940139d1 f9400268 927ff914 (f9401297)
<4>[   29.158474] ---[ end trace 0000000000000000 ]---
<0>[   29.167129] Kernel panic - not syncing: Oops: Fatal exception
<2>[   29.167144] SMP: stopping secondary CPUs
<4>[   29.167158] ------------[ cut here ]------------

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btusb.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e0e30f00a678..fcc62e2fb641 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2741,9 +2741,16 @@ static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff *skb)
 
 static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 {
-	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
+	struct btmtk_data *btmtk_data;
 	int err;
 
+	if (!data->hdev)
+		return;
+
+	btmtk_data = hci_get_priv(data->hdev);
+	if (!btmtk_data)
+		return;
+
 	/*
 	 * The function usb_driver_claim_interface() is documented to need
 	 * locks held if it's not called from a probe routine. The code here
@@ -2765,17 +2772,30 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 
 static void btusb_mtk_release_iso_intf(struct hci_dev *hdev)
 {
-	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
+	struct btmtk_data *btmtk_data;
+
+	if (!hdev)
+		return;
+
+	btmtk_data = hci_get_priv(hdev);
+	if (!btmtk_data)
+		return;
 
 	if (test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags)) {
 		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 		clear_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags);
 
-		dev_kfree_skb_irq(btmtk_data->isopkt_skb);
-		btmtk_data->isopkt_skb = NULL;
-		usb_set_intfdata(btmtk_data->isopkt_intf, NULL);
-		usb_driver_release_interface(&btusb_driver,
-					     btmtk_data->isopkt_intf);
+		if (btmtk_data->isopkt_skb) {
+			dev_kfree_skb_irq(btmtk_data->isopkt_skb);
+			btmtk_data->isopkt_skb = NULL;
+		}
+
+		if (btmtk_data->isopkt_intf) {
+			usb_set_intfdata(btmtk_data->isopkt_intf, NULL);
+			usb_driver_release_interface(&btusb_driver,
+						     btmtk_data->isopkt_intf);
+			btmtk_data->isopkt_intf = NULL;
+		}
 	}
 
 	clear_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags);
-- 
2.45.2


