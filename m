Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E97C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 21:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697C86112D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 21:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 697C86112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7P92J45hfAoaloZJd5ExsjLNh9eJijnxUPhorzwtL34=; b=pUW9Isr2Fu6ulM
	bEHrslHZWJ8igOJvRhp0fRWBInbT49FxVN/vtW5xUB/vlAKtWF/1Gpjkz4d2rkStS8SWqJo8wsG9q
	+ebJlTj4RJc2p/3ZPB77KZtJDGiRPD+Zcfimozxt3vVsVrIJM/zsliXJ05tQGv/rUCkSMN9wykzVo
	Mkz+oluwfNt2+sg+URJlxYmgifkRXSs65y1DZ1Q59ZL7O9X3H8eys7/9Ttn7Ldp1QlTFwPvEVSt63
	WN76PKh6S5lgLnZfnjrPMIcEIZG3eZZXAylxrB5VeLkANIXzW1M7OjB3t36T9w8wLGNL/ABjdiIdJ
	Kg49JW330knzEe7ylfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcaDh-00HKle-81; Mon, 18 Oct 2021 21:30:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcaDe-00HKk0-M1
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 21:30:55 +0000
X-UUID: 8ac737645d1d4c4da5a9c3affa2e22ab-20211018
X-UUID: 8ac737645d1d4c4da5a9c3affa2e22ab-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 798556418; Mon, 18 Oct 2021 14:30:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 14:30:45 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 05:30:45 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Mark-yw Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 06/10] Bluetooth: btmtksdio: update register CSDIOCSR
 operation
Date: Tue, 19 Oct 2021 05:30:17 +0800
Message-ID: <3d93b60ec30d43fbe906a96a33f86b8b98ee36f5.1634592181.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634592181.git.objelf@gmail.com>
References: <cover.1634592181.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_143054_749292_E077ECE8 
X-CRM114-Status: GOOD (  12.61  )
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

That is a preliminary patch to introduce mt7921s support.

Update register CSDIOCSR operation that is suggested from the vendor
driver and is compatible to the all devices.

Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index f712b52e5797..3381c8844902 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -520,8 +520,12 @@ static int btmtksdio_open(struct hci_dev *hdev)
 	/* SDIO CMD 5 allows the SDIO device back to idle state an
 	 * synchronous interrupt is supported in SDIO 4-bit mode
 	 */
-	sdio_writel(bdev->func, SDIO_INT_CTL | SDIO_RE_INIT_EN,
-		    MTK_REG_CSDIOCSR, &err);
+	val = sdio_readl(bdev->func, MTK_REG_CSDIOCSR, &err);
+	if (err < 0)
+		goto err_release_irq;
+
+	val |= SDIO_INT_CTL;
+	sdio_writel(bdev->func, val, MTK_REG_CSDIOCSR, &err);
 	if (err < 0)
 		goto err_release_irq;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
