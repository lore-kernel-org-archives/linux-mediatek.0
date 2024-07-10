Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08059C3DA41
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 17:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pnIbYXtvrFzfOBrPJ+BSfnaUUdbrF5IVgVamegXf5A0=; b=ZCw72cdCcI5HFWTStiGcIgYVpT
	8x7Oja7Xsh+Kpe9f45uShjQh/uzPg63Vvrj4ZqluED+2I0HvGK6XgakKCNyvAQgStVs8GDRhNSXCk
	9Dkr3Tjt5XlF/3mFSkera5aps7MkBzizy2qk1ADZ1mgYZ48V17lWnDDjpdm1mFB7M4oERXy9uCMrJ
	Eeh/N9km3uj4eLlvZWN6EILa0WA9/8tiYGBz7sz5A2dzUk/RALwoqpxV1FSophyh7mQ5GYrxI3fjY
	EiEou0WjNT7DPiD1GuD9BarednuUklkQbiPZpHGzQ90gM9ZiPKqd4D5WFlAs9MW15UAT28A0oaJy3
	joJ5ICBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRbYQ-0000000BMkw-3MUg;
	Wed, 10 Jul 2024 17:56:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRbYN-0000000BMkY-2gVI
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 17:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8135FCE1256;
	Wed, 10 Jul 2024 17:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A1DC32781;
	Wed, 10 Jul 2024 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720634188;
	bh=7Jdv/o1WI3up53D1I++jLFbC2bwz21I4CvTE533R1mE=;
	h=From:Date:Subject:To:Cc:From;
	b=dXJ70nQ71BDLThSgun7DBnJxUFXKAJ5jZZbFnNz+H/uTYP1qEPZsGa4/R04vNpNts
	 kOfgtaOClX/RibAThmAqSWH3gSBlGqpjSqUZYL610X0NCN0wGAI5b3UUqqsKCxmKya
	 8A2VMf1e3KX+MyYWtOekNU+Rl3OKKYH+ZXfB4rNupV/+Owfoyka4igtH7PITNN6ZRk
	 uqmAYN9LaDjezmmootCZ4calGk5QgypH3ao1EDCyA4imkv8EKB74e2teWukvaUQzjM
	 8IoFC1ozM7IU2A3zTUVKtDR3RO5CLEKjtjvBjK0rDrMdf/TP8LI7dcXVzb3bA3kK8s
	 LzEIldCVY5PDA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 10 Jul 2024 10:56:24 -0700
Subject: [PATCH bluetooth-next] Bluetooth: btmtk: Mark all stub functions
 as inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-btmtk-add-missing-inline-to-stubs-v1-1-ba33143ee148@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEfLjmYC/x3NwQqDMAyA4VeRnBeoOirsVcYOrY0apulo4hDEd
 1/Z8bv8/wlKhUnh0ZxQ6MvKWSraWwPjEmQm5FQNnevubmgdRtvsjSEl3FiVZUaWlYXQMqrtUXH
 qfe/jmIIfCGrnU2ji4/94Qlx3spxtQaHD4HVdP+4a1uyDAAAA
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5192; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7Jdv/o1WI3up53D1I++jLFbC2bwz21I4CvTE533R1mE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGl9p32evL7lJLjSgvnK9dJfq3dMlFw/yWzTnzcc4usV8
 5SfuL3b0VHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAm0ifB8L/0usWCMCXB+cyi
 9+8Jakx5u6/X6szpczZHlR+k+25TXnyOkaGda7Pu3E/z3/za8OXG+YhTGV8dygwND+5MDLskwrB
 1SzADAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_105632_077486_D7FB137F 
X-CRM114-Status: GOOD (  12.76  )
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

Several recent patches added static stubs to btmtk.h without the inline
keyword, which causes instances of -Wunused-function when those stubs
are not used anywhere in a file that includes the header:

  In file included from drivers/bluetooth/btusb.c:28:
  drivers/bluetooth/btmtk.h:254:13: warning: 'btmtk_fw_get_filename' defined but not used [-Wunused-function]
    254 | static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
        |             ^~~~~~~~~~~~~~~~~~~~~
  drivers/bluetooth/btmtk.h:249:12: warning: 'btmtk_process_coredump' defined but not used [-Wunused-function]
    249 | static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
        |            ^~~~~~~~~~~~~~~~~~~~~~
  drivers/bluetooth/btmtk.h:243:12: warning: 'btmtk_register_coredump' defined but not used [-Wunused-function]
    243 | static int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
        |            ^~~~~~~~~~~~~~~~~~~~~~~
  drivers/bluetooth/btmtk.h:233:12: warning: 'btmtk_setup_firmware' defined but not used [-Wunused-function]
    233 | static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
        |            ^~~~~~~~~~~~~~~~~~~~
  drivers/bluetooth/btmtk.h:227:12: warning: 'btmtk_setup_firmware_79xx' defined but not used [-Wunused-function]
    227 | static int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
        |            ^~~~~~~~~~~~~~~~~~~~~~~~~

Add inline to all the stubs in btmtk.h (even ones that do not currently
have any warnings associated with them) to ensure there are never unused
function warnings from these stubs, as is customary for the kernel.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I omitted a fixes tag because it seems like this was done over several
changes and I think breaking this up is not really necessary but I am
happy to do so if so desired.
---
 drivers/bluetooth/btmtk.h | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 453ed5131a37..5df7c3296624 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -224,70 +224,73 @@ static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
-				     wmt_cmd_sync_func_t wmt_cmd_sync)
+static inline int btmtk_setup_firmware_79xx(struct hci_dev *hdev,
+					    const char *fwname,
+					    wmt_cmd_sync_func_t wmt_cmd_sync)
 {
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
-				wmt_cmd_sync_func_t wmt_cmd_sync)
+static inline int btmtk_setup_firmware(struct hci_dev *hdev, const char *fwname,
+				       wmt_cmd_sync_func_t wmt_cmd_sync)
 {
 	return -EOPNOTSUPP;
 }
 
-static void btmtk_reset_sync(struct hci_dev *hdev)
+static inline void btmtk_reset_sync(struct hci_dev *hdev)
 {
 }
 
-static int btmtk_register_coredump(struct hci_dev *hdev, const char *name,
-				   u32 fw_version)
+static inline int btmtk_register_coredump(struct hci_dev *hdev,
+					  const char *name, u32 fw_version)
 {
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
+static inline int btmtk_process_coredump(struct hci_dev *hdev,
+					 struct sk_buff *skb)
 {
 	return -EOPNOTSUPP;
 }
 
-static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
-				  u32 fw_ver, u32 fw_flavor)
+static inline void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
+					 u32 fw_ver, u32 fw_flavor)
 {
 }
 
-static int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
+static inline int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
+static inline int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	return -EOPNOTSUPP;
 }
 
-static struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
-				      usb_complete_t tx_complete)
+static inline struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev,
+					     struct sk_buff *skb,
+					     usb_complete_t tx_complete)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
-static int btmtk_usb_resume(struct hci_dev *hdev)
+static inline int btmtk_usb_resume(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_usb_suspend(struct hci_dev *hdev)
+static inline int btmtk_usb_suspend(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_usb_setup(struct hci_dev *hdev)
+static inline int btmtk_usb_setup(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
 }
 
-static int btmtk_usb_shutdown(struct hci_dev *hdev)
+static inline int btmtk_usb_shutdown(struct hci_dev *hdev)
 {
 	return -EOPNOTSUPP;
 }

---
base-commit: c60d1a6e1dae1623169d0d97bfd3e50003072eae
change-id: 20240710-btmtk-add-missing-inline-to-stubs-f3636bcda67e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


