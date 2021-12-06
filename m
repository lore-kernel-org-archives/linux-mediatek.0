Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Re2QHNnDsiHn3/RT8dlQbDVUznkoyyaeTDYfKQaoeg=; b=eH8wNxYxzlfrg7
	RFjiTt/SYbED+QyW6Y4EI2Mgn9eWAvUK37t7mymhc0/WFW+hadJdHqYfYQF7r5NJF0bGDiMVRCgLL
	nDIjWtlX2RAMXWOCP9qZfYsinjfDU4I5b26S4XGi5sy90qOQiOpWpfHNkWY5u+TNKXN9zr/HDYPfd
	B6zAyGNKfvl5d1d2I/1eJ5NePB+zoR6bM5wuGTM3FcY/nOZC2Isiy71jv4ndR2EO4cUHsNbfoxhU9
	5ltoV0cx86M7L6F7gYz1V6uZ3y38LjDx1jNmiRCBt4KXOjA+kAatCRWvkcQtcGk9A98yEHcf3hgV3
	KyF8b17e3gvqDi7MErGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muI28-00583Z-GM; Mon, 06 Dec 2021 17:44:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muI23-00580V-Cn
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 17:44:10 +0000
X-UUID: 12902c2a33754477a874c5f30bffa93b-20211206
X-UUID: 12902c2a33754477a874c5f30bffa93b-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656551667; Mon, 06 Dec 2021 10:44:02 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 09:34:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 01:34:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Dec 2021 01:34:01 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <mark-yw.chen@mediatek.com>,
 <aaron.hou@mediatek.com>, <kaichuan.hsieh@canonical.com>,
 <pmenzel@molgen.mpg.de>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] Bluetooth: btusb: Return error code when getting patch
 status failed
Date: Tue, 7 Dec 2021 01:33:43 +0800
Message-ID: <20211206173343.31380-2-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211206173343.31380-1-mark-yw.chen@mediatek.com>
References: <20211206173343.31380-1-mark-yw.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_094407_504422_1F25491F 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Mark Chen <mark-yw.chen@mediatek.com>

If there are failure cases in getting patch status, it should return the
error code (-EIO).

Fixes: fc342c4dc4087 ("Bluetooth: btusb: Add protocol support for MediaTek MT7921U USB devices")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index c2ee5c4b975a..526dfdf1fe01 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -121,6 +121,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 				} else {
 					bt_dev_err(hdev, "Failed wmt patch dwnld status (%d)",
 						   status);
+					err = -EIO;
 					goto err_release_fw;
 				}
 			}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
