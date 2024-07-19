Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D72C3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 03:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=28l8QKvC3Olgg+dWSr28AdW3OebwY6nJGOCrKM+Reoo=; b=Z17iBrcU+a8S+PFXocmlRmv+fR
	vZnmwE2qlWWjiVaVD9IYtR/BaEx9//KYGCx8kelOQb+vy6+M1g3pLAWrkEHgqd67KnNmTY8aIW5DE
	O3rXveiZEsLxLhe77cL8XgwXbg7M7ZEYa1FhM3QdlAxVBrNqIYGqgBTEChPSgiGpHhxj3HRmOKf/Q
	5unU8l81Rcrd0nMS1tEpVJKT6HPHahvtw6tryhPjCc+D50LBwzuypsbYsWJkVrkAU4eXcBy3mOLka
	jVG/DKDEAZEMEF2T1f1A32P9y2Eay5GSmmcrFxBF68H7swGsCRS5PmW7PrHSciKCtVpl73Y9fpZ7K
	kjpecqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUeU4-00000001RlH-3uTq;
	Fri, 19 Jul 2024 03:40:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUeU2-00000001RkP-2EcX
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 03:40:40 +0000
X-UUID: a590bcec458011efa6c87f6b4542ff6b-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=28l8QKvC3Olgg+dWSr28AdW3OebwY6nJGOCrKM+Reoo=;
	b=GF7mCB0u7XqBENEJMVoTkmxb/d5K/Qtfw/Nhu1VQ+OFVUZHmAjF4/R1chWxjxNMgUGpA1Si3ZylcgVuyXRO14OdJ6FJMryFzEcjgNG8sucqi5kmgUINZkkb0Bjcvlts0RaFOZUBeoKT6PqYVu3I2+geMtKJLa/Qc84IT/dm1RaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:1b28693c-f6e0-4fa1-b48c-a3e42b37c679,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:c029a30d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a590bcec458011efa6c87f6b4542ff6b-20240718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 363460693; Thu, 18 Jul 2024 20:40:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jul 2024 11:30:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jul 2024 11:30:27 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v4] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
Date: Fri, 19 Jul 2024 11:30:19 +0800
Message-ID: <20240719033019.26767-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.058100-8.000000
X-TMASE-MatchedRID: I7rsaQFiURCiwkztVCsqbzl6J+7ealtWvtVce6w5+K8sfFlFugSGUAOi
	VFpF7nSJ37TMydxZ0/vc7gUppY5koqcgTP4t5UFTI0cHLI6lhgIoUVkB7ifJnmHtZs6e3ZMHAJY
	y/fBIuxLTUnxbEiZ303MCHJVGredYJBVW14/3QK0D2WXLXdz+AerRJDUyDHkIxKLCLOyCW5DT4r
	vTUn4TmPx3JZLyUT3kodDxruGyL3fhLW5g057g5Xa57ruHAnHxh+w9Wz/xXDq8NrbzjPvzJ41+2
	Gy6CZ06vjnLF6gHXQqAMuqetGVetksDkkP3zIjq3QfwsVk0UbtuRXh7bFKB7tp1NhDvqY8dqP6E
	g/sbYsei8HQVQhN2PDrWGv8jH9iulExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.058100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1B5B1B37C5A8424C95AEBCDFDD4D71ED4D0729E4F5C7754EF717304D376DB58B2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_204038_598310_A914A339 
X-CRM114-Status: UNSURE (   8.17  )
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

Fixes: d019930b0049 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407091928.AH0aGZnx-lkp@intel.com/
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
Change from v3 to v4:
-rebase code base
---
 drivers/bluetooth/btmtk.c | 2 ++
 drivers/bluetooth/btmtk.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 191bc6925120..2b7c80043aa2 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -437,6 +437,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 }
 EXPORT_SYMBOL_GPL(btmtk_process_coredump);
 
+#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
 static void btmtk_usb_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
@@ -1488,6 +1489,7 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
+#endif
 
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
 MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 5df7c3296624..6fc69cd8636b 100644
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


