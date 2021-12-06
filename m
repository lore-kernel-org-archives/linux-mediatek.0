Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XPyCTPqAHMUj829F0RVXIWLhfGOLW4jZVSZEevrGUeU=; b=L2zuNQ+N3xvdB7
	EHlZxjM6u8yk+H0ddudGjFh2KJXwWokHE7m/41Ja50cr0VBi1A/5UqK+upRdaXZ6XYaI0hFrGfYO9
	psOyn75BZRmo/B1siDKoJivuQKVkAYiBPyKH18umcxXsK+/YS0mAgfBxtE0H2uz93zoZt0n7kRgtO
	belWN8eVoaVkKW7ljn/0b0224c5aJrMQgf5ZrPnv2CH51HmRTSJ1HOdmFaeafAONi9pcGSPidljbt
	gQhGkRX3nc23uvNxBNx8sR61mvx8821EhyNoJJi/1NyK3ZosYktBrTvNik1v5z0t4Dfuq4OVaUgmR
	SKueMcie+ABKC5jhPNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFMh-004Hv7-6K; Mon, 06 Dec 2021 14:53:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFMf-004HuZ-Gh
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 14:53:14 +0000
X-UUID: a8725320f97746f8923aa7a971eac6d8-20211206
X-UUID: a8725320f97746f8923aa7a971eac6d8-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1814989667; Mon, 06 Dec 2021 07:53:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 06:53:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 6 Dec 2021 22:53:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Dec 2021 22:53:07 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <mark-yw.chen@mediatek.com>,
 <aaron.hou@mediatek.com>, <kaichuan.hsieh@canonical.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V2] Bluetooth: btusb: Handle download_firmware failure cases.
Date: Mon, 6 Dec 2021 22:52:41 +0800
Message-ID: <20211206145241.30181-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_065313_588528_1339F150 
X-CRM114-Status: UNSURE (   9.27  )
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

For Mediatek chipset, it can not enabled if there are something wrong
in btmtk_setup_firmware_79xx(). Thus, the process must be terminated
and returned error code.

Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
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
index ab169fc673ea..923cfbe40dae 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2554,6 +2554,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = btmtk_setup_firmware_79xx(hdev, fw_bin_name,
 						btusb_mtk_hci_wmt_sync);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
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
