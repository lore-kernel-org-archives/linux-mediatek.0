Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1BCCA600A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TLtVv2LfsHmB7HEc3C7Hbb6jYgc0PRpuHTELpSc9Pwk=; b=FDTkR+0UJ6qdVgp1m+uKMhJb9p
	XAGiaAUERdNQjHS9Wbehe2UHp6ykJ8HhjAgo0q9N020iCKbzcsvmNrq9OIcb/vJIQ9SY4qgV05bo4
	boezN+VQMaZTZS1TEzE3Y0hw76SPaWupf2h4LJ1sY66a89w6HStOPCN++Cjbc+lqLAYkXZpd9V9wO
	9PfFItnUkrvJ05bnkpVB+Oddj71RCX6v1fFXlRlKRUUOa4hPRd54zK3y0NxlWB5nunpsFXo//N94m
	GZHUd10xfZLs2Qv8DMhe1ypBOr2IOTcs7F5cb9brzD7F3P7VLLqN8v1EP4FVSdLN1ng1X1rqa0Ey9
	SUJqKIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiTr-00000003jnA-2JMh;
	Thu, 08 Oct 2026 07:23:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiTp-00000003jmW-0Cxo
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 07:23:54 +0000
X-UUID: 32516f9ac2e911f1acbe4559397dec65-20261008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TLtVv2LfsHmB7HEc3C7Hbb6jYgc0PRpuHTELpSc9Pwk=;
	b=Ty/USdlnOqbSbqtQJXtq9ygVbNL0zlBBoYazQ+oJfi5RNdeBGAnGzvTlqLsuLyoAW9dwMTjRjrAX2LhHA5WZhd5bJ91x2Lo5EPnqp4GC5VojZNHHbGw7XpuGWsP9t2LhIvP/AbYrL05kB78TusmNn5QZio7h4pJuklW5dZKoaDo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:087cd3d4-a036-487f-8033-17408e6a0ab3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:119e1920-2f17-48f6-b8a0-2bb5971c52b4,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32516f9ac2e911f1acbe4559397dec65-20261008
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1070694014; Thu, 08 Oct 2026 00:23:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Oct 2026 15:23:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 8 Oct 2026 15:23:43 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <silver.chen@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925/mt7928: add get_roc debugfs dumps
Date: Thu, 8 Oct 2026 15:23:40 +0800
Message-ID: <20261008072340.357971-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_002353_105679_E702866D 
X-CRM114-Status: GOOD (  16.36  )
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

From: "Silver.Chen" <silver.chen@mediatek.com>

Add read-only debugfs entries to help debug ROC(CNM) status and OPCH info.
 - get ROC info: print roc info for debug,
   including MBMC enable/OPCH detail/ BSS info.

Usage (DIR=/sys/kernel/debug/ieee80211/phyX/mt76, X = phy index):
 - Print ROC info (MBMC state/OPCH info/BSS info):
     cat $DIR/roc_info

The UNI CMD definitions needed by these dumps are added to mt7925/regs.h.
The required structure are added to mt7925/mcu.h and mt7925/mcu.c.
- mt7925_roc_ch_info_tlv
- mt7925_roc_channel_info
- mt7925_roc_bss_info_tlv
- mt7925_roc_bss_info

Signed-off-by: Silver.Chen <silver.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 84 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 21 +++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 44 ++++++++++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  4 +
 4 files changed, 153 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d01ff49de47a..22db9e27fa53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -286,6 +286,88 @@ static int mt7925_chip_reset(void *data, u64 val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7925_chip_reset, "%lld\n");
 
