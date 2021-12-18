Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254F2C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 01:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7s7lI9A19S5faNpsCEUIQRnmg6KLE8ZxGwsblCuUVto=; b=ThG/+bucIXgLgj
	6Hkaw3UxxyZZWyWCJfquoQc35u/OK3sJ0sOsCcltyRl/3/Wl2iU+ULRsXpjpwuZ+z2Jcmbk8SbD3H
	hsSk00ixc+fG4+miRGVG/gzU8DxC8tZjoT0M155fRMRoFp8RzXhXXRz8lRFIpPCOPPsmNKqi/uhLK
	nGRWEEJCq/HcYxHpU/R75lixBLSKwHZXSe9qRePq2hdxn7j0cWuJRCn6ly3PXA8ogM7Lgns+Rx1du
	ZLcgy5G3AL8RlNiSqTPrrVrS02TOvkQj+DEmcrAVtBFEMAzLLw/Db8cYpXIzQIf8Vo4OIFvUVlMY9
	B/pXHi5ZUZopmLb5kJSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myOE2-00CnxJ-89; Sat, 18 Dec 2021 01:09:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myODv-00CnvZ-Uv
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 01:09:22 +0000
X-UUID: 9aba67a60338470bbf724fb26cbaea18-20211217
X-UUID: 9aba67a60338470bbf724fb26cbaea18-20211217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1793742978; Fri, 17 Dec 2021 18:09:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 17:09:10 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 18 Dec 2021 09:08:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 18 Dec 2021 09:08:55 +0800
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
 <linux-kernel@vger.kernel.org>, Mark Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH 2/3] Bluetooth: btmtksdio: Enable SCO over I2S function
Date: Sat, 18 Dec 2021 09:08:52 +0800
Message-ID: <e17b4b3aec942828ef017592df155e554a3d766b.1639787634.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <632534014b9b8a38e81dfb5749dcd75e2088adb1.1639787634.git.objelf@gmail.com>
References: <632534014b9b8a38e81dfb5749dcd75e2088adb1.1639787634.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_170920_050023_F0ED1C83 
X-CRM114-Status: GOOD (  14.08  )
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

For MediaTek chipset, the driver has to issue the specific command to
enable Bluetooth SCO support over the I2S/PCM interface.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtk.h     | 20 +++++++++
 drivers/bluetooth/btmtksdio.c | 76 +++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 2be1d2680ad8..fc57ef09d132 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -7,8 +7,12 @@
 
 #define HCI_WMT_MAX_EVENT_SIZE		64
 
+#define BTMTK_WMT_REG_WRITE 0x1
 #define BTMTK_WMT_REG_READ 0x2
 
+#define MT7921_PINMUX_0 0x70005050
+#define MT7921_PINMUX_1 0x70005054
+
 enum {
 	BTMTK_WMT_PATCH_DWNLD = 0x1,
 	BTMTK_WMT_TEST = 0x2,
@@ -76,6 +80,22 @@ struct btmtk_wakeon {
 	__le16 wakeup_delay;
 } __packed;
 
+struct btmtk_sco {
+	u8 clock_config;
+	u8 transmit_format_config;
+	u8 channel_format_config;
+	u8 channel_select_config;
+} __packed;
+
+struct reg_write_cmd {
+	u8 type;
+	u8 rsv;
+	u8 num;
+	__le32 addr;
+	__le32 data;
+	__le32 mask;
+} __packed;
+
 struct btmtk_hci_wmt_params {
 	u8 op;
 	u8 flag;
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 771733ce362b..8e4d8c2da824 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -830,6 +830,74 @@ static int btsdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 	return err;
 }
 
+static int btsdio_mtk_reg_write(struct hci_dev *hdev, u32 reg, u32 val, u32 mask)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	struct reg_write_cmd reg_write = {
+		.type = 1,
+		.num = 1,
+		.addr = cpu_to_le32(reg),
+		.data = cpu_to_le32(val),
+		.mask = cpu_to_le32(mask),
+	};
+	int err, status;
+
+	wmt_params.op = BTMTK_WMT_REGISTER;
+	wmt_params.flag = BTMTK_WMT_REG_WRITE;
+	wmt_params.dlen = sizeof(reg_write);
+	wmt_params.data = &reg_write;
+	wmt_params.status = &status;
+
+	err = mtk_hci_wmt_sync(hdev, &wmt_params);
+	if (err < 0)
+		bt_dev_err(hdev, "Failed to write reg(%d)", err);
+
+	return err;
+}
+
+static int btsdio_mtk_sco_setting(struct hci_dev *hdev)
+{
+	struct btmtk_sco sco_setting = {
+		.clock_config = 0x49,
+		.channel_format_config = 0x80,
+	};
+	struct sk_buff *skb;
+	u32 val;
+	int err;
+
+	/* Enable SCO over i2s/pcm for Mediatek Chipset */
+	skb =  __hci_cmd_sync(hdev, 0xfc72, sizeof(sco_setting),
+			      &sco_setting, HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	err = btsdio_mtk_reg_read(hdev, MT7921_PINMUX_0, &val);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to read register (%d)", err);
+		return err;
+	}
+
+	val |= 0x11000000;
+	err = btsdio_mtk_reg_write(hdev, MT7921_PINMUX_0, val, ~0);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to write register (%d)", err);
+		return err;
+	}
+
+	err = btsdio_mtk_reg_read(hdev, MT7921_PINMUX_1, &val);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to read register (%d)", err);
+		return err;
+	}
+
+	val |= 0x00000101;
+	err = btsdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+	if (err < 0)
+		bt_dev_err(hdev, "Failed to write register (%d)", err);
+
+	return err;
+}
+
 static int btmtksdio_setup(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
@@ -862,6 +930,14 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
+
+		/* Enable sco over i2s/pcm */
+		err = btsdio_mtk_sco_setting(hdev);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to enable sco setting (%d)", err);
+			return err;
+		}
+
 		break;
 	case 0x7663:
 	case 0x7668:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
