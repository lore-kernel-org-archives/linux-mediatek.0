Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B2C3DA42
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 00:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ifJT5fUayNFbF/d8Vs6tcLVSXEDZGqDZXqqzL0+y4k=; b=D8xuWRy6gQ+Z0EsI87P4Dbbtza
	XDsqWNotKtiPC+D/Lc1hUIsfe85HwevhL0HqI8Kb+UhI9w0Ek7ToAwBzGwrj60YpJXz6a/v48S3LM
	qzyx5ExAbZeKChYZM1k/+tFRgFjWNhMXyiv8RE6wC7Pvpmvy+Bu1/yZZBdg0BzZdgr0vu5OJof4Nq
	NtQavFCElps4S/5Z9g814o+6qI+7YJ+9mIC3lJH9xQMFidbhI7W4IOaXPrZpLWrkoGxJK1l30DsR0
	nPB57fhp0n4zQwPBsRqyCLSiUBRXqjUdyfKEqlAY6OIfheBJZtJmqsXjZwUZgKS4UZSQIVRaac6TE
	riHUk8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRhp5-0000000CFJW-3lRg;
	Thu, 11 Jul 2024 00:38:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRhp2-0000000CFJ5-39PC
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jul 2024 00:38:10 +0000
X-UUID: d63ed2703f1d11efa6c87f6b4542ff6b-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4ifJT5fUayNFbF/d8Vs6tcLVSXEDZGqDZXqqzL0+y4k=;
	b=O4XljNBk1JAmJ5k8aZPte08FLnnouljTbbUtSRjWa82K2PGo4S0MbGfLALJaU7rEjBuJ8IrjdSBWupkfSxL9NxYEGdMLforNpeO5elS0ujPp5Rc3nU/qmY7XQYxyAJwwZEWEOogz1lkE1hPw/AUrDt8G++X8nerkbhfWWCNK6OU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:41080cd4-41fb-4801-9962-fea9b5c03f77,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:68fd2645-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d63ed2703f1d11efa6c87f6b4542ff6b-20240710
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1743390744; Wed, 10 Jul 2024 17:38:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 11 Jul 2024 08:38:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 11 Jul 2024 08:38:01 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
Date: Thu, 11 Jul 2024 08:37:59 +0800
Message-ID: <20240711003759.18644-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.944500-8.000000
X-TMASE-MatchedRID: wjXr8BNNQ6iiwkztVCsqbzl6J+7ealtWvtVce6w5+K8sfFlFugSGUAOi
	VFpF7nSJ37TMydxZ0/vc7gUppY5koqcgTP4t5UFTI0cHLI6lhgIoUVkB7ifJnmHtZs6e3ZMHAJY
	y/fBIuxLTUnxbEiZ30zAYnDoLfAffAef6h21z2pAflhDI6DvVlkyQ5fRSh2656T1ArrMwNVq6h8
	11TFv4c3ZaxeQSvArMSQv+FB+NQDofbciQjfRltRn0UD4GU5IqQBnqdxuJ5SAUtdRZTmEaIcJfR
	ix8rcI6dR3E5cRxwyiN6fDbnTu0nx8TzIzimOwPbdTuPa9VRGvEQdG7H66TyH4gKq42LRYk/H0g
	76nIVo3es9jlDCKhVe+7jUpl//joxAyCzWH1zgN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.944500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0EF1E6A077C4CC8F187001CEDDA52C4E625076B535373DA94F3692C0A2D61C212000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_173808_823578_7081085F 
X-CRM114-Status: UNSURE (   7.89  )
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

MediaTek moved some usb interface related function to btmtk.c which
may cause build failed if BT USB Kconfig wasn't enabled.
Fix undefined reference by adding config check.

btmtk.c:(.text+0x89c): undefined reference to `usb_alloc_urb'
btmtk.c:(.text+0x8e3): undefined reference to `usb_free_urb'
btmtk.c:(.text+0x956): undefined reference to `usb_free_urb'
btmtk.c:(.text+0xa0e): undefined reference to `usb_anchor_urb'
btmtk.c:(.text+0xb43): undefined reference to `usb_autopm_get_interface'
btmtk.c:(.text+0xb7e): undefined reference to `usb_autopm_put_interface'
btmtk.c:(.text+0xf70): undefined reference to `usb_disable_autosuspend'
btmtk.c:(.text+0x133a): undefined reference to `usb_control_msg'

Fixes: 39a9e1c69e74 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407091928.AH0aGZnx-lkp@intel.com/
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
Change from v2 to v3:
-remove #if in structure in case error causes with certain compilier
---
 drivers/bluetooth/btmtk.c | 2 ++
 drivers/bluetooth/btmtk.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index b7c348687a77..9789296ad4f6 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -437,6 +437,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 }
 EXPORT_SYMBOL_GPL(btmtk_process_coredump);
 
+#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
 static void btmtk_usb_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
@@ -1487,6 +1488,7 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
+#endif
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 453ed5131a37..6bb59f4096b7 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -202,6 +202,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor);
 
+#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
 
 int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
@@ -216,6 +217,7 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
 int btmtk_usb_setup(struct hci_dev *hdev);
 
 int btmtk_usb_shutdown(struct hci_dev *hdev);
+#endif
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
-- 
2.18.0


