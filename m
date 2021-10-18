Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E16CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:15:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D496461076
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D496461076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLKm58j6VHJjvdNaQDxn9NqdP6gM4qsEEvqPebAzBDg=; b=zM2IaCe+S5pkIE
	EjB7Cm1d66cZoyF7bT7MqCal3HxH7v0HBiu9iNTnyFZYWtEOhFIs6WbkY6mYRdBtZwYicQOsFc2aA
	vwwO94FmGO+aAoctsNDX8Yak7ohCHGI43GsBTO6pIXBvalQ92TvqiXAUdD9tKZGf+rmG2lZO3foyd
	GB+mRt2FuGHqo9xMp3R9GnfItbIaJHFFJhKjg987mtMNrKBxUIX1UkjUw+IxgQZwsKHlzAW3rEGZa
	esJRVoAhnUPZM03sas0oIHb6q3LF/sHZeqdgXhCIJ+/F2gEaOErJsHo5OHNA1tZMySjZ7TgteZrw6
	AuqrFzk+/KSYVXGJprKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNnP-00Ebiu-Su; Mon, 18 Oct 2021 08:14:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNnJ-00Ebe4-QB
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 08:14:55 +0000
X-UUID: 2a42a641b2cc47948bb02375c969207d-20211018
X-UUID: 2a42a641b2cc47948bb02375c969207d-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 562590951; Mon, 18 Oct 2021 01:14:49 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 01:08:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Oct 2021 16:08:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 16:08:20 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v7 8/8] mt76: mt7915: set muru platform type
Date: Mon, 18 Oct 2021 16:07:06 +0800
Message-ID: <20211018080706.11401-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211018080706.11401-1-shayne.chen@mediatek.com>
References: <20211018080706.11401-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_011453_898084_2D7BC1B8 
X-CRM114-Status: GOOD (  13.37  )
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

Set muru platform type by mcu cmd to notify fw to init corresponding
algorithm.

Suggested-by: Money Wang <money.wang@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 20 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 10 ++++++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 16 +++++----------
 .../wireless/mediatek/mt76/mt7915/testmode.h  |  4 ----
 5 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f32e124b1a0f..d4c8759bedd8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2906,6 +2906,21 @@ static int mt7915_mcu_set_mwds(struct mt7915_dev *dev, bool enabled)
 				 sizeof(req), false);
 }
 
+int mt7915_mcu_set_muru_ctrl(struct mt7915_dev *dev, u32 cmd, u32 val)
+{
+	struct {
+		__le32 cmd;
+		u8 val[4];
+	} __packed req = {
+		.cmd = cpu_to_le32(cmd),
+	};
+
+	put_unaligned_le32(val, req.val);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL), &req,
+				 sizeof(req), false);
+}
+
 int mt7915_mcu_init(struct mt7915_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7915_mcu_ops = {
@@ -2935,6 +2950,11 @@ int mt7915_mcu_init(struct mt7915_dev *dev)
 	if (ret)
 		return ret;
 
+	ret = mt7915_mcu_set_muru_ctrl(dev, MURU_SET_PLATFORM_TYPE,
+				       MURU_PLATFORM_TYPE_PERF_LEVEL_2);
+	if (ret)
+		return ret;
+
 	return mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
 				 MCU_WA_PARAM_RED, 0, 0);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index a1a6cc064573..4043cf547c9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -1092,6 +1092,16 @@ enum {
 	MT_BF_MODULE_UPDATE = 25
 };
 
+enum {
+	MURU_SET_ARB_OP_MODE = 14,
+	MURU_SET_PLATFORM_TYPE = 25,
+};
+
+enum {
+	MURU_PLATFORM_TYPE_PERF_LEVEL_1 = 1,
+	MURU_PLATFORM_TYPE_PERF_LEVEL_2,
+};
+
 #define MT7915_WTBL_UPDATE_MAX_SIZE	(sizeof(struct wtbl_req_hdr) +	\
 					 sizeof(struct wtbl_generic) +	\
 					 sizeof(struct wtbl_rx) +	\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 78c0896f97b9..bb8ef60f1b1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -443,6 +443,7 @@ int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
 int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 			    const struct mt7915_dfs_pattern *pattern);
+int mt7915_mcu_set_muru_ctrl(struct mt7915_dev *dev, u32 cmd, u32 val);
 int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev);
 int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
 int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 00dcc46b9082..89aae323d29e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -169,22 +169,16 @@ static int
 mt7915_tm_set_tam_arb(struct mt7915_phy *phy, bool enable, bool mu)
 {
 	struct mt7915_dev *dev = phy->dev;
-	struct {
-		__le32 cmd;
-		u8 op_mode;
-	} __packed req = {
-		.cmd = cpu_to_le32(MURU_SET_ARB_OP_MODE),
-	};
+	u32 op_mode;
 
 	if (!enable)
-		req.op_mode = TAM_ARB_OP_MODE_NORMAL;
+		op_mode = TAM_ARB_OP_MODE_NORMAL;
 	else if (mu)
-		req.op_mode = TAM_ARB_OP_MODE_TEST;
+		op_mode = TAM_ARB_OP_MODE_TEST;
 	else
-		req.op_mode = TAM_ARB_OP_MODE_FORCE_SU;
+		op_mode = TAM_ARB_OP_MODE_FORCE_SU;
 
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(MURU_CTRL), &req,
-				 sizeof(req), false);
+	return mt7915_mcu_set_muru_ctrl(dev, MURU_SET_ARB_OP_MODE, op_mode);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 107f0cf2505e..5573ac309363 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -102,8 +102,4 @@ enum {
 	TAM_ARB_OP_MODE_FORCE_SU = 5,
 };
 
-enum {
-	MURU_SET_ARB_OP_MODE = 14,
-};
-
 #endif
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
