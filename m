Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE91C2BB48
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 18:13:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B8A62395A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 18:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B8A62395A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=It4Ry2nMJf8hK590Mr9VYcKNinrbbk/iW80otPA8Sk4=; b=2DstNN9W9ZMe5huPktoiQ+Qp9
	JbU95OUrK9+gHxUHUIHfhKNDw40yl/ejFTX80HBYuO6Fipaxo6YOfSVDwigcOKG4T4jXn1OpjTEUF
	spOe9tUzPNiNMVCtH9OIlMOVvgklvPEmLgewg7NygZLndv2TUKqCWmuMX9Fyot3L+N5oSqEsWOYP2
	sUxBcSJcv6jmVRlhAkAsLQGzwO54eJpeY5Jh0TT12m7e6B+QoV9ZVZfhFYZDd5G0wirdE7nGP4ttI
	mPGNU1IMkVc5cM4Bwx5wMPTWgbJ6pLP7D60zfScfUaWQO6+89o7LSlvfleGxPvaSyLEc3prAYn9zP
	aLZ2xiP7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpxma-00051p-Gg; Thu, 17 Dec 2020 18:13:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpxmV-0004xx-DW
 for linux-mediatek@lists.infradead.org; Thu, 17 Dec 2020 18:13:41 +0000
X-UUID: 0891d4abcceb402aa47a3dab1603b6c9-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GzXUlHBSrdgiClrttciAH9FV9hz/CAYG6mNWEVBsigM=; 
 b=cl72ZXo7ativqphjcYmSbIwLW5IN1O/FV0Px9LELXwt5X3MtXugvUVsyWR0SjVUxk3fiQW/7Yp4m1vh3g1H7gv6MuVpt+QoUx7oUcwxq+3XrfW3dKxbn3wj/XJe5ptCfV6RUTkhVAGNsflIYbX33asShwqgrjZpf43nq/0bqEi4=;