+static int
+mt7925_roc_info(struct seq_file *s, void *data)
+{
+	struct mt792x_dev *dev = dev_get_drvdata(s->private);
+	struct mt7925_roc_ch_info_tlv *ch_tlv;
+	struct mt7925_roc_bss_info_tlv *bss_tlv;
+	struct mt7925_roc_channel_info *ch_info;
+	struct mt7925_roc_bss_info *bss_info;
+	struct sk_buff *skb;
+	bool dbdc_shown = false;
+	u8 *pos, *end;
+	int i, ret;
+
+	mt792x_mutex_acquire(dev);
+	ret = mt7925_mcu_get_roc_info(dev, &skb);
+	mt792x_mutex_release(dev);
+	if (ret)
+		return ret;
+
+	/* skb->data: 4-byte UNI event fixed header + TLVs */
+	pos = skb->data + 4;
+	end = skb->data + skb->len;
+
+	seq_puts(s, "\n[ROC Info]\n");
+
+	while (pos + sizeof(struct tlv) <= end) {
+		struct tlv *tlv = (struct tlv *)pos;
+		u16 tag = le16_to_cpu(tlv->tag);
+		u16 len = le16_to_cpu(tlv->len);
+
+		if (!len || pos + len > end)
+			break;
+
+		switch (tag) {
+		case UNI_EVENT_ROC_GET_CH_INFO:
+			if (len < sizeof(*ch_tlv))
+				break;
+			ch_tlv = (struct mt7925_roc_ch_info_tlv *)pos;
+			if (!dbdc_shown) {
+				seq_printf(s, "MBMC Mode : %s\n\n",
+					   ch_tlv->dbdc_enable ? "Enable" : "Disable");
+				dbdc_shown = true;
+			}
+			ch_info = (struct mt7925_roc_channel_info *)ch_tlv->ch_info;
+			seq_printf(s, "Band %u OPCH %u [", ch_tlv->dbdc_band,
+				   ch_tlv->op_ch_num);
+			for (i = 0; i < ch_tlv->op_ch_num; i++)
+				seq_printf(s, "%u%s", ch_info[i].pri_ch,
+					   i + 1 < ch_tlv->op_ch_num ? ", " : "");
+			seq_puts(s, "]\n");
+			break;
+
+		case UNI_EVENT_ROC_GET_BSS_INFO:
+			if (len < sizeof(*bss_tlv))
+				break;
+			bss_tlv = (struct mt7925_roc_bss_info_tlv *)pos;
+			bss_info = (struct mt7925_roc_bss_info *)bss_tlv->bss_info;
+			seq_puts(s, "\n");
+			for (i = 0; i < bss_tlv->bss_num; i++) {
+				if (!bss_info[i].inuse)
+					continue;
+				seq_printf(s, "BSS%d Inuse%u Act%u ConnStat%u [CH%3u][Band%u][TxNSS%u][RxNSS%u][LinkIdx%u]\n",
+					   i,
+					   bss_info[i].inuse,
+					   bss_info[i].active,
+					   bss_info[i].conn_state,
+					   bss_info[i].pri_ch,
+					   bss_info[i].dbdc_band,
+					   bss_info[i].op_tx_nss,
+					   bss_info[i].op_rx_nss,
+					   bss_info[i].link_idx);
+			}
+			break;
+		}
+
+		pos += len;
+	}
+
+	dev_kfree_skb(skb);
+	return 0;
+}
+
 int mt7925_init_debugfs(struct mt792x_dev *dev)
 {
 	struct dentry *dir;
@@ -309,6 +391,8 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 	debugfs_create_file("idle-timeout", 0600, dir, dev,
 			    &fops_pm_idle_timeout);
 	debugfs_create_file("chip_reset", 0600, dir, dev, &fops_reset);
+	debugfs_create_devm_seqfile(dev->mt76.dev, "roc_info", dir,
+				    mt7925_roc_info);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "runtime_pm_stats", dir,
 				    mt792x_pm_stats);
 	debugfs_create_file("deep-sleep", 0600, dir, dev, &fops_ds);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 2afd3f5e3266..37aec6ed84dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1608,6 +1608,27 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 				 &req, sizeof(req), true);
 }
 
+int mt7925_mcu_get_roc_info(struct mt792x_dev *dev, struct sk_buff **skb)
+{
+	struct {
+		struct {
+			u8 rsv[4];
+		} __packed hdr;
+		struct {
+			__le16 tag;
+			__le16 len;
+		} __packed get_info;
+	} __packed req = {
+		.get_info = {
+			.tag = cpu_to_le16(UNI_ROC_GET_INFO),
+			.len = cpu_to_le16(sizeof(req.get_info)),
+		},
+	};
+
+	return mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_CMD(ROC),
+					 &req, sizeof(req), true, skb);
+}
+
 int mt7925_mcu_set_eeprom(struct mt792x_dev *dev)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 11f9eac13ffc..bc6ecf704564 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -72,6 +72,50 @@ struct mt7925_txpwr_req {
 	u8 _rsv1;
 } __packed;
 
+/* ROC GET_INFO event structures (response to UNI_ROC_GET_INFO command) */
+struct mt7925_roc_ch_info_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 dbdc_band;
+	u8 cnm_timeline_en;
+	u8 op_ch_num;
+	u8 dbdc_enable;
+	u8 ch_info[];
+} __packed;
+
+struct mt7925_roc_channel_info {
+	u8 pri_ch;
+	u8 ch_bw;
+	u8 ch_sco;
+	u8 ch_s1;
+	u8 ch_s2;
+	u8 bss_num;
+	__le16 bss_bitmap;
+} __packed;
+
+struct mt7925_roc_bss_info_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 bss_num;
+	u8 rsv[3];
+	u8 bss_info[];
+} __packed;
+
+struct mt7925_roc_bss_info {
+	u8 bss_type;
+	u8 inuse;
+	u8 active;
+	u8 conn_state;
+	u8 pri_ch;
+	u8 dbdc_band;
+	u8 omac_idx;
+	u8 omac_dbdc_band;
+	u8 op_tx_nss;
+	u8 op_rx_nss;
+	u8 link_idx;
+	u8 rsv;
+} __packed;
+
 struct mt7925_txpwr_event {
 	u8 rsv[4];
 	__le16 tag;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 33782d9ba9ed..1e0b9001901a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -51,6 +51,7 @@ struct mt7925_mcu_hif_ctrl_basic_tlv {
 enum {
 	UNI_ROC_ACQUIRE,
 	UNI_ROC_ABORT,
+	UNI_ROC_GET_INFO = 2,
 	UNI_ROC_SUB_LINK = 3,
 	UNI_ROC_NUM
 };
@@ -66,6 +67,8 @@ enum mt7925_roc_req {
 
 enum {
 	UNI_EVENT_ROC_GRANT = 0,
+	UNI_EVENT_ROC_GET_CH_INFO = 1,
+	UNI_EVENT_ROC_GET_BSS_INFO = 2,
 	UNI_EVENT_ROC_GRANT_SUB_LINK = 4,
 	UNI_EVENT_ROC_TAG_NUM
 };
@@ -394,6 +397,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 		       enum mt7925_roc_req type, u8 token_id);
 int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			 u8 token_id);
+int mt7925_mcu_get_roc_info(struct mt792x_dev *dev, struct sk_buff **skb);
 void mt7925_roc_abort_sync(struct mt792x_dev *dev);
 int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			    int cmd, int *wait_seq);
-- 
2.45.2


