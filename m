Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCBFC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YicvWYDtzdD3kDkgPbvuiETzXe1eRDbQTVMWRQ080c=; b=Mda963neeWMLU365TkJoZ7243g
	jfQXOPvuiJWH3vA3F4uOfeyrG2qEAk/NPvI+uIqorhEYwxLXullsxxDrq6a8lANZnRi8N7MA+TGt7
	CTVwWmEtKpKr3ViAYLKGant5wdV3LXDxKPX0eow+gtl25cFtSSV1s+ZC0Rdf7UC7cavptUpQh2Ejj
	7XUmmxuXO6bgyWdwKtCZ1izBDq18n7InqpjQtnQVt08ffNEHPk2f56Bvtt2jtkXNmx5Bs3fuZhFV2
	/sWlA0thQVx3OoRglYEdNZBEfWHUPUPu0MmNuoVeyoDVvTjCd3K97KPq6YrCMtyEj0YERWbLuRwK9
	LXxTQPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpLA-000000092Pm-2bFM;
	Mon, 22 Jul 2024 09:28:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpL7-000000092OE-2Ohi
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 09:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4603ACE0B1B;
	Mon, 22 Jul 2024 09:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C57C4AF0A;
	Mon, 22 Jul 2024 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721640494;
	bh=YhOXVRafcMg4tYD9zagl52iqpNlfOz9o9bO6OxtTXIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=th0NqCl/AHyOVJ+qH5Jn0cTR5xRpXoj9NUd7KC7xwvhbxq9Rlik6WyCrB5BCCyf84
	 7qbANzTllFk6YVvXXhztKlJZc7JS4uV5z2RuuVPP3nE9+sYTfoNZXFvx/fuoJ6Nlni
	 CjPex2FUiYGyhHoNf8K2HCTodsf4WYmpyRH+SP0jaoy/gRxGZCFGSX9rH/X+IYZvaG
	 5r4fhX+inh27tRmsB0SM1jlYuRlEBcgmpSl238IG1MVlSZRXkDH8nQLczN3qR/3a4c
	 4JRi2rVGmvqFxLwB9kxWrqlOKWzCyYEDDOZ7jBJzhLLerOYECdO5rjBG6GJxPr/NWv
	 mgtfYEt1L3IJQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chris Lu <chris.lu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Jing Cai <jing.cai@mediatek.com>,
	Takashi Iwai <tiwai@suse.de>,
	Peter Tsao <peter.tsao@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] Bluetooth: btmtk: remove #ifdef around declarations
Date: Mon, 22 Jul 2024 11:27:06 +0200
Message-Id: <20240722092735.1109925-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722092735.1109925-1-arnd@kernel.org>
References: <20240722092735.1109925-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_022817_839821_98F2EA15 
X-CRM114-Status: GOOD (  10.02  )
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

From: Arnd Bergmann <arnd@arndb.de>

The caller of these functions in btusb.c is guarded with an
if(IS_ENABLED()) style check, so dead code is left out, but the
declarations are still needed at compile time:

drivers/bluetooth/btusb.c: In function 'btusb_mtk_reset':
drivers/bluetooth/btusb.c:2705:15: error: implicit declaration of function 'btmtk_usb_subsys_reset' [-Wimplicit-function-declaration]
 2705 |         err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
      |               ^~~~~~~~~~~~~~~~~~~~~~
drivers/bluetooth/btusb.c: In function 'btusb_send_frame_mtk':
drivers/bluetooth/btusb.c:2720:23: error: implicit declaration of function 'alloc_mtk_intr_urb' [-Wimplicit-function-declaration]
 2720 |                 urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
      |                       ^~~~~~~~~~~~~~~~~~
drivers/bluetooth/btusb.c:2720:21: error: assignment to 'struct urb *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
 2720 |                 urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
      |                     ^

Fixes: 52828ea60dfd ("Bluetooth: btmtk: Fix btmtk.c undefined reference build error")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/bluetooth/btmtk.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 6fc69cd8636b..5df7c3296624 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -202,7 +202,6 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor);
 
-#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
 
 int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
@@ -217,7 +216,6 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
 int btmtk_usb_setup(struct hci_dev *hdev);
 
 int btmtk_usb_shutdown(struct hci_dev *hdev);
-#endif
 #else
 
 static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
-- 
2.39.2


