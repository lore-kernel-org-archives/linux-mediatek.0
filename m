Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C420C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9UwG2c1vQr8j0VAOrhj6prbUlKcsqfdaVOWDVkkLlGY=; b=WMfN07LVF4EVwK
	P7gCHN2FHeM5zn8m36ee8ZANQ3Bqb6o0wBtaOTuMZPsDeyfVba9E0AoD5sOSLeX9zmbgMO9BiS+2N
	kHL2YRSCgjZ6TiBFCfnCv5stCereGsDvsDk5fRj9P1+1FHRL4VeJdTzJVuZrF/ee9LWWJjQ6Mr3dQ
	94QJQmfepMdGrNn+Jn+UY0FrH9bkliQcYziNJLrwJ128T7RR17V13WojFJm9SASmRF8qPGSBjDZ5d
	zlrU3C3JQSbjYBtH7v4IxLeOnA5DhFWQ+GcoBWkwCJbUkFbtIuX5DIVXqSr9Q4vvz85iVfbsFlhtj
	TDKYAWEw0POpQ1aru7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muI2B-005857-Il; Mon, 06 Dec 2021 17:44:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muI23-00580x-Cp
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 17:44:10 +0000
X-UUID: 2a9c81013eb24065a22fe4b55933e1af-20211206
X-UUID: 2a9c81013eb24065a22fe4b55933e1af-20211206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1961481722; Mon, 06 Dec 2021 10:44:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 09:34:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 01:33:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Dec 2021 01:33:58 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <mark-yw.chen@mediatek.com>,
 <aaron.hou@mediatek.com>, <kaichuan.hsieh@canonical.com>,
 <pmenzel@molgen.mpg.de>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] Bluetooth: btusb: Handle download_firmware failure
 cases
Date: Tue, 7 Dec 2021 01:33:42 +0800
Message-ID: <20211206173343.31380-1-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_094407_512632_D4FAD640 
X-CRM114-Status: UNSURE (   9.81  )
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

Fixes: fc342c4dc4087 ("Bluetooth: btusb: Add protocol support for MediaTek MT7921U USB devices")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 4 ++++
 1 file changed, 4 insertions(+)

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
