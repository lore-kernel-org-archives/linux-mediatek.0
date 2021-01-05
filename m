Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B06C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 05:42:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC9022597
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 05:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC9022597
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TtO3OSls21M6oYdu9zrFOqbyY7GLIJlnHxRJk2Tpz+8=; b=LjKywgg6VURWX9O0PDOxXnGuhF
	AmogrD+hy8Jiq1zmTopYSX9Kdkzgo0ta3+vFFsIpdkp+BU2XuwQS8g9xvEIiRfkYTamECSeRS0yK3
	c/yMwDQJjw+bYM9mWuc/Y/OCtlrQUrP4MDjPlfq69eSFDFFE+MLZ4o/CaSCwbY/swxyP9W+toeVGi
	zMsUnrJC/eRw8MkAN9DYdbQs2EZSpJ3Lwdvz7esDRYdUHj+AXSa1dOwfSwWubqRIK1f3E+AH+LJZv
	R/KR3b9Hnv8wBoH2vqsZ1nThD7C08cjX4yVCn2QgiSg2w8JZh0gSggNpkLT6VSRuTmN3n+CP13SoX
	InfFpo4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwf74-0004zw-04; Tue, 05 Jan 2021 05:42:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwf71-0004zU-Pc
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 05:42:33 +0000
X-UUID: 62d145542d2a442499110ba91da118c5-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FUWSm12R5g9zRFj+RQm8SaliIOPxyk8jVGdXNC6xBQk=; 
 b=SqW8aNgtDKlXRE1RF0yDG6xtJSTCkvB/2roBJj++Q/jrfQ2Um4Ek4/a4m2+MyR4NytWVgvnsNNOXyI3Z6atxXfGr7fA2IL5Z/fdlaaS9hjQYC0zl9F52nC29Hb8/VHn313xy4qSHkMixgkANqY4hRCphCIbJBej4bBO4cmVY7JQ=;
X-UUID: 62d145542d2a442499110ba91da118c5-20210104
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1032669088; Mon, 04 Jan 2021 21:42:28 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 21:42:26 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 13:42:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 13:42:25 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: testmode: add support to set user-defined spe index
Date: Tue, 5 Jan 2021 13:41:24 +0800
Message-ID: <20210105054124.5946-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_004232_448071_D52AB58E 
X-CRM114-Status: GOOD (  15.19  )
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

Add spatial extension (spe) index as a configurable parameter in testmode.
This is used for specifically configuring TX path, such as different
WF TX priority, number of antennas and spatial streams.

If spe_idx is not set, TX path depends on tx_antenna_mask; otherwise,
both spe_idx and tx_antenna_mask are referenced to decide TX path.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h         |  1 +
 .../net/wireless/mediatek/mt76/mt7915/testmode.c  | 15 ++++++++++-----
 drivers/net/wireless/mediatek/mt76/testmode.c     |  4 ++++
 drivers/net/wireless/mediatek/mt76/testmode.h     |  2 ++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 10034c21f812..245a7197b017 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -539,6 +539,7 @@ struct mt76_testmode_data {
 	u8 tx_ltf;
 
 	u8 tx_antenna_mask;
+	u8 tx_spe_idx;
 
 	u32 freq_offset;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index b58c91ea3fa5..278f279cc67b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -205,6 +205,7 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 {
 	static const u8 spe_idx_map[] = {0, 0, 1, 0, 3, 2, 4, 0,
 					 9, 8, 6, 10, 16, 12, 18, 0};
+	struct mt76_testmode_data *td = &phy->mt76->test;
 	struct sk_buff *skb = phy->mt76->test.tx_skb;
 	struct mt7915_dev *dev = phy->dev;
 	struct ieee80211_tx_info *info;
@@ -212,17 +213,21 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 	mt7915_tm_set_trx(phy, TM_MAC_RX_RXV, false);
 
 	if (en) {
-		u8 tx_ant = phy->mt76->test.tx_antenna_mask;
-
 		mutex_unlock(&dev->mt76.mutex);
 		mt7915_set_channel(phy);
 		mutex_lock(&dev->mt76.mutex);
 
 		mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
 
-		if (phy != &dev->phy)
-			tx_ant >>= 2;
-		phy->test.spe_idx = spe_idx_map[tx_ant];
+		if (td->tx_spe_idx) {
+			phy->test.spe_idx = td->tx_spe_idx;
+		} else {
+			u8 tx_ant = td->tx_antenna_mask;
+
+			if (phy != &dev->phy)
+				tx_ant >>= 2;
+			phy->test.spe_idx = spe_idx_map[tx_ant];
+		}
 	}
 
 	mt7915_tm_set_trx(phy, TM_MAC_TX, en);
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 8b14620e16fc..ad8edf137b36 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -14,6 +14,7 @@ static const struct nla_policy mt76_tm_policy[NUM_MT76_TM_ATTRS] = {
 	[MT76_TM_ATTR_TX_RATE_STBC] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_LTF] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_ANTENNA] = { .type = NLA_U8 },
+	[MT76_TM_ATTR_TX_SPE_IDX] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER_CONTROL] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER] = { .type = NLA_NESTED },
 	[MT76_TM_ATTR_FREQ_OFFSET] = { .type = NLA_U32 },
@@ -359,6 +360,7 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_LTF], &td->tx_ltf, 0, 2) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_ANTENNA], &td->tx_antenna_mask,
 			   1 << (ext_phy * 2), phy->antenna_mask << (ext_phy * 2)) ||
+	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_SPE_IDX], &td->tx_spe_idx, 0, 27) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_POWER_CONTROL],
 			   &td->tx_power_control, 0, 1))
 		goto out;
@@ -499,6 +501,8 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_LTF, td->tx_ltf)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_ANTENNA) &&
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_ANTENNA, td->tx_antenna_mask)) ||
+	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_SPE_IDX) &&
+	     nla_put_u8(msg, MT76_TM_ATTR_TX_SPE_IDX, td->tx_spe_idx)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_POWER_CONTROL) &&
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_POWER_CONTROL, td->tx_power_control)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_FREQ_OFFSET) &&
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 7efad685a17c..f215b377d7fb 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -29,6 +29,7 @@
  * @MT76_TM_ATTR_TX_LTF: packet tx LTF, set 0 to 2 for 1x, 2x, and 4x LTF (u8)
  *
  * @MT76_TM_ATTR_TX_ANTENNA: tx antenna mask (u8)
+ * @MT76_TM_ATTR_TX_SPE_IDX: tx spatial extension index (u8)
  * @MT76_TM_ATTR_TX_POWER_CONTROL: enable tx power control (u8)
  * @MT76_TM_ATTR_TX_POWER: per-antenna tx power array (nested, u8 attrs)
  *
@@ -56,6 +57,7 @@ enum mt76_testmode_attr {
 	MT76_TM_ATTR_TX_LTF,
 
 	MT76_TM_ATTR_TX_ANTENNA,
+	MT76_TM_ATTR_TX_SPE_IDX,
 	MT76_TM_ATTR_TX_POWER_CONTROL,
 	MT76_TM_ATTR_TX_POWER,
 
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
