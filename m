Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB085C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 19:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RLk0bEBrhUxWJBl9BUdTw3K+UFpeBHz26kgd/wsnEWA=; b=Qzsy6fphsztyd+
	VJbpA3abWSZkk+1Zigu39euqSKqlczS5TS+gtYfqQtxH1UAdey6z2HkXLCJhyn2hJPl6OjABVeOLq
	lw1yP6TYE76MUrlQ3pJ05gSwp+Xyry335u9gEboW8sWNXyY4fzmMfgCdT7NtbAibjbWeP9qlCZn/o
	Poy7XZnGk1MD6kgUpmyp76IqGw46cQiDdhk2kDHQeeVu8+UCNiqfMy7yBTj5a9sPH6nf5KdwOBfks
	SDMyqSipd9UQisHRJe/GkJAwzN46N0eQmLYAt6H8BiWvZHlXFU68BB5IXmadZwrZMDAA3fwwZrrTS
	tsBxQB9crNoiiBzpTHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6dnk-008IOA-FP; Sun, 09 Jan 2022 19:24:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6dne-008INY-Bi
 for linux-mediatek@lists.infradead.org; Sun, 09 Jan 2022 19:24:21 +0000
X-UUID: eb89105141ab432f8eb2b40fcc64ab03-20220109
X-UUID: eb89105141ab432f8eb2b40fcc64ab03-20220109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1246101726; Sun, 09 Jan 2022 12:24:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 11:24:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 10 Jan 2022 03:24:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 03:24:05 +0800
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
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/5] Bluetooth: btmtksdio: rename btsdio_mtk_reg_read
Date: Mon, 10 Jan 2022 03:23:57 +0800
Message-ID: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_112418_452177_83FBE09F 
X-CRM114-Status: GOOD (  10.56  )
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

Using "btmtksdio" as the prefix instead of "btsdio"

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v5: new created to make the series better
---
 drivers/bluetooth/btmtksdio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b5ea8d3bffaa..891e34b50e44 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -797,7 +797,7 @@ static int mt79xx_setup(struct hci_dev *hdev, const char *fwname)
 	return err;
 }
 
-static int btsdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
+static int btmtksdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 {
 	struct btmtk_hci_wmt_params wmt_params;
 	struct reg_read_cmd {
@@ -844,13 +844,13 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 
 	switch (bdev->data->chipid) {
 	case 0x7921:
-		err = btsdio_mtk_reg_read(hdev, 0x70010200, &dev_id);
+		err = btmtksdio_mtk_reg_read(hdev, 0x70010200, &dev_id);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to get device id (%d)", err);
 			return err;
 		}
 
-		err = btsdio_mtk_reg_read(hdev, 0x80021004, &fw_version);
+		err = btmtksdio_mtk_reg_read(hdev, 0x80021004, &fw_version);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to get fw version (%d)", err);
 			return err;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
