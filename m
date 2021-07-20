Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0FBC07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 13:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD41610D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 13:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD41610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Vhb0CW6DF8d9zKuUcY5q18/0lF1X7jQgFMnbckNZSQ=; b=vQSAuZI8uIJH2Z
	MYNidOsokx4aPv8/0qtNL6immqpvnNQcAhHugUBZc5kNR0Id4Ee7oNJVFtfJ+dBwtkKT2YpBwc1Ok
	jRRrK1rHfmVB21drc3nHC9Z5UyJ2L/V3CXNL2cwnzysWispFiJTcPHMUD6vHZsZw3N5aSL5T2G2wm
	dKAplSWxrXecxCIdZdJhcRQ9po7q5TjxGLPhrQ94xwzCrmBO842CFmFfm2oT4giQEAXhwQ3MW/0Lw
	DiWA9i6xrSrbO3VSVCdgPlX72r/tXAbJitZAW9yyGk+/QhsVkMqsQzL21MM9I3lFDlbb8XKFGzSFx
	Hy136duBrG/e/C3Cktjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5pc8-00CvoO-2n; Tue, 20 Jul 2021 13:16:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5pc4-00Cvln-GL
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 13:16:46 +0000
X-UUID: 49483ecc63fb4bd299ba2c34d19248d3-20210720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TfUUIdK6nHUbWeqc3Hwp2RH7zFO4GFs74ifZ+oXz0kY=; 
 b=Nv9NTwm5zYoekvup+LGErgYQE7qzQVLz5uXDElSFeIaw24EeStXSBadvm/fl4i3uANUf5I8G80o7qXlTsZSwFtTN4k/7vjsfXcd3RC9vn4I4DoK4fZHDgEotcZKAaRuk+twuxr1Fhq89KDsDrzsVb6PIZdmn5g+enUH2PxIsOVI=;
X-UUID: 49483ecc63fb4bd299ba2c34d19248d3-20210720
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1231891599; Tue, 20 Jul 2021 06:16:35 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 06:16:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 21:01:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Jul 2021 21:01:20 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH 1/2] mt76: mt7915: switch proper tx arbiter mode in testmode
Date: Tue, 20 Jul 2021 21:00:13 +0800
Message-ID: <20210720130014.23572-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_061644_601872_6C59A3BB 
X-CRM114-Status: GOOD (  10.12  )
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

Switch proper tx arbiter mode during testmode tx to prevent from
entering the flow of normal tx in FW.
Also, testmode SU and MU tx need to use different arbiter mode.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 29 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.h  | 10 +++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index baa27da..02b98e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -278,6 +278,7 @@ enum {
 	MCU_EXT_CMD_SCS_CTRL = 0x82,
 	MCU_EXT_CMD_FW_DBG_CTRL = 0x95,
 	MCU_EXT_CMD_SET_RDD_TH = 0x9d,
+	MCU_EXT_CMD_MURU_CTRL = 0x9f,
 	MCU_EXT_CMD_SET_SPR = 0xa8,
 	MCU_EXT_CMD_GROUP_PRE_CAL_INFO = 0xab,
 	MCU_EXT_CMD_DPD_PRE_CAL_INFO = 0xac,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index b220b33..00dcc46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -165,6 +165,28 @@ mt7915_tm_set_slot_time(struct mt7915_phy *phy, u8 slot_time, u8 sifs)
 				 sizeof(req), false);
 }
 
+static int
+mt7915_tm_set_tam_arb(struct mt7915_phy *phy, bool enable, bool mu)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct {
+		__le32 cmd;
+		u8 op_mode;
+	} __packed req = {
+		.cmd = cpu_to_le32(MURU_SET_ARB_OP_MODE),
+	};
+
+	if (!enable)
+		req.op_mode = TAM_ARB_OP_MODE_NORMAL;
+	else if (mu)
+		req.op_mode = TAM_ARB_OP_MODE_TEST;
+	else
+		req.op_mode = TAM_ARB_OP_MODE_FORCE_SU;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL), &req,
+				 sizeof(req), false);
+}
+
 static int
 mt7915_tm_set_wmm_qid(struct mt7915_dev *dev, u8 qid, u8 aifs, u8 cw_min,
 		      u16 cw_max, u16 txop)
@@ -397,6 +419,10 @@ mt7915_tm_init(struct mt7915_phy *phy, bool en)
 	mt7915_tm_set_trx(phy, TM_MAC_TXRX, !en);
 
 	mt7915_mcu_add_bss_info(phy, phy->monitor_vif, en);
+	mt7915_mcu_add_sta(dev, phy->monitor_vif, NULL, en);
+
+	if (!en)
+		mt7915_tm_set_tam_arb(phy, en, 0);
 }
 
 static void
@@ -438,6 +464,9 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 		}
 	}
 
+	mt7915_tm_set_tam_arb(phy, en,
+			      td->tx_rate_mode == MT76_TM_TX_MODE_HE_MU);
+
 	/* if all three params are set, duty_cycle will be ignored */
 	if (duty_cycle && tx_time && !ipg) {
 		ipg = tx_time * 100 / duty_cycle - tx_time;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 397a6b5..107f0cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -96,4 +96,14 @@ enum {
 	RF_OPER_WIFI_SPECTRUM,
 };
 
+enum {
+	TAM_ARB_OP_MODE_NORMAL = 1,
+	TAM_ARB_OP_MODE_TEST,
+	TAM_ARB_OP_MODE_FORCE_SU = 5,
+};
+
+enum {
+	MURU_SET_ARB_OP_MODE = 14,
+};
+
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
