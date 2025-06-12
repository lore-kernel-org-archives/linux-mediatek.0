Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1158C61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nsUuIaqnM98AXc3sk5GAF68VDIKR4aTmuSKr+dEPhZ8=; b=WrAm5tMb9uBjVn29yP39Rssn5a
	cDH64E8kDBx88Pa+1ru4KDrAnXCn8OZEk1SpzK+7FllqFQHbNSYYl2i8ZZ14eagWg4RquXKkHDAAH
	876PtGe1jd9wHojYMuFhHuoAOIA8m7PZC1g9VlVwdgbCq1o40ugYsJM+NHnnjcaDAoy4qPCkL4qnq
	EeDLEm8s+pHeKNsZnP3MGVSKeWzhzuB0AuQAFQtcyDiohcHCU64ZfW7hLCg9VeLN+QPE+Ni55cN/s
	fUkOkXNJrhOdogdtbcIoko1JiyN10s2/5ysoScgvjaz82+gBPt+ka58D8HRxKies4Nel0hvhIpGkh
	0CVS6TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPclh-0000000CWQM-1OKw;
	Thu, 12 Jun 2025 07:54:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcH9-0000000CR6Q-1dff
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:23:04 +0000
X-UUID: 10a14148475e11f09eb0dd999d3936bf-20250612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nsUuIaqnM98AXc3sk5GAF68VDIKR4aTmuSKr+dEPhZ8=;
	b=BsABS+42ewliRqlZjkm0YslDK6H59m1Fb2NFb+63lreKfH0qTYCMsxyTX1o6ymI7Qn8L6jWLkmOJw3VbilQRddFZUFxet+LBvDZKOrEug2o4Zb/Rpz+G8A4fE0Yh0pLlPjVGm5GLZzldLms0e0sBi7M8Pv5r9z4hqQrGShS1+qs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:691df753-57ae-4dbe-8862-2cb244afaff4,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:09905cf,CLOUDID:68889a58-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 10a14148475e11f09eb0dd999d3936bf-20250612
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1453571131; Thu, 12 Jun 2025 00:22:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 12 Jun 2025 15:22:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 12 Jun 2025 15:22:54 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Hao Qin
	<Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v2] Bluetooth: mediatek: add gpio pin to reset bt
Date: Thu, 12 Jun 2025 15:22:30 +0800
Message-ID: <20250612072230.12537-1-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_002303_441534_2019E2D0 
X-CRM114-Status: GOOD (  26.70  )
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

This V2 patch provides two methods btmtk_reset_by_gpio,
btmtk_reset_by_gpio_work for mediatek controller,
it has been tested locally many times and can reset normally.

The pin is configured in dts files, bluetooth is reset by pulling
the pin, when exception or coredump occurs, the above methods will
be used to reset the bluetooth, if the pin is not found, it also can
reset bluetooth successfully by software reset.

Compared with the previously submitted version, the following
information has been revised in version V2
1)-Changed the capitalization of co-developer names,
   using the correct capitalization of abbreviations and full
   name, and corrected obvious spelling errors.
2)-Add a revision history.
3)-Remove the "BT Driver" in the prefix.
4)-Add the bt-binding document, include inforamtion related to reset
   pin and compatibility matching.
5)-Add a comment before the schedule_delayed_work function call,
   although schedule_delayed_work is asynchronous, there is no risk.
   Even if it is not completed within 200ms, it will only postpone
   the subsequent probe and will not have any impact.
6-)Add a comment before the btmtk_reset_by_gpio function call,
   if the compatibility filed or pin cannot be found in the dts
   files, it can still reset bluetooth using software reset.

Co-developed-by Hao Qin <hao.qin@mediatek.com>
Co-developed-Chris Lu <chris.lu@mediatek.com>
Co-developed-Jiande Lu <jiande.lu@mediatek.com>
Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
---
 .../bluetooth/mediatek,mt7925-bluetooth.yaml  | 54 +++++++++++++++
 drivers/bluetooth/btmtk.c                     | 69 +++++++++++++++++++
 drivers/bluetooth/btmtk.h                     |  5 ++
 3 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
