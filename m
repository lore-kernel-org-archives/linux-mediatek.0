Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFECC3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5d3PYqUvAD9RWL4rfXNfg3ItuJTaoeexBHixM7y+rvA=; b=CMS5ohwN0S52B3W9wZT0Loe7Vd
	RpItU1AFUWBMvl95Loy4/kY/abw2zZu52ogBPgX/h53cFtBTHk3gxXk++fp7s41btCP7tNwE1bWY3
	MoTGo/NzY6Cn168ozKTYc5IrNuVLsBMMadPb7r/TFYn4AaEfK48L4kxXJQjDlzEI2tt52Zuy56N49
	c6pxNJSP8CAUqA26CrCek8T17R9HFxXyC4lX1vMSsJQENPBl6yI//I6ZUGj0/y6tbG3tXsc1vy+cp
	+KZGkWKJFbZZ2pjQ0tGcJq9gWXlUYSpvdMp0awP4fn2OUybnqK32hMIvD6wrRisITYa+gvesBhLFL
	CpnmUc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTcwg-00000009ek9-1zBg;
	Tue, 16 Jul 2024 07:49:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTcwd-00000009ejf-2LSe
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jul 2024 07:49:56 +0000
X-UUID: fbddc274434711ef955bff358274dad2-20240716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5d3PYqUvAD9RWL4rfXNfg3ItuJTaoeexBHixM7y+rvA=;
	b=rNOrfHJ1tx1DiZgE7UvERafz7z3e7Kaew+NirjFJhjcSfnI5vM/32pvJKcEphyp1c0hfndoIZZJ1SlxOH8wrUJixNasXgPsy2JbGhbBrShM5buzVFAfVKaHDXbzVIDCFwFWW9Y1fliL6oEutFPc2uneV8a027gy+eeSYiJoSNFk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:57b87dbb-eeff-4ae5-bbf6-36f060d98514,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:9e34830d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fbddc274434711ef955bff358274dad2-20240716
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1573146348; Tue, 16 Jul 2024 00:49:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jul 2024 15:49:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jul 2024 15:49:49 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtk: Fix kernel crash when entering btmtk_usb_suspend
Date: Tue, 16 Jul 2024 15:49:47 +0800
Message-ID: <20240716074947.23073-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_004955_625940_2137676D 
X-CRM114-Status: GOOD (  10.20  )
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

If MediaTek's Bluetooth setup is unsuccessful, a NULL pointer issue
occur when the system is suspended and the anchored kill function
is called. To avoid this, add protection to prevent executing the
anchored kill function if the setup is unsuccessful.

[    6.922106] Hardware name: Acer Tomato (rev2) board (DT)
[    6.922114] Workqueue: pm pm_runtime_work
[    6.922132] pstate: 804000c9
(Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.922147] pc : usb_kill_anchored_urbs+0x6c/0x1e0
[    6.922164] lr : usb_kill_anchored_urbs+0x48/0x1e0
[    6.922181] sp : ffff800080903b60
[    6.922187] x29: ffff800080903b60
x28: ffff2c7b85c32b80 x27: ffff2c7bbb370930
[    6.922211] x26: 00000000000f4240
x25: 00000000ffffffff x24: ffffd49ece2dcb48
[    6.922255] x20: ffffffffffffffd8
x19: 0000000000000000 x18: 0000000000000006
[    6.922276] x17: 6531656337386238
x16: 3632373862333863 x15: ffff800080903480
[    6.922297] x14: 0000000000000000
x13: 303278302f303178 x12: ffffd49ecf090e30
[    6.922318] x11: 0000000000000001
x10: 0000000000000001 x9 : ffffd49ecd2c5bb4
[    6.922339] x8 : c0000000ffffdfff
x7 : ffffd49ecefe0db8 x6 : 00000000000affa8
[    6.922360] x5 : ffff2c7bbb35dd48
x4 : 0000000000000000 x3 : 0000000000000000
[    6.922379] x2 : 0000000000000000
x1 : 0000000000000003 x0 : ffffffffffffffd8
[    6.922400] Call trace:
[    6.922405]  usb_kill_anchored_urbs+0x6c/0x1e0
[    6.922422]  btmtk_usb_suspend+0x20/0x38
[btmtk 5f200a97badbdfda4266773fee49acfc8e0224d5]
[    6.922444]  btusb_suspend+0xd0/0x210
[btusb 0bfbf19a87ff406c83b87268b87ce1e80e9a829b]
[    6.922469]  usb_suspend_both+0x90/0x288
[    6.922487]  usb_runtime_suspend+0x3c/0xa8
[    6.922507]  __rpm_callback+0x50/0x1f0
[    6.922523]  rpm_callback+0x70/0x88
[    6.922538]  rpm_suspend+0xe4/0x5a0
[    6.922553]  pm_runtime_work+0xd4/0xe0
[    6.922569]  process_one_work+0x18c/0x440
[    6.922588]  worker_thread+0x314/0x428
[    6.922606]  kthread+0x128/0x138
[    6.922621]  ret_from_fork+0x10/0x20
[    6.922644] Code: f100a274 54000520 d503201f d100a260 (b8370000)
[    6.922654] ---[ end trace 0000000000000000 ]---

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index b7c348687a77..191bc6925120 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1262,7 +1262,8 @@ int btmtk_usb_suspend(struct hci_dev *hdev)
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 
 	/* Stop urb anchor for iso data transmission */
-	usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
+	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
+		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 
 	return 0;
 }
-- 
2.18.0


