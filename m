Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486B6C5AD5A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O31ocQQAnQ4mYd+Qp8hNq92yJLdT9vjFAKxAhayU89c=; b=xzejsFnMVg3JiS00Ka+HlOx/sp
	tVqpRtKUlEsDRJ79IZF2XXzmuOT74+kFU9WAfRfF1HeL3r24bjYILDvdUKxJH/BDqXRxQGIyqG0TJ
	TbJwCGTRGddExcxxCU7wZUXLomuNLP+OaZ9veO60nEum8Q0Zn+9/CDzyZhEFSOS+ZTOLgQqO6zKcT
	U0scrFxRm766Q/i+3z6x8GxSyx8M62Wj3LzhxYCGr5R2W7DwT2JfGQI1M63oeDqNxvNBXLYZk4K2z
	xR1uZTZHzx0VwhjzETasWXvHho2jSZu5+KpaJq8ylr74vSw+IkSdHxVgpBob5vfDEDA/qcvLs4b1e
	tURWPFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFOU-0000000Atwe-0ZkE;
	Mon, 10 Aug 2026 02:05:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFOR-0000000AtwJ-3Ond
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 02:05:36 +0000
X-UUID: f68ca374945f11f1afed4741b24580c9-20260809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=O31ocQQAnQ4mYd+Qp8hNq92yJLdT9vjFAKxAhayU89c=;
	b=NnFqOE20PqoWzHYX0c9FWirraNrsz83JJdpSVBDZr7Wo1A0KeNzYyDyDSBeYMlgSWdADDBqgVvL1JGVOvfsP7VBtfmdAhQcYJI9z5TBAEjD1QMv3m8N9NOrvfNqsLGOH90r4UkCYofBFVrW6WbYvcC87JPfEZLA/U5OSt1De/Xo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6196b637-740a-42ff-af11-7ac719c96a91,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:82d38bc8-5e9e-4077-a2b1-0c1cd7bb35dd,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f68ca374945f11f1afed4741b24580c9-20260809
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 301544351; Sun, 09 Aug 2026 19:05:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 10 Aug 2026 10:05:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 10 Aug 2026 10:05:28 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <vick.cheng@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add coex_info debugfs for WiFi/BT coex
Date: Mon, 10 Aug 2026 10:05:26 +0800
Message-ID: <20260810020526.41492-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_190535_871539_44B0776F 
X-CRM114-Status: GOOD (  21.72  )
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

From: Vick Cheng <vick.cheng@mediatek.com>

This is FW MCU CMD API.
Add mt7925_mcu_chip_config_query() which sends the ASCII command as a
UNI query, walks the reply TLVs and copies the payload of the
UNI_CHIP_CONFIG_CHIP_CFG entry back to the caller along with its
response type. Expose it through a read-only 'coex_info' debugfs entry
that queries the firmware on every read, printing the reply as text or
as a hexdump depending on the reported type.

MCU_UNI_QUERY(CHIP_CONFIG) also needs the MCU_CMD_ACK option cleared in
mt7925_mcu_fill_message(), same as the set variant.

This gives a way to read the live WiFi/BT coex state on an upstream
kernel without a vendor tool. The entry is read-only and only issues the
command when read, so it costs nothing when unused, and the
mt7925_mcu_fill_message() change only matches the new query opcode, so
no existing command path changes behaviour.

Signed-off-by: Vick Cheng <vick.cheng@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 30 +++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 78 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  9 +++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  2 +
 4 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d01ff49de47a..9a5ea12b76c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -286,6 +286,34 @@ static int mt7925_chip_reset(void *data, u64 val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7925_chip_reset, "%lld\n");
 
+static int
+mt7925_coex_info(struct seq_file *s, void *data)
+{
+#define MT7925_CHIP_CONFIG_RESP_SIZE	320
+	struct mt792x_dev *dev = dev_get_drvdata(s->private);
+	u8 resp[MT7925_CHIP_CONFIG_RESP_SIZE], resp_type;
+	int i, ret;
+
+	mt792x_mutex_acquire(dev);
+	ret = mt7925_mcu_chip_config_query(dev, "coexBwcGetModeInfo 0",
+					   &resp_type, resp, sizeof(resp));
+	mt792x_mutex_release(dev);
+
+	if (ret < 0)
+		return ret;
+
+	if (!ret)
+		seq_puts(s, "no reply\n");
+	else if (resp_type == CHIP_CONFIG_TYPE_ASCII)
+		seq_printf(s, "%.*s\n", ret, resp);
+	else
+		for (i = 0; i < ret; i += 16)
+			seq_printf(s, "%04x: %*ph\n", i,
+				   min_t(int, 16, ret - i), resp + i);
+
+	return 0;
+}
+
 int mt7925_init_debugfs(struct mt792x_dev *dev)
 {
 	struct dentry *dir;
@@ -309,6 +337,8 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 	debugfs_create_file("idle-timeout", 0600, dir, dev,
 			    &fops_pm_idle_timeout);
 	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
+	debugfs_create_devm_seqfile(dev->mt76.dev, "coex_info", dir,
+				    mt7925_coex_info);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "runtime_pm_stats", dir,
 				    mt792x_pm_stats);
 	debugfs_create_file("deep-sleep", 0600, dir, dev, &fops_ds);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa29c486a455..e6316cea1865 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1160,6 +1160,81 @@ int mt7925_mcu_chip_config(struct mt792x_dev *dev, const char *cmd)
 				 &req, sizeof(req), false);
 }
 
