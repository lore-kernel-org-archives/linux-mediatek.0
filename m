Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B71C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEZMGxzz09sCpUkHnYnh/TYDvXU54vJjvVeN953FDKY=; b=43BbZnxwWyczmv
	+RvabBs6yst0rcDMbOjm535IpV1dU8lde9kC9oDJ2jxagbTu7CyRX+I8YTpBTPBXhHqA+xdZkv/BR
	LSt+n2QMi68O3Bz7BmBj/U8k2VN2MMJhzzgWASEH3mD3HSc5HA4wrYs2KQrczmke8ayCYckyyKeKG
	JhbgtngtqSNFcLtwl0oGTBrBd88rWqJt+xEz75K238n/1aK3xdnX8uPtQce/nGtO48sB8snBBmUl3
	AV0PlyiJG88KvzgBwWhtRFufnvyCTCXFdw7SMhQWmTUEdsvZcV6MKOctMcvEnLdnmx/USzcElEW4R
	I2kKKwFHwIPCqndkoQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6dny-008ITj-0k; Sun, 09 Jan 2022 19:24:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6dnu-008IR6-T4
 for linux-mediatek@lists.infradead.org; Sun, 09 Jan 2022 19:24:36 +0000
X-UUID: 523d101dd6bd4c959927ea7ed4c959f3-20220109
X-UUID: 523d101dd6bd4c959927ea7ed4c959f3-20220109
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 739288150; Sun, 09 Jan 2022 12:24:32 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 11:24:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 10 Jan 2022 03:24:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 03:24:17 +0800
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
Subject: [PATCH v5 3/5] Bluetooth: mt7921s: Enable SCO over I2S
Date: Mon, 10 Jan 2022 03:23:59 +0800
Message-ID: <7340990573bf9a17342479e5bb3f67cf5d95b110.1641755121.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
References: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_112434_978427_1ED7C43F 
X-CRM114-Status: GOOD (  17.48  )
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

The driver has to issue the specific command to enable Bluetooth SCO over
the I2S/PCM interface on mt7921s, that is supported since the firmware
with version 20211222191101 was added, and the patch would not cause any
harm even when the old firmware is applied.

The SCO profile with the patch was tested by setting up a VOIP application,
connected to HFP device, checked telephony function can work normally.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
v2: refine git message and fix typo
v3:
   1. free skb after calling  __hci_cmd_sync
   2. make bt_awake as const struct btmtk_sco
v4:
   1. update git message
   2. drop a few redundant error messages
v5:
   1. make reg_write as const struct reg_write_cmd
   2. cleanup the error message in btsdio_mtk_reg_write
   3. rename btsdio_mtk_sco_setting of the prefix btmtksdio
   4. rename btsdio_mtk_reg_write of the prefix btmtksdio
---
 drivers/bluetooth/btmtk.h     | 20 +++++++++++
 drivers/bluetooth/btmtksdio.c | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

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
index a8273874e29f..a41b5f65e7a9 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -830,6 +830,66 @@ static int btmtksdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 	return err;
 }
 
+static int btmtksdio_mtk_reg_write(struct hci_dev *hdev, u32 reg, u32 val, u32 mask)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	const struct reg_write_cmd reg_write = {
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
+		bt_dev_err(hdev, "Failed to write reg (%d)", err);
+
+	return err;
+}
+
+static int btmtksdio_sco_setting(struct hci_dev *hdev)
+{
+	const struct btmtk_sco sco_setting = {
+		.clock_config = 0x49,
+		.channel_format_config = 0x80,
+	};
+	struct sk_buff *skb;
+	u32 val;
+	int err;
+
+	/* Enable SCO over I2S/PCM for MediaTek chipset */
+	skb =  __hci_cmd_sync(hdev, 0xfc72, sizeof(sco_setting),
+			      &sco_setting, HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	kfree_skb(skb);
+
+	err = btmtksdio_mtk_reg_read(hdev, MT7921_PINMUX_0, &val);
+	if (err < 0)
+		return err;
+
+	val |= 0x11000000;
+	err = btmtksdio_mtk_reg_write(hdev, MT7921_PINMUX_0, val, ~0);
+	if (err < 0)
+		return err;
+
+	err = btmtksdio_mtk_reg_read(hdev, MT7921_PINMUX_1, &val);
+	if (err < 0)
+		return err;
+
+	val |= 0x00000101;
+	return btmtksdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
+}
+
 static int btmtksdio_setup(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
@@ -862,6 +922,14 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
+
+		/* Enable SCO over I2S/PCM */
+		err = btmtksdio_sco_setting(hdev);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to enable SCO setting (%d)", err);
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
