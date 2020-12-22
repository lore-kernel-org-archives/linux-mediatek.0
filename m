Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E5EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 15:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D02230FC
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 15:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D02230FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bPufzGKl9gYyOMCFj+rn38h8kH8dRbr6r5mhN/OOc6I=; b=DvZ8y+Y0IT8YxQQRxo/iGff9Td
	UgNzxXy3IWT0P3aYWkXIbyGu959mxlWe3wdlEJJaZOCXyNfnouqbVSM4ElQbRRxn4rjPHJZbSfcZi
	4m1AhbGi60ArZkY0u9/+iFqePf4ZTTA+MLXb8OwgiWqefkizKpi8OxKUU4yuzEdbrd3I/sJaylWVg
	GLlCqrlwaLUC1re4/uSdAuQkpW18dVQXbsPGSNR8ytnzrPS6z4MKVvWG7rdkN8OCiV/5+CC690wem
	Mt/Td86l8bZEpRwdFvmqr7iZxxW5N8NPmG9bEApG43jCmrJMqhYevHTGzJhud6oYnUXV9vsbNZu5S
	IJebtP0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krjEn-0002Ut-1n; Tue, 22 Dec 2020 15:06:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krjEh-0002U9-8O
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 15:06:07 +0000
X-UUID: f9be766fd95f4181b78ea31606d078fd-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qdR4Bq+D9lTkjWpXMx/lfWq0zLpQtiOIGbOTsQwmSm0=; 
 b=iriDRXj3cJtbN9SjmfRt3GqHtLu42h8O4GIkIUYAPiod7U5/cDQTfknnPoW98odLXb8Cr3Awe0e4IKaesDBzjkPz0qF3735NFAoh24UaSKjkvqz1TPddMJXEMTsvbd/2+x9YazAVHAmagSrNyS1JVYitlgI1DL9BiCX7+sEQ0wY=;
X-UUID: f9be766fd95f4181b78ea31606d078fd-20201222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1627558509; Tue, 22 Dec 2020 07:05:53 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 07:05:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 23:05:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 23:05:34 +0800
From: <Mark-YW.Chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
Subject: [PATCH 1/1] [Add support Mediatek mt7921U]
Date: Tue, 22 Dec 2020 23:05:27 +0800
Message-ID: <20201222150527.22904-1-Mark-YW.Chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "mark-yw.chen" <mark-yw.chen@mediatek.com>, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.tsao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

This patch adds the support of enabling MT7921U, it's USB-based
Bluetooth function.

There are some component in the Mediatek driver.
1. Btmtk_main: it's common code for Mediatek devices,
   such as firmware download, chip initialization,
   state machine handling and etc.
2. Btmtkusb: it's for usb interface,
   such as usb endpoint enumeration, urb handling and etc.

Firstly, we update the common part and usb part for MT7921U.
Secondly, we will add the support MT7921S, it's SDIO-based device.
Finally, we will add the procedure to support uart/pcie interfaces.

Signed-off-by: Mark-YW Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtk_main.c | 1735 +++++++++++++++++++++++++++
 drivers/bluetooth/btmtk_main.h |  578 +++++++++
 drivers/bluetooth/btmtk_usb.h  |   60 +
 drivers/bluetooth/btmtkusb.c   | 2050 ++++++++++++++++++++++++++++++++
 4 files changed, 4423 insertions(+)
 create mode 100644 drivers/bluetooth/btmtk_main.c
 create mode 100644 drivers/bluetooth/btmtk_main.h
 create mode 100644 drivers/bluetooth/btmtk_usb.h
 create mode 100644 drivers/bluetooth/btmtkusb.c

