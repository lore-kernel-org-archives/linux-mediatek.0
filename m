Return-Path: <SRS0=6j47=7G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A881C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 10:25:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 441552077D
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 10:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qt0ytbJJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S1HfFC78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 441552077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K7OTitYOuWLTdfhHgJwR7tzJqI8vFuk6Q8oj96v9nK8=; b=qt0ytbJJdLnxWI
	AsU0ZkjY7o7oZylxuJ1yYkmVnqsLtXkqT626VZ/+pJuDG+o0369Ab92ZuKHxDANGxmLi6eEiXPD2f
	io8ZumJlAaSV0wnL6zDSXFR3TGQoG+hj9U0lSEfcZl/+mIvFHYxXe+qEw1r+hilxaCyLfUtwNYeoa
	qW1NrNiUCFP42p48Ky3alRyL5kjYFgTeAwLXf3YJoe8Ipd/oNqRbua3YDyoj4lWaj+jtD8kCX3jMa
	BKPHAzlIuGy+Yi6LzAWRfIvJnXLnUSh+HA5q8w9fgB4Wuv8Ewjspgfo2fnYiWU7j/fxCjvjeEUWam
	WtmkRAA3PB8Q5rU9UDOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcnoW-0001O7-JR; Sun, 24 May 2020 10:25:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcnoT-0000gb-67
 for linux-mediatek@lists.infradead.org; Sun, 24 May 2020 10:25:03 +0000
X-UUID: 61c2e8797e164de3bb7401ec4f659275-20200524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hOzMYCZ3qsvYgw8bs4JJEy5VmWKuRRy/5B9rA8cNlEE=; 
 b=S1HfFC78PLVuX2afd0UtVEi3+KZBJwc7t3mHpuswpYkzDBqlHFKK8LFReCGTV6VI6MtZQgeQiLOIoud5lVuPzypa4uBpz1HBqB99DKV7TlmRtwME5eiVnJMhhJH14A6uMtkmRiQH+JpuCKG/FICqg5Vxaickk5lyTEtGyfOZUNU=;
X-UUID: 61c2e8797e164de3bb7401ec4f659275-20200524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 700518193; Sun, 24 May 2020 02:24:47 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 May 2020 03:14:51 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 May 2020 18:14:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 24 May 2020 18:14:40 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: fix BUG: spinlock bad magic in mt76_dma_init
Date: Sun, 24 May 2020 18:14:41 +0800
Message-ID: <54dc821bf69fe8e7ae017f221069a4f41ae37893.1590260648.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4D90F55D31A314470E2E0E7DED0FDB3AADD4CE3F33CA5DB2C81192D7CF81C5A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_032501_238340_BA1CDBC9 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

dma init should be done when dma have been allocated

[    2.361127] BUG: spinlock bad magic on CPU#0, modprobe/456
[    2.361583]  lock: 0xffffa1287525b3b8, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[    2.362250] CPU: 0 PID: 456 Comm: modprobe Not tainted 4.14.177 #5
[    2.362751] Hardware name: HP Meep/Meep, BIOS Google_Meep.11297.75.0 06/17/2019
[    2.363343] Call Trace:
[    2.363552]  dump_stack+0x97/0xdb
[    2.363826]  ? spin_bug+0xa6/0xb3
[    2.364096]  do_raw_spin_lock+0x6a/0x9a
[    2.364417]  mt76_dma_rx_fill+0x44/0x1de [mt76]
[    2.364787]  ? mt76_dma_kick_queue+0x18/0x18 [mt76]
[    2.365184]  mt76_dma_init+0x53/0x85 [mt76]
[    2.365532]  mt7615_dma_init+0x3d7/0x546 [mt7615e]
[    2.365928]  mt7615_register_device+0xe6/0x1a0 [mt7615e]
[    2.366364]  mt7615_mmio_probe+0x14b/0x171 [mt7615e]
[    2.366771]  mt7615_pci_probe+0x118/0x13b [mt7615e]
[    2.367169]  pci_device_probe+0xaf/0x13d
[    2.367491]  driver_probe_device+0x284/0x2ca
[    2.367840]  __driver_attach+0x7a/0x9e
[    2.368146]  ? driver_attach+0x1f/0x1f
[    2.368451]  bus_for_each_dev+0xa0/0xdb
[    2.368765]  bus_add_driver+0x132/0x204
[    2.369078]  driver_register+0x8e/0xcd
[    2.369384]  do_one_initcall+0x160/0x257
[    2.369706]  ? 0xffffffffc0240000
[    2.369980]  do_init_module+0x60/0x1bb
[    2.370286]  load_module+0x18c2/0x1a2b
[    2.370596]  ? kernel_read_file+0x141/0x1b9
[    2.370937]  ? kernel_read_file_from_fd+0x46/0x71
[    2.371320]  SyS_finit_module+0xcc/0xf0
[    2.371636]  do_syscall_64+0x6b/0xf7
[    2.371930]  entry_SYSCALL_64_after_hwframe+0x3d/0xa2
[    2.372344] RIP: 0033:0x7da218ae4199
[    2.372637] RSP: 002b:00007fffd0608398 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    2.373252] RAX: ffffffffffffffda RBX: 00005a705449df90 RCX: 00007da218ae4199
[    2.373833] RDX: 0000000000000000 RSI: 00005a7052e73bd8 RDI: 0000000000000006
[    2.374411] RBP: 00007fffd06083e0 R08: 0000000000000000 R09: 00005a705449d540
[    2.374989] R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000000000
[    2.375569] R13: 00005a705449def0 R14: 00005a7052e73bd8 R15: 0000000000000000

Fixes: d3377b78cec6 ("mt76: add HE phy modes and hardware queue")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 75e659774e07..eca39799f050 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -576,7 +576,7 @@ mt76_dma_init(struct mt76_dev *dev)
 
 	init_dummy_netdev(&dev->napi_dev);
 
-	for (i = 0; i < ARRAY_SIZE(dev->q_rx); i++) {
+	for (i = 0; i < ARRAY_SIZE(dev->q_rx) && dev->q_rx[i].desc; i++) {
 		netif_napi_add(&dev->napi_dev, &dev->napi[i], mt76_dma_rx_poll,
 			       64);
 		mt76_dma_rx_fill(dev, &dev->q_rx[i]);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
