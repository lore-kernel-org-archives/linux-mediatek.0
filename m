Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=guKp423VrOKaSw9cNNQuejav0DtRW0ecAzljQz98s+s=; b=WBC76h+VKXvtVf
	yXYuP1QsoO76Inv7MlRMgfk2nbWyb3aYRe09w0CsE/9QaOj/i+w0uuWs8u+A858sE+lHnbY3xRYcS
	UonRxzRy87S6MHFs4IDsxwbxDjAYz46MfzXO3K1rtazcii6BTc/gpBVan2346ksbRqlBfR48KBCx3
	Dhsxc7OgtHZQ4KcYPCJ4QF1PszTh+Rm3EOv8djSzJ35mlvTbVB77LncG+wb0VxII4Pflm0zd45qIj
	qDL1IQdQUTmbvJ/q4adP8zG8faszgCljqZjjk+vOpPKmm4OJuDKEo/tFWLb2t+5XFU2Cv6jka8BRO
	K+9VsdaHyuoluil2796w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUBNP-00A78X-BO; Tue, 15 Mar 2022 17:54:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUBNK-00A76f-TH
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 17:54:29 +0000
X-UUID: f6e2fabc98df4145be87df162d498aba-20220315
X-UUID: f6e2fabc98df4145be87df162d498aba-20220315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1715938317; Tue, 15 Mar 2022 10:54:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 10:54:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 01:54:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 01:54:10 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <abhishekpandit@google.com>, <michaelfsun@google.com>, <mcchou@chromium.org>, 
 <shawnku@google.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yake
 Yang" <yake.yang@mediatek.com>
Subject: [PATCH v4 1/5] Bluetooth: btmtksdio: Fix kernel oops in
 btmtksdio_interrupt
Date: Wed, 16 Mar 2022 01:54:04 +0800
Message-ID: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647366404.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_105426_982424_8FE18986 
X-CRM114-Status: GOOD (  15.44  )
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

From: Yake Yang <yake.yang@mediatek.com>

Fix the following kernel oops in btmtksdio_interrrupt

[   14.339134]  btmtksdio_interrupt+0x28/0x54
[   14.339139]  process_sdio_pending_irqs+0x68/0x1a0
[   14.339144]  sdio_irq_work+0x40/0x70
[   14.339154]  process_one_work+0x184/0x39c
[   14.339160]  worker_thread+0x228/0x3e8
[   14.339168]  kthread+0x148/0x3ac
[   14.339176]  ret_from_fork+0x10/0x30

That happened because hdev->power_on is already called before
sdio_set_drvdata which btmtksdio_interrupt handler relies on is not
properly set up.

The details are shown as the below: hci_register_dev would run
queue_work(hdev->req_workqueue, &hdev->power_on) as WQ_HIGHPRI
workqueue_struct to complete the power-on sequeunce and thus hci_power_on
may run before sdio_set_drvdata is done in btmtksdio_probe.

The hci_dev_do_open in hci_power_on would initialize the device and enable
the interrupt and thus it is possible that btmtksdio_interrupt is being
called right before sdio_set_drvdata is filled out.

When btmtksdio_interrupt is being called and sdio_set_drvdata is not filled
, the kernel oops is going to happen because btmtksdio_interrupt access an
uninitialized pointer.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Reviewed-by: Mark Chen <markyawenchen@gmail.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index df3f9d090529..9644069cecbb 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1281,6 +1281,8 @@ static int btmtksdio_probe(struct sdio_func *func,
 	hdev->manufacturer = 70;
 	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 
+	sdio_set_drvdata(func, bdev);
+
 	err = hci_register_dev(hdev);
 	if (err < 0) {
 		dev_err(&func->dev, "Can't register HCI device\n");
@@ -1288,8 +1290,6 @@ static int btmtksdio_probe(struct sdio_func *func,
 		return err;
 	}
 
-	sdio_set_drvdata(func, bdev);
-
 	/* pm_runtime_enable would be done after the firmware is being
 	 * downloaded because the core layer probably already enables
 	 * runtime PM for this func such as the case host->caps &
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
