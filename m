Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E4606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c1rPo0wQ;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=tunFnw8a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DulNqdfKE6sH1mnNs6HM457oup51LrFAFnJgAmD9E3Q=; b=c1rPo0wQ4UoxZ86Ct+OoffU2lJ
	lk5lymYLVs5oq8D+HvSDZpB0iJoepxLD9i0WpeUJFCT2ohWv+StDONHhlYURpmTj34hlAozwHRdI2
	7lWNEPlVVBGHfhftT6LoAhGez9XJBw6ngHDSi2jbDhlcba7x9SxUJlv7Mb7G0Kn+sGGG1XltavDJq
	2vewGDeB+xZ+61s/RWHL9syKN0+RRHDC2gPfu438CG4xSYd+utQoHIk/b855A5H439h168wpH6oTi
	Ror+CHAg+8YN39VHz6HqJsR3vQDXlbFeBySKU4I56UsAv3AJy3iq9Wf3MN1Sx+S7Im57taIbNZ//Q
	a8fKhHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcJ7-00000002FiO-0634;
	Tue, 10 Nov 2026 03:14:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIu-00000002FD5-1i4p
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:51 +0000
X-UUID: b8ab049adcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DulNqdfKE6sH1mnNs6HM457oup51LrFAFnJgAmD9E3Q=;
	b=tunFnw8afnsdZ5bmQRh4/2S93ZHn908rKmGVa0lJ5Fuemn7SYEI9Dd40OPvOVF5TZnTHkenJ7k24XO+5nZ0T/NK1qWBKGrWXj3i1TX5Qd3d/rab/Zgf2SXv60hSrScycbjTtY0elNMo8G/Sg7k+eZHg2OqwrtJ6Z5JCgb4OPwiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b72bc161-d185-4d6e-a325-ea174522e952,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:1ab0878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8ab049adcb411f1afed4741b24580c9-20261109
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1925555980; Mon, 09 Nov 2026 20:13:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:36 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 28/28] wifi: mt76: mt7925: add hm_alg_ctrl debugfs to override the MLO link plan
Date: Tue, 10 Nov 2026 11:12:44 +0800
Message-ID: <20261110031244.369014-29-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191348_484510_DCC1012D 
X-CRM114-Status: GOOD (  13.22  )
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

Add a debugfs knob to override the firmware hybrid-MLO link plan for
validation. Writing "<manual>-<obss>-<bt>-<plan>-<obss%>-<bt%>" to
/sys/kernel/debug/ieee80211/phyN/mt76/hm_alg_ctrl sends the UNI_CMD_HM
ALG_CTRL TLV to the firmware.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 41 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 30 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 16 ++++++++
 4 files changed, 88 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 5c27285542ab..233da1b0162d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1364,6 +1364,7 @@ enum {
 	MCU_UNI_CMD_ASSERT_DUMP = 0x6f,
 	MCU_UNI_CMD_EXT_EEPROM_CTRL = 0x74,
 	MCU_UNI_CMD_FACT_CAL = 0x7c,
+	MCU_UNI_CMD_HM = 0x7d,
 	MCU_UNI_CMD_RADIO_STATUS = 0x80,
 	MCU_UNI_CMD_MLD = 0x82,
 	MCU_UNI_CMD_PEER_MLD = 0x83,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d01ff49de47a..52e9bf437c8e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -286,6 +286,46 @@ static int mt7925_chip_reset(void *data, u64 val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_reset, NULL, mt7925_chip_reset, "%lld\n");
 
+/* Hybrid-MLO link-plan control.
+ *
+ * Usage:
+ *   echo <ManualModeEn>-<ForceObss>-<ForceBT>-<ForcePlan>-<ObssTime%>-<BT%> \
+ *       > /sys/kernel/debug/ieee80211/phyX/mt76/hm_alg_ctrl
+ */
+static ssize_t
+mt7925_hm_alg_ctrl_set(struct file *file, const char __user *user_buf,
+		       size_t count, loff_t *ppos)
+{
+	struct mt792x_dev *dev = file->private_data;
+	struct mt7925_hm_alg_ctrl ctrl = {};
+	char buf[32];
+	int ret;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+	buf[count] = '\0';
+
+	if (sscanf(buf, "%hhu-%hhu-%hhu-%hhu-%hhu-%hhu",
+		   &ctrl.manual_mode_en, &ctrl.force_obss, &ctrl.force_bt,
+		   &ctrl.force_plan, &ctrl.obss_time_pct, &ctrl.bt_pct) != 6)
+		return -EINVAL;
+
+	mt792x_mutex_acquire(dev);
+	ret = mt7925_mcu_set_hm_alg_ctrl(dev, &ctrl);
+	mt792x_mutex_release(dev);
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations fops_hm_alg_ctrl = {
+	.write = mt7925_hm_alg_ctrl_set,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 int mt7925_init_debugfs(struct mt792x_dev *dev)
 {
 	struct dentry *dir;
@@ -312,6 +352,7 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 	debugfs_create_devm_seqfile(dev->mt76.dev, "runtime_pm_stats", dir,
 				    mt792x_pm_stats);
 	debugfs_create_file("deep-sleep", 0600, dir, dev, &fops_ds);
+	debugfs_create_file("hm_alg_ctrl", 0200, dir, dev, &fops_hm_alg_ctrl);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 588328a01dc8..d02ab03fe7ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -4606,3 +4606,33 @@ int mt7925_mcu_set_rssimonitor(struct mt792x_dev *dev, struct ieee80211_vif *vif
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(RSSI_MONITOR), &req,
 				 sizeof(req), false);
 }
+
+int mt7925_mcu_set_hm_alg_ctrl(struct mt792x_dev *dev,
+			       struct mt7925_hm_alg_ctrl *ctrl)
+{
+	struct {
+		u8 rsv[4];		/* struct UNI_CMD_HM fixed field */
+		__le16 tag;
+		__le16 len;
+		u8 manual_mode_en;
+		u8 force_obss;
+		u8 force_bt;
+		u8 force_plan;
+		u8 obss_time_pct;
+		u8 bt_pct;
+		u8 rsv2[6];
+	} __packed req = {
+		.tag = cpu_to_le16(UNI_CMD_HM_TAG_ALG_CTRL),
+		.len = cpu_to_le16(sizeof(req) -
+				   offsetof(typeof(req), tag)),
+		.manual_mode_en = ctrl->manual_mode_en,
+		.force_obss = ctrl->force_obss,
+		.force_bt = ctrl->force_bt,
+		.force_plan = ctrl->force_plan,
+		.obss_time_pct = ctrl->obss_time_pct,
+		.bt_pct = ctrl->bt_pct,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(HM), &req,
+				 sizeof(req), true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index ae403c04e436..1f42a48e522d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -764,4 +764,20 @@ int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
 int
 mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev,
 			 struct ieee80211_bss_conf *link_conf, bool enable);
+/* Hybrid-MLO algorithm control. Lets the host override the firmware's
+ * MLO link-plan decision for validation.
+ */
+#define UNI_CMD_HM_TAG_ALG_CTRL		0
+
+struct mt7925_hm_alg_ctrl {
+	u8 manual_mode_en;
+	u8 force_obss;
+	u8 force_bt;
+	u8 force_plan;
+	u8 obss_time_pct;
+	u8 bt_pct;
+};
+
+int mt7925_mcu_set_hm_alg_ctrl(struct mt792x_dev *dev,
+			       struct mt7925_hm_alg_ctrl *ctrl);
 #endif
-- 
2.45.2


