Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97211C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZJrfYHYJOMP34dg1nE/qlVp4YYkhc3t1cHGmUC0OQgk=; b=CJl/cBOvBM/0qiwoh2eB8hJJ+a
	bYoEqRv8VKv2D3GzR7rZ6/ptXue7mkEsW7Br0AJnWM2+UW7AmJwhLJouGlkBe6xj3LyY/kPQN10ay
	ghvNOyJJ4IeBBPbVpq0rRd1IRGQzIMeI5W9XQvVzYzIh7mKW0kiAUOPNjpRwW+T05y5hPZwioHKwi
	jCT6S6xCAekXNTJ0ld640Rwvy2XiSwJVlO75pXES2ITdK5h5uTSa9O0qzm3/j8OWAIHTxAc6oN5ui
	8ziH+kb0gLv1gt886j9sST3tRFJ1ASCMbbqXoougR+WkRhFXO0uvcV2YKkaXRzP3RlbKpd3aZ0j15
	dcMM7WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjJi-007oto-PI; Wed, 13 Jul 2022 20:50:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjJd-007onU-4N
	for linux-mediatek@lists.infradead.org; Wed, 13 Jul 2022 20:50:41 +0000
X-UUID: 6d8c946007494a458d57bafc012604a3-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cb0514c7-5567-4f0d-b91e-561fc355431a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:4b5ee732-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6d8c946007494a458d57bafc012604a3-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 393678440; Wed, 13 Jul 2022 13:50:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 04:00:22 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 04:00:21 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <ted.huang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<abhishekpandit@google.com>, <michaelfsun@google.com>, <mcchou@chromium.org>,
	<shawnku@google.com>, <linux-bluetooth@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jing
 Cai" <jing.cai@mediatek.com>
Subject: [PATCH v2] Bluetooth: btusb: mediatek: fix shutdown failure during runtime suspend
Date: Thu, 14 Jul 2022 04:00:20 +0800
Message-ID: <3f1ee6737f092ae6312a7ae6079d341b81c791a5.1657670957.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_135037_196178_6FB125F8 
X-CRM114-Status: GOOD (  12.67  )
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

From: Sean Wang <sean.wang@mediatek.com>

Fix the WMT command timed out during Bluetooth was being shutdown while USB
was in runtime suspend state.

Fixes: a1c49c434e15 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
Co-developed-by: Jing Cai <jing.cai@mediatek.com>
Signed-off-by: Jing Cai <jing.cai@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btusb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fb1a67189412..b1161853c6ab 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2795,10 +2795,15 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 
 static int btusb_mtk_shutdown(struct hci_dev *hdev)
 {
+	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct btmtk_hci_wmt_params wmt_params;
 	u8 param = 0;
 	int err;
 
+	err = usb_autopm_get_interface(data->intf);
+	if (err < 0)
+		return err;
+
 	/* Disable the device */
 	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
@@ -2807,12 +2812,12 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 	wmt_params.status = NULL;
 
 	err = btusb_mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
+	if (err < 0)
 		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
-		return err;
-	}
 
-	return 0;
+	usb_autopm_put_interface(data->intf);
+
+	return err;
 }
 
 static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
-- 
2.25.1


