Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B96C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34032225AB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 09:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34032225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8oundEsV1dhi/d6Ai3fZJLZK/4PRSdlhZgHjaFXJCsE=; b=g+GMtGfYtELk/v5CiomZpLMmrw
	kml3jnHa1pqPSX3NAPCH99lT6hO9hibYgviFw2NWZg/Wt7gUTVrMDjqlS75ZPw/NxQlnVNcfjVaBW
	VWPCMmB5cOwSTVH4AuWLUBPWwV+7t5nkCo0x8Mty/li/hGsQ/Jg1iJCjFpeD0Unp0AJL0g5Fqp1c+
	6F27qFNk3bkkV96LAjkwjswEKTPN5BsaZ6l3v7dkhDjDaGsgm7cWqilKY1rHUA5zUcOhZlicQcYfS
	PdmvQs592r0H7Ttku8jsTmwN6D8ykeunxJ4hj0VPBLSvk+4Mz30Un/marbhWRiEh6JsdMy5aC3JB6
	+soZMF/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwiDs-0003xt-Dj; Tue, 05 Jan 2021 09:01:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwiDo-0003uo-St
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 09:01:47 +0000
X-UUID: ad522f472e98498ba4be8242031ae8d4-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O3iVQZSaf0YXP74ljhxcy73T+hXmmdBemadN+fEeLVs=; 
 b=LuzoNd/VtXkVZ+Wx3yq4SVsDqCmP0jda8hTeFa1uu/ZLI5BTQ0hEPH0f0MKrT7eMw3S+6ml7uy8AYZzGDxZhAjO79tqty5Nhn5QKCntFqqCZ0WWK049jsoEudbgosDoj+n1EbUftQyHWV3nJkZyE8qzdOQtyRM1niv1Il/EYURg=;
X-UUID: ad522f472e98498ba4be8242031ae8d4-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1897514618; Tue, 05 Jan 2021 01:01:38 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 00:56:07 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 16:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 16:56:06 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 1/6] mt76: testmode: add attributes for ipg related parameters
Date: Tue, 5 Jan 2021 16:55:24 +0800
Message-ID: <20210105085529.14206-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_040145_128281_E141AFD5 
X-CRM114-Status: GOOD (  11.72  )
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

Add attributes for setting tx inter-packet gap (ipg), duty cycle, and
transmission time in testmode.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  4 ++++
 drivers/net/wireless/mediatek/mt76/testmode.c | 17 +++++++++++++++++
 drivers/net/wireless/mediatek/mt76/testmode.h |  8 ++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 245a7197b017..cbe9689dc2ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -541,6 +541,10 @@ struct mt76_testmode_data {
 	u8 tx_antenna_mask;
 	u8 tx_spe_idx;
 
+	u8 tx_duty_cycle;
+	u32 tx_time;
+	u32 tx_ipg;
+
 	u32 freq_offset;
 
 	u8 tx_power[4];
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index ad8edf137b36..74cadf51df55 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -17,6 +17,9 @@ static const struct nla_policy mt76_tm_policy[NUM_MT76_TM_ATTRS] = {
 	[MT76_TM_ATTR_TX_SPE_IDX] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER_CONTROL] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER] = { .type = NLA_NESTED },
+	[MT76_TM_ATTR_TX_DUTY_CYCLE] = { .type = NLA_U8 },
+	[MT76_TM_ATTR_TX_IPG] = { .type = NLA_U32 },
+	[MT76_TM_ATTR_TX_TIME] = { .type = NLA_U32 },
 	[MT76_TM_ATTR_FREQ_OFFSET] = { .type = NLA_U32 },
 };
 
@@ -361,10 +364,18 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_ANTENNA], &td->tx_antenna_mask,
 			   1 << (ext_phy * 2), phy->antenna_mask << (ext_phy * 2)) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_SPE_IDX], &td->tx_spe_idx, 0, 27) ||
+	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_DUTY_CYCLE],
+			   &td->tx_duty_cycle, 0, 99) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_POWER_CONTROL],
 			   &td->tx_power_control, 0, 1))
 		goto out;
 
+	if (tb[MT76_TM_ATTR_TX_IPG])
+		td->tx_ipg = nla_get_u32(tb[MT76_TM_ATTR_TX_IPG]);
+
+	if (tb[MT76_TM_ATTR_TX_TIME])
+		td->tx_time = nla_get_u32(tb[MT76_TM_ATTR_TX_TIME]);
+
 	if (tb[MT76_TM_ATTR_FREQ_OFFSET])
 		td->freq_offset = nla_get_u32(tb[MT76_TM_ATTR_FREQ_OFFSET]);
 
@@ -503,6 +514,12 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_ANTENNA, td->tx_antenna_mask)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_SPE_IDX) &&
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_SPE_IDX, td->tx_spe_idx)) ||
+	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_DUTY_CYCLE) &&
+	     nla_put_u8(msg, MT76_TM_ATTR_TX_DUTY_CYCLE, td->tx_duty_cycle)) ||
+	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_IPG) &&
+	     nla_put_u32(msg, MT76_TM_ATTR_TX_IPG, td->tx_ipg)) ||
+	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_TIME) &&
+	     nla_put_u32(msg, MT76_TM_ATTR_TX_TIME, td->tx_time)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_POWER_CONTROL) &&
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_POWER_CONTROL, td->tx_power_control)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_FREQ_OFFSET) &&
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index f215b377d7fb..cecdf358aa44 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -33,6 +33,10 @@
  * @MT76_TM_ATTR_TX_POWER_CONTROL: enable tx power control (u8)
  * @MT76_TM_ATTR_TX_POWER: per-antenna tx power array (nested, u8 attrs)
  *
+ * @MT76_TM_ATTR_TX_DUTY_CYCLE: packet tx duty cycle (u8)
+ * @MT76_TM_ATTR_TX_IPG: tx inter-packet gap, in unit of us (u32)
+ * @MT76_TM_ATTR_TX_TIME: packet transmission time, in unit of us (u32)
+ *
  * @MT76_TM_ATTR_FREQ_OFFSET: RF frequency offset (u32)
  *
  * @MT76_TM_ATTR_STATS: statistics (nested, see &enum mt76_testmode_stats_attr)
@@ -61,6 +65,10 @@ enum mt76_testmode_attr {
 	MT76_TM_ATTR_TX_POWER_CONTROL,
 	MT76_TM_ATTR_TX_POWER,
 
+	MT76_TM_ATTR_TX_DUTY_CYCLE,
+	MT76_TM_ATTR_TX_IPG,
+	MT76_TM_ATTR_TX_TIME,
+
 	MT76_TM_ATTR_FREQ_OFFSET,
 
 	MT76_TM_ATTR_STATS,
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
