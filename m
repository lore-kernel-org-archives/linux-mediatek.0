Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F79C4321E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0g4draon/1xrJU9gvq9U+VVe8dpfYf45KWVgNeunXmM=; b=x8gPEvdI9H9vyO
	cwOghtks2vpXqGYXs1Nbr5zE33/FFhvRRfDosEvYGdIHP614tbgPD5dW83HFtIjyfoJrkJ7acaOMZ
	Y7uH/O1uCHHbbnb8Unw95Nk2kQO18pyv98Bqmqt43cd5VzmOkOJxsSz8gFSkUZweXCiJePtM8lkBg
	NFWI0HQQkMwHlVxVmrQxC9zG3r37foRRiIJ+YgF/OSTJgvptwo1kQqwXgtafw6goY+DlHi90T0FkK
	kd6RjrJA20sQAEslj2RLPp2DstrIZzb7kg4HQKukm4REY60qA8EVWg96VEB8egxEoINOS7CGYvfkZ
	DUJKFon2sxP9z2yZygyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUBXU-00A9Yq-9Q; Tue, 15 Mar 2022 18:04:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUBXQ-00A9XR-Tf
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 18:04:54 +0000
X-UUID: 9ca2ad0e14124b2bb9ce6227d55eabb4-20220315
X-UUID: 9ca2ad0e14124b2bb9ce6227d55eabb4-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1452187413; Tue, 15 Mar 2022 11:04:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 10:54:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 01:54:26 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 01:54:26 +0800
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
Subject: [PATCH v4 5/5] Bluetooth: mt7921s: Add WBS support
Date: Wed, 16 Mar 2022 01:54:08 +0800
Message-ID: <e30fe2298865e619b439f628bf8cc3ffd1734a2c.1647366404.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647366404.git.objelf@gmail.com>
References: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647366404.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_110452_977672_30350818 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yake Yang <yake.yang@mediatek.com>

It is time to add wide band speech (WBS) support.

Reviewed-by: Mark Chen <markyawenchen@gmail.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c28eb9fc6176..f3dc5881fff7 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1123,6 +1123,9 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 			return err;
 		}
 
+		/* Enable WBS with mSBC codec */
+		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+
 		/* Enable GPIO reset mechanism */
 		if (bdev->reset) {
 			err = btmtksdio_reset_setting(hdev);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