diff --git a/drivers/bluetooth/btmtk_main.c b/drivers/bluetooth/btmtk_main.c
new file mode 100644
index 000000000000..3038eda057e8
--- /dev/null
+++ b/drivers/bluetooth/btmtk_main.c
@@ -0,0 +1,1735 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 MediaTek Inc.
+
+/*
+ * Bluetooth support for MediaTek SDIO/USB/UART devices
+ *
+ */
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/input.h>
+#include <linux/pm_wakeup.h>
+#include <linux/reboot.h>
+#include <linux/string.h>
+#include "btmtk_main.h"
+
+#define MTKBT_UNSLEEPABLE_LOCK(x, y)	spin_lock_irqsave(x, y)
+#define MTKBT_UNSLEEPABLE_UNLOCK(x, y)	spin_unlock_irqsave(x, y)
+
+/* TODO, need to modify the state mutex for each hci dev*/
+static DEFINE_MUTEX(btmtk_chip_state_mutex);
+#define CHIP_STATE_MUTEX_LOCK()	mutex_lock(&btmtk_chip_state_mutex)
+#define CHIP_STATE_MUTEX_UNLOCK()	mutex_unlock(&btmtk_chip_state_mutex)
+static DEFINE_MUTEX(btmtk_fops_state_mutex);
+#define FOPS_MUTEX_LOCK()	mutex_lock(&btmtk_fops_state_mutex)
+#define FOPS_MUTEX_UNLOCK()	mutex_unlock(&btmtk_fops_state_mutex)
+
+static int btmtk_fops_get_state(struct btmtk_dev *bdev);
+u8 btmtk_log_lvl = BTMTK_LOG_LVL_DEF;
+
+/* To support dynamic mount of interface can be probed */
+static int btmtk_intf_num = BT_MCU_MINIMUM_INTERFACE_NUM;
+/* To allow g_bdev being sized from btmtk_intf_num setting */
+static struct btmtk_dev **g_bdev;
+
+const u8 RESET_EVENT[] = { 0x0E, 0x04, 0x01, 0x03, 0x0c, 0x00 };
+const u8 READ_ISO_PACKET_SIZE_CMD[] = { 0x01, 0x98, 0xFD, 0x02 };
+
+u8 wmt_over_hci_header[] = { 0x01, 0x6F, 0xFC};
+
+/*btmtk main information*/
+static struct btmtk_main_info main_info;
+
+/* State machine table that clarify through each HIF events,
+ * To specify HIF event on
+ * Entering / End / Error
+ */
+static const struct btmtk_cif_state g_cif_state[] = {
+	/* HIF_EVENT_PROBE */
+	{BTMTK_STATE_PROBE, BTMTK_STATE_WORKING, BTMTK_STATE_DISCONNECT},
+	/* HIF_EVENT_DISCONNECT */
+	{BTMTK_STATE_DISCONNECT, BTMTK_STATE_DISCONNECT, BTMTK_STATE_DISCONNECT},
+	/* HIF_EVENT_SUSPEND */
+	{BTMTK_STATE_SUSPEND, BTMTK_STATE_SUSPEND, BTMTK_STATE_FW_DUMP},
+	/* HIF_EVENT_RESUME */
+	{BTMTK_STATE_RESUME, BTMTK_STATE_WORKING, BTMTK_STATE_FW_DUMP},
+	/* HIF_EVENT_STANDBY */
+	{BTMTK_STATE_STANDBY, BTMTK_STATE_STANDBY, BTMTK_STATE_FW_DUMP},
+	/* BTMTK_STATE_FW_DUMP */
+	{BTMTK_STATE_SUBSYS_RESET, BTMTK_STATE_WORKING, BTMTK_STATE_FW_DUMP},
+	/* BTMTK_STATE_FW_DUMP */
+	{BTMTK_STATE_FW_DUMP, BTMTK_STATE_DISCONNECT, BTMTK_STATE_FW_DUMP},
+	/* BTMTK_STATE_FW_DUMP */
+	{BTMTK_STATE_FW_DUMP, BTMTK_STATE_FW_DUMP, BTMTK_STATE_FW_DUMP},
+};
+
+__weak int btmtk_cif_register(void)
+{
+	BTMTK_ERR("No cif register function");
+	return -1;
+}
+
+__weak int btmtk_cif_deregister(void)
+{
+	BTMTK_ERR("No cif deregister function");
+	return -1;
+}
+
+int btmtk_get_chip_state(struct btmtk_dev *bdev)
+{
+	int state = BTMTK_STATE_INIT;
+
+	CHIP_STATE_MUTEX_LOCK();
+	state = bdev->interface_state;
+	CHIP_STATE_MUTEX_UNLOCK();
+
+	return state;
+}
+
+void btmtk_set_chip_state(struct btmtk_dev *bdev, int new_state)
+{
+	static const char * const state_msg[] = {
+		"UNKNOWN", "INIT", "DISCONNECT", "PROBE", "WORKING", "SUSPEND", "RESUME",
+		"FW_DUMP", "STANDBY", "SUBSYS_RESET",
+	};
+
+	BTMTK_INFO("%s: %s(%d) -> %s(%d)", __func__, state_msg[bdev->interface_state],
+		   bdev->interface_state, state_msg[new_state], new_state);
+
+	CHIP_STATE_MUTEX_LOCK();
+	bdev->interface_state = new_state;
+	CHIP_STATE_MUTEX_UNLOCK();
+}
+
+static int btmtk_fops_get_state(struct btmtk_dev *bdev)
+{
+	int state = BTMTK_FOPS_STATE_INIT;
+
+	FOPS_MUTEX_LOCK();
+	state = bdev->fops_state;
+	FOPS_MUTEX_UNLOCK();
+
+	return state;
+}
+
+static void btmtk_fops_set_state(struct btmtk_dev *bdev, int new_state)
+{
+	static const char * const fstate_msg[] = {
+		"UNKNOWN", "INIT", "OPENING", "OPENED", "CLOSING", "CLOSED",
+	};
+
+	BTMTK_INFO("%s: FOPS_%s(%d) -> FOPS_%s(%d)", __func__, fstate_msg[bdev->fops_state],
+		   bdev->fops_state, fstate_msg[new_state], new_state);
+	FOPS_MUTEX_LOCK();
+	bdev->fops_state = new_state;
+	FOPS_MUTEX_UNLOCK();
+}
+
+struct btmtk_main_info *btmtk_get_main_info(void)
+{
+	return &main_info;
+}
+
+static int main_init(void)
+{
+	int i = 0;
+
+	BTMTK_INFO("%s", __func__);
+
+	/* Check if user changes default minimum supported intf count */
+	if (btmtk_intf_num < BT_MCU_MINIMUM_INTERFACE_NUM) {
+		btmtk_intf_num = BT_MCU_MINIMUM_INTERFACE_NUM;
+		BTMTK_WARN("%s minimum interface is %d", __func__, btmtk_intf_num);
+	}
+
+	g_bdev = kzalloc((sizeof(*g_bdev) * btmtk_intf_num), GFP_KERNEL);
+	if (!g_bdev) {
+		BTMTK_WARN("%s insufficient memory", __func__);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < btmtk_intf_num; i++) {
+		g_bdev[i] = btmtk_allocate_dev_memory(NULL);
+		if (g_bdev[i])
+			btmtk_fops_set_state(g_bdev[i], BTMTK_FOPS_STATE_INIT);
+		else
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int main_exit(void)
+{
+	int i = 0;
+
+	BTMTK_INFO("%s releasing intf count <%d>", __func__, btmtk_intf_num);
+
+	if (!g_bdev) {
+		BTMTK_WARN("%s g_data is NULL", __func__);
+		return 0;
+	}
+
+	BTMTK_INFO("%s: Register reboot_notifier callback success.", __func__);
+
+	for (i = 0; i < btmtk_intf_num; i++) {
+		if (!g_bdev[i])
+			btmtk_free_dev_memory(NULL, g_bdev[i]);
+	}
+
+	kfree(g_bdev);
+	return 0;
+}
+
+static inline struct sk_buff *h4_recv_buf(struct hci_dev *hdev,
+					  struct sk_buff *skb,
+					  const unsigned char *buffer,
+					  int count,
+					  const struct h4_recv_pkt *pkts,
+					  int pkts_count)
+{
+	struct btmtk_dev *bdev = NULL;
+
+	if (!hdev || !buffer) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return ERR_PTR(-EINVAL);
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s, bdev is invalid", __func__);
+		return ERR_PTR(-EINVAL);
+	}
+	if (IS_ERR(skb))
+		skb = NULL;
+
+	while (count) {
+		int i, len;
+
+		if (!skb) {
+			for (i = 0; i < pkts_count; i++) {
+				if (buffer[0] != (&pkts[i])->type)
+					continue;
+
+				skb = bt_skb_alloc((&pkts[i])->maxlen,
+						   GFP_ATOMIC);
+				if (!skb) {
+					BTMTK_ERR("%s, alloc skb failed!", __func__);
+					return ERR_PTR(-ENOMEM);
+				}
+
+				hci_skb_pkt_type(skb) = (&pkts[i])->type;
+				hci_skb_expect(skb) = (&pkts[i])->hlen;
+				break;
+			}
+
+			/* Check for invalid packet type */
+			if (!skb) {
+				BTMTK_ERR("%s,skb is invalid, buffer[0] = %d!", __func__,
+					  buffer[0]);
+				return ERR_PTR(-EILSEQ);
+			}
+
+			count -= 1;
+			buffer += 1;
+		}
+
+		len = min_t(uint, hci_skb_expect(skb) - skb->len, count);
+		memcpy(skb_put(skb, len), buffer, len);
+
+		count -= len;
+		buffer += len;
+
+		if (skb->len < hci_skb_expect(skb))
+			continue;
+
+		for (i = 0; i < pkts_count; i++) {
+			if (hci_skb_pkt_type(skb) == (&pkts[i])->type)
+				break;
+		}
+
+		if (i >= pkts_count) {
+			BTMTK_ERR("%s, pkt type is invalid!", __func__);
+			kfree_skb(skb);
+			return ERR_PTR(-EILSEQ);
+		}
+
+		if (skb->len == (&pkts[i])->hlen) {
+			u16 dlen;
+
+			switch ((&pkts[i])->lsize) {
+			case 0:
+				/* No variable data length */
+				dlen = 0;
+				break;
+			case 1:
+				dlen = skb->data[(&pkts[i])->loff];
+				hci_skb_expect(skb) += dlen;
+
+				if (skb_tailroom(skb) < dlen) {
+					BTMTK_ERR("%s, skb_tailroom is not enough, dlen:%d!",
+						  __func__, dlen);
+					kfree_skb(skb);
+					return ERR_PTR(-EMSGSIZE);
+				}
+				break;
+			case 2:
+				/* Double octet variable length */
+				dlen = get_unaligned_le16(skb->data +
+							  (&pkts[i])->loff);
+				hci_skb_expect(skb) += dlen;
+
+				if (skb_tailroom(skb) < dlen) {
+					BTMTK_ERR("%s, tailroom isn't enough in case 2, dlen:%d!",
+						  __func__, dlen);
+					kfree_skb(skb);
+					return ERR_PTR(-EMSGSIZE);
+				}
+				break;
+			default:
+				/* Unsupported variable length */
+				BTMTK_ERR("%s, Unsupported variable length!", __func__);
+				kfree_skb(skb);
+				return ERR_PTR(-EILSEQ);
+			}
+
+			if (!dlen) {
+				/* No more data, complete frame */
+				(&pkts[i])->recv(hdev, skb);
+				skb = NULL;
+			}
+		} else {
+			/* Complete frame */
+			(&pkts[i])->recv(hdev, skb);
+			skb = NULL;
+		}
+	}
+
+	return skb;
+}
+
+static const struct h4_recv_pkt mtk_recv_pkts[] = {
+	{ H4_RECV_ACL,      .recv = btmtk_recv_acl },
+	{ H4_RECV_SCO,      .recv = hci_recv_frame },
+	{ H4_RECV_EVENT,    .recv = btmtk_recv_event },
+};
+
+int btmtk_recv(struct hci_dev *hdev, const u8 *data, size_t count)
+{
+	struct btmtk_dev *bdev = NULL;
+	const unsigned char *p_left = data;
+	int sz_left = count;
+	int err;
+
+	if (!hdev || !data) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return -EINVAL;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s, bdev is NULL!", __func__);
+		return -EINVAL;
+	}
+
+	while (sz_left > 0) {
+		/*  The serial data received from MT7622 BT controller is
+		 *  at all time padded around with the STP header and tailer.
+		 *
+		 *  A full STP packet is looking like
+		 *   -----------------------------------
+		 *  | STP header  |  H:4   | STP tailer |
+		 *   -----------------------------------
+		 *  but it doesn't guarantee to contain a full H:4 packet which
+		 *  means that it's possible for multiple STP packets forms a
+		 *  full H:4 packet that means extra STP header + length doesn't
+		 *  indicate a full H:4 frame, things can fragment. Whose length
+		 *  recorded in STP header just shows up the most length the
+		 *  H:4 engine can handle currently.
+		 */
+
+		bdev->rx_skb = h4_recv_buf(hdev, bdev->rx_skb, data,
+					   count, mtk_recv_pkts,
+					   ARRAY_SIZE(mtk_recv_pkts));
+
+		if (IS_ERR(bdev->rx_skb)) {
+			err = PTR_ERR(bdev->rx_skb);
+			pr_err("Frame reassembly failed (%d)", err);
+			bdev->rx_skb = NULL;
+			return err;
+		}
+
+		sz_left -= count;
+		p_left += count;
+	}
+
+	return 0;
+}
+
+static int btmtk_dispatch_pkt(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	int state = BTMTK_STATE_INIT;
+
+	if ((bt_cb(skb)->pkt_type == HCI_ACLDATA_PKT) &&
+	    skb->data[0] == 0x6f &&
+	    skb->data[1] == 0xfc) {
+		static int dump_data_counter;
+		static int dump_data_length;
+
+		state = btmtk_get_chip_state(bdev);
+		if (state != BTMTK_STATE_FW_DUMP) {
+			BTMTK_INFO("%s: FW dump begin", __func__);
+			dump_data_counter = 0;
+			dump_data_length = 0;
+			btmtk_set_chip_state(bdev, BTMTK_STATE_FW_DUMP);
+		}
+
+		dump_data_counter++;
+		dump_data_length += skb->len;
+
+		if (dump_data_counter % 1000 == 0) {
+			BTMTK_INFO("%s: FW dump on-going, total_packet = %d, total_length = %d",
+				   __func__, dump_data_counter, dump_data_length);
+		}
+
+		if (dump_data_counter < 20)
+			BTMTK_INFO("%s: FW dump data (%d): %s",
+				   __func__, dump_data_counter, &skb->data[4]);
+
+		if (skb->data[skb->len - 4] == 'e' &&
+		    skb->data[skb->len - 3] == 'n' &&
+		    skb->data[skb->len - 2] == 'd') {
+			BTMTK_INFO("%s: FW dump end, dump_data_counter = %d",
+				   __func__, dump_data_counter);
+		}
+	} else if (memcmp(skb->data, RESET_EVENT, sizeof(RESET_EVENT)) == 0) {
+		BTMTK_INFO("%s: Get RESET_EVENT", __func__);
+	}
+	return 0;
+}
+
+int btmtk_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_dev *bdev = NULL;
+
+	if (!hdev || !skb) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return -EINVAL;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev || !bdev->workqueue) {
+		BTMTK_ERR("%s, bdev or workqueue is invalid!", __func__);
+		return -EINVAL;
+	}
+
+	skb_queue_tail(&bdev->rx_q, skb);
+	queue_work(bdev->workqueue, &bdev->rx_work);
+
+	return 0;
+}
+
+int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_dev *bdev = NULL;
+
+	if (!hdev || !skb) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return -EINVAL;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev || !bdev->workqueue) {
+		BTMTK_ERR("%s, bdev or workqueue is invalid!", __func__);
+		kfree_skb(skb);
+		return -EINVAL;
+	}
+
+	skb_queue_tail(&bdev->rx_q, skb);
+	queue_work(bdev->workqueue, &bdev->rx_work);
+
+	return 0;
+}
+
+int btmtk_main_send_cmd(struct btmtk_dev *bdev, const u8 *cmd,
+			const int cmd_len, const u8 *event, const int event_len,
+			int delay, int retry, int pkt_type)
+{
+	struct sk_buff *skb = NULL;
+	int ret = 0;
+	int state = BTMTK_STATE_INIT;
+
+	if (!bdev || !bdev->hdev || !cmd || cmd_len <= 0) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (memcmp(cmd, wmt_over_hci_header, sizeof(wmt_over_hci_header)) &&
+	    pkt_type != BTMTK_TX_ACL_FROM_DRV &&
+	    bdev->power_state != BTMTK_DONGLE_STATE_POWER_ON) {
+		BTMTK_WARN("%s: chip power isn't on, ignore this command, state is %d",
+			   __func__, bdev->power_state);
+		goto exit;
+	}
+
+	state = btmtk_get_chip_state(bdev);
+	if (state == BTMTK_STATE_FW_DUMP) {
+		BTMTK_WARN("%s: FW dumping ongoing, don't send any cmd to FW!!!", __func__);
+		ret = -1;
+		goto exit;
+	}
+
+	skb = alloc_skb(cmd_len + BT_SKB_RESERVE, GFP_ATOMIC);
+	if (!skb) {
+		BTMTK_ERR("%s allocate skb failed!!", __func__);
+		goto exit;
+	}
+
+	skb_reserve(skb, 7);
+	bt_cb(skb)->pkt_type = HCI_COMMAND_PKT;
+	memcpy(skb->data, cmd, cmd_len);
+	skb->len = cmd_len;
+
+	ret = main_info.hif_hook.send_and_recv(bdev,
+					       skb,
+					       event, event_len,
+					       delay, retry, pkt_type);
+
+	if (ret < 0)
+		BTMTK_ERR("%s send_and_recv failed!!", __func__);
+
+exit:
+	BTMTK_DBG("%s end!!", __func__);
+	return ret;
+}
+
+static void btmtk_load_code_from_bin(const struct firmware **fw_firmware,
+				     char *bin_name, struct device *dev,
+				     u8 **image, u32 *code_len)
+{
+	int err = 0;
+	int retry = 10;
+
+	if (!bin_name) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return;
+	}
+
+	do {
+		err = request_firmware(fw_firmware, bin_name, dev);
+		if (err == 0) {
+			break;
+		} else if (retry <= 0) {
+			*fw_firmware = NULL;
+			BTMTK_INFO("%s: request_firmware %d times fail, file not exist, err = %d",
+				   __func__, 10, err);
+			return;
+		}
+		BTMTK_INFO("%s: request_firmware fail, file not exist, err = %d, retry = %d",
+			   __func__, err, retry);
+		msleep(100);
+	} while (retry-- > 0);
+
+	*image = (u8 *)(*fw_firmware)->data;
+	*code_len = (*fw_firmware)->size;
+}
+
+static void btmtk_print_bt_patch_info(struct btmtk_dev *bdev, u8 *fwbuf)
+{
+	struct _PATCH_HEADER *patchhdr = NULL;
+	struct _GLOBAL_DESCR *globaldesrc = NULL;
+
+	if (!fwbuf) {
+		BTMTK_WARN("%s, fwbuf is NULL!", __func__);
+		return;
+	}
+
+	patchhdr = (struct _PATCH_HEADER *)fwbuf;
+
+	if (is_mt7922(bdev->chip_id) || is_mt7961(bdev->chip_id))
+		globaldesrc = (struct _GLOBAL_DESCR *)(fwbuf + FW_ROM_PATCH_HEADER_SIZE);
+
+	BTMTK_INFO("[btmtk] =============== Patch Info ==============");
+	if (patchhdr) {
+		BTMTK_INFO("[btmtk] Built Time = %s", patchhdr->ucdatetime);
+		BTMTK_INFO("[btmtk] Hw Ver = 0x%04x", patchhdr->u2hwver);
+		BTMTK_INFO("[btmtk] Sw Ver = 0x%04x", patchhdr->u2swver);
+		BTMTK_INFO("[btmtk] Magic Number = 0x%08x", patchhdr->u4magicnum);
+
+		BTMTK_INFO("[btmtk] Platform = %c%c%c%c",
+			   patchhdr->ucplatform[0],
+			   patchhdr->ucplatform[1],
+			   patchhdr->ucplatform[2],
+			   patchhdr->ucplatform[3]);
+	}
+
+	if (globaldesrc) {
+		BTMTK_INFO("[btmtk] Patch Ver = 0x%08x", globaldesrc->u4patchver);
+		BTMTK_INFO("[btmtk] Section num = 0x%08x", globaldesrc->u4sectionnum);
+	}
+
+	BTMTK_INFO("[btmtk] =========================================");
+}
+
+static void btmtk_print_wifi_patch_info(struct btmtk_dev *bdev, u8 *fwbuf)
+{
+	struct _PATCH_HEADER *patchhdr = NULL;
+	struct _GLOBAL_DESCR *globaldesrc = NULL;
+
+	if (!fwbuf) {
+		BTMTK_WARN("%s, fwbuf is NULL!", __func__);
+		return;
+	}
+
+	patchhdr = (struct _PATCH_HEADER *)fwbuf;
+
+	if (is_mt7922(bdev->chip_id) || is_mt7961(bdev->chip_id))
+		globaldesrc = (struct _GLOBAL_DESCR *)(fwbuf + FW_ROM_PATCH_HEADER_SIZE);
+
+	BTMTK_INFO("[btmtk] =============== Wifi Patch Info ==============");
+	if (patchhdr) {
+		BTMTK_INFO("[btmtk] Built Time = %s", patchhdr->ucdatetime);
+		BTMTK_INFO("[btmtk] Hw Ver = 0x%04x",
+			   ((patchhdr->u2hwver & 0x00ff) << 8) |
+			   ((patchhdr->u2hwver & 0xff00) >> 8));
+		BTMTK_INFO("[btmtk] Sw Ver = 0x%04x",
+			   ((patchhdr->u2swver & 0x00ff) << 8) |
+			   ((patchhdr->u2swver & 0xff00) >> 8));
+		BTMTK_INFO("[btmtk] Magic Number = 0x%08x", be2cpu32(patchhdr->u4magicnum));
+
+		BTMTK_INFO("[btmtk] Platform = %c%c%c%c",
+			   patchhdr->ucplatform[0],
+			   patchhdr->ucplatform[1],
+			   patchhdr->ucplatform[2],
+			   patchhdr->ucplatform[3]);
+	}
+
+	if (globaldesrc) {
+		BTMTK_INFO("[btmtk] Patch Ver = 0x%08x",
+			   be2cpu32(globaldesrc->u4patchver));
+		BTMTK_INFO("[btmtk] Section num = 0x%08x",
+			   be2cpu32(globaldesrc->u4sectionnum));
+	} else {
+		BTMTK_WARN("%s, globaldesrc is NULL!", __func__);
+	}
+
+	BTMTK_INFO("[btmtk] =========================================");
+}
+
+static int btmtk_send_wmt_download_cmd(struct btmtk_dev *bdev, u8 *cmd,
+				       int cmd_len, u8 *event, int event_len,
+				       struct _SECTION_MAP *sectionmap,
+				       u8 fw_state, u8 dma_flag, bool patch_flag)
+{
+	int payload_len = 0;
+	int ret = -1;
+	int i = 0;
+	u32 revert_secspec = 0;
+
+	if (!bdev || !cmd || !event || !sectionmap) {
+		BTMTK_ERR("%s: invalid parameter!", __func__);
+		return ret;
+	}
+
+	/* prepare HCI header */
+	cmd[0] = 0x01;
+	cmd[1] = 0x6F;
+	cmd[2] = 0xFC;
+
+	/* prepare WMT header */
+	cmd[4] = 0x01;
+	cmd[5] = 0x01;
+
+	if (fw_state == 0) {
+		/* prepare WMT DL cmd */
+		payload_len = SEC_MAP_NEED_SEND_SIZE + 2;
+
+		cmd[3] = (payload_len + 4) & 0xFF;
+		cmd[6] = payload_len & 0xFF;
+		cmd[7] = (payload_len >> 8) & 0xFF;
+		cmd[8] = 0x00;
+		cmd[9] = dma_flag; /* 1:using DMA to download, 0:using legacy wmt cmd*/
+		cmd_len = SEC_MAP_NEED_SEND_SIZE + PATCH_HEADER_SIZE;
+
+		if (patch_flag)
+			for (i = 0; i < SECTION_SPEC_NUM; i++) {
+				revert_secspec = be2cpu32(sectionmap->u4secspec[i]);
+				memcpy(&cmd[PATCH_HEADER_SIZE] + i * sizeof(u32),
+				       (u8 *)&revert_secspec, sizeof(u32));
+			}
+		else
+			memcpy(&cmd[PATCH_HEADER_SIZE], (u8 *)(sectionmap->u4secspec),
+			       SEC_MAP_NEED_SEND_SIZE);
+
+		ret = btmtk_main_send_cmd(bdev, cmd, cmd_len,
+					  event, event_len, DELAY_TIMES, RETRY_TIMES,
+					  BTMTK_TX_CMD_FROM_DRV);
+		if (ret < 0) {
+			BTMTK_ERR("%s: send wmd dl cmd failed, terminate!", __func__);
+			return PATCH_ERR;
+		}
+
+		if (bdev->recv_evt_len >= event_len)
+			return bdev->io_buf[PATCH_STATUS];
+
+		ret = PATCH_ERR;
+	} else {
+		BTMTK_ERR("%s: fw state is error!", __func__);
+	}
+
+	return ret;
+}
+
+static int btmtk_load_fw_patch_using_wmt_cmd(struct btmtk_dev *bdev,
+					     u8 *image, u8 *fwbuf, u8 *event,
+					     int event_len, u32 patch_len, int offset)
+{
+	int ret = 0;
+	u32 cur_len = 0;
+	s32 sent_len;
+	int first_block = 1;
+	u8 phase;
+	int delay = PATCH_DOWNLOAD_PHASE1_2_DELAY_TIME;
+	int retry = PATCH_DOWNLOAD_PHASE1_2_RETRY;
+
+	if (!bdev || !image || !fwbuf) {
+		BTMTK_WARN("%s, invalid parameters!", __func__);
+		ret = -1;
+		goto exit;
+	}
+
+	/* loading rom patch */
+	while (1) {
+		s32 sent_len_max = UPLOAD_PATCH_UNIT - PATCH_HEADER_SIZE;
+
+		sent_len = (patch_len - cur_len) >= sent_len_max ?
+			    sent_len_max : (patch_len - cur_len);
+
+		if (sent_len > 0) {
+			if (first_block == 1) {
+				if (sent_len < sent_len_max)
+					phase = PATCH_PHASE3;
+				else
+					phase = PATCH_PHASE1;
+				first_block = 0;
+			} else if (sent_len == sent_len_max) {
+				if (patch_len - cur_len == sent_len_max)
+					phase = PATCH_PHASE3;
+				else
+					phase = PATCH_PHASE2;
+			} else {
+				phase = PATCH_PHASE3;
+			}
+
+			/* prepare HCI header */
+			image[0] = 0x02;
+			image[1] = 0x6F;
+			image[2] = 0xFC;
+			image[3] = (sent_len + 5) & 0xFF;
+			image[4] = ((sent_len + 5) >> 8) & 0xFF;
+
+			/* prepare WMT header */
+			image[5] = 0x01;
+			image[6] = 0x01;
+			image[7] = (sent_len + 1) & 0xFF;
+			image[8] = ((sent_len + 1) >> 8) & 0xFF;
+
+			image[9] = phase;
+			memcpy(&image[10], fwbuf + offset + cur_len, sent_len);
+			if (phase == PATCH_PHASE3) {
+				delay = PATCH_DOWNLOAD_PHASE3_DELAY_TIME;
+				retry = PATCH_DOWNLOAD_PHASE3_RETRY;
+			}
+
+			cur_len += sent_len;
+			BTMTK_DBG("%s: sent_len = %d, cur_len = %d, phase = %d", __func__,
+				  sent_len, cur_len, phase);
+
+			ret = btmtk_main_send_cmd(bdev, image, sent_len + PATCH_HEADER_SIZE,
+						  event, event_len, delay, retry,
+						  BTMTK_TX_ACL_FROM_DRV);
+			if (ret < 0) {
+				BTMTK_INFO("%s: send patch failed, terminate", __func__);
+				goto exit;
+			}
+		} else {
+			break;
+		}
+	}
+
+exit:
+	return ret;
+}
+
+static int btmtk_send_fw_rom_patch_79xx(struct btmtk_dev *bdev,
+					u8 *fwbuf, bool patch_flag)
+{
+	u8 *pos;
+	int loop_count = 0;
+	int ret = 0;
+	u32 section_num = 0;
+	u32 section_offset = 0;
+	u32 dl_size = 0;
+	int patch_status = 0;
+	int retry = 20;
+	u8 dma_flag = PATCH_DOWNLOAD_USING_WMT;
+	struct _SECTION_MAP *sectionmap;
+	struct _GLOBAL_DESCR *globaldescr;
+	u8 event[] = {0x04, 0xE4, 0x05, 0x02, 0x01, 0x01, 0x00, 0x00}; /* event[7] is status*/
+
+	if (!fwbuf) {
+		BTMTK_WARN("%s, fwbuf is NULL!", __func__);
+		ret = -1;
+		goto exit;
+	}
+
+	globaldescr = (struct _GLOBAL_DESCR *)(fwbuf + FW_ROM_PATCH_HEADER_SIZE);
+
+	BTMTK_INFO("%s: loading rom patch...\n", __func__);
+
+	if (patch_flag)
+		section_num = be2cpu32(globaldescr->u4sectionnum);
+	else
+		section_num = globaldescr->u4sectionnum;
+	BTMTK_INFO("%s: section_num = 0x%08x\n", __func__, section_num);
+
+	pos = kmalloc(UPLOAD_PATCH_UNIT, GFP_ATOMIC);
+	if (!pos) {
+		BTMTK_ERR("%s: alloc memory failed", __func__);
+		goto exit;
+	}
+
+	do {
+		sectionmap = (struct _SECTION_MAP *)(fwbuf + FW_ROM_PATCH_HEADER_SIZE +
+				FW_ROM_PATCH_GD_SIZE + FW_ROM_PATCH_SEC_MAP_SIZE * loop_count);
+		dma_flag = PATCH_DOWNLOAD_USING_WMT;
+		if (patch_flag) {
+			/* wifi is big-endian */
+			section_offset = be2cpu32(sectionmap->u4secoffset);
+			dl_size = be2cpu32(sectionmap->bin_info_spec.u4dlsize);
+			dma_flag = be2cpu32(sectionmap->bin_info_spec.u4dlmodecrctype) & 0xFF;
+		} else {
+			/* BT is little-endian */
+			section_offset = sectionmap->u4secoffset;
+			dl_size = sectionmap->bin_info_spec.u4dlsize;
+			/*
+			 * loop_count = 0: BGF patch
+			 *              1: BT ILM
+			 * only BT ILM support DL DMA for Buzzard
+			 */
+			dma_flag = le2cpu32(sectionmap->bin_info_spec.u4dlmodecrctype) & 0xFF;
+		}
+		BTMTK_INFO("%s:loop=%d, sec_offset=0x%08x, dl patch_len=0x%08x, dl mode=%d",
+			   __func__, loop_count, section_offset, dl_size, dma_flag);
+		if (dl_size > 0) {
+			retry = 20;
+			do {
+				patch_status = btmtk_send_wmt_download_cmd(bdev, pos, 0,
+									   event, sizeof(event) - 1,
+									   sectionmap, 0, dma_flag,
+									   patch_flag);
+				BTMTK_INFO("%s: patch_status %d", __func__, patch_status);
+
+				if (patch_status > PATCH_READY || patch_status == PATCH_ERR) {
+					BTMTK_ERR("%s: patch_status error", __func__);
+					ret = -1;
+					goto err;
+				} else if (patch_status == PATCH_READY) {
+					BTMTK_INFO("%s: no need to load rom patch section%d",
+						   __func__, loop_count);
+					goto next_section;
+				} else if (patch_status == PATCH_IS_DOWNLOAD_BY_OTHER) {
+					msleep(100);
+					retry--;
+				} else if (patch_status == PATCH_NEED_DOWNLOAD) {
+					break;  /* Download ROM patch directly */
+				}
+			} while (retry > 0);
+
+			if (patch_status == PATCH_IS_DOWNLOAD_BY_OTHER) {
+				BTMTK_WARN("%s: Hold by another fun more than 2 seconds", __func__);
+				ret = -1;
+				goto err;
+			}
+
+			if (dma_flag == PATCH_DOWNLOAD_USING_DMA && main_info.hif_hook.dl_dma) {
+				/* using DMA to download fw patch*/
+				ret = main_info.hif_hook.dl_dma(bdev,
+					pos, fwbuf,
+					dl_size, section_offset);
+				if (ret < 0) {
+					BTMTK_ERR("%s: dl using dma failed!", __func__);
+					goto err;
+				}
+			} else {
+				/* using legacy wmt cmd to download fw patch */
+				ret = btmtk_load_fw_patch_using_wmt_cmd(bdev, pos, fwbuf, event,
+									sizeof(event) - 1,
+									dl_size, section_offset);
+				if (ret < 0) {
+					BTMTK_ERR("%s: dl using wmt cmd failed!", __func__);
+					goto err;
+				}
+			}
+		}
+next_section:
+		continue;
+	} while (++loop_count < section_num);
+
+err:
+	kfree(pos);
+	pos = NULL;
+
+exit:
+	return ret;
+}
+
+int btmtk_load_rom_patch_79xx(struct btmtk_dev *bdev, bool patch_flag)
+{
+	int ret = 0;
+	const struct firmware *fw_firmware = NULL;
+	u8 *rom_patch = NULL;
+	unsigned int rom_patch_len = 0;
+
+	BTMTK_ERR("%s, patch_flag = %d!", __func__, patch_flag);
+
+	if (!bdev) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return -EINVAL;
+	}
+
+	if (patch_flag) {
+		if (bdev->flavor)
+			/* if flavor equals 1, it represent 7920, else it represent 7921*/
+			snprintf(bdev->rom_patch_bin_file_name, MAX_BIN_FILE_NAME_LEN,
+				 "WIFI_MT%04x_patch_mcu_1a_%x_hdr.bin",
+				 bdev->chip_id & 0xffff, (bdev->fw_version & 0xff) + 1);
+		else
+			snprintf(bdev->rom_patch_bin_file_name, MAX_BIN_FILE_NAME_LEN,
+				 "WIFI_MT%04x_patch_mcu_1_%x_hdr.bin",
+				 bdev->chip_id & 0xffff, (bdev->fw_version & 0xff) + 1);
+	}
+
+	btmtk_load_code_from_bin(&fw_firmware, bdev->rom_patch_bin_file_name, NULL,
+				 &rom_patch, &rom_patch_len);
+
+	if (!rom_patch) {
+		BTMTK_ERR("%s: please assign a rom patch(/etc/firmware/%s)or(/lib/firmware/%s)",
+			  __func__, bdev->rom_patch_bin_file_name, bdev->rom_patch_bin_file_name);
+		ret = -1;
+		goto err;
+	}
+
+	if (patch_flag)
+		/*Display rom patch info*/
+		btmtk_print_wifi_patch_info(bdev, rom_patch);
+	else
+		btmtk_print_bt_patch_info(bdev, rom_patch);
+
+	ret = btmtk_send_fw_rom_patch_79xx(bdev, rom_patch, patch_flag);
+	if (ret < 0) {
+		BTMTK_ERR("%s, btmtk_send_fw_rom_patch_79xx failed!", __func__);
+		goto err;
+	}
+
+	bdev->power_state = BTMTK_DONGLE_STATE_POWER_OFF;
+	BTMTK_INFO("%s end", __func__);
+
+err:
+	if (fw_firmware)
+		release_firmware(fw_firmware);
+	return ret;
+}
+
+int btmtk_load_rom_patch(struct btmtk_dev *bdev)
+{
+	int err = -1;
+
+	if (!bdev || !bdev->hdev) {
+		BTMTK_ERR("%s: invalid parameters!", __func__);
+		return err;
+	}
+
+	if (is_mt7922(bdev->chip_id) || is_mt7961(bdev->chip_id)) {
+		err = btmtk_load_rom_patch_79xx(bdev, BT_DOWNLOAD);
+		if (err < 0) {
+			BTMTK_ERR("%s: btmtk_load_rom_patch_79xx bt patch failed!", __func__);
+			return err;
+		}
+
+		err = btmtk_load_rom_patch_79xx(bdev, WIFI_DOWNLOAD);
+		if (err < 0) {
+			BTMTK_WARN("%s: btmtk_load_rom_patch_79xx wifi patch failed!", __func__);
+			err = 0;
+		}
+	} else {
+		BTMTK_WARN("%s: unknown chip id (%d)", __func__, bdev->chip_id);
+	}
+
+	return err;
+}
+
+struct btmtk_dev *btmtk_get_dev(void)
+{
+	int i = 0;
+	struct btmtk_dev *tmp_bdev = NULL;
+
+	BTMTK_INFO("%s", __func__);
+
+	for (i = 0; i < btmtk_intf_num; i++) {
+		if (!g_bdev[i]->hdev) {
+			if (i == 0)
+				g_bdev[i]->dongle_index = i;
+			else
+				g_bdev[i]->dongle_index = g_bdev[i - 1]->dongle_index + 1;
+
+			tmp_bdev = g_bdev[i];
+
+			/* Hook pre-defined table on state machine */
+			g_bdev[i]->cif_state = (struct btmtk_cif_state *)g_cif_state;
+			break;
+		}
+	}
+
+	return tmp_bdev;
+}
+
+void btmtk_release_dev(struct btmtk_dev *bdev)
+{
+	int i = 0;
+	struct btmtk_dev *tmp_bdev = NULL;
+
+	tmp_bdev = bdev;
+	if (!tmp_bdev) {
+		for (i = 0; i < btmtk_intf_num; i++) {
+			if (memcmp(tmp_bdev, g_bdev[i], sizeof(*tmp_bdev)) == 0) {
+				memset(tmp_bdev, 0, sizeof(*tmp_bdev));
+
+				tmp_bdev = NULL;
+				break;
+			}
+		}
+	}
+}
+
+struct btmtk_dev *btmtk_allocate_dev_memory(struct device *dev)
+{
+	struct btmtk_dev *bdev;
+	size_t len = sizeof(*bdev);
+
+	if (!dev)
+		bdev = devm_kzalloc(dev, len, GFP_KERNEL);
+	else
+		bdev = kzalloc(len, GFP_KERNEL);
+
+	if (!bdev)
+		return NULL;
+
+	btmtk_set_chip_state(bdev, BTMTK_STATE_INIT);
+
+	return bdev;
+}
+
+void btmtk_free_dev_memory(struct device *dev, struct btmtk_dev *bdev)
+{
+	if (!bdev) {
+		if (!dev)
+			devm_kfree(dev, bdev);
+		else
+			kfree(bdev);
+	}
+}
+
+int btmtk_send_wmt_power_on_cmd(struct btmtk_dev *bdev)
+{
+	/* Support 7668 and 7961 */
+	u8 cmd[] = { 0x01, 0x6F, 0xFC, 0x06, 0x01, 0x06, 0x02, 0x00, 0x00, 0x01 };
+	u8 event[] = { 0x04, 0xE4, 0x05, 0x02, 0x06, 0x01, 0x00 };
+	int ret = -1, retry = RETRY_TIMES;
+
+	if (!bdev) {
+		BTMTK_ERR("%s: bdev is NULL !", __func__);
+		return ret;
+	}
+
+retry_again:
+
+	ret = btmtk_main_send_cmd(bdev, cmd, sizeof(cmd), event, sizeof(event),
+				  WMT_DELAY_TIMES, RETRY_TIMES, BTMTK_TX_CMD_FROM_DRV);
+	if (ret < 0) {
+		BTMTK_ERR("%s: failed(%d)", __func__, ret);
+		bdev->power_state = BTMTK_DONGLE_STATE_ERROR;
+		ret = -1;
+	} else if (ret == 0 && bdev->recv_evt_len > 0) {
+		switch (bdev->io_buf[6]) {
+		case 0:			 /* successful */
+			BTMTK_INFO("%s: OK", __func__);
+			bdev->power_state = BTMTK_DONGLE_STATE_POWER_ON;
+			break;
+		case 2:			 /* TODO:retry */
+			if (retry > 0) {
+				retry--;
+				BTMTK_INFO("%s: need to try again", __func__);
+				mdelay(50);
+				goto retry_again;
+			}
+			break;
+		default:
+			BTMTK_WARN("%s: Unknown result: %02X", __func__, bdev->io_buf[6]);
+			bdev->power_state = BTMTK_DONGLE_STATE_ERROR;
+			ret = -1;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int btmtk_send_wmt_power_off_cmd(struct btmtk_dev *bdev)
+{
+	/* Support 7668 and 7961 */
+	u8 cmd[] = { 0x01, 0x6F, 0xFC, 0x06, 0x01, 0x06, 0x02, 0x00, 0x00, 0x00 };
+	/* To-Do, for event check */
+	u8 event[] = { 0x04, 0xE4, 0x05, 0x02, 0x06, 0x01, 0x00 };
+	int ret = -1;
+
+	if (!bdev) {
+		BTMTK_ERR("%s: bdev is NULL !", __func__);
+		return ret;
+	}
+
+	if (bdev->power_state == BTMTK_DONGLE_STATE_POWER_OFF) {
+		BTMTK_WARN("%s: power_state already power off", __func__);
+		return 0;
+	}
+
+	ret = btmtk_main_send_cmd(bdev, cmd, sizeof(cmd), event, sizeof(event),
+				  DELAY_TIMES, RETRY_TIMES, BTMTK_TX_CMD_FROM_DRV);
+	if (ret < 0) {
+		BTMTK_ERR("%s: failed(%d)", __func__, ret);
+		bdev->power_state = BTMTK_DONGLE_STATE_ERROR;
+		return ret;
+	}
+
+	bdev->power_state = BTMTK_DONGLE_STATE_POWER_OFF;
+	BTMTK_INFO("%s done", __func__);
+	return ret;
+}
+
+int btmtk_cap_init(struct btmtk_dev *bdev)
+{
+	if (!bdev) {
+		BTMTK_ERR("%s, bdev is NULL!", __func__);
+		return -1;
+	}
+
+	main_info.hif_hook.reg_read(bdev, CHIP_ID, &bdev->chip_id);
+	if (is_mt7922(bdev->chip_id) || is_mt7961(bdev->chip_id)) {
+		main_info.hif_hook.reg_read(bdev, FLAVOR, &bdev->flavor);
+		main_info.hif_hook.reg_read(bdev, FW_VERSION, &bdev->fw_version);
+	} else {
+		BTMTK_ERR("Unknown Mediatek device(%04X)\n", bdev->chip_id);
+		return -1;
+	}
+
+	BTMTK_INFO("%s: Chip ID = 0x%x", __func__, bdev->chip_id);
+	BTMTK_INFO("%s: flavor = 0x%x", __func__, bdev->flavor);
+	BTMTK_INFO("%s: FW Ver = 0x%x", __func__, bdev->fw_version);
+
+	memset(bdev->rom_patch_bin_file_name, 0, MAX_BIN_FILE_NAME_LEN);
+	if ((bdev->fw_version & 0xff) == 0xff) {
+		BTMTK_ERR("%s: failed, wrong FW version : 0x%x !", __func__, bdev->fw_version);
+		return -1;
+	}
+
+	/* Bin filename format : "BT_RAM_CODE_MT%04x_%x_%x_hdr.bin"
+	 *  $$$$ : chip id
+	 *  % : fw version & 0xFF + 1 (in HEX)
+	 */
+	bdev->flavor = (bdev->flavor & 0x00000080) >> 7;
+	BTMTK_INFO("%s: flavor1 = 0x%x", __func__, bdev->flavor);
+
+	/* if flavor equals 1, it represent 7920, else it represent 7921 */
+	if (bdev->flavor)
+		snprintf(bdev->rom_patch_bin_file_name, MAX_BIN_FILE_NAME_LEN,
+			 "BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
+			 bdev->chip_id & 0xffff, (bdev->fw_version & 0xff) + 1);
+	else
+		snprintf(bdev->rom_patch_bin_file_name, MAX_BIN_FILE_NAME_LEN,
+			 "BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
+			 bdev->chip_id & 0xffff, (bdev->fw_version & 0xff) + 1);
+
+	BTMTK_INFO("%s: rom patch file name is %s", __func__, bdev->rom_patch_bin_file_name);
+
+	return 0;
+}
+
+int btmtk_send_init_cmds(struct btmtk_dev *bdev)
+{
+	int ret = -1;
+
+	if (!bdev) {
+		BTMTK_ERR("%s: bdev is NULL !", __func__);
+		goto exit;
+	}
+
+	BTMTK_INFO("%s", __func__);
+
+	ret = btmtk_send_wmt_power_on_cmd(bdev);
+	if (ret < 0) {
+		if (bdev->power_state != BTMTK_DONGLE_STATE_POWER_ON)
+			BTMTK_ERR("%s, btmtk_send_wmt_power_on_cmd failed!", __func__);
+		goto exit;
+	}
+
+exit:
+	return ret;
+}
+
+int btmtk_send_deinit_cmds(struct btmtk_dev *bdev)
+{
+	int ret = -1;
+
+	if (!bdev) {
+		BTMTK_ERR("%s: bdev is NULL !", __func__);
+		return ret;
+	}
+
+	BTMTK_INFO("%s", __func__);
+
+	ret = btmtk_send_wmt_power_off_cmd(bdev);
+	if (bdev->power_state != BTMTK_DONGLE_STATE_POWER_OFF) {
+		BTMTK_WARN("Power off failed, reset it");
+		btmtk_send_assert_cmd(bdev);
+	}
+
+	return ret;
+}
+
+int btmtk_send_assert_cmd(struct btmtk_dev *bdev)
+{
+	int ret = 0;
+	int state;
+	u8 buf[] = { 0x01, 0x6F, 0xFC, 0x05, 0x01, 0x02, 0x01, 0x00, 0x08 };
+	struct sk_buff *skb = NULL;
+
+	if (!bdev) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	state = btmtk_get_chip_state(bdev);
+	if (state == BTMTK_STATE_FW_DUMP) {
+		BTMTK_WARN("%s: FW dumping already!!!", __func__);
+		return ret;
+	}
+
+	BTMTK_INFO("%s: send assert cmd", __func__);
+
+	skb = alloc_skb(sizeof(buf) + BT_SKB_RESERVE, GFP_ATOMIC);
+	if (!skb) {
+		BTMTK_ERR("%s allocate skb failed!!", __func__);
+		goto exit;
+	}
+	bt_cb(skb)->pkt_type = HCI_COMMAND_PKT;
+	memcpy(skb->data, buf, sizeof(buf));
+	skb->len = sizeof(buf);
+
+	ret = main_info.hif_hook.send_cmd(bdev, skb, 100, 20, (int)BTMTK_TX_CMD_FROM_DRV);
+	if (ret < 0)
+		BTMTK_ERR("%s failed!!", __func__);
+	else
+		BTMTK_INFO("%s: OK", __func__);
+
+exit:
+	return ret;
+}
+
+static int bt_flush(struct hci_dev *hdev)
+{
+	return 0;
+}
+
+static int bt_close(struct hci_dev *hdev)
+{
+	int ret = -1;
+	int state = BTMTK_STATE_INIT;
+	int fstate = BTMTK_FOPS_STATE_INIT;
+	struct btmtk_dev *bdev = NULL;
+
+	if (!hdev) {
+		BTMTK_ERR("%s: invalid parameters!", __func__);
+		return ret;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s: bdev is invalid!", __func__);
+		return ret;
+	}
+
+	fstate = btmtk_fops_get_state(bdev);
+	if (fstate != BTMTK_FOPS_STATE_OPENED) {
+		BTMTK_WARN("%s: fops is not allow close(%d)", __func__, fstate);
+		goto err;
+	}
+	btmtk_fops_set_state(bdev, BTMTK_FOPS_STATE_CLOSING);
+
+	state = btmtk_get_chip_state(bdev);
+	if (state != BTMTK_STATE_WORKING && state != BTMTK_STATE_STANDBY) {
+		BTMTK_WARN("%s: not in working state and standby state(%d).", __func__, state);
+		goto exit;
+	}
+
+	BTMTK_INFO("%s, enter", __func__);
+
+	if (main_info.hif_hook.cif_mutex_lock)
+		main_info.hif_hook.cif_mutex_lock(bdev);
+
+	if (state != BTMTK_STATE_STANDBY) {
+		ret = btmtk_send_deinit_cmds(bdev);
+		if (ret < 0) {
+			BTMTK_ERR("%s, btmtk_send_deinit_cmds failed", __func__);
+			goto unlock;
+		}
+	}
+
+	/* Flush RX works */
+	flush_work(&bdev->rx_work);
+
+	/* Drop queues */
+	skb_queue_purge(&bdev->rx_q);
+
+	main_info.hif_hook.close(hdev);
+
+unlock:
+	if (main_info.hif_hook.cif_mutex_unlock)
+		main_info.hif_hook.cif_mutex_unlock(bdev);
+exit:
+	btmtk_fops_set_state(bdev, BTMTK_FOPS_STATE_CLOSED);
+
+err:
+	return 0;
+}
+
+static int bt_open(struct hci_dev *hdev)
+{
+	int ret = -1;
+	int state = BTMTK_STATE_INIT;
+	int fstate = BTMTK_FOPS_STATE_INIT;
+	struct btmtk_dev *bdev = NULL;
+
+	BTMTK_INFO("%s: MTK BT Driver Version : %s", __func__, VERSION);
+
+	if (!hdev) {
+		BTMTK_ERR("%s: invalid parameters!", __func__);
+		return -EFAULT;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s: bdev is invalid", __func__);
+		return -EFAULT;
+	}
+
+	state = btmtk_get_chip_state(bdev);
+	if (state == BTMTK_STATE_INIT || state == BTMTK_STATE_DISCONNECT) {
+		ret = -EAGAIN;
+		goto failed;
+	}
+
+	if (state != BTMTK_STATE_WORKING && state != BTMTK_STATE_STANDBY) {
+		BTMTK_WARN("%s: not in working state and standby state(%d).", __func__, state);
+		ret = -ENODEV;
+		goto failed;
+	}
+
+	fstate = btmtk_fops_get_state(bdev);
+	if (fstate == BTMTK_FOPS_STATE_OPENED) {
+		BTMTK_WARN("%s: fops opened!", __func__);
+		ret = 0;
+		goto failed;
+	} else if ((fstate == BTMTK_FOPS_STATE_CLOSING) ||
+	    (fstate == BTMTK_FOPS_STATE_OPENING)) {
+		BTMTK_WARN("%s: fops open/close is on-going !", __func__);
+		ret = -EAGAIN;
+		goto failed;
+	}
+
+	BTMTK_INFO("%s", __func__);
+	btmtk_fops_set_state(bdev, BTMTK_FOPS_STATE_OPENING);
+	ret = main_info.hif_hook.open(hdev);
+	if (ret < 0) {
+		BTMTK_ERR("%s, cif_open failed", __func__);
+		goto failed;
+	}
+
+	ret = btmtk_send_init_cmds(bdev);
+	if (ret < 0) {
+		BTMTK_ERR("%s, btmtk_send_init_cmds failed", __func__);
+		goto failed;
+	}
+
+	if (main_info.hif_hook.open_done)
+		main_info.hif_hook.open_done(bdev);
+
+	btmtk_fops_set_state(bdev, BTMTK_FOPS_STATE_OPENED);
+
+	return 0;
+
+failed:
+	btmtk_fops_set_state(bdev, BTMTK_FOPS_STATE_CLOSED);
+
+	return ret;
+}
+
+static int bt_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	int ret = -1;
+	int state = BTMTK_STATE_INIT;
+	int fstate = BTMTK_FOPS_STATE_INIT;
+	struct btmtk_dev *bdev = NULL;
+
+	if (!hdev || !skb) {
+		BTMTK_ERR("%s, invalid parameters!", __func__);
+		return -ENODEV;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s, bdev is invalid!", __func__);
+		return -ENODEV;
+	}
+
+	fstate = btmtk_fops_get_state(bdev);
+	if (fstate != BTMTK_FOPS_STATE_OPENED) {
+		BTMTK_WARN("%s: fops is not open yet(%d)!", __func__, fstate);
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	state = btmtk_get_chip_state(bdev);
+	if (state != BTMTK_STATE_WORKING) {
+		BTMTK_WARN("%s: chip state is %d.", __func__, state);
+		if (state == BTMTK_STATE_DISCONNECT) {
+			ret = -ENODEV;
+		} else {
+			msleep(3000);
+			ret = -EAGAIN;
+		}
+		goto exit;
+	}
+
+	if (bdev->power_state == BTMTK_DONGLE_STATE_POWER_OFF) {
+		BTMTK_WARN("%s: dongle state already power off, do not write", __func__);
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
+
+	/* For Ble ISO packet size */
+	if (memcmp(skb->data, READ_ISO_PACKET_SIZE_CMD, sizeof(READ_ISO_PACKET_SIZE_CMD)) == 0) {
+		bdev->iso_threshold = skb->data[sizeof(READ_ISO_PACKET_SIZE_CMD)] +
+					(skb->data[sizeof(READ_ISO_PACKET_SIZE_CMD) + 1]  << 8);
+		BTMTK_INFO("%s: Ble iso pkt size is %d", __func__, bdev->iso_threshold);
+	}
+
+	ret = main_info.hif_hook.send_cmd(bdev, skb, 0, 0, (int)BTMTK_TX_PKT_FROM_HOST);
+	if (ret < 0)
+		BTMTK_ERR("%s failed!!", __func__);
+exit:
+	return ret;
+}
+
+static int bt_setup(struct hci_dev *hdev)
+{
+	BTMTK_INFO("%s", __func__);
+	return 0;
+}
+
+void btmtk_reg_hif_hook(struct hif_hook_ptr *hook)
+{
+	memcpy(&main_info.hif_hook, hook, sizeof(struct hif_hook_ptr));
+}
+
+static void btmtk_rx_work(struct work_struct *work)
+{
+	int err = 0, skip_pkt = 0;
+	struct btmtk_dev *bdev = container_of(work, struct btmtk_dev, rx_work);
+	struct sk_buff *skb;
+	int fstate = BTMTK_FOPS_STATE_INIT;
+	int state = 0;
+
+	BTMTK_DBG("%s enter", __func__);
+
+	while ((skb = skb_dequeue(&bdev->rx_q))) {
+		skip_pkt = btmtk_dispatch_pkt(bdev->hdev, skb);
+		if (skip_pkt != 0) {
+			kfree_skb(skb);
+			continue;
+		}
+
+		if (hci_skb_pkt_type(skb) == HCI_EVENT_PKT) {
+			if (main_info.hif_hook.event_filter(bdev, skb)) {
+				kfree_skb(skb);
+				continue;
+			}
+		}
+
+		fstate = btmtk_fops_get_state(bdev);
+		if (fstate != BTMTK_FOPS_STATE_OPENED) {
+			kfree_skb(skb);
+			continue;
+		}
+
+		state = btmtk_get_chip_state(bdev);
+		if (state != BTMTK_STATE_WORKING) {
+			kfree_skb(skb);
+			continue;
+		}
+
+		err = hci_recv_frame(bdev->hdev, skb);
+		if (err < 0) {
+			if (err != -ENXIO)
+				BTMTK_ERR("%s failed, err = %d", __func__, err);
+			return;
+		}
+	}
+}
+
+void btmtk_free_hci_device(struct btmtk_dev *bdev, int hci_bus_type)
+{
+	if (!bdev)
+		return;
+
+	flush_work(&bdev->rx_work);
+
+	skb_queue_purge(&bdev->rx_q);
+	destroy_workqueue(bdev->workqueue);
+
+	BTMTK_INFO("%s", __func__);
+
+	if (bdev->hdev)
+		hci_free_dev(bdev->hdev);
+
+	bdev->chip_reset = 0;
+	BTMTK_INFO("%s done", __func__);
+}
+
+int btmtk_allocate_hci_device(struct btmtk_dev *bdev, int hci_bus_type)
+{
+	struct hci_dev *hdev;
+	int err = 0;
+
+	if (!bdev) {
+		BTMTK_ERR("%s, bdev is NULL!", __func__);
+		err = -EINVAL;
+		goto exit;
+	}
+
+	BTMTK_INFO("%s", __func__);
+	hdev = hci_alloc_dev();
+	if (!hdev) {
+		BTMTK_ERR("%s, hdev is NULL!", __func__);
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	hdev->bus = hci_bus_type;
+	hci_set_drvdata(hdev, bdev);
+
+	hdev->dev_type = 0x00;
+
+	bdev->hdev = hdev;
+
+	hdev->open	   = bt_open;
+	hdev->close    = bt_close;
+	hdev->flush    = bt_flush;
+	hdev->send	   = bt_send_frame;
+	hdev->setup    = bt_setup;
+
+	INIT_WORK(&bdev->rx_work, btmtk_rx_work);
+
+	init_waitqueue_head(&bdev->p_wait_event_q);
+
+	skb_queue_head_init(&bdev->rx_q);
+
+	bdev->workqueue = alloc_workqueue("BTMTK_RX_WQ", WQ_HIGHPRI | WQ_UNBOUND |
+					  WQ_MEM_RECLAIM, 1);
+	if (!bdev->workqueue) {
+		BTMTK_ERR("%s, bdev->workqueue is NULL!", __func__);
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	BTMTK_INFO("%s done", __func__);
+
+exit:
+	return err;
+}
+
+int btmtk_register_hci_device(struct btmtk_dev *bdev)
+{
+	struct hci_dev *hdev;
+	int err = 0;
+
+	hdev = bdev->hdev;
+
+	err = hci_register_dev(hdev);
+	if (err < 0) {
+		BTMTK_INFO("%s can't register", __func__);
+		hci_free_dev(hdev);
+		goto exit;
+	}
+
+		test_and_clear_bit(HCI_SETUP, &hdev->dev_flags);
+
+exit:
+	return err;
+}
+
+int btmtk_deregister_hci_device(struct btmtk_dev *bdev)
+{
+	int err = 0;
+
+	if (bdev && bdev->hdev)
+		hci_unregister_dev(bdev->hdev);
+
+	return err;
+}
+
+static int btmtk_main_allocate_memory(struct btmtk_dev *bdev)
+{
+	BTMTK_INFO("%s", __func__);
+
+	if (!bdev->rom_patch_bin_file_name) {
+		bdev->rom_patch_bin_file_name = kzalloc(MAX_BIN_FILE_NAME_LEN, GFP_KERNEL);
+		if (!bdev->rom_patch_bin_file_name) {
+			BTMTK_ERR("%s: alloc memory fail rom_patch_bin_file_name", __func__);
+			return -ENOMEM;
+		}
+	}
+
+	if (!bdev->io_buf) {
+		bdev->io_buf = kzalloc(IO_BUF_SIZE, GFP_KERNEL);
+		if (!bdev->io_buf) {
+			BTMTK_ERR("%s: alloc memory fail io_buf", __func__);
+			return -ENOMEM;
+		}
+	}
+
+	BTMTK_INFO("%s: Done", __func__);
+	return 0;
+}
+
+static void btmtk_main_free_memory(struct btmtk_dev *bdev)
+{
+	kfree(bdev->rom_patch_bin_file_name);
+	bdev->rom_patch_bin_file_name = NULL;
+
+	kfree(bdev->io_buf);
+	bdev->io_buf = NULL;
+
+	BTMTK_INFO("%s: Success", __func__);
+}
+
+int btmtk_main_cif_initialize(struct btmtk_dev *bdev, int hci_bus)
+{
+	int err = 0;
+
+	err = btmtk_main_allocate_memory(bdev);
+	if (err < 0) {
+		BTMTK_ERR("btmtk_main_allocate_memory failed!");
+		goto end;
+	}
+
+	err = btmtk_allocate_hci_device(bdev, hci_bus);
+	if (err < 0) {
+		BTMTK_ERR("btmtk_allocate_hci_device failed!");
+		goto free_mem;
+	}
+
+	err = btmtk_cap_init(bdev);
+	if (err < 0) {
+		BTMTK_ERR("btmtk_cap_init failed!");
+		goto free_hci_dev;
+	}
+
+	return 0;
+
+free_hci_dev:
+	btmtk_free_hci_device(bdev, hci_bus);
+free_mem:
+	btmtk_main_free_memory(bdev);
+end:
+	return err;
+}
+
+void btmtk_main_cif_uninitialize(struct btmtk_dev *bdev, int hci_bus)
+{
+	btmtk_free_hci_device(bdev, hci_bus);
+	btmtk_main_free_memory(bdev);
+}
+
+int btmtk_main_cif_disconnect_notify(struct btmtk_dev *bdev, int hci_bus)
+{
+	btmtk_deregister_hci_device(bdev);
+	btmtk_free_hci_device(bdev, hci_bus);
+
+	bdev->power_state = BTMTK_DONGLE_STATE_POWER_OFF;
+	btmtk_release_dev(bdev);
+
+	return 0;
+}
+
+/**
+ * Kernel Module init/exit Functions
+ */
+static int __init main_driver_init(void)
+{
+	int ret = 0;
+	int i;
+
+	/* Mediatek Driver Version */
+	BTMTK_INFO("%s: MTK BT Driver Version : %s", __func__, VERSION);
+
+	ret = main_init();
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < btmtk_intf_num; i++)
+		btmtk_set_chip_state(g_bdev[i], BTMTK_STATE_DISCONNECT);
+
+	ret = btmtk_cif_register();
+	if (ret < 0) {
+		BTMTK_ERR("*** USB registration failed(%d)! ***", ret);
+		main_exit();
+		return ret;
+	}
+
+	BTMTK_INFO("%s: Done", __func__);
+	return ret;
+}
+
+static void __exit main_driver_exit(void)
+{
+	BTMTK_INFO("%s", __func__);
+	btmtk_cif_deregister();
+	main_exit();
+}
+module_init(main_driver_init);
+module_exit(main_driver_exit);
+
+/**
+ * Module Common Information
+ */
+MODULE_DESCRIPTION("Mediatek Bluetooth Driver");
+MODULE_VERSION(VERSION SUBVER);
+MODULE_LICENSE("GPL");
+module_param(btmtk_intf_num, int, 0444);
diff --git a/drivers/bluetooth/btmtk_main.h b/drivers/bluetooth/btmtk_main.h
new file mode 100644
index 000000000000..ce8447ff0484
--- /dev/null
+++ b/drivers/bluetooth/btmtk_main.h
@@ -0,0 +1,578 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2020 MediaTek Inc.
+
+/*
+ * Bluetooth support for MediaTek SDIO/USB/UART devices
+ *
+ */
+
+#ifndef __BTMTK_MAIN_H__
+#define __BTMTK_MAIN_H__
+#include <linux/version.h>
+#include <linux/firmware.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+
+#include <linux/spinlock.h>
+#include <linux/kallsyms.h>
+#include <linux/device.h>
+#include <asm/unaligned.h>
+
+/* Define for proce node */
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+
+/* Define for whole chip reset */
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+
+#include <linux/kthread.h>
+#include <linux/freezer.h>
+
+/** Driver version */
+#define VERSION "7.0.2020110301"
+#define SUBVER ":turnkey"
+
+#define BTMTKUART_RX_STATE_ACTIVE	1
+#define BTMTKUART_RX_STATE_WAKEUP	2
+#define BTMTKUART_RX_STATE_RESET	3
+
+/**
+ * Maximum rom patch file name length
+ */
+#define MAX_BIN_FILE_NAME_LEN 64
+
+/**
+ * Type definition
+ */
+#ifndef TRUE
+	#define TRUE 1
+#endif
+#ifndef FALSE
+	#define FALSE 0
+#endif
+
+#define MIN(a, b) (((a) < (b)) ? (a) : (b))
+#define MAX(a, b) (((a) > (b)) ? (a) : (b))
+
+/**
+ * Log and level definition
+ */
+#define BTMTK_LOG_LVL_ERR	1
+#define BTMTK_LOG_LVL_WARN	2
+#define BTMTK_LOG_LVL_INFO	3
+#define BTMTK_LOG_LVL_DBG	4
+#define BTMTK_LOG_LVL_MAX	BTMTK_LOG_LVL_DBG
+#define BTMTK_LOG_LVL_DEF	BTMTK_LOG_LVL_INFO	/* default setting */
+
+#define HCI_LOG_MAX_BUF_SIZE	66
+#define WMT_OVER_HCI_HEADER_SIZE	3
+
+extern u8 btmtk_log_lvl;
+
+#define BTMTK_ERR(fmt, ...)	 \
+	do { if (btmtk_log_lvl >= BTMTK_LOG_LVL_ERR) \
+		pr_warn("[btmtk_err] ***" fmt"***\n", ##__VA_ARGS__); } while (0)
+#define BTMTK_WARN(fmt, ...)	\
+	do { if (btmtk_log_lvl >= BTMTK_LOG_LVL_WARN) \
+		pr_warn("[btmtk_warn] " fmt"\n", ##__VA_ARGS__); } while (0)
+#define BTMTK_INFO(fmt, ...)	\
+	do { if (btmtk_log_lvl >= BTMTK_LOG_LVL_INFO) \
+		pr_warn("[btmtk_info] " fmt"\n", ##__VA_ARGS__); } while (0)
+#define BTMTK_DBG(fmt, ...)	 \
+	do { if (btmtk_log_lvl >= BTMTK_LOG_LVL_DBG) \
+		pr_warn("[btmtk_dbg] " fmt"\n", ##__VA_ARGS__); } while (0)
+
+#define BTMTK_INFO_RAW(p, l, fmt, ...)						\
+	do {									\
+		if (btmtk_log_lvl >= BTMTK_LOG_LVL_INFO) {			\
+			int raw_count = 0;					\
+			char str[HCI_LOG_MAX_BUF_SIZE * 3 + 1];			\
+			char *p_str = str;					\
+			const unsigned char *ptr = p;				\
+			pr_warn("[btmtk_info] " fmt, ##__VA_ARGS__);		\
+			for (raw_count = 0; raw_count < MIN(l, HCI_LOG_MAX_BUF_SIZE); ++raw_count)\
+				p_str += sprintf(p_str, " %02X", ptr[raw_count]);		\
+			*p_str = '\0';								\
+			pr_warn("%s\n", str);					\
+		}								\
+	} while (0)
+
+#define BTMTK_DBG_RAW(p, l, fmt, ...)						\
+	do {									\
+		if (btmtk_log_lvl >= BTMTK_LOG_LVL_DBG) {			\
+			int raw_count = 0;					\
+			char str[HCI_LOG_MAX_BUF_SIZE * 3 + 1];			\
+			char *p_str = str;					\
+			const unsigned char *ptr = p;				\
+			pr_warn("[btmtk_debug] " fmt, ##__VA_ARGS__);		\
+			for (raw_count = 0; raw_count < MIN(l, HCI_LOG_MAX_BUF_SIZE); ++raw_count)\
+				p_str += sprintf(p_str, " %02X", ptr[raw_count]);		\
+			*p_str = '\0';						\
+			pr_warn("%s\n", str);					\
+		}								\
+	} while (0)
+
+#define BTMTK_CIF_IS_NULL(bdev, cif_event) \
+	(!bdev || !(&bdev->cif_state[cif_event]))
+
+/**
+ *
+ * HCI packet type
+ */
+#define MTK_HCI_COMMAND_PKT		0x01
+#define MTK_HCI_ACLDATA_PKT		0x02
+#define MTK_HCI_SCODATA_PKT		0x03
+#define MTK_HCI_EVENT_PKT		0x04
+#define HCI_ISO_PKT			0x05
+#define HCI_ISO_PKT_HEADER_SIZE	4
+#define HCI_ISO_PKT_WITH_ACL_HEADER_SIZE	5
+
+/**
+ * ROM patch related
+ */
+#define PATCH_HCI_HEADER_SIZE	4
+#define PATCH_WMT_HEADER_SIZE	5
+#define PATCH_HEADER_SIZE	(PATCH_HCI_HEADER_SIZE + PATCH_WMT_HEADER_SIZE + 1)
+
+#define UPLOAD_PATCH_UNIT	2048
+#define PATCH_INFO_SIZE		30
+#define PATCH_PHASE1		1
+#define PATCH_PHASE2		2
+#define PATCH_PHASE3		3
+
+/* It is for mt7961 download rom patch*/
+#define FW_ROM_PATCH_HEADER_SIZE	32
+#define FW_ROM_PATCH_GD_SIZE	64
+#define FW_ROM_PATCH_SEC_MAP_SIZE	64
+#define SEC_MAP_NEED_SEND_SIZE	52
+#define PATCH_STATUS	7
+
+#define IO_BUF_SIZE		(HCI_MAX_EVENT_SIZE > 256 ? HCI_MAX_EVENT_SIZE : 256)
+#define EVENT_COMPARE_SIZE	64
+
+#define SECTION_SPEC_NUM	13
+
+/**
+ * Disable RESUME_RESUME
+ */
+#ifndef BT_DISABLE_RESET_RESUME
+#define BT_DISABLE_RESET_RESUME 0
+#endif
+
+#define WIFI_DOWNLOAD	TRUE
+#define BT_DOWNLOAD	FALSE
+
+#define SWAP32(x)\
+	((u32)(\
+	(((u32)(x) & (u32)0x000000ffUL) << 24) |\
+	(((u32)(x) & (u32)0x0000ff00UL) << 8) |\
+	(((u32)(x) & (u32)0x00ff0000UL) >> 8) |\
+	(((u32)(x) & (u32)0xff000000UL) >> 24)))
+
+/* Endian byte swapping codes */
+#ifdef __LITTLE_ENDIAN
+#define cpu2le32(x) ((uint32_t)(x))
+#define le2cpu32(x) ((uint32_t)(x))
+#define cpu2be32(x) SWAP32((x))
+#define be2cpu32(x) SWAP32((x))
+#else
+#define cpu2le32(x) SWAP32((x))
+#define le2cpu32(x) SWAP32((x))
+#define cpu2be32(x) ((uint32_t)(x))
+#define be2cpu32(x) ((uint32_t)(x))
+#endif
+
+#define FW_VERSION	0x80021004
+#define CHIP_ID	0x70010200
+#define FLAVOR	0x70010020
+#define COMP_EVENT_TIMO		5000
+
+#define hci_dev_test_and_clear_flag(hdev, nr)  test_and_clear_bit((nr), (hdev)->dev_flags)
+
+/* h4_recv */
+#define hci_skb_pkt_type(skb) bt_cb((skb))->pkt_type
+#define hci_skb_expect(skb) bt_cb((skb))->expect
+#define hci_skb_opcode(skb) bt_cb((skb))->hci.opcode
+
+/* HCI bus types */
+#define HCI_VIRTUAL	0
+#define HCI_USB		1
+#define HCI_PCCARD	2
+#define HCI_UART	3
+#define HCI_RS232	4
+#define HCI_PCI		5
+#define HCI_SDIO	6
+#define HCI_SPI		7
+#define HCI_I2C		8
+#define HCI_SMD		9
+
+#define HCI_TYPE_SIZE	1
+/* this for 79XX need download patch staus
+ * 0:
+ * patch download is not complete, BT driver need to download patch
+ * 1:
+ * patch is downloading by Wifi,BT driver need to retry until status = PATCH_READY
+ * 2:
+ * patch download is complete, BT driver no need to download patch
+ */
+#define PATCH_ERR -1
+#define PATCH_NEED_DOWNLOAD 0
+#define PATCH_IS_DOWNLOAD_BY_OTHER 1
+#define PATCH_READY 2
+
+/* 0:
+ * using legacy wmt cmd/evt to download fw patch, usb/sdio just support 0 now
+ * 1:
+ * using DMA to download fw patch
+ */
+#define PATCH_DOWNLOAD_USING_WMT 0
+#define PATCH_DOWNLOAD_USING_DMA 1
+
+#define PATCH_DOWNLOAD_PHASE1_2_DELAY_TIME 1
+#define PATCH_DOWNLOAD_PHASE1_2_RETRY 5
+#define PATCH_DOWNLOAD_PHASE3_DELAY_TIME 20
+#define PATCH_DOWNLOAD_PHASE3_RETRY 20
+
+/* * delay and retrey for main_send_cmd */
+#define WMT_DELAY_TIMES 100
+#define DELAY_TIMES 20
+#define RETRY_TIMES 20
+
+/* Expected minimum supported interface */
+#define BT_MCU_MINIMUM_INTERFACE_NUM	4
+
+/* Bus event */
+#define HIF_EVENT_PROBE		0
+#define HIF_EVENT_DISCONNECT	1
+#define HIF_EVENT_SUSPEND	2
+#define HIF_EVENT_RESUME	3
+#define HIF_EVENT_STANDBY	4
+#define HIF_EVENT_SUBSYS_RESET	5
+#define HIF_EVENT_WHOLE_CHIP_RESET	6
+#define HIF_EVENT_FW_DUMP	7
+
+#define CHAR2HEX_SIZE	4
+
+#define EDR_MIN		-32
+#define EDR_MAX		20
+#define EDR_MIN_LV9	13
+#define BLE_MIN		-29
+#define BLE_MAX		20
+#define EDR_MIN_R1	-64
+#define EDR_MAX_R1	40
+#define EDR_MIN_LV9_R1	26
+#define BLE_MIN_R1	-58
+#define BLE_MAX_R1	40
+#define EDR_MIN_R2	-128
+#define EDR_MAX_R2	80
+#define EDR_MIN_LV9_R2	52
+#define BLE_MIN_R2	-116
+#define BLE_MAX_R2	80
+
+#define ERR_PWR		-9999
+
+enum {
+	RES_1 = 0,
+	RES_DOT_5,
+	RES_DOT_25
+};
+
+enum {
+	CHECK_SINGLE_SKU_PWR_MODE	= 0,
+	CHECK_SINGLE_SKU_EDR_MAX,
+	CHECK_SINGLE_SKU_BLE,
+	CHECK_SINGLE_SKU_BLE_2M,
+	CHECK_SINGLE_SKU_BLE_LR_S2,
+	CHECK_SINGLE_SKU_BLE_LR_S8,
+	CHECK_SINGLE_SKU_ALL
+};
+
+struct btmtk_cif_state {
+	unsigned char ops_enter;
+	unsigned char ops_end;
+	unsigned char ops_error;
+};
+
+enum TX_TYPE {
+	BTMTK_TX_CMD_FROM_DRV = 0,	/* send hci cmd and wmt cmd by driver */
+	BTMTK_TX_ACL_FROM_DRV,	/* send acl pkt with load rompatch by driver */
+	BTMTK_TX_PKT_FROM_HOST,	/* send pkt from host, include acl and hci */
+};
+
+enum {
+	BTMTK_DONGLE_STATE_UNKNOWN,
+	BTMTK_DONGLE_STATE_POWER_ON,
+	BTMTK_DONGLE_STATE_POWER_OFF,
+	BTMTK_DONGLE_STATE_ERROR,
+};
+
+enum {
+	HW_ERR_NONE = 0x00,
+	HW_ERR_CODE_CHIP_RESET = 0xF0,
+	HW_ERR_CODE_USB_DISC = 0xF1,
+	HW_ERR_CODE_CORE_DUMP = 0xF2,
+	HW_ERR_CODE_POWER_ON = 0xF3,
+	HW_ERR_CODE_POWER_OFF = 0xF4,
+	HW_ERR_CODE_SET_SLEEP_CMD = 0xF5,
+	HW_ERR_CODE_RESET_STACK_AFTER_WOBLE = 0xF6,
+};
+
+/* Please keep sync with btmtk_set_state function */
+enum {
+	/* BTMTK_STATE_UNKNOWN = 0, */
+	BTMTK_STATE_INIT = 1,
+	BTMTK_STATE_DISCONNECT,
+	BTMTK_STATE_PROBE,
+	BTMTK_STATE_WORKING,
+	BTMTK_STATE_SUSPEND,
+	BTMTK_STATE_RESUME,
+	BTMTK_STATE_FW_DUMP,
+	BTMTK_STATE_STANDBY,
+	BTMTK_STATE_SUBSYS_RESET,
+};
+
+/* Please keep sync with btmtk_fops_set_state function */
+enum {
+	/* BTMTK_FOPS_STATE_UNKNOWN = 0, */
+	BTMTK_FOPS_STATE_INIT = 1,
+	BTMTK_FOPS_STATE_OPENING,	/* during opening */
+	BTMTK_FOPS_STATE_OPENED,	/* open in fops_open */
+	BTMTK_FOPS_STATE_CLOSING,	/* during closing */
+	BTMTK_FOPS_STATE_CLOSED,	/* closed */
+};
+
+enum {
+	BTMTK_EVENT_COMPARE_STATE_UNKNOWN,
+	BTMTK_EVENT_COMPARE_STATE_NOTHING_NEED_COMPARE,
+	BTMTK_EVENT_COMPARE_STATE_NEED_COMPARE,
+	BTMTK_EVENT_COMPARE_STATE_COMPARE_SUCCESS,
+};
+
+struct h4_recv_pkt {
+	u8  type;	/* Packet type */
+	u8  hlen;	/* Header length */
+	u8  loff;	/* Data length offset in header */
+	u8  lsize;	/* Data length field size */
+	u16 maxlen;	/* Max overall packet length */
+	int (*recv)(struct hci_dev *hdev, struct sk_buff *skb);
+};
+
+struct _PATCH_HEADER {
+	u8 ucdatetime[16];
+	u8 ucplatform[4];
+	u16 u2hwver;
+	u16 u2swver;
+	u32 u4magicnum;
+};
+
+struct _GLOBAL_DESCR {
+	u32 u4patchver;
+	u32 u4subsys;
+	u32 u4featureopt;
+	u32 u4sectionnum;
+};
+
+struct _SECTION_MAP {
+	u32 u4sectype;
+	u32 u4secoffset;
+	u32 u4secsize;
+	union {
+		u32 u4secspec[SECTION_SPEC_NUM];
+		struct {
+			u32 u4dladdr;
+			u32 u4dlsize;
+			u32 u4seckeyidx;
+			u32 u4alignlen;
+			u32 u4sectype;
+			u32 u4dlmodecrctype;
+			u32 u4crc;
+			u32 reserved[6];
+		} bin_info_spec;
+	};
+};
+
+#define H4_RECV_ACL \
+	.type = HCI_ACLDATA_PKT, \
+	.hlen = HCI_ACL_HDR_SIZE, \
+	.loff = 2, \
+	.lsize = 2, \
+	.maxlen = HCI_MAX_FRAME_SIZE \
+
+#define H4_RECV_SCO \
+	.type = HCI_SCODATA_PKT, \
+	.hlen = HCI_SCO_HDR_SIZE, \
+	.loff = 2, \
+	.lsize = 1, \
+	.maxlen = HCI_MAX_SCO_SIZE
+
+#define H4_RECV_EVENT \
+	.type = HCI_EVENT_PKT, \
+	.hlen = HCI_EVENT_HDR_SIZE, \
+	.loff = 1, \
+	.lsize = 1, \
+	.maxlen = HCI_MAX_EVENT_SIZE
+
+struct btmtk_dev {
+	struct hci_dev	*hdev;
+	unsigned long	hdev_flags;
+	unsigned long	flags;
+	void *intf_dev;
+	void *cif_dev;
+
+	struct work_struct	work;
+	struct work_struct	waker;
+	struct work_struct	reset_waker;
+
+	int recv_evt_len;
+	int tx_in_flight;
+	/* for tx skb buffer */
+	spinlock_t txlock;
+	/* for rx skb buffer */
+	spinlock_t rxlock;
+	struct sk_buff	*evt_skb;
+	struct sk_buff	*sco_skb;
+
+	/* For ble iso packet size */
+	int iso_threshold;
+
+	unsigned int	sco_num;
+	int	isoc_altsetting;
+
+	int	suspend_count;
+
+	/* For tx queue */
+	unsigned long	tx_state;
+
+	/* For rx queue */
+	struct workqueue_struct	*workqueue;
+	struct sk_buff_head	rx_q;
+	struct work_struct	rx_work;
+	struct sk_buff		*rx_skb;
+
+	wait_queue_head_t	p_wait_event_q;
+
+	unsigned int	subsys_reset;
+	unsigned int	chip_reset;
+	unsigned char	*rom_patch_bin_file_name;
+	unsigned int	chip_id;
+	unsigned int	flavor;
+	unsigned int	fw_version;
+	unsigned char	dongle_index;
+	unsigned char	power_state;
+	unsigned char	fops_state;
+	unsigned char	interface_state;
+	struct btmtk_cif_state *cif_state;
+
+	/* io buffer for usb control transfer */
+	unsigned char	*io_buf;
+};
+
+typedef int (*cif_open_ptr)(struct hci_dev *hdev);
+typedef int (*cif_close_ptr)(struct hci_dev *hdev);
+typedef int (*cif_reg_read_ptr)(struct btmtk_dev *bdev, u32 reg, u32 *val);
+typedef int (*cif_reg_write_ptr)(struct btmtk_dev *bdev, u32 reg, u32 val);
+typedef int (*cif_send_cmd_ptr)(struct btmtk_dev *bdev, struct sk_buff *skb,
+		int delay, int retry, int pkt_type);
+typedef int (*cif_send_and_recv_ptr)(struct btmtk_dev *bdev,
+		struct sk_buff *skb,
+		const u8 *event, const int event_len,
+		int delay, int retry, int pkt_type);
+typedef int (*cif_event_filter_ptr)(struct btmtk_dev *bdev, struct sk_buff *skb);
+typedef int (*cif_subsys_reset_ptr)(struct btmtk_dev *bdev);
+typedef int (*cif_whole_reset_ptr)(struct btmtk_dev *bdev);
+typedef void (*cif_chip_reset_notify_ptr)(struct btmtk_dev *bdev);
+typedef void (*cif_mutex_lock_ptr)(struct btmtk_dev *bdev);
+typedef void (*cif_mutex_unlock_ptr)(struct btmtk_dev *bdev);
+typedef void (*cif_open_done_ptr)(struct btmtk_dev *bdev);
+typedef int (*cif_dl_dma_ptr)(struct btmtk_dev *bdev, u8 *image,
+		u8 *fwbuf, int section_dl_size, int section_offset);
+
+struct hif_hook_ptr {
+	cif_open_ptr			open;
+	cif_close_ptr			close;
+	cif_reg_read_ptr		reg_read;
+	cif_reg_write_ptr		reg_write;
+	cif_send_cmd_ptr		send_cmd;
+	cif_send_and_recv_ptr		send_and_recv;
+	cif_event_filter_ptr		event_filter;
+	cif_subsys_reset_ptr		subsys_reset;
+	cif_whole_reset_ptr		whole_reset;
+	cif_chip_reset_notify_ptr	chip_reset_notify;
+	cif_mutex_lock_ptr		cif_mutex_lock;
+	cif_mutex_unlock_ptr		cif_mutex_unlock;
+	cif_open_done_ptr		open_done;
+	cif_dl_dma_ptr			dl_dma;
+};
+
+struct btmtk_main_info {
+	struct hif_hook_ptr hif_hook;
+};
+
+static inline int is_mt7922(u32 chip_id)
+{
+	chip_id &= 0xFFFF;
+	if (chip_id == 0x7922)
+		return 1;
+	return 0;
+}
+
+static inline int is_mt7961(u32 chip_id)
+{
+	chip_id &= 0xFFFF;
+	if (chip_id == 0x7961)
+		return 1;
+	return 0;
+}
+
+int btmtk_get_chip_state(struct btmtk_dev *bdev);
+void btmtk_set_chip_state(struct btmtk_dev *bdev, int new_state);
+int btmtk_allocate_hci_device(struct btmtk_dev *bdev, int hci_bus_type);
+void btmtk_free_hci_device(struct btmtk_dev *bdev, int hci_bus_type);
+int btmtk_register_hci_device(struct btmtk_dev *bdev);
+int btmtk_deregister_hci_device(struct btmtk_dev *bdev);
+int btmtk_recv(struct hci_dev *hdev, const u8 *data, size_t count);
+int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
+int btmtk_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
+int btmtk_send_init_cmds(struct btmtk_dev *hdev);
+int btmtk_send_deinit_cmds(struct btmtk_dev *hdev);
+int btmtk_main_send_cmd(struct btmtk_dev *bdev, const u8 *cmd,
+			const int cmd_len, const u8 *event, const int event_len,
+			int delay, int retry, int pkt_type);
+int btmtk_send_wmt_power_on_cmd(struct btmtk_dev *hdev);
+int btmtk_send_wmt_power_off_cmd(struct btmtk_dev *hdev);
+int btmtk_uart_send_wakeup_cmd(struct hci_dev *hdev);
+int btmtk_uart_send_set_uart_cmd(struct hci_dev *hdev);
+int btmtk_load_rom_patch(struct btmtk_dev *bdev);
+struct btmtk_dev *btmtk_get_dev(void);
+void btmtk_release_dev(struct btmtk_dev *bdev);
+struct btmtk_dev *btmtk_allocate_dev_memory(struct device *dev);
+void btmtk_free_dev_memory(struct device *dev, struct btmtk_dev *bdev);
+void btmtk_reset_waker(struct work_struct *work);
+struct btmtk_main_info *btmtk_get_main_info(void);
+/** file_operations: stpbtfwlog */
+int btmtk_fops_openfwlog(struct inode *inode, struct file *file);
+int btmtk_fops_closefwlog(struct inode *inode, struct file *file);
+ssize_t btmtk_fops_readfwlog(struct file *filp, char __user *buf, size_t count, loff_t *f_pos);
+ssize_t btmtk_fops_writefwlog(struct file *filp, const char __user *buf, size_t count,
+			      loff_t *f_pos);
+unsigned int btmtk_fops_pollfwlog(struct file *filp, poll_table *wait);
+long btmtk_fops_unlocked_ioctlfwlog(struct file *filp, unsigned int cmd, unsigned long arg);
+
+/* Auto enable picus */
+int btmtk_picus_enable(struct btmtk_dev *bdev);
+int btmtk_picus_disable(struct btmtk_dev *bdev);
+
+void btmtk_reg_hif_hook(struct hif_hook_ptr *hook);
+int btmtk_main_cif_initialize(struct btmtk_dev *bdev, int hci_bus);
+void btmtk_main_cif_uninitialize(struct btmtk_dev *bdev, int hci_bus);
+int btmtk_main_cif_disconnect_notify(struct btmtk_dev *bdev, int hci_bus);
+int btmtk_send_assert_cmd(struct btmtk_dev *bdev);
+int btmtk_efuse_read(struct btmtk_dev *bdev, u16 addr, u8 *value);
+
+void btmtk_set_country_code_from_wifi(char *code);
+
+#endif /* __BTMTK_MAIN_H__ */
diff --git a/drivers/bluetooth/btmtk_usb.h b/drivers/bluetooth/btmtk_usb.h
new file mode 100644
index 000000000000..92d11e808e78
--- /dev/null
+++ b/drivers/bluetooth/btmtk_usb.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2020 MediaTek Inc.
+
+/*
+ * Bluetooth support for MediaTek USB devices
+ *
+ */
+
+#ifndef _BTMTK_USB_H_
+#define _BTMTK_USB_H_
+#include <linux/usb.h>
+#include "btmtk_main.h"
+
+#define HCI_MAX_COMMAND_SIZE	255
+#define URB_MAX_BUFFER_SIZE	(4 * 1024)
+
+#define BT0_MCU_INTERFACE_NUM 0
+#define BT1_MCU_INTERFACE_NUM 3
+#define BT_MCU_INTERFACE_NUM_MAX 4
+#define BT_MCU_NUM_MAX 2
+
+/**
+ * Send cmd dispatch evt
+ */
+#define HCI_EV_VENDOR			0xff
+#define HCI_USB_IO_BUF_SIZE		256
+
+extern u8 wmt_over_hci_header[];
+
+struct btmtk_usb_dev {
+	struct usb_endpoint_descriptor	*intr_ep;
+	struct usb_endpoint_descriptor	*bulk_tx_ep;
+	struct usb_endpoint_descriptor	*bulk_rx_ep;
+	struct usb_endpoint_descriptor	*isoc_tx_ep;
+	struct usb_endpoint_descriptor	*isoc_rx_ep;
+
+	struct usb_device	*udev;
+	struct usb_interface	*intf;
+	struct usb_interface	*isoc;
+	struct usb_interface	*iso_channel;
+
+	struct usb_anchor	tx_anchor;
+	struct usb_anchor	intr_anchor;
+	struct usb_anchor	bulk_anchor;
+	struct usb_anchor	isoc_anchor;
+	struct usb_anchor	ctrl_anchor;
+
+	__u8	cmdreq_type;
+	__u8	cmdreq;
+
+	int new_isoc_altsetting;
+	int new_isoc_altsetting_interface;
+
+	unsigned char	*o_usb_buf;
+
+	unsigned char	*urb_intr_buf;
+	unsigned char	*urb_bulk_buf;
+	unsigned char	*urb_ble_isoc_buf;
+};
+#endif
diff --git a/drivers/bluetooth/btmtkusb.c b/drivers/bluetooth/btmtkusb.c
new file mode 100644
index 000000000000..36e00ddebe62
--- /dev/null
+++ b/drivers/bluetooth/btmtkusb.c
@@ -0,0 +1,2050 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 MediaTek Inc.
+
+/*
+ * Bluetooth support for MediaTek USB devices
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/firmware.h>
+#include <asm/unaligned.h>
+#include <linux/usb/quirks.h>
+#include <net/bluetooth/bluetooth.h>
+#include <net/bluetooth/hci_core.h>
+#include "btmtk_usb.h"
+#include "btmtk_main.h"
+
+static struct usb_driver btusb_driver;
+static int intf_to_idx[BT_MCU_INTERFACE_NUM_MAX] = {0, -1, -1, 1};
+static struct btmtk_usb_dev g_usb_dev[BT_MCU_MINIMUM_INTERFACE_NUM][BT_MCU_NUM_MAX];
+
+static const struct usb_device_id btusb_table[] = {
+	/* Mediatek MT7961 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7961, 0xe0, 0x01, 0x01) },
+	/* Mediatek MT7922 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7922, 0xe0, 0x01, 0x01) },
+
+	{ }	/* Terminating entry */
+};
+
+static char event_need_compare[EVENT_COMPARE_SIZE] = {0};
+static char event_need_compare_len;
+static char event_compare_status;
+
+static DEFINE_MUTEX(btmtk_usb_ops_mutex);
+#define USB_OPS_MUTEX_LOCK()	mutex_lock(&btmtk_usb_ops_mutex)
+#define USB_OPS_MUTEX_UNLOCK()	mutex_unlock(&btmtk_usb_ops_mutex)
+
+MODULE_DEVICE_TABLE(usb, btusb_table);
+
+#define BTUSB_MAX_ISOC_FRAMES	24
+
+#define BTUSB_INTR_RUNNING	0
+#define BTUSB_BULK_RUNNING	1
+#define BTUSB_ISOC_RUNNING	2
+#define BTUSB_SUSPENDING	3
+#define BTUSB_DID_ISO_RESUME	4
+#define BTUSB_BLE_ISOC_RUNNING	5
+
+#define DEVICE_VENDOR_REQUEST_IN	0xc0
+#define DEVICE_CLASS_REQUEST_OUT	0x20
+#define USB_CTRL_IO_TIMO		100
+
+#define BTMTK_CIF_GET_DEV_PRIV(bdev, intf, ifnum_base) \
+	do { \
+		bdev = usb_get_intfdata(intf); \
+		ifnum_base = intf->cur_altsetting->desc.bInterfaceNumber; \
+	} while (0)
+
+static int btmtk_cif_allocate_memory(struct btmtk_usb_dev *cif_dev);
+static void btmtk_cif_free_memory(struct btmtk_usb_dev *cif_dev);
+
+static int btmtk_usb_send_and_recv(struct btmtk_dev *bdev,
+				   struct sk_buff *skb,
+				   const u8 *event, const int event_len,
+				   int delay, int retry, int pkt_type);
+static int btmtk_usb_event_filter(struct btmtk_dev *bdev, struct sk_buff *skb);
+static int btmtk_usb_send_cmd(struct btmtk_dev *bdev, struct sk_buff *skb,
+			      int delay, int retry, int pkt_type);
+static int btmtk_usb_read_register(struct btmtk_dev *bdev, u32 reg, u32 *val);
+static int btmtk_usb_write_register(struct btmtk_dev *bdev, u32 reg, u32 val);
+
+static void btmtk_usb_cif_mutex_lock(struct btmtk_dev *bdev)
+{
+	USB_OPS_MUTEX_LOCK();
+}
+
+static void btmtk_usb_cif_mutex_unlock(struct btmtk_dev *bdev)
+{
+	USB_OPS_MUTEX_UNLOCK();
+}
+
+static inline void btusb_free_frags(struct btmtk_dev *bdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&bdev->rxlock, flags);
+
+	kfree_skb(bdev->evt_skb);
+	bdev->evt_skb = NULL;
+
+	kfree_skb(bdev->sco_skb);
+	bdev->sco_skb = NULL;
+
+	spin_unlock_irqrestore(&bdev->rxlock, flags);
+}
+
+static int btusb_recv_isoc(struct btmtk_dev *bdev, void *buffer, int count)
+{
+	struct sk_buff *skb;
+	int err = 0;
+
+	spin_lock(&bdev->rxlock);
+	skb = bdev->sco_skb;
+
+	while (count) {
+		int len;
+
+		if (!skb) {
+			skb = bt_skb_alloc(HCI_MAX_SCO_SIZE, GFP_ATOMIC);
+			if (!skb) {
+				err = -ENOMEM;
+				break;
+			}
+
+			hci_skb_pkt_type(skb) = HCI_SCODATA_PKT;
+			hci_skb_expect(skb) = HCI_SCO_HDR_SIZE;
+		}
+
+		len = min_t(uint, hci_skb_expect(skb), count);
+		memcpy(skb_put(skb, len), buffer, len);
+
+		count -= len;
+		buffer += len;
+		hci_skb_expect(skb) -= len;
+
+		if (skb->len == HCI_SCO_HDR_SIZE) {
+			hci_skb_expect(skb) = hci_sco_hdr(skb)->dlen;
+
+			if (skb_tailroom(skb) < hci_skb_expect(skb)) {
+				kfree_skb(skb);
+				skb = NULL;
+
+				err = -EILSEQ;
+				break;
+			}
+		}
+
+		if (!hci_skb_expect(skb)) {
+			hci_recv_frame(bdev->hdev, skb);
+			skb = NULL;
+		}
+	}
+
+	bdev->sco_skb = skb;
+	spin_unlock(&bdev->rxlock);
+
+	return err;
+}
+
+static void btusb_intr_complete(struct urb *urb)
+{
+	struct hci_dev *hdev = NULL;
+	struct btmtk_dev *bdev = NULL;
+	struct btmtk_usb_dev *cif_dev = NULL;
+	int err;
+	u8 *buf;
+
+	if (!urb) {
+		BTMTK_ERR("%s: ERROR, urb is NULL!", __func__);
+		return;
+	}
+
+	hdev = urb->context;
+	if (!hdev) {
+		BTMTK_ERR("%s: ERROR, hdev is NULL!", __func__);
+		return;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s: ERROR, bdev is NULL!", __func__);
+		return;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	if (!cif_dev) {
+		BTMTK_ERR("%s: ERROR, cif_dev is NULL!", __func__);
+		return;
+	}
+
+	BTMTK_DBG("%s urb %p status %d count %d", hdev->name, urb, urb->status,
+		  urb->actual_length);
+
+	if (urb->status != 0) {
+		BTMTK_WARN("%s: urb %p urb->status %d count %d", __func__,
+			   urb, urb->status, urb->actual_length);
+	}
+
+	if (urb->status == 0) {
+		hdev->stat.byte_rx += urb->actual_length;
+
+		if (!cif_dev->urb_intr_buf) {
+			BT_ERR("%s: bdev->urb_intr_buf is NULL!", __func__);
+			return;
+		}
+
+		buf = urb->transfer_buffer;
+		if (urb->actual_length >= URB_MAX_BUFFER_SIZE ||
+		    (urb->actual_length != (buf[1] + 2) && urb->actual_length > 1)) {
+			BTMTK_ERR("%s: urb->actual_length is invalid, buf[1] = %d!",
+				  __func__, buf[1]);
+			goto intr_resub;
+		}
+		memset(cif_dev->urb_intr_buf, 0, URB_MAX_BUFFER_SIZE);
+		cif_dev->urb_intr_buf[0] = HCI_EVENT_PKT;
+		memcpy(cif_dev->urb_intr_buf + 1, urb->transfer_buffer, urb->actual_length);
+
+		err = btmtk_recv(hdev, cif_dev->urb_intr_buf, urb->actual_length + 1);
+		if (err) {
+			BTMTK_ERR("%s corrupted event packet, urb_intr_buf = %p, transfer_buf = %p",
+				  hdev->name, cif_dev->urb_intr_buf, urb->transfer_buffer);
+			hdev->stat.err_rx++;
+		}
+	} else if (urb->status == -ENOENT) {
+		BTMTK_INFO("%s: urb->status is ENOENT!", __func__);
+		return;
+	}
+
+	if (!test_bit(BTUSB_INTR_RUNNING, &bdev->flags)) {
+		BTMTK_INFO("%s: test_bit is not running!", __func__);
+		return;
+	}
+
+intr_resub:
+	usb_mark_last_busy(cif_dev->udev);
+	usb_anchor_urb(urb, &cif_dev->intr_anchor);
+
+	err = usb_submit_urb(urb, GFP_ATOMIC);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p failed to resubmit (%d)",
+				  hdev->name, urb, -err);
+		usb_unanchor_urb(urb);
+	}
+}
+
+static void btusb_mtk_wmt_recv(struct urb *urb)
+{
+	struct hci_dev *hdev = urb->context;
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = NULL;
+	struct sk_buff *skb;
+	int err;
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	if (urb->status == 0 && urb->actual_length > 0) {
+		hdev->stat.byte_rx += urb->actual_length;
+		skb = bt_skb_alloc(HCI_MAX_EVENT_SIZE, GFP_ATOMIC);
+		if (!skb) {
+			BTMTK_ERR("%s skb is null!", __func__);
+			hdev->stat.err_rx++;
+			goto exit;
+		}
+
+		if (urb->actual_length >= HCI_MAX_EVENT_SIZE) {
+			kfree_skb(skb);
+			hdev->stat.err_rx++;
+			goto exit;
+		}
+		hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
+		memcpy(skb_put(skb, urb->actual_length), urb->transfer_buffer, urb->actual_length);
+
+		hci_recv_frame(hdev, skb);
+		return;
+	} else if (urb->status == -ENOENT) {
+		goto exit;
+	}
+
+	usb_mark_last_busy(cif_dev->udev);
+
+	usleep_range(90, 100);
+
+	usb_anchor_urb(urb, &cif_dev->ctrl_anchor);
+	err = usb_submit_urb(urb, GFP_ATOMIC);
+	if (err < 0) {
+		kfree(urb->setup_packet);
+		if (err != -EPERM && err != -ENODEV)
+			usb_unanchor_urb(urb);
+	}
+
+	return;
+
+exit:
+	kfree(urb->setup_packet);
+}
+
+static int btusb_submit_wmt_urb(struct hci_dev *hdev, gfp_t mem_flags)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = NULL;
+	struct usb_ctrlrequest *dr;
+	struct urb *urb;
+	unsigned char *buf;
+	unsigned int pipe;
+	int err, size;
+	unsigned int ifnum_base;
+
+	urb = usb_alloc_urb(0, mem_flags);
+	if (!urb)
+		return -ENOMEM;
+
+	size = le16_to_cpu(HCI_MAX_EVENT_SIZE);
+
+	dr = kmalloc(sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		usb_free_urb(urb);
+		return -ENOMEM;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	ifnum_base = cif_dev->intf->cur_altsetting->desc.bInterfaceNumber;
+
+	dr->bRequestType = 0xC0;
+	dr->bRequest     = 0x01;
+	dr->wIndex       = 0;
+	dr->wValue       = 0x30;
+	dr->wLength      = __cpu_to_le16(size);
+
+	pipe = usb_rcvctrlpipe(cif_dev->udev, 0);
+
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf) {
+		kfree(dr);
+		usb_free_urb(urb);
+		return -ENOMEM;
+	}
+
+	usb_fill_control_urb(urb, cif_dev->udev, pipe, (void *)dr,
+			     buf, size, btusb_mtk_wmt_recv, hdev);
+
+	urb->transfer_flags |= URB_FREE_BUFFER;
+
+	usb_anchor_urb(urb, &cif_dev->ctrl_anchor);
+
+	err = usb_submit_urb(urb, mem_flags);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p submission failed (%d)",
+				  hdev->name, urb, -err);
+		kfree(dr);
+		usb_unanchor_urb(urb);
+	}
+
+	usb_free_urb(urb);
+
+	return err;
+}
+
+static int btusb_submit_intr_urb(struct hci_dev *hdev, gfp_t mem_flags)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = NULL;
+	struct urb *urb;
+	unsigned char *buf;
+	unsigned int pipe;
+	int err, size;
+
+	BTMTK_DBG("%s", hdev->name);
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	if (!cif_dev->intr_ep)
+		return -ENODEV;
+
+	urb = usb_alloc_urb(0, mem_flags);
+	if (!urb)
+		return -ENOMEM;
+
+	size = le16_to_cpu(HCI_MAX_EVENT_SIZE);
+	BTMTK_INFO("%s: maximum packet size:%d", __func__, size);
+
+	buf = kmalloc(size, mem_flags);
+	if (!buf) {
+		usb_free_urb(urb);
+		return -ENOMEM;
+	}
+
+	pipe = usb_rcvintpipe(cif_dev->udev, cif_dev->intr_ep->bEndpointAddress);
+
+	usb_fill_int_urb(urb, cif_dev->udev, pipe, buf, size,
+			 btusb_intr_complete, hdev, cif_dev->intr_ep->bInterval);
+
+	urb->transfer_flags |= URB_FREE_BUFFER;
+
+	usb_anchor_urb(urb, &cif_dev->intr_anchor);
+
+	err = usb_submit_urb(urb, mem_flags);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p submission failed (%d)",
+				  hdev->name, urb, -err);
+		usb_unanchor_urb(urb);
+	}
+
+	usb_free_urb(urb);
+
+	return err;
+}
+
+static void btusb_bulk_complete(struct urb *urb)
+{
+	struct hci_dev *hdev = NULL;
+	struct btmtk_dev *bdev = NULL;
+	struct btmtk_usb_dev *cif_dev = NULL;
+	int err;
+	u8 *buf;
+	u16 len = 0;
+
+	if (!urb) {
+		BTMTK_ERR("%s: ERROR, urb is NULL!", __func__);
+		return;
+	}
+
+	hdev = urb->context;
+	if (!hdev) {
+		BTMTK_ERR("%s: ERROR, hdev is NULL!", __func__);
+		return;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s: ERROR, bdev is NULL!", __func__);
+		return;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	if (!cif_dev) {
+		BTMTK_ERR("%s: ERROR, cif_dev is NULL!", __func__);
+		return;
+	}
+
+	if (urb->status != 0) {
+		BTMTK_INFO("%s: urb %p urb->status %d count %d", __func__, urb,
+			   urb->status, urb->actual_length);
+	}
+
+	if (urb->status == 0) {
+		hdev->stat.byte_rx += urb->actual_length;
+		if (!cif_dev->urb_bulk_buf) {
+			BT_ERR("%s: bdev->urb_bulk_buf is NULL!", __func__);
+			return;
+		}
+
+		buf = urb->transfer_buffer;
+		len = buf[2] + ((buf[3] << 8) & 0xff00);
+		if (urb->actual_length >= URB_MAX_BUFFER_SIZE ||
+		    urb->actual_length != len + 4) {
+			BTMTK_ERR("%s urb->actual_length is invalid, len = %d!", __func__, len);
+			goto bulk_resub;
+		}
+		memset(cif_dev->urb_bulk_buf, 0, URB_MAX_BUFFER_SIZE);
+		cif_dev->urb_bulk_buf[0] = HCI_ACLDATA_PKT;
+		memcpy(cif_dev->urb_bulk_buf + 1, urb->transfer_buffer, urb->actual_length);
+
+		err = btmtk_recv(hdev, cif_dev->urb_bulk_buf, urb->actual_length + 1);
+		if (err) {
+			BTMTK_ERR("%s corrupted ACL packet, urb_bulk_buf = %p, transfer_buf = %p",
+				  hdev->name, cif_dev->urb_bulk_buf, urb->transfer_buffer);
+			hdev->stat.err_rx++;
+		}
+	} else if (urb->status == -ENOENT) {
+		/* Avoid suspend failed when usb_kill_urb */
+		BTMTK_INFO("%s urb %p status %d count %d", hdev->name,
+			   urb, urb->status, urb->actual_length);
+		return;
+	}
+
+	if (!test_bit(BTUSB_BULK_RUNNING, &bdev->flags)) {
+		BTMTK_INFO("%s test flag failed", __func__);
+		return;
+	}
+
+bulk_resub:
+	usb_anchor_urb(urb, &cif_dev->bulk_anchor);
+	usb_mark_last_busy(cif_dev->udev);
+
+	err = usb_submit_urb(urb, GFP_ATOMIC);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p failed to resubmit (%d)",
+				  hdev->name, urb, -err);
+		usb_unanchor_urb(urb);
+	}
+}
+
+static int btusb_submit_bulk_urb(struct hci_dev *hdev, gfp_t mem_flags)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = NULL;
+	struct urb *urb;
+	unsigned char *buf;
+	unsigned int pipe;
+	int err, size = HCI_MAX_FRAME_SIZE;
+
+	BTMTK_DBG("%s", hdev->name);
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	if (!cif_dev->bulk_rx_ep)
+		return -ENODEV;
+
+	urb = usb_alloc_urb(0, mem_flags);
+	if (!urb)
+		return -ENOMEM;
+
+	buf = kmalloc(size, mem_flags);
+	if (!buf) {
+		usb_free_urb(urb);
+		return -ENOMEM;
+	}
+
+	pipe = usb_rcvbulkpipe(cif_dev->udev, cif_dev->bulk_rx_ep->bEndpointAddress);
+
+	usb_fill_bulk_urb(urb, cif_dev->udev, pipe, buf, size,
+			  btusb_bulk_complete, hdev);
+
+	urb->transfer_flags |= URB_FREE_BUFFER;
+
+	usb_mark_last_busy(cif_dev->udev);
+	usb_anchor_urb(urb, &cif_dev->bulk_anchor);
+
+	err = usb_submit_urb(urb, mem_flags);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p submission failed (%d)",
+				  hdev->name, urb, -err);
+		usb_unanchor_urb(urb);
+	}
+
+	usb_free_urb(urb);
+
+	return err;
+}
+
+static void btusb_isoc_complete(struct urb *urb)
+{
+	struct hci_dev *hdev = NULL;
+	struct btmtk_dev *bdev = NULL;
+	struct btmtk_usb_dev *cif_dev = NULL;
+	int i, err;
+
+	if (!urb) {
+		BTMTK_ERR("%s: ERROR, urb is NULL!", __func__);
+		return;
+	}
+
+	hdev = urb->context;
+	if (!hdev) {
+		BTMTK_ERR("%s: ERROR, hdev is NULL!", __func__);
+		return;
+	}
+
+	bdev = hci_get_drvdata(hdev);
+	if (!bdev) {
+		BTMTK_ERR("%s: ERROR, bdev is NULL!", __func__);
+		return;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	if (!cif_dev) {
+		BTMTK_ERR("%s: ERROR, cif_dev is NULL!", __func__);
+		return;
+	}
+
+	BTMTK_DBG("%s urb %p status %d count %d", hdev->name,
+		  urb, urb->status, urb->actual_length);
+
+	if (!test_bit(HCI_RUNNING, &hdev->flags))
+		return;
+
+	if (urb->status == 0) {
+		for (i = 0; i < urb->number_of_packets; i++) {
+			unsigned int offset = urb->iso_frame_desc[i].offset;
+			unsigned int length = urb->iso_frame_desc[i].actual_length;
+
+			if (urb->iso_frame_desc[i].status)
+				continue;
+
+			hdev->stat.byte_rx += length;
+
+			if (btusb_recv_isoc(bdev, urb->transfer_buffer + offset,
+					    length) < 0) {
+				BTMTK_ERR("%s corrupted SCO packet", hdev->name);
+				hdev->stat.err_rx++;
+			}
+		}
+	} else if (urb->status == -ENOENT) {
+		BTMTK_INFO("%s: urb->status is ENOENT!", __func__);
+		return;
+	}
+
+	if (!test_bit(BTUSB_ISOC_RUNNING, &bdev->flags)) {
+		BTMTK_INFO("%s: bdev->flags is RUNNING!", __func__);
+		return;
+	}
+
+	usb_anchor_urb(urb, &cif_dev->isoc_anchor);
+
+	err = usb_submit_urb(urb, GFP_ATOMIC);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p failed to resubmit (%d)",
+				  hdev->name, urb, -err);
+		usb_unanchor_urb(urb);
+	}
+}
+
+static inline void __fill_isoc_descriptor(struct urb *urb, int len, int mtu)
+{
+	int i, offset = 0;
+
+	BTMTK_DBG("len %d mtu %d", len, mtu);
+
+	for (i = 0; i < BTUSB_MAX_ISOC_FRAMES && len >= mtu;
+					i++, offset += mtu, len -= mtu) {
+		urb->iso_frame_desc[i].offset = offset;
+		urb->iso_frame_desc[i].length = mtu;
+	}
+
+	if (len && i < BTUSB_MAX_ISOC_FRAMES) {
+		urb->iso_frame_desc[i].offset = offset;
+		urb->iso_frame_desc[i].length = len;
+		i++;
+	}
+
+	urb->number_of_packets = i;
+}
+
+static int btusb_submit_isoc_urb(struct hci_dev *hdev, gfp_t mem_flags)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = NULL;
+	struct urb *urb;
+	unsigned char *buf;
+	unsigned int pipe;
+	int err, size;
+
+	BTMTK_DBG("%s", hdev->name);
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	if (!cif_dev->isoc_rx_ep)
+		return -ENODEV;
+
+	urb = usb_alloc_urb(BTUSB_MAX_ISOC_FRAMES, mem_flags);
+	if (!urb)
+		return -ENOMEM;
+
+	size = le16_to_cpu(cif_dev->isoc_rx_ep->wMaxPacketSize) *
+						BTUSB_MAX_ISOC_FRAMES;
+
+	buf = kmalloc(size, mem_flags);
+	if (!buf) {
+		usb_free_urb(urb);
+		return -ENOMEM;
+	}
+
+	pipe = usb_rcvisocpipe(cif_dev->udev, cif_dev->isoc_rx_ep->bEndpointAddress);
+
+	usb_fill_int_urb(urb, cif_dev->udev, pipe, buf, size, btusb_isoc_complete,
+			 hdev, cif_dev->isoc_rx_ep->bInterval);
+
+	urb->transfer_flags = URB_FREE_BUFFER | URB_ISO_ASAP;
+
+	__fill_isoc_descriptor(urb, size,
+			       le16_to_cpu(cif_dev->isoc_rx_ep->wMaxPacketSize));
+
+	usb_anchor_urb(urb, &cif_dev->isoc_anchor);
+
+	err = usb_submit_urb(urb, mem_flags);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p submission failed (%d)",
+				  hdev->name, urb, -err);
+		usb_unanchor_urb(urb);
+	}
+
+	usb_free_urb(urb);
+
+	return err;
+}
+
+static void btusb_tx_complete(struct urb *urb)
+{
+	struct sk_buff *skb = urb->context;
+	struct hci_dev *hdev = (struct hci_dev *)skb->dev;
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	unsigned long flags;
+
+	BTMTK_DBG("%s urb %p status %d count %d", hdev->name, urb,
+		  urb->status, urb->actual_length);
+
+	if (!test_bit(HCI_RUNNING, &hdev->flags))
+		goto done;
+
+	if (!urb->status)
+		hdev->stat.byte_tx += urb->transfer_buffer_length;
+	else
+		hdev->stat.err_tx++;
+
+done:
+	spin_lock_irqsave(&bdev->txlock, flags);
+	bdev->tx_in_flight--;
+	spin_unlock_irqrestore(&bdev->txlock, flags);
+
+	kfree(urb->setup_packet);
+
+	kfree_skb(skb);
+}
+
+static void btusb_isoc_tx_complete(struct urb *urb)
+{
+	struct sk_buff *skb = urb->context;
+	struct hci_dev *hdev = (struct hci_dev *)skb->dev;
+
+	BTMTK_DBG("%s urb %p status %d count %d", hdev->name,
+		  urb, urb->status, urb->actual_length);
+
+	if (!test_bit(HCI_RUNNING, &hdev->flags))
+		goto done;
+
+	if (!urb->status)
+		hdev->stat.byte_tx += urb->transfer_buffer_length;
+	else
+		hdev->stat.err_tx++;
+
+done:
+	kfree(urb->setup_packet);
+
+	kfree_skb(skb);
+}
+
+static int btmtk_usb_open(struct hci_dev *hdev)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int err;
+	unsigned int ifnum_base;
+
+	BTMTK_DBG("%s", hdev->name);
+
+	err = usb_autopm_get_interface(cif_dev->intf);
+	if (err < 0)
+		return err;
+
+	cif_dev->intf->needs_remote_wakeup = 1;
+
+	if (test_and_set_bit(BTUSB_INTR_RUNNING, &bdev->flags))
+		goto done;
+
+	ifnum_base = cif_dev->intf->cur_altsetting->desc.bInterfaceNumber;
+	err = btusb_submit_intr_urb(hdev, GFP_KERNEL);
+	if (err < 0)
+		goto failed;
+
+	err = btusb_submit_bulk_urb(hdev, GFP_KERNEL);
+	if (err < 0) {
+		usb_kill_anchored_urbs(&cif_dev->intr_anchor);
+		goto failed;
+	}
+
+	set_bit(BTUSB_BULK_RUNNING, &bdev->flags);
+
+done:
+	usb_autopm_put_interface(cif_dev->intf);
+	return 0;
+
+failed:
+	clear_bit(BTUSB_INTR_RUNNING, &bdev->flags);
+	usb_autopm_put_interface(cif_dev->intf);
+	return err;
+}
+
+static void btusb_stop_traffic(struct btmtk_usb_dev *cif_dev)
+{
+	usb_kill_anchored_urbs(&cif_dev->intr_anchor);
+	usb_kill_anchored_urbs(&cif_dev->bulk_anchor);
+	usb_kill_anchored_urbs(&cif_dev->isoc_anchor);
+	usb_kill_anchored_urbs(&cif_dev->ctrl_anchor);
+}
+
+static int btmtk_usb_close(struct hci_dev *hdev)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int err;
+
+	BTMTK_INFO("%s enter!", __func__);
+
+	cancel_work_sync(&bdev->work);
+	cancel_work_sync(&bdev->waker);
+
+	clear_bit(BTUSB_BLE_ISOC_RUNNING, &bdev->flags);
+	clear_bit(BTUSB_ISOC_RUNNING, &bdev->flags);
+	clear_bit(BTUSB_BULK_RUNNING, &bdev->flags);
+	clear_bit(BTUSB_INTR_RUNNING, &bdev->flags);
+
+	btusb_stop_traffic(cif_dev);
+	btusb_free_frags(bdev);
+
+	err = usb_autopm_get_interface(cif_dev->intf);
+	if (err < 0)
+		goto failed;
+
+	cif_dev->intf->needs_remote_wakeup = 0;
+	usb_autopm_put_interface(cif_dev->intf);
+
+failed:
+	return 0;
+}
+
+static struct urb *alloc_ctrl_urb(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	struct usb_ctrlrequest *dr;
+	struct urb *urb;
+	unsigned int pipe;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb)
+		return ERR_PTR(-ENOMEM);
+
+	dr = kmalloc(sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		usb_free_urb(urb);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	dr->bRequestType = cif_dev->cmdreq_type;
+	dr->bRequest     = cif_dev->cmdreq;
+	dr->wIndex       = 0;
+	dr->wValue       = 0;
+	dr->wLength      = __cpu_to_le16(skb->len);
+
+	pipe = usb_sndctrlpipe(cif_dev->udev, 0x00);
+
+	usb_fill_control_urb(urb, cif_dev->udev, pipe, (void *)dr,
+			     skb->data, skb->len, btusb_tx_complete, skb);
+
+	skb->dev = (void *)hdev;
+
+	return urb;
+}
+
+static struct urb *alloc_bulk_urb(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	struct urb *urb;
+	unsigned int pipe;
+
+	if (!cif_dev->bulk_tx_ep)
+		return ERR_PTR(-ENODEV);
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb)
+		return ERR_PTR(-ENOMEM);
+
+	pipe = usb_sndbulkpipe(cif_dev->udev, cif_dev->bulk_tx_ep->bEndpointAddress);
+
+	usb_fill_bulk_urb(urb, cif_dev->udev, pipe,
+			  skb->data, skb->len, btusb_tx_complete, skb);
+
+	skb->dev = (void *)hdev;
+
+	return urb;
+}
+
+static struct urb *alloc_isoc_urb(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	struct urb *urb;
+	unsigned int pipe;
+
+	if (!cif_dev->isoc_tx_ep)
+		return ERR_PTR(-ENODEV);
+
+	urb = usb_alloc_urb(BTUSB_MAX_ISOC_FRAMES, GFP_KERNEL);
+	if (!urb)
+		return ERR_PTR(-ENOMEM);
+
+	pipe = usb_sndisocpipe(cif_dev->udev, cif_dev->isoc_tx_ep->bEndpointAddress);
+
+	usb_fill_int_urb(urb, cif_dev->udev, pipe,
+			 skb->data, skb->len, btusb_isoc_tx_complete,
+			 skb, cif_dev->isoc_tx_ep->bInterval);
+
+	urb->transfer_flags  = URB_ISO_ASAP;
+
+	__fill_isoc_descriptor(urb, skb->len,
+			       le16_to_cpu(cif_dev->isoc_tx_ep->wMaxPacketSize));
+
+	skb->dev = (void *)hdev;
+
+	return urb;
+}
+
+static int submit_tx_urb(struct hci_dev *hdev, struct urb *urb)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int err;
+
+	usb_anchor_urb(urb, &cif_dev->tx_anchor);
+
+	err = usb_submit_urb(urb, GFP_KERNEL);
+	if (err < 0) {
+		if (err != -EPERM && err != -ENODEV)
+			BTMTK_ERR("%s urb %p submission failed (%d)",
+				  hdev->name, urb, -err);
+		kfree(urb->setup_packet);
+		usb_unanchor_urb(urb);
+	} else {
+		usb_mark_last_busy(cif_dev->udev);
+	}
+
+	usb_free_urb(urb);
+	return err;
+}
+
+static int submit_or_queue_tx_urb(struct hci_dev *hdev, struct urb *urb)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	unsigned long flags;
+	bool suspending;
+
+	spin_lock_irqsave(&bdev->txlock, flags);
+	suspending = test_bit(BTUSB_SUSPENDING, &bdev->flags);
+	if (!suspending)
+		bdev->tx_in_flight++;
+	spin_unlock_irqrestore(&bdev->txlock, flags);
+
+	if (!suspending)
+		return submit_tx_urb(hdev, urb);
+
+	schedule_work(&bdev->waker);
+
+	usb_free_urb(urb);
+	return 0;
+}
+
+static int btusb_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct urb *urb = NULL;
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	unsigned int ifnum_base;
+	int ret = 0;
+
+	if (skb->len <= 0) {
+		ret = -EFAULT;
+		BTMTK_ERR("%s: target packet length:%zu is not allowed",
+			  __func__, (size_t)skb->len);
+	}
+
+	ifnum_base = cif_dev->intf->cur_altsetting->desc.bInterfaceNumber;
+
+	skb_pull(skb, 1);
+	switch (hci_skb_pkt_type(skb)) {
+	case HCI_COMMAND_PKT:
+		/* For wmt cmd/evt */
+		if (!memcmp(skb->data, &wmt_over_hci_header[1], WMT_OVER_HCI_HEADER_SIZE - 1)) {
+			skb_push(skb, 1);
+			skb->data[0] = 0x01;
+			btmtk_usb_send_cmd(bdev, skb, 100, 20, BTMTK_TX_CMD_FROM_DRV);
+			btusb_submit_wmt_urb(hdev, GFP_KERNEL);
+			return 0;
+		}
+
+		urb = alloc_ctrl_urb(hdev, skb);
+
+		if (IS_ERR(urb)) {
+			kfree_skb(skb);
+			skb = NULL;
+			return PTR_ERR(urb);
+		}
+
+		hdev->stat.cmd_tx++;
+		return submit_or_queue_tx_urb(hdev, urb);
+
+	case HCI_ACLDATA_PKT:
+		urb = alloc_bulk_urb(hdev, skb);
+		if (IS_ERR(urb)) {
+			kfree_skb(skb);
+			skb = NULL;
+			return PTR_ERR(urb);
+		}
+		hdev->stat.acl_tx++;
+		return submit_or_queue_tx_urb(hdev, urb);
+
+	case HCI_SCODATA_PKT:
+		urb = alloc_isoc_urb(hdev, skb);
+		if (IS_ERR(urb)) {
+			kfree_skb(skb);
+			skb = NULL;
+			return PTR_ERR(urb);
+		}
+
+		hdev->stat.sco_tx++;
+		return submit_tx_urb(hdev, urb);
+	}
+
+	kfree_skb(skb);
+	skb = NULL;
+	return -EILSEQ;
+}
+
+static int btmtk_usb_load_fw_patch_using_dma(struct btmtk_dev *bdev, u8 *image,
+					     u8 *fwbuf, int section_dl_size,
+					     int section_offset)
+{
+	int cur_len = 0;
+	int ret = 0;
+	s32 sent_len;
+	u8 dl_done_cmd[] = {0x01, 0x6F, 0xFC, 0x05, 0x01, 0x01, 0x01, 0x00, PATCH_PHASE3};
+	u8 event[] = {0x04, 0xE4, 0x05, 0x02, 0x01, 0x01, 0x00, 0x00}; /* event[7] is status*/
+
+	if (!bdev || !image || !fwbuf) {
+		BTMTK_ERR("%s: invalid parameters!", __func__);
+		ret = -1;
+		goto exit;
+	}
+
+	BTMTK_INFO("%s: loading rom patch... start", __func__);
+	while (1) {
+		sent_len = (section_dl_size - cur_len) >= (UPLOAD_PATCH_UNIT - HCI_TYPE_SIZE) ?
+				(UPLOAD_PATCH_UNIT - HCI_TYPE_SIZE) : (section_dl_size - cur_len);
+
+		if (sent_len > 0) {
+			image[0] = HCI_ACLDATA_PKT;
+			memcpy(&image[HCI_TYPE_SIZE], fwbuf + section_offset + cur_len, sent_len);
+			BTMTK_DBG("%s: sent_len = %d, cur_len = %d", __func__,
+				  sent_len, cur_len);
+			ret = btmtk_main_send_cmd(bdev,
+						  image, sent_len + HCI_TYPE_SIZE,
+						  NULL, -1,
+						  0, 0, BTMTK_TX_ACL_FROM_DRV);
+			if (ret < 0) {
+				BTMTK_ERR("%s: send patch failed, terminate", __func__);
+				goto exit;
+			}
+			cur_len += sent_len;
+		} else {
+			break;
+		}
+	}
+
+	ret = btmtk_main_send_cmd(bdev, dl_done_cmd, sizeof(dl_done_cmd),
+				  event, sizeof(event),
+				  DELAY_TIMES, RETRY_TIMES,
+				  BTMTK_TX_CMD_FROM_DRV);
+	if (ret < 0)
+		BTMTK_ERR("%s: send wmd dl cmd failed, terminate!", __func__);
+	BTMTK_INFO("%s: loading rom patch... Done", __func__);
+
+exit:
+	return ret;
+}
+
+static void btusb_notify(struct hci_dev *hdev, unsigned int evt)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+
+	BTMTK_DBG("%s evt %d", hdev->name, evt);
+
+	if (hci_conn_num(hdev, SCO_LINK) != bdev->sco_num) {
+		bdev->sco_num = hci_conn_num(hdev, SCO_LINK);
+		schedule_work(&bdev->work);
+	}
+}
+
+static inline int __set_isoc_interface(struct hci_dev *hdev, int altsetting)
+{
+	struct btmtk_dev *bdev = hci_get_drvdata(hdev);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	struct usb_interface *intf = cif_dev->isoc;
+	struct usb_endpoint_descriptor *ep_desc;
+	int i, err;
+	unsigned int ifnum_base;
+
+	if (!cif_dev->isoc)
+		return -ENODEV;
+
+	ifnum_base = cif_dev->intf->cur_altsetting->desc.bInterfaceNumber;
+	cif_dev->new_isoc_altsetting_interface = 1;
+	err = usb_set_interface(cif_dev->udev, cif_dev->new_isoc_altsetting_interface, altsetting);
+
+	if (err < 0) {
+		BTMTK_ERR("%s setting interface failed (%d)", hdev->name, -err);
+		return err;
+	}
+
+	bdev->isoc_altsetting = altsetting;
+
+	cif_dev->isoc_tx_ep = NULL;
+	cif_dev->isoc_rx_ep = NULL;
+
+	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
+		ep_desc = &intf->cur_altsetting->endpoint[i].desc;
+
+		if (!cif_dev->isoc_tx_ep && usb_endpoint_is_isoc_out(ep_desc)) {
+			cif_dev->isoc_tx_ep = ep_desc;
+			continue;
+		}
+
+		if (!cif_dev->isoc_rx_ep && usb_endpoint_is_isoc_in(ep_desc)) {
+			cif_dev->isoc_rx_ep = ep_desc;
+			continue;
+		}
+	}
+
+	if (!cif_dev->isoc_tx_ep || !cif_dev->isoc_rx_ep) {
+		BTMTK_ERR("%s invalid SCO descriptors", hdev->name);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void btusb_work(struct work_struct *work)
+{
+	struct btmtk_dev *bdev = container_of(work, struct btmtk_dev, work);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	struct hci_dev *hdev = bdev->hdev;
+	int new_alts;
+	int err;
+	unsigned long flags;
+
+	if (bdev->sco_num > 0) {
+		if (!test_bit(BTUSB_DID_ISO_RESUME, &bdev->flags)) {
+			err = usb_autopm_get_interface(cif_dev->isoc ?
+						       cif_dev->isoc :
+						       cif_dev->intf);
+			if (err < 0) {
+				clear_bit(BTUSB_ISOC_RUNNING, &bdev->flags);
+				usb_kill_anchored_urbs(&cif_dev->isoc_anchor);
+				return;
+			}
+
+			set_bit(BTUSB_DID_ISO_RESUME, &bdev->flags);
+		}
+
+		if (hdev->voice_setting & 0x0020) {
+			static const int alts[3] = { 2, 4, 5 };
+
+			new_alts = alts[bdev->sco_num - 1];
+		} else {
+			new_alts = bdev->sco_num;
+		}
+
+		clear_bit(BTUSB_ISOC_RUNNING, &bdev->flags);
+		usb_kill_anchored_urbs(&cif_dev->isoc_anchor);
+
+		spin_lock_irqsave(&bdev->rxlock, flags);
+		kfree_skb(bdev->sco_skb);
+		bdev->sco_skb = NULL;
+		spin_unlock_irqrestore(&bdev->rxlock, flags);
+
+		if (__set_isoc_interface(hdev, new_alts) < 0)
+			return;
+
+		if (!test_and_set_bit(BTUSB_ISOC_RUNNING, &bdev->flags)) {
+			if (btusb_submit_isoc_urb(hdev, GFP_KERNEL) < 0)
+				clear_bit(BTUSB_ISOC_RUNNING, &bdev->flags);
+			else
+				btusb_submit_isoc_urb(hdev, GFP_KERNEL);
+		}
+	} else {
+		clear_bit(BTUSB_ISOC_RUNNING, &bdev->flags);
+		usb_kill_anchored_urbs(&cif_dev->isoc_anchor);
+		BTMTK_INFO("%s set alt to zero", __func__);
+		__set_isoc_interface(hdev, 0);
+		if (test_and_clear_bit(BTUSB_DID_ISO_RESUME, &bdev->flags))
+			usb_autopm_put_interface(cif_dev->isoc ? cif_dev->isoc : cif_dev->intf);
+	}
+}
+
+static void btusb_waker(struct work_struct *work)
+{
+	struct btmtk_dev *bdev = container_of(work, struct btmtk_dev, waker);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int err;
+
+	err = usb_autopm_get_interface(cif_dev->intf);
+	if (err < 0)
+		return;
+
+	usb_autopm_put_interface(cif_dev->intf);
+}
+
+static int btusb_probe(struct usb_interface *intf,
+		       const struct usb_device_id *id)
+{
+	struct usb_endpoint_descriptor *ep_desc;
+	struct btmtk_dev *bdev = NULL;
+	struct btmtk_usb_dev *cif_dev = NULL;
+	unsigned int ifnum_base;
+	int i, err = 0;
+
+	ifnum_base = intf->cur_altsetting->desc.bInterfaceNumber;
+	BTMTK_DBG("intf %p id %p, interfacenum = %d", intf, id, ifnum_base);
+
+	bdev = usb_get_intfdata(intf);
+	if (!bdev) {
+		BTMTK_ERR("[ERR] bdev is NULL");
+		err = -ENOMEM;
+		goto end;
+	}
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
+		ep_desc = &intf->cur_altsetting->endpoint[i].desc;
+
+		if (!cif_dev->intr_ep && usb_endpoint_is_int_in(ep_desc)) {
+			cif_dev->intr_ep = ep_desc;
+			BTMTK_INFO("intr_rx_ep i = %d  EP 0x%02X, number_of_endpoints=%d",
+				   i, ep_desc->bEndpointAddress,
+				   intf->cur_altsetting->desc.bNumEndpoints);
+			continue;
+		}
+
+		if (!cif_dev->bulk_tx_ep && usb_endpoint_is_bulk_out(ep_desc)) {
+			cif_dev->bulk_tx_ep = ep_desc;
+			BTMTK_INFO("bulk_tx_ep i = %d  EP 0x%02X, number_of_endpoints=%d",
+				   i, ep_desc->bEndpointAddress,
+				   intf->cur_altsetting->desc.bNumEndpoints);
+			continue;
+		}
+
+		if (!cif_dev->bulk_rx_ep && usb_endpoint_is_bulk_in(ep_desc)) {
+			cif_dev->bulk_rx_ep = ep_desc;
+			BTMTK_INFO("bulk_rx_ep i = %d  EP = 0x%02X, number_of_endpoints=%d",
+				   i, ep_desc->bEndpointAddress,
+				   intf->cur_altsetting->desc.bNumEndpoints);
+			continue;
+		}
+	}
+
+	if (!cif_dev->intr_ep || !cif_dev->bulk_tx_ep || !cif_dev->bulk_rx_ep) {
+		BTMTK_ERR("[ERR] intr_ep or bulk_tx_ep or bulk_rx_ep is NULL");
+		err = -ENODEV;
+		goto end;
+	}
+
+	cif_dev->cmdreq_type = USB_TYPE_CLASS;
+	cif_dev->cmdreq = 0x00;
+
+	cif_dev->udev = interface_to_usbdev(intf);
+	cif_dev->intf = intf;
+	bdev->intf_dev = &cif_dev->udev->dev;
+
+	INIT_WORK(&bdev->work, btusb_work);
+	INIT_WORK(&bdev->waker, btusb_waker);
+	init_usb_anchor(&cif_dev->tx_anchor);
+	spin_lock_init(&bdev->txlock);
+
+	init_usb_anchor(&cif_dev->intr_anchor);
+	init_usb_anchor(&cif_dev->bulk_anchor);
+	init_usb_anchor(&cif_dev->isoc_anchor);
+	init_usb_anchor(&cif_dev->ctrl_anchor);
+	spin_lock_init(&bdev->rxlock);
+
+	err = btmtk_cif_allocate_memory(cif_dev);
+	if (err < 0) {
+		BTMTK_ERR("[ERR] btmtk_cif_allocate_memory failed!");
+		goto end;
+	}
+
+	err = btmtk_main_cif_initialize(bdev, HCI_USB);
+	if (err < 0) {
+		BTMTK_ERR("[ERR] btmtk_main_cif_initialize failed!");
+		goto free_mem;
+	}
+
+	bdev->hdev->notify = btusb_notify;
+
+	SET_HCIDEV_DEV(bdev->hdev, &cif_dev->intf->dev);
+
+	err = btmtk_load_rom_patch(bdev);
+	if (err < 0) {
+		BTMTK_ERR("btmtk load rom patch failed!");
+		goto deinit;
+	}
+
+	usb_set_intfdata(intf, bdev);
+
+	err = btmtk_send_init_cmds(bdev);
+	if (err < 0)
+		BTMTK_ERR("%s, btmtk_send_init_cmds failed, err = %d", __func__, err);
+
+	err = btmtk_register_hci_device(bdev);
+	if (err < 0) {
+		BTMTK_ERR("btmtk_register_hci_device failed!");
+		goto deinit;
+	}
+
+	return 0;
+
+deinit:
+	btmtk_main_cif_uninitialize(bdev, HCI_USB);
+free_mem:
+	btmtk_cif_free_memory(cif_dev);
+end:
+	return err;
+}
+
+static void btusb_disconnect(struct usb_interface *intf)
+{
+	struct btmtk_dev *bdev = NULL;
+	struct btmtk_usb_dev *cif_dev = NULL;
+	struct hci_dev *hdev;
+
+	bdev = usb_get_intfdata(intf);
+	if (!bdev) {
+		BTMTK_WARN("%s: bdev is NULL!", __func__);
+		return;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	if (!cif_dev) {
+		BTMTK_WARN("%s: cif_dev is NULL!", __func__);
+		return;
+	}
+
+	hdev = bdev->hdev;
+	usb_set_intfdata(cif_dev->intf, NULL);
+
+	if (cif_dev->isoc)
+		usb_set_intfdata(cif_dev->isoc, NULL);
+
+	if (cif_dev->iso_channel)
+		usb_set_intfdata(cif_dev->iso_channel, NULL);
+
+	if (intf == cif_dev->intf) {
+		if (cif_dev->isoc)
+			usb_driver_release_interface(&btusb_driver, cif_dev->isoc);
+		if (cif_dev->iso_channel)
+			usb_driver_release_interface(&btusb_driver, cif_dev->iso_channel);
+	} else if (intf == cif_dev->isoc) {
+		usb_driver_release_interface(&btusb_driver, cif_dev->intf);
+	} else if (intf == cif_dev->iso_channel) {
+		usb_driver_release_interface(&btusb_driver, cif_dev->intf);
+	}
+
+	btmtk_cif_free_memory(cif_dev);
+
+	btmtk_main_cif_disconnect_notify(bdev, HCI_USB);
+}
+
+#ifdef CONFIG_PM
+static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct btmtk_dev *bdev = usb_get_intfdata(intf);
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int ret = 0;
+
+	if (bdev->suspend_count++) {
+		BTMTK_ERR("%s: Has suspended. suspend_count: %d end",
+			  __func__, bdev->suspend_count);
+		return 0;
+	}
+
+	spin_lock_irq(&bdev->txlock);
+	if (!(PMSG_IS_AUTO(message) && bdev->tx_in_flight)) {
+		set_bit(BTUSB_SUSPENDING, &bdev->flags);
+		spin_unlock_irq(&bdev->txlock);
+	} else {
+		spin_unlock_irq(&bdev->txlock);
+		bdev->suspend_count--;
+		return -EBUSY;
+	}
+
+	cancel_work_sync(&bdev->work);
+
+	btusb_stop_traffic(cif_dev);
+	usb_kill_anchored_urbs(&cif_dev->tx_anchor);
+
+	BTMTK_INFO("%s end, suspend_count = %d", __func__, bdev->suspend_count);
+
+	return ret;
+}
+
+static int btusb_resume(struct usb_interface *intf)
+{
+	struct btmtk_dev *bdev = usb_get_intfdata(intf);
+	struct hci_dev *hdev = bdev->hdev;
+	int err = 0;
+
+	BTMTK_INFO("%s begin", __func__);
+
+	if (--bdev->suspend_count) {
+		BTMTK_WARN("%s: bdev->suspend_count %d, return 0", __func__,
+			   bdev->suspend_count);
+		return 0;
+	}
+
+	if (test_bit(BTUSB_INTR_RUNNING, &bdev->flags)) {
+		err = btusb_submit_intr_urb(hdev, GFP_NOIO);
+		if (err < 0) {
+			clear_bit(BTUSB_INTR_RUNNING, &bdev->flags);
+			goto done;
+		}
+	}
+
+	if (test_bit(BTUSB_BULK_RUNNING, &bdev->flags)) {
+		err = btusb_submit_bulk_urb(hdev, GFP_NOIO);
+		if (err < 0) {
+			clear_bit(BTUSB_BULK_RUNNING, &bdev->flags);
+			goto done;
+		}
+
+		btusb_submit_bulk_urb(hdev, GFP_NOIO);
+	}
+
+	if (test_bit(BTUSB_ISOC_RUNNING, &bdev->flags)) {
+		if (btusb_submit_isoc_urb(hdev, GFP_NOIO) < 0)
+			clear_bit(BTUSB_ISOC_RUNNING, &bdev->flags);
+		else
+			btusb_submit_isoc_urb(hdev, GFP_NOIO);
+	}
+
+	spin_lock_irq(&bdev->txlock);
+	clear_bit(BTUSB_SUSPENDING, &bdev->flags);
+	spin_unlock_irq(&bdev->txlock);
+	schedule_work(&bdev->work);
+
+	BTMTK_INFO("%s end", __func__);
+
+	return 0;
+
+done:
+	spin_lock_irq(&bdev->txlock);
+	clear_bit(BTUSB_SUSPENDING, &bdev->flags);
+	spin_unlock_irq(&bdev->txlock);
+
+	return err;
+}
+#endif
+
+static int btmtk_cif_probe(struct usb_interface *intf,
+			   const struct usb_device_id *id)
+{
+	int ret = -1;
+	int cif_event = 0;
+	unsigned int ifnum_base;
+	struct btmtk_cif_state *cif_state = NULL;
+	struct btmtk_dev *bdev = NULL;
+
+	/* Mediatek Driver Version */
+	BTMTK_INFO("%s: MTK BT Driver Version : %s", __func__, VERSION);
+
+	ifnum_base = intf->cur_altsetting->desc.bInterfaceNumber;
+	BTMTK_DBG("intf %p id %p, interfacenum = %d", intf, id, ifnum_base);
+
+	if (ifnum_base != BT0_MCU_INTERFACE_NUM &&
+	    ifnum_base != BT1_MCU_INTERFACE_NUM)
+		return -ENODEV;
+
+	bdev = btmtk_get_dev();
+	usb_set_intfdata(intf, bdev);
+	bdev->cif_dev = &g_usb_dev[bdev->dongle_index][intf_to_idx[ifnum_base]];
+
+	cif_event = HIF_EVENT_PROBE;
+	if (BTMTK_CIF_IS_NULL(bdev, cif_event)) {
+		/* Error */
+		BTMTK_WARN("%s intf[%d] priv setting is NULL", __func__, ifnum_base);
+		return -ENODEV;
+	}
+
+	cif_state = &bdev->cif_state[cif_event];
+
+	/* Set Entering state */
+	btmtk_set_chip_state((void *)bdev, cif_state->ops_enter);
+
+	/* Do HIF events */
+	ret = btusb_probe(intf, id);
+
+	/* Set End/Error state */
+	if (ret == 0)
+		btmtk_set_chip_state((void *)bdev, cif_state->ops_end);
+	else
+		btmtk_set_chip_state((void *)bdev, cif_state->ops_error);
+
+	return ret;
+}
+
+static void btmtk_cif_disconnect(struct usb_interface *intf)
+{
+	int cif_event = 0;
+	unsigned int ifnum_base;
+	struct btmtk_cif_state *cif_state = NULL;
+	struct btmtk_dev *bdev = NULL;
+
+	BTMTK_CIF_GET_DEV_PRIV(bdev, intf, ifnum_base);
+
+	/* Retrieve current HIF event state */
+	cif_event = HIF_EVENT_DISCONNECT;
+	if (BTMTK_CIF_IS_NULL(bdev, cif_event)) {
+		/* Error */
+		BTMTK_WARN("%s intf[%d] priv setting is NULL", __func__, ifnum_base);
+		return;
+	}
+
+	cif_state = &bdev->cif_state[cif_event];
+
+	btmtk_usb_cif_mutex_lock(bdev);
+	/* Set Entering state */
+	btmtk_set_chip_state((void *)bdev, cif_state->ops_enter);
+
+	/* Do HIF events */
+	btusb_disconnect(intf);
+
+	/* Set End/Error state */
+	btmtk_set_chip_state((void *)bdev, cif_state->ops_end);
+	btmtk_usb_cif_mutex_unlock(bdev);
+}
+
+#ifdef CONFIG_PM
+static int btmtk_cif_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	int ret = 0;
+	unsigned int ifnum_base;
+	int cif_event = 0;
+	struct btmtk_cif_state *cif_state = NULL;
+	struct btmtk_dev *bdev = NULL;
+	int state = BTMTK_STATE_INIT;
+
+	BTMTK_INFO("%s, enter", __func__);
+	BTMTK_CIF_GET_DEV_PRIV(bdev, intf, ifnum_base);
+
+	state = btmtk_get_chip_state(bdev);
+	/* Retrieve current HIF event state */
+	if (state == BTMTK_STATE_FW_DUMP) {
+		BTMTK_WARN("%s: FW dumping ongoing, don't dos suspend flow!!!", __func__);
+		cif_event = HIF_EVENT_FW_DUMP;
+	} else {
+		cif_event = HIF_EVENT_SUSPEND;
+	}
+
+	if (BTMTK_CIF_IS_NULL(bdev, cif_event)) {
+		/* Error */
+		BTMTK_WARN("%s intf[%d] priv setting is NULL", __func__, ifnum_base);
+		return -ENODEV;
+	}
+
+	cif_state = &bdev->cif_state[cif_event];
+
+	/* Set Entering state */
+	btmtk_set_chip_state((void *)bdev, cif_state->ops_enter);
+
+	/* Do HIF events */
+	ret = btusb_suspend(intf, message);
+
+	/* Set End/Error state */
+	if (ret == 0)
+		btmtk_set_chip_state((void *)bdev, cif_state->ops_end);
+	else
+		btmtk_set_chip_state((void *)bdev, cif_state->ops_error);
+
+	BTMTK_INFO("%s, end. ret = %d", __func__, ret);
+	return ret;
+}
+
+static int btmtk_cif_resume(struct usb_interface *intf)
+{
+	int ret = 0;
+	unsigned int ifnum_base;
+	int cif_event = 0;
+	struct btmtk_cif_state *cif_state = NULL;
+	struct btmtk_dev *bdev = NULL;
+
+	BTMTK_INFO("%s, enter", __func__);
+	BTMTK_CIF_GET_DEV_PRIV(bdev, intf, ifnum_base);
+
+	/* Retrieve current HIF event state */
+	cif_event = HIF_EVENT_RESUME;
+	if (BTMTK_CIF_IS_NULL(bdev, cif_event)) {
+		/* Error */
+		BTMTK_WARN("%s intf[%d] priv setting is NULL", __func__, ifnum_base);
+		return -ENODEV;
+	}
+
+	cif_state = &bdev->cif_state[cif_event];
+
+	/* Set Entering state */
+	btmtk_set_chip_state((void *)bdev, cif_state->ops_enter);
+
+	/* Do HIF events */
+	ret = btusb_resume(intf);
+
+	/* Set End/Error state */
+	if (ret == 0)
+		btmtk_set_chip_state((void *)bdev, cif_state->ops_end);
+	else
+		btmtk_set_chip_state((void *)bdev, cif_state->ops_error);
+
+	BTMTK_INFO("%s, end. ret = %d", __func__, ret);
+	return ret;
+}
+#endif	// CONFIG_PM //
+
+static struct usb_driver btusb_driver = {
+	.name		= "btmtk_usb",
+	.probe		= btmtk_cif_probe,
+	.disconnect	= btmtk_cif_disconnect,
+#ifdef CONFIG_PM
+	.suspend	= btmtk_cif_suspend,
+	.resume		= btmtk_cif_resume,
+#endif
+	.id_table	= btusb_table,
+	.supports_autosuspend = 1,
+	.disable_hub_initiated_lpm = 1,
+};
+
+int btmtk_cif_register(void)
+{
+	int retval = 0;
+	struct hif_hook_ptr hook;
+
+	BTMTK_INFO("%s", __func__);
+
+	memset(&hook, 0, sizeof(hook));
+	hook.open = btmtk_usb_open;
+	hook.close = btmtk_usb_close;
+	hook.reg_read = btmtk_usb_read_register;
+	hook.reg_write = btmtk_usb_write_register;
+	hook.send_cmd = btmtk_usb_send_cmd;
+	hook.send_and_recv = btmtk_usb_send_and_recv;
+	hook.event_filter = btmtk_usb_event_filter;
+	hook.cif_mutex_lock = btmtk_usb_cif_mutex_lock;
+	hook.cif_mutex_unlock = btmtk_usb_cif_mutex_unlock;
+	hook.dl_dma = btmtk_usb_load_fw_patch_using_dma;
+	btmtk_reg_hif_hook(&hook);
+
+	retval = usb_register(&btusb_driver);
+	if (retval)
+		BTMTK_ERR("*** USB registration fail(%d)! ***", retval);
+	else
+		BTMTK_INFO("%s, usb registration success!", __func__);
+	return retval;
+}
+
+int btmtk_cif_deregister(void)
+{
+	BTMTK_INFO("%s", __func__);
+	usb_deregister(&btusb_driver);
+	BTMTK_INFO("%s: Done", __func__);
+	return 0;
+}
+
+static int btmtk_cif_allocate_memory(struct btmtk_usb_dev *cif_dev)
+{
+	if (!cif_dev->o_usb_buf) {
+		cif_dev->o_usb_buf = kzalloc(HCI_MAX_COMMAND_SIZE, GFP_KERNEL);
+		if (!cif_dev->o_usb_buf) {
+			BTMTK_ERR("%s: alloc memory fail (bdev->o_usb_buf)", __func__);
+			return -1;
+		}
+	}
+
+	if (!cif_dev->urb_intr_buf) {
+		cif_dev->urb_intr_buf = kzalloc(URB_MAX_BUFFER_SIZE, GFP_KERNEL);
+		if (!cif_dev->urb_intr_buf) {
+			BTMTK_ERR("%s: alloc memory fail (bdev->urb_intr_buf)", __func__);
+			return -1;
+		}
+	}
+	if (!cif_dev->urb_bulk_buf) {
+		cif_dev->urb_bulk_buf = kzalloc(URB_MAX_BUFFER_SIZE, GFP_KERNEL);
+		if (!cif_dev->urb_bulk_buf) {
+			BTMTK_ERR("%s: alloc memory fail (bdev->urb_bulk_buf)", __func__);
+			return -1;
+		}
+	}
+	if (!cif_dev->urb_ble_isoc_buf) {
+		cif_dev->urb_ble_isoc_buf = kzalloc(URB_MAX_BUFFER_SIZE, GFP_KERNEL);
+		if (!cif_dev->urb_ble_isoc_buf) {
+			BTMTK_ERR("%s: alloc memory fail (bdev->urb_ble_isoc_buf)", __func__);
+			return -1;
+		}
+	}
+
+	BTMTK_INFO("%s: Done", __func__);
+	return 0;
+}
+
+static void btmtk_cif_free_memory(struct btmtk_usb_dev *cif_dev)
+{
+	if (!cif_dev) {
+		BTMTK_ERR("%s: bdev is NULL!", __func__);
+		return;
+	}
+
+	kfree(cif_dev->o_usb_buf);
+	cif_dev->o_usb_buf = NULL;
+
+	kfree(cif_dev->urb_intr_buf);
+	cif_dev->urb_intr_buf = NULL;
+
+	kfree(cif_dev->urb_bulk_buf);
+	cif_dev->urb_bulk_buf = NULL;
+
+	kfree(cif_dev->urb_ble_isoc_buf);
+	cif_dev->urb_ble_isoc_buf = NULL;
+
+	memset(cif_dev, 0, sizeof(struct btmtk_usb_dev));
+
+	BTMTK_INFO("%s: Success", __func__);
+}
+
+static int btmtk_usb_read_register(struct btmtk_dev *bdev, u32 reg, u32 *val)
+{
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int ret = -1;
+	__le16 reg_high;
+	__le16 reg_low;
+
+	reg_high = ((reg >> 16) & 0xffff);
+	reg_low = (reg & 0xffff);
+
+	memset(bdev->io_buf, 0, IO_BUF_SIZE);
+	ret = usb_control_msg(cif_dev->udev, usb_rcvctrlpipe(cif_dev->udev, 0),
+			      0x63,
+			      DEVICE_VENDOR_REQUEST_IN,
+			      reg_high,
+			      reg_low,
+			      bdev->io_buf,
+			      sizeof(u32), USB_CTRL_IO_TIMO);
+
+	if (ret < 0) {
+		*val = 0xffffffff;
+		BTMTK_ERR("%s: error(%d), reg=%x, value=%x", __func__, ret, reg, *val);
+		return ret;
+	}
+
+	memmove(val, bdev->io_buf, sizeof(u32));
+	*val = le32_to_cpu(*val);
+
+	return 0;
+}
+
+static int btmtk_usb_write_register(struct btmtk_dev *bdev, u32 reg, u32 val)
+{
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	int ret = -1;
+	__le16 reg_high;
+	__le16 reg_low;
+	u8 buf[4];
+
+	reg_high = ((reg >> 16) & 0xffff);
+	reg_low = (reg & 0xffff);
+
+	buf[0] = 0;
+	buf[1] = 0;
+	buf[2] = (val & 0x00ff);
+	buf[3] = ((val >> 8) & 0x00ff);
+
+	memcpy(cif_dev->o_usb_buf, buf, sizeof(buf));
+	ret = usb_control_msg(cif_dev->udev, usb_sndctrlpipe(cif_dev->udev, 0),
+			      0x66, /* bRequest */
+			      0x40, /* bRequestType */
+			      reg_high, /* wValue */
+			      reg_low, /* wIndex */
+			      cif_dev->o_usb_buf,
+			      sizeof(buf), USB_CTRL_IO_TIMO);
+
+	if (ret < 0) {
+		val = 0xffffffff;
+		BTMTK_ERR("%s: error(%d), reg=%x, value=%x", __func__, ret, reg, val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void btmtk_cif_load_rom_patch_complete(struct urb *urb)
+{
+	struct completion *sent_to_mcu_done = (struct completion *)urb->context;
+
+	complete(sent_to_mcu_done);
+}
+
+int btmtk_cif_send_control_out(struct btmtk_dev *bdev, struct sk_buff *skb,
+			       int delay, int retry)
+{
+	struct btmtk_usb_dev *cif_dev = NULL;
+	int ret = 0;
+	unsigned int ifnum_base;
+
+	if (!bdev || !bdev->hdev || !bdev->io_buf || !skb ||
+	    skb->len > HCI_MAX_COMMAND_SIZE || skb->len <= 0) {
+		BTMTK_ERR("%s: incorrect parameter", __func__);
+		ret = -1;
+		goto exit;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	if (!cif_dev->udev || !cif_dev->o_usb_buf) {
+		BTMTK_ERR("%s: cif_dev is invalid", __func__);
+		ret = -1;
+		goto exit;
+	}
+
+	ifnum_base = cif_dev->intf->cur_altsetting->desc.bInterfaceNumber;
+	memcpy(cif_dev->o_usb_buf, skb->data + 1, skb->len - 1);
+	ret = usb_control_msg(cif_dev->udev, usb_sndctrlpipe(cif_dev->udev, 0),
+			      0x01, DEVICE_CLASS_REQUEST_OUT, 0x30, 0x00,
+			      (void *)cif_dev->o_usb_buf, skb->len - 1,
+			      USB_CTRL_IO_TIMO);
+
+	if (ret < 0) {
+		BTMTK_ERR("%s: command send failed(%d)", __func__, ret);
+		goto exit;
+	}
+exit:
+	kfree_skb(skb);
+	skb = NULL;
+	return ret;
+}
+
+static int btmtk_cif_send_bulk_out(struct btmtk_dev *bdev, struct sk_buff *skb)
+{
+	int ret = 0;
+	struct urb *urb;
+	unsigned int pipe;
+	struct completion sent_to_mcu_done;
+	void *buf;
+	struct btmtk_usb_dev *cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	buf = usb_alloc_coherent(cif_dev->udev, UPLOAD_PATCH_UNIT,
+				 GFP_KERNEL, &urb->transfer_dma);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	init_completion(&sent_to_mcu_done);
+
+	pipe = usb_sndbulkpipe(cif_dev->udev, cif_dev->bulk_tx_ep->bEndpointAddress);
+
+	memcpy(buf, skb->data + 1, skb->len - 1);
+	usb_fill_bulk_urb(urb,
+			  cif_dev->udev,
+			  pipe,
+			  buf,
+			  skb->len - 1,
+			  (usb_complete_t)btmtk_cif_load_rom_patch_complete,
+			  &sent_to_mcu_done);
+
+	urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+
+	ret = usb_submit_urb(urb, GFP_KERNEL);
+	if (ret < 0) {
+		BTMTK_ERR("%s: submit urb failed (%d)", __func__, ret);
+		goto error;
+	}
+
+	if (!wait_for_completion_timeout
+			(&sent_to_mcu_done, msecs_to_jiffies(1000))) {
+		usb_kill_urb(urb);
+		BTMTK_ERR("%s: upload rom_patch timeout", __func__);
+		ret = -ETIME;
+		goto error;
+	}
+
+error:
+	usb_free_coherent(cif_dev->udev, UPLOAD_PATCH_UNIT, buf, urb->transfer_dma);
+exit:
+	usb_free_urb(urb);
+	kfree_skb(skb);
+	skb = NULL;
+	return ret;
+}
+
+int btmtk_usb_send_cmd(struct btmtk_dev *bdev, struct sk_buff *skb,
+		       int delay, int retry, int pkt_type)
+{
+	int ret = -1;
+
+	if (pkt_type == BTMTK_TX_CMD_FROM_DRV) {
+		/* handle wmt cmd from driver */
+		ret = btmtk_cif_send_control_out(bdev, skb, delay, retry);
+	} else if (pkt_type == BTMTK_TX_ACL_FROM_DRV) {
+		/* bulk out for load rom patch*/
+		ret = btmtk_cif_send_bulk_out(bdev, skb);
+	} else if (pkt_type == BTMTK_TX_PKT_FROM_HOST) {
+		/* handle hci cmd and acl pkt from host, handle hci cmd from driver */
+		ret = btusb_send_frame(bdev->hdev, skb);
+	}
+
+	return ret;
+}
+
+static int btmtk_cif_recv_evt(struct btmtk_dev *bdev, int delay, int retry)
+{
+	struct btmtk_usb_dev *cif_dev = NULL;
+	int ret = -1;	/* if successful, 0 */
+	unsigned int ifnum_base;
+
+	if (!bdev) {
+		BTMTK_ERR("%s: !bdev!\n", __func__);
+		return ret;
+	}
+
+	cif_dev = (struct btmtk_usb_dev *)bdev->cif_dev;
+	if (!cif_dev->udev || !bdev->hdev) {
+		BTMTK_ERR("%s: invalid parameters!\n", __func__);
+		return ret;
+	}
+
+	ifnum_base = cif_dev->intf->cur_altsetting->desc.bInterfaceNumber;
+get_response_again:
+	/* ms delay */
+	mdelay(delay);
+
+	/* check WMT event */
+	memset(bdev->io_buf, 0, IO_BUF_SIZE);
+	bdev->io_buf[0] = HCI_EVENT_PKT;
+	ret = usb_control_msg(cif_dev->udev, usb_rcvctrlpipe(cif_dev->udev, 0),
+			      0x01, DEVICE_VENDOR_REQUEST_IN, 0x30, 0x00,
+			      bdev->io_buf + 1, HCI_USB_IO_BUF_SIZE,
+			      USB_CTRL_IO_TIMO);
+
+	if (ret < 0) {
+		BTMTK_ERR("%s: event get failed(%d)", __func__, ret);
+		return ret;
+	}
+
+	if (ret > 0) {
+		BTMTK_DBG_RAW(bdev->io_buf, ret + 1, "%s OK: EVT:", __func__);
+		return ret + 1; /* return read length */
+	} else if (retry > 0) {
+		BTMTK_WARN("%s: Trying to get response... (%d)", __func__, ret);
+		retry--;
+		goto get_response_again;
+	}
+
+	BTMTK_ERR("%s NG: do not got response:(%d)", __func__, ret);
+	return -1;
+}
+
+int btmtk_usb_send_and_recv(struct btmtk_dev *bdev,
+			    struct sk_buff *skb, const u8 *event,
+			    const int event_len, int delay,
+			    int retry, int pkt_type)
+{
+	unsigned long comp_event_timo = 0, start_time = 0;
+	int ret = 0;
+
+	if (!bdev) {
+		BTMTK_ERR("%s: !bdev!\n", __func__);
+		return ret;
+	}
+
+	if ((pkt_type == BTMTK_TX_CMD_FROM_DRV || pkt_type == BTMTK_TX_ACL_FROM_DRV)) {
+		ret = btmtk_usb_send_cmd(bdev, skb, delay, retry, pkt_type);
+		if (ret < 0) {
+			BTMTK_ERR("%s btmtk_usb_send_cmd failed!!", __func__);
+			goto exit;
+		}
+
+		if (event && event_len > 0) {
+			bdev->recv_evt_len = btmtk_cif_recv_evt(bdev, delay, retry);
+			if (bdev->recv_evt_len < 0) {
+				BTMTK_ERR("%s btmtk_cif_recv_evt failed!!", __func__);
+				ret = -1;
+				goto exit;
+			}
+
+			if (bdev->io_buf && bdev->recv_evt_len >= event_len) {
+				if (memcmp(bdev->io_buf, event, event_len) == 0) {
+					ret = 0;
+					goto exit;
+				}
+			}
+			BTMTK_INFO("%s compare fail\n", __func__);
+			ret = -1;
+		} else {
+			ret = 0;
+		}
+	} else {
+		if (event) {
+			if (event_len > EVENT_COMPARE_SIZE) {
+				BTMTK_ERR("%s, event_len (%d) > EVENT_COMPARE_SIZE(%d), error",
+					  __func__, event_len, EVENT_COMPARE_SIZE);
+				ret = -1;
+				goto exit;
+			}
+			event_compare_status = BTMTK_EVENT_COMPARE_STATE_NEED_COMPARE;
+			memcpy(event_need_compare, event + 1, event_len - 1);
+			event_need_compare_len = event_len - 1;
+
+			start_time = jiffies;
+			/* check hci event /wmt event for SDIO/UART interface, check hci
+			 * event for USB interface
+			 */
+			comp_event_timo = jiffies + msecs_to_jiffies(COMP_EVENT_TIMO);
+			BTMTK_INFO("event_need_compare_len %d, event_compare_status %d",
+				   event_need_compare_len, event_compare_status);
+		} else {
+			event_compare_status = BTMTK_EVENT_COMPARE_STATE_COMPARE_SUCCESS;
+		}
+
+		ret = btmtk_usb_send_cmd(bdev, skb, delay, retry, pkt_type);
+		if (ret < 0) {
+			BTMTK_ERR("%s btmtk_sdio_send_cmd failed!!", __func__);
+			goto exit;
+		}
+
+		do {
+			/* check if event_compare_success */
+			if (event_compare_status == BTMTK_EVENT_COMPARE_STATE_COMPARE_SUCCESS) {
+				ret = 0;
+				break;
+			}
+			usleep_range(10, 100);
+		} while (time_before(jiffies, comp_event_timo));
+
+		event_compare_status = BTMTK_EVENT_COMPARE_STATE_NOTHING_NEED_COMPARE;
+	}
+
+exit:
+	return ret;
+}
+
+int btmtk_usb_event_filter(struct btmtk_dev *bdev, struct sk_buff *skb)
+{
+	if (event_compare_status == BTMTK_EVENT_COMPARE_STATE_NEED_COMPARE &&
+	    skb->len >= event_need_compare_len) {
+		if (memcmp(skb->data, event_need_compare, event_need_compare_len) == 0) {
+			event_compare_status = BTMTK_EVENT_COMPARE_STATE_COMPARE_SUCCESS;
+		} else {
+			BTMTK_INFO_RAW(event_need_compare, event_need_compare_len,
+				       "%s: event_need_compare:", __func__);
+			return 0;
+		}
+
+		return 1;
+	}
+	return 0;
+}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