X-UUID: 0891d4abcceb402aa47a3dab1603b6c9-20201217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 94565286; Thu, 17 Dec 2020 10:13:36 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 10:13:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 02:13:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Dec 2020 02:13:24 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v3 8/8] mt76: mt7921: add debugfs support
Date: Fri, 18 Dec 2020 02:13:21 +0800
Message-ID: <89fc8a716d5a40063d55783c3ef52a2952c22850.1608227863.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1608227863.git.objelf@gmail.com>
References: <cover.1608227863.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_131339_678426_BBE5A729 
X-CRM114-Status: GOOD (  21.05  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add debugfs support to dump driver statistics and hardware details.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/Makefile    |   2 +-
 .../wireless/mediatek/mt76/mt7921/debugfs.c   | 178 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   2 +-
 3 files changed, 180 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
index dc3c05c389f2..daac64fc2cc0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -2,4 +2,4 @@
 
 obj-$(CONFIG_MT7921E) += mt7921e.o
 
-mt7921e-y := pci.o mcu.o mac.o dma.o eeprom.o main.o init.o
+mt7921e-y := pci.o mcu.o mac.o dma.o eeprom.o main.o init.o debugfs.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
new file mode 100644
index 000000000000..9cdeb14cc933
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
+#include "mt7921.h"
+#include "eeprom.h"
+
+static int
+mt7921_fw_debug_set(void *data, u64 val)
+{
+	struct mt7921_dev *dev = data;
+
+	dev->fw_debug = (u8)val;
+
+	mt7921_mcu_fw_log_2_host(dev, dev->fw_debug);
+
+	return 0;
+}
+
+static int
+mt7921_fw_debug_get(void *data, u64 *val)
+{
+	struct mt7921_dev *dev = data;
+
+	*val = dev->fw_debug;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug, mt7921_fw_debug_get,
+			 mt7921_fw_debug_set, "%lld\n");
+
+static void
+mt7921_ampdu_stat_read_phy(struct mt7921_phy *phy,
+			   struct seq_file *file)
+{
+	struct mt7921_dev *dev = file->private;
+	int bound[15], range[4], i;
+
+	if (!phy)
+		return;
+
+	/* Tx ampdu stat */
+	for (i = 0; i < ARRAY_SIZE(range); i++)
+		range[i] = mt76_rr(dev, MT_MIB_ARNG(0, i));
+
+	for (i = 0; i < ARRAY_SIZE(bound); i++)
+		bound[i] = MT_MIB_ARNCR_RANGE(range[i / 4], i) + 1;
+
+	seq_printf(file, "\nPhy0\n");
+
+	seq_printf(file, "Length: %8d | ", bound[0]);
+	for (i = 0; i < ARRAY_SIZE(bound) - 1; i++)
+		seq_printf(file, "%3d -%3d | ",
+			   bound[i] + 1, bound[i + 1]);
+
+	seq_puts(file, "\nCount:  ");
+	for (i = 0; i < ARRAY_SIZE(bound); i++)
+		seq_printf(file, "%8d | ", dev->mt76.aggr_stats[i]);
+	seq_puts(file, "\n");
+
+	seq_printf(file, "BA miss count: %d\n", phy->mib.ba_miss_cnt);
+}
+
+static int
+mt7921_tx_stats_read(struct seq_file *file, void *data)
+{
+	struct mt7921_dev *dev = file->private;
+	int stat[8], i, n;
+
+	mt7921_ampdu_stat_read_phy(&dev->phy, file);
+
+	/* Tx amsdu info */
+	seq_puts(file, "Tx MSDU stat:\n");
+	for (i = 0, n = 0; i < ARRAY_SIZE(stat); i++) {
+		stat[i] = mt76_rr(dev,  MT_PLE_AMSDU_PACK_MSDU_CNT(i));
+		n += stat[i];
+	}
+
+	for (i = 0; i < ARRAY_SIZE(stat); i++) {
+		seq_printf(file, "AMSDU pack count of %d MSDU in TXD: 0x%x ",
+			   i + 1, stat[i]);
+		if (n != 0)
+			seq_printf(file, "(%d%%)\n", stat[i] * 100 / n);
+		else
+			seq_puts(file, "\n");
+	}
+
+	return 0;
+}
+
+static int
+mt7921_tx_stats_open(struct inode *inode, struct file *f)
+{
+	return single_open(f, mt7921_tx_stats_read, inode->i_private);
+}
+
+static const struct file_operations fops_tx_stats = {
+	.open = mt7921_tx_stats_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+	.owner = THIS_MODULE,
+};
+
+static int
+mt7921_queues_acq(struct seq_file *s, void *data)
+{
+	struct mt7921_dev *dev = dev_get_drvdata(s->private);
+	int i;
+
+	for (i = 0; i < 16; i++) {
+		int j, acs = i / 4, index = i % 4;
+		u32 ctrl, val, qlen = 0;
+
+		val = mt76_rr(dev, MT_PLE_AC_QEMPTY(acs, index));
+		ctrl = BIT(31) | BIT(15) | (acs << 8);
+
+		for (j = 0; j < 32; j++) {
+			if (val & BIT(j))
+				continue;
+
+			mt76_wr(dev, MT_PLE_FL_Q0_CTRL,
+				ctrl | (j + (index << 5)));
+			qlen += mt76_get_field(dev, MT_PLE_FL_Q3_CTRL,
+					       GENMASK(11, 0));
+		}
+		seq_printf(s, "AC%d%d: queued=%d\n", acs, index, qlen);
+	}
+
+	return 0;
+}
+
+static int
+mt7921_queues_read(struct seq_file *s, void *data)
+{
+	struct mt7921_dev *dev = dev_get_drvdata(s->private);
+	struct {
+		struct mt76_queue *q;
+		char *queue;
+	} queue_map[] = {
+		{ dev->mphy.q_tx[MT_TXQ_BE],	 "WFDMA0" },
+		{ dev->mt76.q_mcu[MT_MCUQ_WM],	 "MCUWM"  },
+		{ dev->mt76.q_mcu[MT_MCUQ_FWDL], "MCUFWQ" },
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(queue_map); i++) {
+		struct mt76_queue *q = queue_map[i].q;
+
+		if (!q)
+			continue;
+
+		seq_printf(s,
+			   "%s:	queued=%d head=%d tail=%d\n",
+			   queue_map[i].queue, q->queued, q->head,
+			   q->tail);
+	}
+
+	return 0;
+}
+
+int mt7921_init_debugfs(struct mt7921_dev *dev)
+{
+	struct dentry *dir;
+
+	dir = mt76_register_debugfs(&dev->mt76);
+	if (!dir)
+		return -ENOMEM;
+
+	debugfs_create_devm_seqfile(dev->mt76.dev, "queues", dir,
+				    mt7921_queues_read);
+	debugfs_create_devm_seqfile(dev->mt76.dev, "acq", dir,
+				    mt7921_queues_acq);
+	debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
+	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index e5ba2591a61d..446f76bbfd21 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -231,7 +231,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
 
 	ieee80211_queue_work(mt76_hw(dev), &dev->init_work);
 
-	return 0;
+	return mt7921_init_debugfs(dev);
 }
 
 void mt7921_unregister_device(struct mt7921_dev *dev)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
