Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2712BC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcCXPEQWoonsJNi2BaZgrWx2SxdTSsXBa3ZannnYBAY=; b=fRSXm9UQdzb0Uy
	sveqHMjT6OvUsessh3xE5N0v3G6v/GSfP3iI5LoN7NE+7svYGRdVDdew0Aiz3eUmVya+X8FNnGlCD
	i14bQaaM0m73sLcdppEi/G4N7oiyGzmX76E0mCi8A3FNa6vGh5ExJ45cgspRfs38e/BPgSrniWy2Y
	rAVyiEe+6QxJ6f6RE7nB/oE2M+w6XR14imdCGzOKLD5UetVbQAOjR5kEbu2xgViULWCokA13uVeug
	kv6ooa5Y/311aU8hEoE44xXx9P7DXCa4P1ZNB7OczS8HS89KxjXa2p6ZJ2ZhSew0phT0DelZ/5haD
	kfbSrubudKCpt3UhuxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUBXW-00A9ZW-34; Tue, 15 Mar 2022 18:04:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUBXR-00A9Xu-N6
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 18:04:55 +0000
X-UUID: e898cf155065445591b8950667c43027-20220315
X-UUID: e898cf155065445591b8950667c43027-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1622735148; Tue, 15 Mar 2022 11:04:30 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 11:00:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 02:00:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 02:00:08 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <abhishekpandit@google.com>, <michaelfsun@google.com>, <mcchou@chromium.org>, 
 <shawnku@google.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yake
 Yang" <yake.yang@mediatek.com>
Subject: [PATCH RESEND 3/5] Bluetooth: mt7921s: Add .get_data_path_id
Date: Wed, 16 Mar 2022 02:00:02 +0800
Message-ID: <b790033dfbaded0ccec1247200dc2bc22a7a7cac.1647367024.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647367024.git.objelf@gmail.com>
References: <7b4627d5017be2c26ded9daf7fd297bed6614852.1647367024.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_110453_779363_1EDFD8ED 
X-CRM114-Status: GOOD (  12.95  )
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

Add .get_data_path_id to fetch data_path_id for MT7921 to support HFP
offload use case.

This is a preliminary patch to add the WBS support to the MT7921 driver.

Reviewed-by: Mark Chen <markyawenchen@gmail.com>
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 034e55278c56..4000a994fe2c 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -936,6 +936,13 @@ static int btmtksdio_mtk_reg_write(struct hci_dev *hdev, u32 reg, u32 val, u32 m
 	return err;
 }
 
+static int btmtksdio_get_data_path_id(struct hci_dev *hdev, __u8 *data_path_id)
+{
+	/* uses 1 as data path id for all the usecases */
+	*data_path_id = 1;
+	return 0;
+}
+
 static int btmtksdio_sco_setting(struct hci_dev *hdev)
 {
 	const struct btmtk_sco sco_setting = {
@@ -968,7 +975,13 @@ static int btmtksdio_sco_setting(struct hci_dev *hdev)
 		return err;
 
 	val |= 0x00000101;
-	return btmtksdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+	err =  btmtksdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+	if (err < 0)
+		return err;
+
+	hdev->get_data_path_id = btmtksdio_get_data_path_id;
+
+	return err;
 }
 
 static int btmtksdio_reset_setting(struct hci_dev *hdev)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
