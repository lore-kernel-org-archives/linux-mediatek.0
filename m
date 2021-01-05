Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C67C433E9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B288C2255F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B288C2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUrLbqc21SstQlNRMAPOQcFtP16kAJ7EEGTAMlR7Nuc=; b=NT6mZe2fs5afDUrQQb5N06xJ/
	uoQ5f0o1pqC2EMaxtiMYk6Xvz/6lP8mye9dysfE4wkAeBEBMuzUOu4vfjnWjC3DpzFMYz2JZhZY4v
	rm3OoIpMHFoX8Oc1VugdetyUmQq8EfmhMm0ylYbL2p7v5XahtOgITosNCUJl0er5WSewFkp467qAU
	lE0UWd4a4udmHUwiOb206G5kPgCThJu9I11xA8fgD6NJ9UeGU4PVvEBGxvWCKUuyJ3F5QdcH3h6ZE
	hQwZTwgFFhvl235VZXrMbKkN0MwPgCvQiRDofdPRwLDeK/V68E9XDH4hklMdloURsvhvBLdJ6OC+D
	RsRCJmdEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwiDr-0003xa-UC; Tue, 05 Jan 2021 09:01:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwiDo-0003ur-4C
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 09:01:45 +0000
X-UUID: 4b6040192f2c49e6a2c1a482bfade667-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Mx/uFeYqzRYNKNyYshRdoT5OZYxWIJ77g0Y3JHv5vZY=; 
 b=fUnhpfEOndBx1ZGnC/7FMKD7ZOG840x+18bKiHx//WBLEEGQZXOddG8okeJIPZFC6KZGbuxYNa/QF+sVF5o+9r/MeMHrLeqLydeY4+hoLwVsi+2q/x9Xi++5IjVMGLcnPPED9P1A0qCEciAYBp6RnUYZ4JjkKHlZmx82/l4Pcqw=;
