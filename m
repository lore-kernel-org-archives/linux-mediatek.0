Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB93C4706C
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jUpRoMwXiMcq+F1SDXQGYUVejYi/UalmN4jhxJyXTww=; b=T/eaGVkwYmEIyLjQv4Xlcp0Me/
	zXsPFIaOAF/xa+rg5vmnRk0va0fCyJpsM6SDGLN29mc/B5DAwfuJVoPTz0ih5sTtBAFEvP1/LQg5c
	bDv6one55p5rHEwhds+etkJdvCaHS5SZXQ3I3yJp00pn9+DStP7lXrLt4tQb6ei1EPICcjShQNrhr
	ULraijUDnwCxI7R6sXYKoetX+J4b9XqKlNFfHvXuCBDX5vUtgMOxtVuK6/ahBoaSV1/jScg7Xy8sP
	Vf0R6U3s//SSe9rRBYno7TEkwsokhxIq83QU9SafNHV4zRarKBP7YL9gviC3boFS2obYyDM41hgt2
	gPvtcqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOZtI-004o1i-0T;
	Sat, 13 Jan 2024 09:01:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOZtE-004o1J-2b
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jan 2024 09:01:18 +0000
X-UUID: 4b75f816b1f211ee9a662f17bb45267e-20240113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jUpRoMwXiMcq+F1SDXQGYUVejYi/UalmN4jhxJyXTww=;
	b=u3Y3RCuKfj+geE0kVp42OZ3QJ0/vbcSK+UW+zz8V4T4b39coQDqrhBBPDq9foYo89eSRim39rDL9uNbLSyiIcBJDo66ERO57e6UIYRq8THRtn8Gc4f5j08L5luPYqqTGy8SkguoWMBlkqFdOdbc0r9vCqKqMLWQ19nYojNfB0B8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:68dd7fc5-57d2-4f17-9738-0871dc69d404,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:bd034e7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4b75f816b1f211ee9a662f17bb45267e-20240113
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1455867315; Sat, 13 Jan 2024 02:01:10 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 13 Jan 2024 17:00:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 13 Jan 2024 17:00:37 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Quan Zhou
	<quan.zhou@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Deren Wu
	<deren.wu@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt7921e: fix use-after-free in free_irq()
Date: Sat, 13 Jan 2024 17:00:22 +0800
Message-ID: <572d6af305a09fc8bdd96a8ee57399039803a2bb.1705135817.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_010116_859490_D6351B63 
X-CRM114-Status: GOOD (  11.73  )
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

From commit a304e1b82808 ("[PATCH] Debug shared irqs"), there is a test
to make sure the shared irq handler should be able to handle the unexpected
event after deregistration. For this case, let's apply MT76_REMOVED flag to
indicate the device was removed and do not run into the resource access
anymore.

BUG: KASAN: use-after-free in mt7921_irq_handler+0xd8/0x100 [mt7921e]
Read of size 8 at addr ffff88824a7d3b78 by task rmmod/11115
CPU: 28 PID: 11115 Comm: rmmod Tainted: G        W    L    5.17.0 #10
Hardware name: Micro-Star International Co., Ltd. MS-7D73/MPG B650I
EDGE WIFI (MS-7D73), BIOS 1.81 01/05/2024
Call Trace:
 <TASK>
 dump_stack_lvl+0x6f/0xa0
 print_address_description.constprop.0+0x1f/0x190
 ? mt7921_irq_handler+0xd8/0x100 [mt7921e]
 ? mt7921_irq_handler+0xd8/0x100 [mt7921e]
 kasan_report.cold+0x7f/0x11b
 ? mt7921_irq_handler+0xd8/0x100 [mt7921e]
 mt7921_irq_handler+0xd8/0x100 [mt7921e]
 free_irq+0x627/0xaa0
 devm_free_irq+0x94/0xd0
 ? devm_request_any_context_irq+0x160/0x160
 ? kobject_put+0x18d/0x4a0
 mt7921_pci_remove+0x153/0x190 [mt7921e]
 pci_device_remove+0xa2/0x1d0
 __device_release_driver+0x346/0x6e0
 driver_detach+0x1ef/0x2c0
 bus_remove_driver+0xe7/0x2d0
 ? __check_object_size+0x57/0x310
 pci_unregister_driver+0x26/0x250
 __do_sys_delete_module+0x307/0x510
 ? free_module+0x6a0/0x6a0
 ? fpregs_assert_state_consistent+0x4b/0xb0
 ? rcu_read_lock_sched_held+0x10/0x70
 ? syscall_enter_from_user_mode+0x20/0x70
 ? trace_hardirqs_on+0x1c/0x130
 do_syscall_64+0x5c/0x80
 ? trace_hardirqs_on_prepare+0x72/0x160
 ? do_syscall_64+0x68/0x80
 ? trace_hardirqs_on_prepare+0x72/0x160
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/linux-wireless/CABXGCsOdvVwdLmSsC8TZ1jF0UOg_F_W3wqLECWX620PUkvNk=A@mail.gmail.com/
Fixes: 9270270d6219 ("wifi: mt76: mt7921: fix PCI DMA hang after reboot")
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 57903c6e4f11..2f04d6658b6b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -387,6 +387,7 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 
 	mt7921e_unregister_device(dev);
+	set_bit(MT76_REMOVED, &mdev->phy.state);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 	mt76_free_device(&dev->mt76);
 	pci_free_irq_vectors(pdev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 488326ce5ed4..3893dbe866fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -12,6 +12,8 @@ irqreturn_t mt792x_irq_handler(int irq, void *dev_instance)
 {
 	struct mt792x_dev *dev = dev_instance;
 
+	if (test_bit(MT76_REMOVED, &dev->mt76.phy.state))
+		return IRQ_NONE;
 	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
 
 	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
-- 
2.18.0


