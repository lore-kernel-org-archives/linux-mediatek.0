Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A55C04FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GUoxGu/XV4yejGo4HwhwIzs325AikFIy+EyTK0tIl50=; b=3xsDevEiICDHNFTQGraUi9bH4H
	jErfmZSiU5XDJlTj8APVPID/fNSETJluXB9504HLByJiN4M24BMpflq6WPKkq3khcdttDP2Tbn0L8
	+kHzb1V8uGK2e1SVCO3r8gywqm5Nosw53teGkvrt1E6+oCVc7LFQ7USGUiC2GgFH84FnlvG+z9RX/
	dsrlrPPg+GKvs1a7+JfNh2CnhUhflJ9H2sV9Gg/OTWwRUg5NBDj93H5+h7ZFzboEbjxgtKk4GtWuw
	rRyXH6rHYIhBYJv/SQN4ZFK4PuDOo0vHxGaTSFHmNyy0AfJBTu+J8i/+mhQSqPvOg57ucMqg6jjAS
	9G1nAwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDfI-0000000GXe7-1VZb;
	Fri, 12 Apr 2024 09:57:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDfF-0000000GXb7-2e3K
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 09:57:46 +0000
X-UUID: 19d40ae8f8b311ee96d5dfc950b7243d-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GUoxGu/XV4yejGo4HwhwIzs325AikFIy+EyTK0tIl50=;
	b=mTABdcWwzlZXXTNaefgwDATRhpvn5aXW7RxaOJ0cnlJCGAgO/WM+pqnCH+xb+VyndJm17OuSa4xRHxMLPuz7Zlj2QMeMblAoo9y04/bnQhkbqxi2WLWwXv+8ZfUaWpY2egXfmg8oum3sK2TNNVqK7ydTos+LrFg7TYhcNwjBe/s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:022a39e1-e3f5-4554-bf2e-825a86017983,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:9e67d6fa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19d40ae8f8b311ee96d5dfc950b7243d-20240412
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <hao.qin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2119314242; Fri, 12 Apr 2024 02:57:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:57:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:57:36 +0800
From: Hao Qin <hao.qin@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, "Steve
 Lee" <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Hao Qin <hao.qin@mediatek.com>
Subject: [PATCH] Bluetooth: btusb: mediatek: Support auto revert for MT7922
Date: Fri, 12 Apr 2024 17:57:13 +0800
Message-ID: <20240412095713.25641-1-hao.qin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.149400-8.000000
X-TMASE-MatchedRID: uVuWzlu52Rmpk9YSiEd5IibMb0f5D0uqQl/FdRYkUZLfUZT83lbkEN6M
	yUV+2+DZYUXcHav/Rxk/Z/74EQY5HY9oUcx9VMLgFEUknJ/kEl7dB/CxWTRRuzBqYATSOgWjFdf
	36Pz24xgsw6pGLK+fcHBrphPcQbdOhnFBYfr+xvLDBirxwAorpCPx8YLfnf6LTrVhTMP/B9tuxo
	3gc6EQQpFHHnx2aRWzgITnGkK0NFNRskXKHhdfKpij9M86UwHhsKHfMTjCprzAgTvs8QFuaX7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.149400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 14D0662F09C9B987CEC4A61F7B7A086A01D0ABDA3FA2701977748C2005FC8B442000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_025745_731743_C118941B 
X-CRM114-Status: UNSURE (   8.82  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for auto reverting MT7922 during reset process.

Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
 drivers/bluetooth/btusb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 4c0cc13adb47..0ad96ec8d31d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3032,7 +3032,16 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	usb_kill_anchored_urbs(&data->tx_anchor);
 	mediatek = hci_get_priv(hdev);
 
-	if (mediatek->dev_id == 0x7925) {
+	if (mediatek->dev_id == 0x7922) {
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= 0x00002020;
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= BIT(0);
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		msleep(100);
+	} else if (mediatek->dev_id == 0x7925) {
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
 		val |= (1 << 5);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
@@ -3072,6 +3081,9 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	if (err < 0)
 		bt_dev_err(hdev, "Reset timeout");
 
+	if (mediatek->dev_id == 0x7922)
+		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+
 	btusb_mtk_id_get(data, 0x70010200, &val);
 	if (!val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
-- 
2.18.0


