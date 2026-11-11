Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C61606A320
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 05:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQy1ioyk;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LHP+nQZr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6Of0FLLvErHmONV3gxc2SvsJn1KTVIFkSTvZnTLnZLQ=; b=lQy1ioykKJcqM1lueV3bRahmyD
	KGyzCp6MwckxuD3dvfZLwwgudmN+yaKC31Bdkj8i7oPqh2Hc5MJLvHlVrWK0upaUk1fPYQW8qFu60
	bp0bQA+QnhshZn7+T9vEPRuoKGiyevWhc+c3K4Lc0jAQ5Kd8xH7g9nZRUSOegzsuQuhuFhKskps0n
	EjsAMY1fcbxnkMbXE7h+pIM8WOP+V3x4eP2vkG/Cvx5Q5+tznG7a31KSEATy6oy/CH+m9rpZcBau3
	tVi8lVdjZx7v3deUKsmzVwNeQ++KGaqJphJ6tiF5IUJhXisUD+TUV+/TEKs74RizhxcXB5R81zxaS
	Vi/2BhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1C4-00000005gQd-0ms9;
	Wed, 11 Nov 2026 05:48:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1C1-00000005gPz-22oZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 05:48:22 +0000
X-UUID: 7d1f14eadd9311f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6Of0FLLvErHmONV3gxc2SvsJn1KTVIFkSTvZnTLnZLQ=;
	b=LHP+nQZr5BIGy4LrX3I7h/LA4GLimlyXdqxnSNWwIVOFk144yVu/EKaYfySxSuUBbu1m3FHyW7SX8kKjKtoj3bUDJCULmHfAwpydUorNPmgbKkxfD3g0LtFAD8ejtBt826OyOsTYRrjdYJB39n2ZyqhRlALTtTSzHah2KQXncy0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ae2a7ae0-8e3c-4f26-9981-5e9737a5c365,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ef75b130-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7d1f14eadd9311f1acbe4559397dec65-20261110
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 528356855; Tue, 10 Nov 2026 22:48:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 13:48:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 13:48:13 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Shengwei.Lu@mediatek.com>, <jb.tsai@mediatek.com>,
	Shengwei Lu <shengwei.lu@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: mt792x: add ICS logging framework to the shared library
