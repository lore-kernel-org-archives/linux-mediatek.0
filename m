Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AA4C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bkvgIktChmzkooE5NvOvL26cQeo/bI5bJkOyPX+YUEQ=; b=BTbBG19E+KtmFysODb+ZBi+Qs3
	oda+qTn/F8VWYViGhw3NldzkTrUiADzsJZuMb01JZDmbstWNytbGBNGU0rLLlBcHLJZnJ+JxVOudK
	wXidBCUEaGk7aO0AXl3YQOBKVkBOTRWYhSgsqJplrEQEHVcF+4PN0KZVy/jGZXvDMjCoZLWWvJDd3
	ijrPlQr0GQYX5p+0U0ZlfN620KOKFDJGhY6wtrvJqB0u6ZaXrQ2mmEsvr7hPblW8RrwKFac9pYQ/Q
	i+/ww1sPkOi2ejtcmDtrQM+bz9/NUeQMVUALan8GDSIjZJztwtCwNbIAePvRpEBzwgI3wyyDg1ufa
	PK9jT2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmS7-00000008VAz-1eOj;
	Mon, 22 Jul 2024 06:23:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmS4-00000008VAU-0QwY
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 06:23:18 +0000
X-UUID: dec24bd847f211ef955bff358274dad2-20240721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bkvgIktChmzkooE5NvOvL26cQeo/bI5bJkOyPX+YUEQ=;
	b=Gn4f3PxTqaOq/WUPUHaceJAaHs5AFeIOeYvuFtjI4+uaPinobYg4Mon4rVrPDIbMIqU+pCqGJwVFCnYzHnLBrlSCMbZ826OuP85erPuyMqLJczTbQMKI6QGMt6qESJc9KGISsJpgMY8P15MUJblVorcEmMpFRFKkbEW0rvcAV3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:c241d2a0-4944-4330-adb9-fb98c19cc672,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:06839fd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dec24bd847f211ef955bff358274dad2-20240721
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 663540062; Sun, 21 Jul 2024 23:23:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 22 Jul 2024 14:22:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 22 Jul 2024 14:22:35 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH] Bluetooth: btmtk: Fix function-declaration build error
Date: Mon, 22 Jul 2024 14:22:16 +0800
Message-ID: <20240722062216.16090-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_232316_154622_C473032D 
X-CRM114-Status: UNSURE (   7.79  )
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

Separate out the declaration of usb related function into another
if/else condition in btmtk.h, avoiding function-declaration issue
happened when CONFIG_BT_HCIBTUSB was defined but CONFIG_BT_HCIBTUSB_MTK
wasn't.

'btmtk_usb_subsys_reset';
ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
'alloc_mtk_intr_urb';
ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
'btmtk_usb_setup';
ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
'btmtk_usb_shutdown';ISO C99 and later do not support
implicit function declarations [-Wimplicit-function-declaration]

Fixes: 52828ea60dfd ("Bluetooth: btmtk: Fix btmtk.c undefined reference build error")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407200904.hRqT3JKD-lkp@intel.com/
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 6fc69cd8636b..fcc44800cf29 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -201,23 +201,6 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
 
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor);
-
-#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
-int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
-
-int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
-
-struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
-			       usb_complete_t tx_complete);
-
-int btmtk_usb_resume(struct hci_dev *hdev);
-
-int btmtk_usb_suspend(struct hci_dev *hdev);
-
-int btmtk_usb_setup(struct hci_dev *hdev);
-
-int btmtk_usb_shutdown(struct hci_dev *hdev);
-#endif
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
@@ -259,7 +242,25 @@ static inline void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
 					 u32 fw_ver, u32 fw_flavor)
 {
 }
+#endif
+
+/* USB interface related functions */
+#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
+int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
+
+int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
+
+struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
+			       usb_complete_t tx_complete);
 
+int btmtk_usb_resume(struct hci_dev *hdev);
+
+int btmtk_usb_suspend(struct hci_dev *hdev);
+
+int btmtk_usb_setup(struct hci_dev *hdev);
+
+int btmtk_usb_shutdown(struct hci_dev *hdev);
+#else
 static inline int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
 	return -EOPNOTSUPP;
-- 
2.18.0