X-UUID: 4b6040192f2c49e6a2c1a482bfade667-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1295205048; Tue, 05 Jan 2021 01:01:38 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 00:56:13 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:56:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 4/6] mt76: mt7915: add support for ipg in testmode
Date: Tue, 5 Jan 2021 16:55:27 +0800
Message-ID: <20210105085529.14206-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105085529.14206-1-shayne.chen@mediatek.com>
References: <20210105085529.14206-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_040144_595218_C1BF970A 
X-CRM114-Status: GOOD (  18.02  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support to calculate and apply ipg parameters in testmode
for MT7915 NIC.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   1 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |   8 +-
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 125 +++++++++++++++++-
 .../wireless/mediatek/mt76/mt7915/testmode.h  |  11 ++
 4 files changed, 142 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index ee6d70339d92..66d34d78c1d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -49,6 +49,7 @@ enum {
 enum {
 	MCU_ATE_SET_TRX = 0x1,
 	MCU_ATE_SET_FREQ_OFFSET = 0xa,
+	MCU_ATE_SET_SLOT_TIME = 0x13,
 };
 
 struct mt7915_mcu_rxd {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 848703e6eb7c..6fb5cbab9c32 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -59,6 +59,13 @@
 #define MT_TIMEOUT_VAL_PLCP		GENMASK(15, 0)
 #define MT_TIMEOUT_VAL_CCA		GENMASK(31, 16)
 
+#define MT_TMAC_ATCR(_band)		MT_WF_TMAC(_band, 0x098)
+#define MT_TMAC_ATCR_TXV_TOUT		GENMASK(7, 0)
+
+#define MT_TMAC_TRCR0(_band)		MT_WF_TMAC(_band, 0x09c)
+#define MT_TMAC_TRCR0_TR2T_CHK		GENMASK(8, 0)
+#define MT_TMAC_TRCR0_I2T_CHK		GENMASK(24, 16)
+
 #define MT_TMAC_ICR0(_band)		MT_WF_TMAC(_band, 0x0a4)
 #define MT_IFS_EIFS			GENMASK(8, 0)
 #define MT_IFS_RIFS			GENMASK(14, 10)
@@ -70,7 +77,6 @@
 #define MT_TMAC_CTCR0_INS_DDLMT_EN		BIT(17)
 #define MT_TMAC_CTCR0_INS_DDLMT_VHT_SMPDU_EN	BIT(18)
 
-#define MT_TMAC_TRCR0(_band)		MT_WF_TMAC(_band, 0x09c)
 #define MT_TMAC_TFCR0(_band)		MT_WF_TMAC(_band, 0x1e0)
 
 #define MT_WF_DMA_BASE(_band)		((_band) ? 0xa1e00 : 0x21e00)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 278f279cc67b..748c9b55e498 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -132,6 +132,111 @@ mt7915_tm_set_trx(struct mt7915_phy *phy, int type, bool en)
 				 sizeof(req), false);
 }
 
+static int
+mt7915_tm_set_slot_time(struct mt7915_phy *phy, u8 slot_time, u8 sifs)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt7915_tm_cmd req = {
+		.testmode_en = !(phy->mt76->test.state == MT76_TM_STATE_OFF),
+		.param_idx = MCU_ATE_SET_SLOT_TIME,
+		.param.slot.slot_time = slot_time,
+		.param.slot.sifs = sifs,
+		.param.slot.rifs = 2,
+		.param.slot.eifs = cpu_to_le16(60),
+		.param.slot.band = phy != &dev->phy,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
+static int
+mt7915_tm_set_wmm_qid(struct mt7915_dev *dev, u8 qid, u8 aifs, u8 cw_min,
+		      u16 cw_max, u16 txop)
+{
+	struct mt7915_mcu_tx req = { .total = 1 };
+	struct edca *e = &req.edca[0];
+
+	e->queue = qid;
+	e->set = WMM_PARAM_SET;
+
+	e->aifs = aifs;
+	e->cw_min = cw_min;
+	e->cw_max = cpu_to_le16(cw_max);
+	e->txop = cpu_to_le16(txop);
+
+	return mt7915_mcu_update_edca(dev, &req);
+}
+
+static int
+mt7915_tm_set_ipg_params(struct mt7915_phy *phy, u32 ipg, u8 mode)
+{
+#define TM_DEFAULT_SIFS	10
+#define TM_MAX_SIFS	127
+#define TM_MAX_AIFSN	0xf
+#define TM_MIN_AIFSN	0x1
+#define BBP_PROC_TIME	1500
+	struct mt7915_dev *dev = phy->dev;
+	u8 sig_ext = (mode == MT76_TM_TX_MODE_CCK) ? 0 : 6;
+	u8 slot_time = 9, sifs = TM_DEFAULT_SIFS;
+	u8 aifsn = TM_MIN_AIFSN;
+	u32 i2t_time, tr2t_time, txv_time;
+	bool ext_phy = phy != &dev->phy;
+	u16 cw = 0;
+
+	if (ipg < sig_ext + slot_time + sifs)
+		ipg = 0;
+
+	if (!ipg)
+		goto done;
+
+	ipg -= sig_ext;
+
+	if (ipg <= (TM_MAX_SIFS + slot_time)) {
+		sifs = ipg - slot_time;
+	} else {
+		u32 val = (ipg + slot_time) / slot_time;
+
+		while (val >>= 1)
+			cw++;
+
+		if (cw > 16)
+			cw = 16;
+
+		ipg -= ((1 << cw) - 1) * slot_time;
+
+		aifsn = ipg / slot_time;
+		if (aifsn > TM_MAX_AIFSN)
+			aifsn = TM_MAX_AIFSN;
+
+		ipg -= aifsn * slot_time;
+
+		if (ipg > TM_DEFAULT_SIFS) {
+			if (ipg < TM_MAX_SIFS)
+				sifs = ipg;
+			else
+				sifs = TM_MAX_SIFS;
+		}
+	}
+done:
+	txv_time = mt76_get_field(dev, MT_TMAC_ATCR(ext_phy),
+				  MT_TMAC_ATCR_TXV_TOUT);
+	txv_time *= 50;	/* normal clock time */
+
+	i2t_time = (slot_time * 1000 - txv_time - BBP_PROC_TIME) / 50;
+	tr2t_time = (sifs * 1000 - txv_time - BBP_PROC_TIME) / 50;
+
+	mt76_set(dev, MT_TMAC_TRCR0(ext_phy),
+		 FIELD_PREP(MT_TMAC_TRCR0_TR2T_CHK, tr2t_time) |
+		 FIELD_PREP(MT_TMAC_TRCR0_I2T_CHK, i2t_time));
+
+	mt7915_tm_set_slot_time(phy, slot_time, sifs);
+
+	return mt7915_tm_set_wmm_qid(dev,
+				     mt7915_lmac_mapping(dev, IEEE80211_AC_BE),
+				     aifsn, cw, cw, 0);
+}
+
 static void
 mt7915_tm_reg_backup_restore(struct mt7915_phy *phy)
 {
@@ -206,9 +311,12 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 	static const u8 spe_idx_map[] = {0, 0, 1, 0, 3, 2, 4, 0,
 					 9, 8, 6, 10, 16, 12, 18, 0};
 	struct mt76_testmode_data *td = &phy->mt76->test;
-	struct sk_buff *skb = phy->mt76->test.tx_skb;
 	struct mt7915_dev *dev = phy->dev;
+	struct sk_buff *skb = td->tx_skb;
 	struct ieee80211_tx_info *info;
+	u8 duty_cycle = td->tx_duty_cycle;
+	u32 tx_time = td->tx_time;
+	u32 ipg = td->tx_ipg;
 
 	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, false);
 
@@ -230,13 +338,26 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 		}
 	}
 
-	mt7915_tm_set_trx(phy, TM_MAC_TX, en);
+	/* if all three params are set, duty_cycle will be ignored */
+	if (duty_cycle && tx_time && !ipg) {
+		ipg = tx_time * 100 / duty_cycle - tx_time;
+	} else if (duty_cycle && !tx_time && ipg) {
+		if (duty_cycle < 100)
+			tx_time = duty_cycle * ipg / (100 - duty_cycle);
+	}
+
+	mt7915_tm_set_ipg_params(phy, ipg, td->tx_rate_mode);
+
+	if (ipg)
+		td->tx_queued_limit = MT76_TM_TIMEOUT * 1000000 / ipg / 2;
 
 	if (!en || !skb)
 		return;
 
 	info = IEEE80211_SKB_CB(skb);
 	info->control.vif = phy->monitor_vif;
+
+	mt7915_tm_set_trx(phy, TM_MAC_TX, en);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 964f2d7fde3a..784d4c948886 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -16,6 +16,16 @@ struct mt7915_tm_freq_offset {
 	__le32 freq_offset;
 };
 
+struct mt7915_tm_slot_time {
+	u8 slot_time;
+	u8 sifs;
+	u8 rifs;
+	u8 _rsv;
+	__le16 eifs;
+	u8 band;
+	u8 _rsv1[5];
+};
+
 struct mt7915_tm_cmd {
 	u8 testmode_en;
 	u8 param_idx;
@@ -24,6 +34,7 @@ struct mt7915_tm_cmd {
 		__le32 data;
 		struct mt7915_tm_trx trx;
 		struct mt7915_tm_freq_offset freq;
+		struct mt7915_tm_slot_time slot;
 		u8 test[72];
 	} param;
 } __packed;
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