Date: Wed, 11 Nov 2026 13:48:10 +0800
Message-ID: <20261111054811.845536-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_214821_575727_AE7CF91B 
X-CRM114-Status: GOOD (  26.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengwei Lu <shengwei.lu@mediatek.com>

Introduce the ICS logging framework in the shared mt792x library so
the mt792x driver family can reuse a single
implementation instead of carrying per-chip duplicates.

The shared pieces are:

- mt792x_ics.c: the ICS MCU enable command, selecting UNI
  (MT7925/MT7928) command path by chip; the RX
  log header/aggregation; the ics_worker that drains the queue to a
  file; and the enable/disable bookkeeping.
- mt792x.h: per-device ics_worker, ics_q, fwlog_seq, ics and path_str
  fields, the rx_ics ring on mt792x_dma_layout and the
  rx.wm4_complete_mask on mt792x_irq_map, plus the exported ICS helpers.
- mt792x_debugfs.c: mt792x_ics_get/set, exported so each driver only
  needs to define its own fops_ics.
- mt792x_dma.c: ICS RX ring allocation, the ICS napi schedule in the
  irq tasklet and rx-poll-complete mask, and the worker kick from
  mt792x_poll_rx.
- mt76_connac.h, mt76_connac_mcu.h, mt76.h: PKT_TYPE_ICS,
  MCU_UNI_CMD_ICS and MT_RXQ_ICS.

The ICS log file is created under /tmp with a timestamped name and
appended to by the worker; enabling purges stale skbs so a new session
never inherits old data.

Signed-off-by: Shengwei Lu <shengwei.lu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/Makefile   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../net/wireless/mediatek/mt76/mt76_connac.h  |   1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  17 ++
 .../wireless/mediatek/mt76/mt792x_debugfs.c   |  26 +++
 .../net/wireless/mediatek/mt76/mt792x_dma.c   |  26 +++
 .../net/wireless/mediatek/mt76/mt792x_ics.c   | 206 ++++++++++++++++++
 8 files changed, 279 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt792x_ics.c

diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index cacdd2b13d05..a6ff1b8d70ac 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -38,7 +38,7 @@ mt76x02-usb-y := mt76x02_usb_mcu.o mt76x02_usb_core.o
 mt76-connac-lib-y := mt76_connac_mcu.o mt76_connac_mac.o mt76_connac3_mac.o
 
 mt792x-lib-y := mt792x_core.o mt792x_mac.o mt792x_trace.o \
-		mt792x_debugfs.o mt792x_dma.o
+		mt792x_debugfs.o mt792x_dma.o mt792x_ics.o
 mt792x-lib-$(CONFIG_ACPI) += mt792x_acpi_sar.o
 mt792x-usb-y := mt792x_usb.o
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 477d33a0022d..bbcf1f1a5922 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -151,6 +151,7 @@ enum mt76_rxq_id {
 	MT_RXQ_RRO_RXDMAD_C,
 	MT_RXQ_NPU0,
 	MT_RXQ_NPU1,
+	MT_RXQ_ICS,
 	__MT_RXQ_MAX
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index b1677ca24703..c699759fd37f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -16,6 +16,7 @@ enum rx_pkt_type {
 	PKT_TYPE_TXRX_NOTIFY,
 	PKT_TYPE_RX_EVENT,
 	PKT_TYPE_NORMAL_MCU,
+	PKT_TYPE_ICS	= 0x0c,
 	PKT_TYPE_RX_FW_MONITOR	= 0x0c,
 	PKT_TYPE_TXRX_NOTIFY_V0	= 0x18,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index bb98a6eacac4..90788667278b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1353,6 +1353,7 @@ enum {
 	MCU_UNI_CMD_FIXED_RATE_TABLE = 0x40,
 	MCU_UNI_CMD_RSSI_MONITOR = 0x41,
 	MCU_UNI_CMD_TESTMODE_CTRL = 0x46,
+	MCU_UNI_CMD_ICS = 0x49,
 	MCU_UNI_CMD_NAN	= 0x56,
 	MCU_UNI_CMD_RRO = 0x57,
 	MCU_UNI_CMD_OFFCH_SCAN_CTRL = 0x58,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index a7d71e007da0..e4fc3fc7c873 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -253,6 +253,7 @@ struct mt792x_irq_map {
 		u32 data_complete_mask;
 		u32 wm_complete_mask;
 		u32 wm2_complete_mask;
+		u32 wm4_complete_mask;
 	} rx;
 };
 
@@ -269,6 +270,7 @@ struct mt792x_dma_layout {
 	struct mt792x_dma_ring tx_done;
 	struct mt792x_dma_ring rx_data;
 	struct mt792x_dma_ring rx_mcu;
+	struct mt792x_dma_ring rx_ics;
 };
 
 #define mt792x_dma_ring(_qid, _n_desc, _ring_base) \
@@ -322,6 +324,13 @@ struct mt792x_dev {
 	struct work_struct usb_reset_work;
 	atomic_t usb_reset_pending;
 
+	struct mt76_worker ics_worker;
+	struct sk_buff_head ics_q;
+	u16 fwlog_seq;
+	u64 ics;
+	bool ics_en;
+	char path_str[28];
+
 	u8 fw_debug;
 	u8 fw_features;
 
@@ -643,6 +652,14 @@ mt792x_skb_add_usb_sdio_hdr(struct mt792x_dev *dev, struct sk_buff *skb,
 	put_unaligned_le32(hdr, skb_push(skb, sizeof(hdr)));
 }
 
+/* ICS */
+void mt792x_ics_worker(struct mt76_worker *w);
+void mt792x_ics_log(struct mt792x_dev *dev, struct sk_buff *skb);
+void mt792x_mcu_rx_ics(struct mt792x_dev *dev, struct sk_buff *skb);
+int mt792x_mcu_enable_ics(struct mt792x_dev *dev, u64 val);
+int mt792x_ics_set(void *data, u64 val);
+int mt792x_ics_get(void *data, u64 *val);
+
 int __mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792xe_mcu_fw_pmctrl(struct mt792x_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c b/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
index 65c37e0cef8f..7c140f1293c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_debugfs.c
@@ -166,3 +166,29 @@ int mt792x_pm_idle_timeout_get(void *data, u64 *val)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mt792x_pm_idle_timeout_get);
+
+int
+mt792x_ics_set(void *data, u64 val)
+{
+	struct mt792x_dev *dev = data;
+
+	dev->ics = val;
+
+	mt792x_mutex_acquire(dev);
+	mt792x_mcu_enable_ics(dev, val);
+	mt792x_mutex_release(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_ics_set);
+
+int
+mt792x_ics_get(void *data, u64 *val)
+{
+	struct mt792x_dev *dev = data;
+
+	*val = dev->ics;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_ics_get);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index e74b95fdc767..c2ddb7d23e53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -66,6 +66,9 @@ void mt792x_irq_tasklet(unsigned long data)
 	if (intr & irq_map->rx.wm2_complete_mask)
 		napi_schedule(&dev->mt76.napi[MT_RXQ_MCU_WA]);
 
+	if (is_mt7928(&dev->mt76) && (intr & irq_map->rx.wm4_complete_mask))
+		napi_schedule(&dev->mt76.napi[MT_RXQ_ICS]);
+
 	if (intr & irq_map->rx.data_complete_mask)
 		napi_schedule(&dev->mt76.napi[MT_RXQ_MAIN]);
 }
@@ -80,6 +83,8 @@ void mt792x_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q)
 		mt76_connac_irq_enable(mdev, irq_map->rx.data_complete_mask);
 	else if (q == MT_RXQ_MCU_WA)
 		mt76_connac_irq_enable(mdev, irq_map->rx.wm2_complete_mask);
+	else if (is_mt7928(&dev->mt76) && q == MT_RXQ_ICS)
+		mt76_connac_irq_enable(mdev, irq_map->rx.wm4_complete_mask);
 	else
 		mt76_connac_irq_enable(mdev, irq_map->rx.wm_complete_mask);
 }
@@ -148,6 +153,23 @@ int mt792x_dma_alloc_queues(struct mt792x_dev *dev,
 			       layout->rx_data.n_desc,
 			       MT_RX_BUF_SIZE,
 			       layout->rx_data.ring_base);
+	if (ret)
+		return ret;
+
+	/* ICS */
+	if (is_mt7925(&dev->mt76))
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_MCU_WA],
+				       layout->rx_ics.qid,
+				       layout->rx_ics.n_desc,
+				       MT_RX_BUF_SIZE,
+				       layout->rx_ics.ring_base);
+
+	if (is_mt7928(&dev->mt76))
+		ret = mt76_queue_alloc(dev, &dev->mt76.q_rx[MT_RXQ_ICS],
+				       layout->rx_ics.qid,
+				       layout->rx_ics.n_desc,
+				       MT_RX_BUF_SIZE,
+				       layout->rx_ics.ring_base);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mt792x_dma_alloc_queues);
@@ -549,6 +571,10 @@ int mt792x_poll_rx(struct napi_struct *napi, int budget)
 	done = mt76_dma_rx_poll(napi, budget);
 	mt76_connac_pm_unref(&dev->mphy, &dev->pm);
 
