Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327AC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XLJ8ZIis+liXlHvaqNtJlaa2mNt5pmdacFyPBYtigdQ=; b=XqUsfKP50e2vop
	4OKzo9IFeBnp0dJiEiWo9UzK5fNSAXH+tN0MjPFOBqdmKag1Bmums14XECBScmaHbsMY/n9AT7UBZ
	7O0EeOb+BKjlDF5laDu8w/1R8nb4zZU4e/RFRzUNCUFx+XBSJcxAjSeI+xqIUNWQfr1aIhWJEdfyq
	5emUk3K/ztpqCfKm2RB9BDlfHoyes0S4UmWHw3QE/OnFMFXbYulqFhNCq5/nNiJkg1w74VveC5J1/
	A5QmvCImmFof+TUVHDTfJnWQFdO7wVAy2+/9Vx3dnkqMGzW0ELSfCh/vApCbYTODciPtmdD12iYry
	geuTEU91AF/Ki0vpKP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muAPl-003BkT-Km; Mon, 06 Dec 2021 09:36:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muAPf-003BjC-1E
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 09:36:04 +0000
X-UUID: 7e531572b0814443a4b0ce7d004f1276-20211206
X-UUID: 7e531572b0814443a4b0ce7d004f1276-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1767901624; Mon, 06 Dec 2021 02:35:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 01:25:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 17:25:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Dec 2021 17:25:51 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <mark-yw.chen@mediatek.com>, <aaron.hou@mediatek.com>,
 <kaichuan.hsieh@canonical.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Bluetooth: btusb: Handle download_firmware failure cases.
Date: Mon, 6 Dec 2021 17:25:46 +0800
Message-ID: <20211206092546.27216-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_013559_108955_566B4A84 
X-CRM114-Status: UNSURE (   8.66  )
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

From: mark-yw.chen <mark-yw.chen@mediatek.com>

For Mediatek chipset, if there are no firmware bin or command_timeout,
the process should be terminated in btusb_mtk_setup().

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
Change-Id: I99f1d7b72fa70643d9123e7e6cdc8d0b4369ce52
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btusb.c | 4 ++++
 2 files changed, 5 insertions(+)

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
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index ab169fc673ea..3ea04b1d0750 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2554,6 +2554,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = btmtk_setup_firmware_79xx(hdev, fw_bin_name,
 						btusb_mtk_hci_wmt_sync);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to setup firmware (%d)", err);
+			return err;
+		}
 
 		/* It's Device EndPoint Reset Option Register */
 		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, MTK_EP_RST_IN_OUT_OPT);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
