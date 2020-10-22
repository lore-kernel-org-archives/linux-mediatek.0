Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C554FC55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:29:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B8122249
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VWrhD50R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XTdAQ6uQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B8122249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FKYezTk9RFhzaYPwRhYD70uo82GvAxwETt8PISK1zmM=; b=VWrhD50RqUs4dtqn6prbddWJz
	sUKGDoQXkmcub7eCmibyd4cOOBMrrzg6qFgN0yWvQVtIWK5tl8ifUU1TfGWMoAlERt3ti0VrcQ5yY
	HIzeddi4hwvNBKfpzQtEvms+JlvBfOiZC78dDqYzIF8lDknlrd/9M/bxoVNBRo0CcJSYaY8Zf1Sv/
	FQw5FCtzqFvFYQXRuo88hvm+yN/t3PN0SPgscQjXGkkMdohdFNlaaIUf4bETiehMUYv98fkjxaTip
	qFTWFhxHgUb7u+7giID6aA1Q+La4RUk/CT/yFIr4pyCjCq34tqSxfs8FVKH0X0PKhU+KzPq1edd4B
	OtDtAMy5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVQLd-0002zM-KR; Thu, 22 Oct 2020 02:29:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVQLW-0002uZ-Nt
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 02:28:56 +0000
X-UUID: da2b3abd62dc47e69a78d5eedb0b89b2-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ubohY/g8g7z0KWnRlK8MD461CtBHRICaCK/003ikeWU=; 
 b=XTdAQ6uQiq4R8GGdphNkkPc1oEuh8rlzTEMZ3EXKx0I7+hi5LwNe5M1NMvvxQXThxVdEqjoQtGWefeSi2LL5zbs+FX/0bpjxonfAqMbdJqnrffo41BhGDPCteDjwDECItV5AUZt7i4J6WJSNV9DVLGvNTLFVmbA3pADSxbI5eys=;
X-UUID: da2b3abd62dc47e69a78d5eedb0b89b2-20201021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1407699338; Wed, 21 Oct 2020 18:28:45 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 19:28:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 10:28:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 10:28:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v4 09/10] mt76: mt7915: add support to set txpower in testmode
Date: Thu, 22 Oct 2020 10:28:19 +0800
Message-ID: <20201022022820.3077-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201022022820.3077-1-shayne.chen@mediatek.com>
References: <20201022022820.3077-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5D845305484DD9A37B32C0F4A5DE34B00AF662C04656B7EB7C84E42D6C7FB5842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_222854_962503_B307D4D8 
X-CRM114-Status: GOOD (  16.84  )
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

Support tx_power setting in testmode. Note that the tx power value of
antenna 1-3 equal to antenna 0.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index c2dd19d..b3649bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -6,6 +6,17 @@
 #include "mcu.h"
 #include "testmode.h"
 
+enum {
+	TM_CHANGED_TXPOWER,
+
+	/* must be last */
+	NUM_TM_CHANGED
+};
+
+static const u8 tm_change_map[] = {
+	[TM_CHANGED_TXPOWER] = MT76_TM_ATTR_TX_POWER,
+};
+
 struct reg_band {
 	u32 band[2];
 };
@@ -35,6 +46,42 @@ static const struct reg_band reg_backup_list[] = {
 	REG_BAND(WF_RFCR1),
 };
 
+static int
+mt7915_tm_set_tx_power(struct mt7915_phy *phy)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt76_phy *mphy = phy->mt76;
+	struct cfg80211_chan_def *chandef = &mphy->chandef;
+	int freq = chandef->center_freq1;
+	int ret;
+	struct {
+		u8 format_id;
+		u8 dbdc_idx;
+		s8 tx_power;
+		u8 ant_idx;	/* Only 0 is valid */
+		u8 center_chan;
+		u8 rsv[3];
+	} __packed req = {
+		.format_id = 0xf,
+		.dbdc_idx = phy != &dev->phy,
+		.center_chan = ieee80211_frequency_to_channel(freq),
+	};
+	u8 *tx_power = NULL;
+
+	if (dev->mt76.test.state != MT76_TM_STATE_OFF)
+		tx_power = dev->mt76.test.tx_power;
+
+	/* Tx power of the other antennas are the same as antenna 0 */
+	if (tx_power && tx_power[0])
+		req.tx_power = tx_power[0];
+
+	ret = mt76_mcu_send_msg(&dev->mt76,
+				MCU_EXT_CMD_TX_POWER_FEATURE_CTRL,
+				&req, sizeof(req), false);
+
+	return ret;
+}
+
 static int
 mt7915_tm_mode_ctrl(struct mt7915_dev *dev, bool enable)
 {
@@ -176,6 +223,13 @@ mt7915_tm_set_rx_frames(struct mt7915_dev *dev, bool en)
 	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_RX_RXV, en);
 }
 
+static void
+mt7915_tm_update_params(struct mt7915_dev *dev, u32 changed)
+{
+	if (changed & BIT(TM_CHANGED_TXPOWER))
+		mt7915_tm_set_tx_power(&dev->phy);
+}
+
 static int
 mt7915_tm_set_state(struct mt76_dev *mdev, enum mt76_testmode_state state)
 {
@@ -196,6 +250,51 @@ mt7915_tm_set_state(struct mt76_dev *mdev, enum mt76_testmode_state state)
 	else if (prev_state == MT76_TM_STATE_OFF || state == MT76_TM_STATE_OFF)
 		mt7915_tm_init(dev);
 
+	if ((state == MT76_TM_STATE_IDLE &&
+	     prev_state == MT76_TM_STATE_OFF) ||
+	    (state == MT76_TM_STATE_OFF &&
+	     prev_state == MT76_TM_STATE_IDLE)) {
+		u32 changed = 0;
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(tm_change_map); i++) {
+			u16 cur = tm_change_map[i];
+
+			if (td->param_set[cur / 32] & BIT(cur % 32))
+				changed |= BIT(i);
+		}
+
+		mt7915_tm_update_params(dev, changed);
+	}
+
+	return 0;
+}
+
+static int
+mt7915_tm_set_params(struct mt76_dev *mdev, struct nlattr **tb,
+		     enum mt76_testmode_state new_state)
+{
+	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
+	struct mt76_testmode_data *td = &dev->mt76.test;
+	u32 changed = 0;
+	int i;
+
+	BUILD_BUG_ON(NUM_TM_CHANGED >= 32);
+
+	if (new_state == MT76_TM_STATE_OFF ||
+	    td->state == MT76_TM_STATE_OFF)
+		return 0;
+
+	if (td->tx_antenna_mask & ~dev->phy.chainmask)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(tm_change_map); i++) {
+		if (tb[tm_change_map[i]])
+			changed |= BIT(i);
+	}
+
+	mt7915_tm_update_params(dev, changed);
+
 	return 0;
 }
 
@@ -253,5 +352,6 @@ mt7915_tm_dump_stats(struct mt76_dev *mdev, struct sk_buff *msg)
 
 const struct mt76_testmode_ops mt7915_testmode_ops = {
 	.set_state = mt7915_tm_set_state,
+	.set_params = mt7915_tm_set_params,
 	.dump_stats = mt7915_tm_dump_stats,
 };
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