+	/* ICS */
+	if ((dev->ics >> 32) & 0xf)
+		mt76_worker_schedule(&dev->ics_worker);
+
 	return done;
 }
 EXPORT_SYMBOL_GPL(mt792x_poll_rx);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_ics.c b/drivers/net/wireless/mediatek/mt76/mt792x_ics.c
new file mode 100644
index 000000000000..18c9dec03d0e
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_ics.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2026 MediaTek Inc. */
+#include <linux/firmware.h>
+#include <linux/fs.h>
+#include <linux/inet.h>
+#include <linux/timekeeping.h>
+#include <linux/time.h>
+#include "mt792x.h"
+#include "mt76.h"
+
+#define MT792x_ICS_LOG_MAGIC_NUM   0x44D9C99A
+
+enum {
+	UNI_ICS_SETTING = 0,
+};
+
+struct mt792x_ics_log_hdr {
+	u32 magic_num;
+	u8  ver;
+	u8  rsv;
+	u16 seq_no;
+	u32 timestamp;
+	u16 msg_id;
+	u16 len;
+};
+
+struct mt792x_ics_agg_hdr {
+	u16 rx_byte_cnt;
+	u16 frame_cnt:5;
+	u16 rsv1:6;
+	u16 pkt_type:5;
+	u16 rsv2;
+	u16 pse_fid;
+};
+
+struct mt792x_ics_conf {
+	u8 cmd_ver;
+	u8 action;
+	u16 cmd_len;
+	u8 module;
+	u8 filter;
+	u8 operation;
+	u8 pading0;
+	u16 condition[7];
+	u8 pading1[62];
+};
+
+struct mt792x_ics_req {
+	u8 rsv[4];
+	u8 tlv_buffer[];
+} __packed;
+
+int mt792x_mcu_enable_ics(struct mt792x_dev *dev, u64 val)
+{
+	struct mt76_phy *phy = &dev->mphy;
+	struct mt76_dev *mdev = phy->dev;
+	struct mt792x_ics_conf conf;
+	struct mt792x_ics_req *hdr;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+	int max_len, err;
+	struct timespec64 ts;
+	struct tm timestamp;
+	char date_str[15];
+
+	memset(&conf, 0, sizeof(conf));
+
+	if (((val >> 36) & 0xf) != 2) {
+		dev_err(mdev->dev, "ICS cmd format error\n");
+		return 0;
+	}
+
+	ktime_get_real_ts64(&ts);
+	time64_to_tm(ts.tv_sec, (-sys_tz.tz_minuteswest * 60), &timestamp);
+
+	snprintf(date_str, sizeof(date_str), "%04ld%02d%02d%02d%02d%02d",
+		 timestamp.tm_year + 1900, timestamp.tm_mon + 1,
+		 timestamp.tm_mday, timestamp.tm_hour, timestamp.tm_min,
+		 timestamp.tm_sec);
+
+	conf.module = (val >> 36) & 0xf;
+	conf.action = (val >> 32) & 0xf;
+	conf.filter = (val >> 28) & 0xf;
+	conf.operation = (val >> 24) & 0xf;
+	conf.condition[0] = (val >> 20) & 0xf;
+	conf.condition[1] = (val >> 16) & 0xf;
+	conf.condition[2] = (val >> 12) & 0xf;
+	conf.condition[3] = (val >> 8) & 0xf;
+	conf.condition[4] = (val >> 4) & 0xf;
+	conf.condition[5] = (val >> 0) & 0xf;
+	conf.condition[6] = 0;
+	max_len = sizeof(*hdr) + sizeof(conf) + sizeof(*tlv);
+	skb = mt76_mcu_msg_alloc(mdev, NULL, max_len);
+
+	if (!skb)
+		return -ENOMEM;
+
+	if (is_mt7928(mdev) || is_mt7925(mdev)) {
+		hdr = (struct mt792x_ics_req *)skb_put(skb, sizeof(*hdr));
+		tlv = mt76_connac_mcu_add_tlv(skb, UNI_ICS_SETTING, (sizeof(conf) + sizeof(*tlv)));
+		memcpy(&tlv->data, &conf, sizeof(conf));
+		err = mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(ICS), false);
+	} else {
+		return 0;
+	}
+
+	if (err < 0)
+		return err;
+
+	if (conf.action && !dev->ics_en) {
+		skb_queue_purge(&dev->ics_q);
+		mt76_worker_enable(&dev->ics_worker);
+		snprintf(dev->path_str, sizeof(dev->path_str), "/tmp/ICS_%s.bin", date_str);
+		dev_info(mdev->dev, "ICS file path=%s enable=0x%llx\n", dev->path_str, val);
+		dev->ics_en = true;
+	} else if (!conf.action && dev->ics_en) {
+		if (!skb_queue_empty(&dev->ics_q))
+			mt76_worker_schedule(&dev->ics_worker);
+		mt76_worker_disable(&dev->ics_worker);
+		dev_info(mdev->dev, "ICS file saved path=%s\n", dev->path_str);
+		memset(dev->path_str, 0, sizeof(dev->path_str));
+		skb_queue_purge(&dev->ics_q);
+		dev->ics_en = false;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_mcu_enable_ics);
+
+static int fw_log_to_file(struct mt792x_dev *dev, u8 *data, u32 len)
+{
+	struct file *p = NULL;
+	loff_t pos = 0;
+
+	p = filp_open(dev->path_str, O_WRONLY | O_CREAT | O_APPEND, 0600);
+	if (IS_ERR(p))
+		return -1;
+
+	kernel_write(p, data, (size_t)len, &pos);
+	filp_close(p, NULL);
+	return 0;
+}
+
+void mt792x_ics_log(struct mt792x_dev *dev, struct sk_buff *skb)
+{
+	struct mt792x_ics_agg_hdr *ics_agg_hdr;
+	struct mt792x_ics_log_hdr *ics_log_hdr;
+	u32	len;
+	u8 *recv_buff;
+
+	if (skb->len < sizeof(*ics_agg_hdr)) {
+		dev_kfree_skb(skb);
+		return;
+	}
+
+	ics_agg_hdr = (struct mt792x_ics_agg_hdr *)skb->data;
+	len = ics_agg_hdr->rx_byte_cnt + sizeof(struct mt792x_ics_log_hdr);
+
+	/* rx_byte_cnt comes from the firmware/aggregation header, do not
+	 * trust it beyond the skb that was actually received
+	 */
+	if (len > skb->len + sizeof(struct mt792x_ics_log_hdr)) {
+		dev_kfree_skb(skb);
+		return;
+	}
+
+	recv_buff = kmalloc(len, GFP_ATOMIC);
+
+	if (recv_buff) {
+		memset(recv_buff, 0, len);
+		/* prepare ICS header */
+		ics_log_hdr = (struct mt792x_ics_log_hdr *)recv_buff;
+		ics_log_hdr->magic_num = MT792x_ICS_LOG_MAGIC_NUM;
+		ics_log_hdr->ver = 1;
+		ics_log_hdr->rsv = 0;
+		ics_log_hdr->seq_no = dev->fwlog_seq++;
+		ics_log_hdr->timestamp = 0;
+		ics_log_hdr->msg_id = PKT_TYPE_ICS;
+		ics_log_hdr->len = ics_agg_hdr->rx_byte_cnt;
+		/* prepare ICS frame */
+		memcpy(recv_buff + sizeof(struct mt792x_ics_log_hdr),
+		       ics_agg_hdr, ics_agg_hdr->rx_byte_cnt);
+		fw_log_to_file(dev, recv_buff, len);
+		kfree(recv_buff);
+	}
+
+	dev_kfree_skb(skb);
+}
+EXPORT_SYMBOL_GPL(mt792x_ics_log);
+
+void mt792x_ics_worker(struct mt76_worker *w)
+{
+	struct sk_buff *skb;
+	struct mt792x_dev *dev = container_of(w, struct mt792x_dev,
+					      ics_worker);
+
+	while ((skb = skb_dequeue(&dev->ics_q)) != NULL)
+		mt792x_ics_log(dev, skb);
+}
+EXPORT_SYMBOL_GPL(mt792x_ics_worker);
+
+void mt792x_mcu_rx_ics(struct mt792x_dev *dev, struct sk_buff *skb)
+{
+	skb_queue_tail(&dev->ics_q, skb);
+}
+EXPORT_SYMBOL_GPL(mt792x_mcu_rx_ics);
-- 
2.45.2


