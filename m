Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A530C38150
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvSw0YCcP6OkaKMinb0d5io/X3LmFsIcP7XhTzkLI/c=; b=K+63YzgauAqB297hj/m2EGyS9L
	vno9+vuRNm4+YSHUpO8DUdSyaRghcOVHUMDfTqd0o69EhQpEbrUnLj3XaAsj9QA7tty2tyFLcMMdW
	GKjLRDjDJWJJe30PTMxer0amBwgGjixmBNWxq3Rku5HEm5tdTNnutX1A4XIgLSeKouLd/mQRmxr5c
	FmdGUfy/+BQblUbjgYwUY95f/ghb4iGi6qekpuzoxQcTEVXiEY9bZELSbOUV2OOMb1pcqCVmTHatf
	eej5opqOtnhvd3UpsGq28TigyTcXmiXV6Je1vVDIgnc3V7mJODmlPV4FL2/tBw/3sRm5owKnSSg6E
	2Y8yUUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRRue-00000009l4J-1Ejm;
	Wed, 10 Jul 2024 07:38:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRRua-00000009l16-2kck
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 07:38:50 +0000
X-UUID: 6b407df43e8f11efa6c87f6b4542ff6b-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mvSw0YCcP6OkaKMinb0d5io/X3LmFsIcP7XhTzkLI/c=;
	b=Tmpgs1ijDkccsmszzkw+X3d4HdfbngcDEraO9w7+VF++5p8Gd4h4HRmF/3nR474RZgQkJfi856M5LXxSoVJ8R1BO2E/5469ci2QkCvtbtgNifP8iK/+BaLk5PmzPzTZjoLxp1vSvisaKt0Q7ngRV3/BYaw2DWccj6JMvakkFFEw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:550cad6b-7cd9-4de7-9166-7e2bc198440d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:63e24ed1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6b407df43e8f11efa6c87f6b4542ff6b-20240710
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1048190396; Wed, 10 Jul 2024 00:38:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 15:38:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 15:38:33 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
Date: Wed, 10 Jul 2024 15:38:32 +0800
Message-ID: <20240710073832.4381-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.091700-8.000000
X-TMASE-MatchedRID: IL7zMc1rB96iwkztVCsqbzl6J+7ealtWvtVce6w5+K8sfFlFugSGUDAx
	/Q55TgrfZW9aUrh/vYDSwA55kcDk3Pww9Stut6YHmNvbnzNu6oL4qCLIu0mtICz+5QCTrE/sI6q
	q9xPsXYiTFmqgSxbocNnFK+oGmxAsIzPPScfZfh+gx+na8dyT1fqtWPv3hAK2Cjo47SvV0k1Xvy
	lpgLr3gMrdT5sfS91sBFQhScLIoJdAW3ODyfm3/gwfhKwa9GwDftnnpG0AB3VdhPmPvbogbKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrUWRK7Bl4Dml/FhLcV2i0H//0q3VBjI4L5bjsrNE7+gtGl94
	w95vR5c=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.091700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5E7C9090678A3D3D1A6745644C61EEA5F16F33400E3FA696709DF94C7AE55AC22000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_003848_724839_E8B313D5 
X-CRM114-Status: UNSURE (   9.78  )
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

MediaTek move some usb interface related function to btmtk.c which
may cause build failed if BT USB Kconfig wasn't enabled.
Fix undefined reference by adding config check.

Fixes: 39a9e1c69e74 Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407091928.AH0aGZnx-lkp@intel.com/
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 2 ++
 drivers/bluetooth/btmtk.h | 4 ++++
 2 files changed, 6 insertions(+)

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
index 453ed5131a37..890dbe9beff8 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -165,6 +165,7 @@ struct btmtk_data {
 	btmtk_reset_sync_func_t reset_sync;
 	struct btmtk_coredump_info cd_info;
 
+#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
 	struct usb_device *udev;
 	struct usb_interface *intf;
 	struct usb_anchor *ctrl_anchor;
@@ -177,6 +178,7 @@ struct btmtk_data {
 
 	/* spinlock for ISO data transmission */
 	spinlock_t isorxlock;
+#endif
 };
 
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
@@ -202,6 +204,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor);
 
+#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
 
 int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
@@ -216,6 +219,7 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
 int btmtk_usb_setup(struct hci_dev *hdev);
 
 int btmtk_usb_shutdown(struct hci_dev *hdev);
+#endif
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
-- 
2.18.0


