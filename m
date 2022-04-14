Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC81CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p57PxWPPm+HOncaBYrnFubmHudXhu9OCsfaFufffoW8=; b=Fydkp4QonkMmsM
	JLT30EupIc94oujlMCBmE+FUoX2323k++9LAv34FqGsT+iWEuFWZeYdGYQniNyvXSup4dVwiIcll1
	2s0rTjjKvs3KZYonx5EZwe99pHT1MoK7tlsXWhJy+kX95Xc8NkrbtLqzD72IUXyQAGUbhQ+qyAP9/
	AB7N2zjYm8JRPUKN8855uS67lKdNBniUZAdh5ffHHLjBkDNjnM/WAqv9Pti7l8C3ixT/XF5yNlSt7
	sPRRwD5lK9VxoxyfklC6I6cDV8YW5QQ00rV9G00kgUv/iRHqpbMYMG15xdnYtx1ppkuZCE56c8jd1
	VBh6v/tHqKv4ehDHo7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf8Xe-007cl0-1k; Thu, 14 Apr 2022 23:06:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf8XZ-007ciT-Iu
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 23:06:20 +0000
X-UUID: 12dc89fbbb434ebf8dbff5fa11a4bf31-20220414
X-UUID: 12dc89fbbb434ebf8dbff5fa11a4bf31-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 731198812; Thu, 14 Apr 2022 16:06:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 15:56:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 15 Apr 2022 06:56:06 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 06:56:06 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Deren
 Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: fix kernel crash at mt7921_pci_remove
Date: Fri, 15 Apr 2022 06:56:05 +0800
Message-ID: <a8cd712777d9f6b5c23e65225c37c3360593de3e.1649976504.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_160617_656996_BF04B4DB 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

The crash log shown it is possible that mt7921_irq_handler is called while
devm_free_irq is being handled so mt76_free_device need to be postponed
until devm_free_irq is completed to solve the crash we free the mt76 device
too early.

[ 9299.339655] BUG: kernel NULL pointer dereference, address: 0000000000000008
[ 9299.339705] #PF: supervisor read access in kernel mode
[ 9299.339735] #PF: error_code(0x0000) - not-present page
[ 9299.339768] PGD 0 P4D 0
[ 9299.339786] Oops: 0000 [#1] SMP PTI
[ 9299.339812] CPU: 1 PID: 1624 Comm: prepare-suspend Not tainted 5.15.14-1.fc32.qubes.x86_64 #1
[ 9299.339863] Hardware name: Xen HVM domU, BIOS 4.14.3 01/20/2022
[ 9299.339901] RIP: 0010:mt7921_irq_handler+0x1e/0x70 [mt7921e]
[ 9299.340048] RSP: 0018:ffffa81b80c27cb0 EFLAGS: 00010082
[ 9299.340081] RAX: 0000000000000000 RBX: ffff98a4cb752020 RCX: ffffffffa96211c5
[ 9299.340123] RDX: 0000000000000000 RSI: 00000000000d4204 RDI: ffff98a4cb752020
[ 9299.340165] RBP: ffff98a4c28a62a4 R08: ffff98a4c37a96c0 R09: 0000000080150011
[ 9299.340207] R10: 0000000040000000 R11: 0000000000000000 R12: ffff98a4c4eaa080
[ 9299.340249] R13: ffff98a4c28a6360 R14: ffff98a4cb752020 R15: ffff98a4c28a6228
[ 9299.340297] FS: 00007260840d3740(0000) GS:ffff98a4ef700000(0000) knlGS:0000000000000000
[ 9299.340345] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 9299.340383] CR2: 0000000000000008 CR3: 0000000004c56001 CR4: 0000000000770ee0
[ 9299.340432] PKRU: 55555554
[ 9299.340449] Call Trace:
[ 9299.340467] <TASK>
[ 9299.340485] __free_irq+0x221/0x350
[ 9299.340527] free_irq+0x30/0x70
[ 9299.340553] devm_free_irq+0x55/0x80
[ 9299.340579] mt7921_pci_remove+0x2f/0x40 [mt7921e]
[ 9299.340616] pci_device_remove+0x3b/0xa0
[ 9299.340651] __device_release_driver+0x17a/0x240
[ 9299.340686] device_driver_detach+0x3c/0xa0
[ 9299.340714] unbind_store+0x113/0x130
[ 9299.340740] kernfs_fop_write_iter+0x124/0x1b0
[ 9299.340775] new_sync_write+0x15c/0x1f0
[ 9299.340806] vfs_write+0x1d2/0x270
[ 9299.340831] ksys_write+0x67/0xe0
[ 9299.340857] do_syscall_64+0x3b/0x90
[ 9299.340887] entry_SYSCALL_64_after_hwframe+0x44/0xae

Fixes: 5c14a5f944b9 ("mt76: mt7921: introduce mt7921e support")
Reported-by: ThinerLogoer <logoerthiner1@163.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 062e2b422478..b5fb22b8e086 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -119,7 +119,6 @@ static void mt7921e_unregister_device(struct mt7921_dev *dev)
 	mt7921_mcu_exit(dev);
 
 	tasklet_disable(&dev->irq_tasklet);
-	mt76_free_device(&dev->mt76);
 }
 
 static u32 __mt7921_reg_addr(struct mt7921_dev *dev, u32 addr)
@@ -356,6 +355,7 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 
 	mt7921e_unregister_device(dev);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
+	mt76_free_device(&dev->mt76);
 	pci_free_irq_vectors(pdev);
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