new file mode 100644
index 000000000000..bcdb46effdba
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7925-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7925 Bluetooth
+
+maintainers:
+  - Zhangchao Zhang <zhangchao.zhang@mediatek.com>
+
+description:
+  7925 uses the USB bus to communicate with the host.
+  Two methods are used to reset Bluetooth.
+  When Bluetooth crashes or core dumps,
+  the pin will be pulled low, then held for 200ms,
+  and then pulled high again before next probe.
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7925-bluetooth
+
+  reg:
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      An active-high reset pin for the Bluetooth core;
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    &xhci0 {
+      vbus-supply = <&pp5000_usb>;
+      usb2-lpm-disable;
+
+      status = "okay";
+
+      bt_reset: bt-reset{
+        compatible = "mediatek,usb-bluetooth";
+        reset-gpios = <&pio 248 GPIO_ACTIVE_HIGH>;
+      };
+    };
\ No newline at end of file
diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 4390fd571dbd..3e5f3ca6f0d5 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -6,6 +6,8 @@
 #include <linux/firmware.h>
 #include <linux/usb.h>
 #include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/unaligned.h>
 
 #include <net/bluetooth/bluetooth.h>
@@ -109,6 +111,65 @@ static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
 	}
 }
 
+static void btmtk_reset_by_gpio_work(struct work_struct *work)
+{
+	struct btmtk_reset_gpio *reset_gpio_data =
+			container_of(work, struct btmtk_reset_gpio, reset_work.work);
+
+	gpio_direction_output(reset_gpio_data->gpio_number, 1);
+	kfree(reset_gpio_data);
+}
+
+static int btmtk_reset_by_gpio(struct hci_dev *hdev)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+	struct btmtk_reset_gpio *reset_gpio_data;
+	struct device_node *node;
+	int reset_gpio_number;
+
+	node = of_find_compatible_node(NULL, NULL, "mediatek,usb-bluetooth");
+	if (node) {
+		reset_gpio_number = of_get_named_gpio(node, "reset-gpios", 0);
+		if (!gpio_is_valid(reset_gpio_number)) {
+			bt_dev_warn(hdev, "invalid reset GPIO, use software reset");
+			return -EINVAL;
+		}
+	} else {
+		bt_dev_warn(hdev, "no reset GPIO, use software reset");
+		return -ENODEV;
+	}
+
+	/* Toggle the hard reset line. The Mediatek device is going to
+	 * yank itself off the USB and then replug. The cleanup is handled
+	 * correctly on the way out (standard USB disconnect), and the new
+	 * device is detected cleanly and bound to the driver again like
+	 * it should be.
+	 */
+
+	if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &data->flags)) {
+		bt_dev_err(hdev, "last reset failed? Not resetting again");
+		return 0;
+	}
+
+	reset_gpio_data = kzalloc(sizeof(*reset_gpio_data), GFP_KERNEL);
+	if (!reset_gpio_data)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&reset_gpio_data->reset_work, btmtk_reset_by_gpio_work);
+	reset_gpio_data->gpio_number = reset_gpio_number;
+
+	gpio_direction_output(reset_gpio_number, 0);
+
+	/* It requires 200ms for mtk bt chip to do reset,
+	 * although Schedule_delayed_work is asynchronous,
+	 * it is risk-free. If it is not completed in 200ms,
+	 * it will only postpone the next probe, which will
+	 * only make the probe run later. There is no other risk.
+	 */
+	schedule_delayed_work(&reset_gpio_data->reset_work, msecs_to_jiffies(200));
+	return 0;
+}
+
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor)
 {
@@ -364,6 +425,14 @@ void btmtk_reset_sync(struct hci_dev *hdev)
 	struct btmtk_data *reset_work = hci_get_priv(hdev);
 	int err;
 
+	/* Toggle reset gpio if the platform provieds one,
+	 * if the compatibility field or pin cannot be found
+	 * in the dts files, it can still reset bluetooth using
+	 * software reset.
+	 */
+	err = btmtk_reset_by_gpio(hdev);
+	if (!err)
+		return;
 	hci_dev_lock(hdev);
 
 	err = hci_cmd_sync_queue(hdev, reset_work->reset_sync, NULL, NULL);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 5df7c3296624..8a265ce367d1 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -179,6 +179,11 @@ struct btmtk_data {
 	spinlock_t isorxlock;
 };
 
+struct btmtk_reset_gpio {
+	struct delayed_work reset_work;
+	int gpio_number;
+};
+
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
 				   struct btmtk_hci_wmt_params *);
 
-- 
2.46.0


