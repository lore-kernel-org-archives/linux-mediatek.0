Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECDDC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C306F2255F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C306F2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PJW8oNkS3KAHsGui6+kTWKG9dGqwi/Fq7S/HvRqlAp8=; b=u7DtXYu/FHIi+3kuYbCu378DD
	vztNrwxCsLx9sNjXgiRS5gil5P84USXka3tsqu/yFXIgsPoIpnHtr/WFxzK1unSWSWtKMBw+UeVYC
	nNACBdUqaHFzj/qVVXYgTnaxYvjQEfQ1CkAN51y8ylbwRa4hcsE0wcI7Pw72+1zE/34lRHai/LLZm
	aDZ/peazyKT7ihosm4FP9B9IRS34w4Wy2ESCM8lISAzk2YOhja2Pw0QYIokZjcVbNE0B8srkBuSG/
	QQqCj8NDCfN5Sja1et2QJhcV/dGOQAKMymDOcAOFbGWjc6TLnxDwEKTrw0nlJ8f8zWxUBmVtzZf84
	3rfyec85w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwiDp-0003wf-Gx; Tue, 05 Jan 2021 09:01:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwiDm-0003ur-FM
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 09:01:43 +0000
X-UUID: 5f98fd397a6a4bbf881ea7195465e409-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=afIL9Mrv/jmsPmjWlz3dlzR+KVwqpRLzFtAzSyy2J+g=; 
 b=clf7AY+po3/IDgtpVmlG90Iyvh7Zar99X+hvEEARqf8cdiwC0YsPeeMoNKAppfznE40rg5SpQsl8PL2dNCJDdf+JD7EQOjOrmW+scHuMj6yj5soc0jJdwW6B8njw0SW2+JY1dXcBgALAxhaiIOScfdC/p6UVKoFYoyQ8FdM+5ho=;
X-UUID: 5f98fd397a6a4bbf881ea7195465e409-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 924458382; Tue, 05 Jan 2021 01:01:38 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 00:56:09 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:56:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:56:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 6/6] mt76: mt7915: clean hw queue before starting new testmode
 tx
Date: Tue, 5 Jan 2021 16:55:29 +0800
Message-ID: <20210105085529.14206-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105085529.14206-1-shayne.chen@mediatek.com>
References: <20210105085529.14206-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC75EFC5F96D58FA74A45154A7EC7F1BB98760C0FD3DBA75C9679D0FDA9072022000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_040142_747898_984A52B0 
X-CRM114-Status: GOOD (  12.06  )
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

Add a testmode mcu command to clean up hw tx queue before a new
testmode tx starts.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/testmode.c | 16 ++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/testmode.h |  8 ++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 66d34d78c1d4..163b6f330e67 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -50,6 +50,7 @@ enum {
 	MCU_ATE_SET_TRX = 0x1,
 	MCU_ATE_SET_FREQ_OFFSET = 0xa,
 	MCU_ATE_SET_SLOT_TIME = 0x13,
+	MCU_ATE_CLEAN_TXQUEUE = 0x1c,
 };
 
 struct mt7915_mcu_rxd {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index a8e639ffe6de..6f6e02038c6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -132,6 +132,21 @@ mt7915_tm_set_trx(struct mt7915_phy *phy, int type, bool en)
 				 sizeof(req), false);
 }
 
+static int
+mt7915_tm_clean_hwq(struct mt7915_phy *phy, u8 wcid)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt7915_tm_cmd req = {
+		.testmode_en = 1,
+		.param_idx = MCU_ATE_CLEAN_TXQUEUE,
+		.param.clean.wcid = wcid,
+		.param.clean.band = phy != &dev->phy,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
 static int
 mt7915_tm_set_slot_time(struct mt7915_phy *phy, u8 slot_time, u8 sifs)
 {
@@ -408,6 +423,7 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 	u32 ipg = td->tx_ipg;
 
 	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, false);
+	mt7915_tm_clean_hwq(phy, dev->mt76.global_wcid.idx);
 
 	if (en) {
 		mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 784d4c948886..da92cad0aa9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -26,6 +26,13 @@ struct mt7915_tm_slot_time {
 	u8 _rsv1[5];
 };
 
+struct mt7915_tm_clean_txq {
+	bool sta_pause;
+	u8 wcid;	/* 256 sta */
+	u8 band;
+	u8 rsv;
+};
+
 struct mt7915_tm_cmd {
 	u8 testmode_en;
 	u8 param_idx;
@@ -35,6 +42,7 @@ struct mt7915_tm_cmd {
 		struct mt7915_tm_trx trx;
 		struct mt7915_tm_freq_offset freq;
 		struct mt7915_tm_slot_time slot;
+		struct mt7915_tm_clean_txq clean;
 		u8 test[72];
 	} param;
 } __packed;
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