+int mt7925_mcu_chip_config_query(struct mt792x_dev *dev, const char *cmd,
+				 u8 *resp_type, void *resp, u16 resp_size)
+{
+	u16 len = strlen(cmd);
+	struct {
+		u8 _rsv[4];
+		__le16 tag;
+		__le16 len;
+		struct mt76_connac_config config;
+	} __packed req = {
+		.tag = cpu_to_le16(UNI_CHIP_CONFIG_CHIP_CFG),
+		.len = cpu_to_le16(sizeof(req) - 4),
+		.config = {
+			.resp_type = 0,
+			.type = CHIP_CONFIG_TYPE_ASCII,
+			.data_size = cpu_to_le16(len),
+		},
+	};
+	const u16 hdr_len = sizeof(struct tlv) +
+			    offsetof(struct mt76_connac_config, data);
+	struct mt76_connac_config *cfg;
+	struct sk_buff *skb;
+	int ret;
+
+	if (!len || len >= sizeof(req.config.data))
+		return -EINVAL;
+
+	memcpy(req.config.data, cmd, len);
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_QUERY(CHIP_CONFIG),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	/* skip the fixed field of the event, the TLVs follow it */
+	if (skb->len < 4) {
+		ret = -EINVAL;
+		goto out;
+	}
+	skb_pull(skb, 4);
+
+	ret = -ENOENT;
+	while (skb->len >= sizeof(struct tlv)) {
+		struct tlv *tlv = (struct tlv *)skb->data;
+		u16 tlv_len = le16_to_cpu(tlv->len);
+		u16 data_size;
+
+		if (tlv_len < sizeof(*tlv) || tlv_len > skb->len)
+			break;
+
+		if (le16_to_cpu(tlv->tag) != UNI_CHIP_CONFIG_CHIP_CFG) {
+			skb_pull(skb, tlv_len);
+			continue;
+		}
+
+		if (tlv_len < hdr_len)
+			break;
+
+		cfg = (struct mt76_connac_config *)tlv->data;
+		data_size = le16_to_cpu(cfg->data_size);
+		if (data_size > tlv_len - hdr_len)
+			break;
+
+		*resp_type = cfg->resp_type;
+		ret = min_t(u16, data_size, resp_size);
+		memcpy(resp, cfg->data, ret);
+		break;
+	}
+
+out:
+	dev_kfree_skb(skb);
+
+	return ret;
+}
+
 int mt7925_mcu_set_deep_sleep(struct mt792x_dev *dev, bool enable)
 {
 	char cmd[16];
@@ -3772,7 +3847,8 @@ int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			uni_txd->option = MCU_CMD_UNI_EXT_ACK;
 
 		if (cmd == MCU_UNI_CMD(HIF_CTRL) ||
-		    cmd == MCU_UNI_CMD(CHIP_CONFIG))
+		    cmd == MCU_UNI_CMD(CHIP_CONFIG) ||
+		    cmd == MCU_UNI_QUERY(CHIP_CONFIG))
 			uni_txd->option &= ~MCU_CMD_ACK;
 
 		if (mcu_cmd == MCU_UNI_CMD_TESTMODE_CTRL ||
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..2cf3971d9853 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -119,6 +119,15 @@ enum {
 	UNI_CHIP_CONFIG_NIC_CAPA = 0x3,
 };
 
+/* type/resp_type of struct mt76_connac_config */
+enum {
+	CHIP_CONFIG_TYPE_WO_RESPONSE,
+	CHIP_CONFIG_TYPE_MEM8,
+	CHIP_CONFIG_TYPE_MEM32,
+	CHIP_CONFIG_TYPE_ASCII,
+	CHIP_CONFIG_TYPE_BINARY,
+};
+
 enum {
 	UNI_BAND_CONFIG_RADIO_ENABLE,
 	UNI_BAND_CONFIG_RTS_THRESHOLD = 0x08,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 321e732347f2..d0db5d8dae48 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -295,6 +295,8 @@ int mt7925_mcu_get_rx_rate(struct mt792x_phy *phy, struct ieee80211_vif *vif,
 int mt7925_mcu_fw_log_2_host(struct mt792x_dev *dev, u8 ctrl);
 void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb);
 int mt7925_mcu_chip_config(struct mt792x_dev *dev, const char *cmd);
+int mt7925_mcu_chip_config_query(struct mt792x_dev *dev, const char *cmd,
+				 u8 *resp_type, void *resp, u16 resp_size);
 int mt7925_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
 			    u8 bit_op, u32 bit_map);
 
-- 
2.45.2


