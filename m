Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B22C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB8C21D7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyURBU3N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XXNvtuzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB8C21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vi1kyXzK3BHmZHJJleZk65RL1qsYJblCKwuWL8PAC+8=; b=KyURBU3NSQFAYANP8WgynuZrD
	70btkI1jWwWefx8/sViTNwYV9wM211NiIciG7xA2839kIEIlab/n1dX6JXvBxGuHH7lgMH3IAkriQ
	KZFov3j3/M2HHnGy1XJES0hrKSdTevHs4kBUKOeWtYPtqmFv8EUSfuCcOrkkUkCwzTDNaUqVUN8w3
	Ukyn0zb3AOeWrWjsX3CR1QOXnE77ytOH6d1hVY1xND1rorsO28zTood6A3h6+IIYnfpZOqTkKXjYn
	xoAo3g42924gORVwxvlBNjlBWZboMEGXbSPtJuf41JVB1c6ubAzKm2qliB7CPfNFfEYwacDQfPPO5
	rsCL1O3UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxN1-0000Hh-MF; Mon, 12 Oct 2020 12:56:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxMw-0000Fu-TE
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 12:56:04 +0000
X-UUID: 818d939c254b4a77a9d8a441858794d6-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IV3VKhX62l8SB/s3LSR95ku9WRinPqcgkb7E4fEt4ck=; 
 b=XXNvtuzrYEEgnz9c/92dKdKRtRRxiPA9QqvgzDtzrnFQo2OZTKP+zxOTDAcw9YCL3JIKiJZaGPJT0uBbSakA0ZaqsPt8JwOwFy8Tdnt9DgtPUfF3HiQ4PRVVe8jINdgsVBWU7koYaHQm6F4qDMkhxtj1YRR4ARfsYzmxalTpgjA=;
X-UUID: 818d939c254b4a77a9d8a441858794d6-20201012
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1485210326; Mon, 12 Oct 2020 04:56:01 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:55:58 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 20:55:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 20:55:55 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 03/10] mt76: testmode: add tx_rate_stbc parameter
Date: Mon, 12 Oct 2020 20:53:56 +0800
Message-ID: <20201012125403.8608-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012125403.8608-1-shayne.chen@mediatek.com>
References: <20201012125403.8608-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 30E3D097D701E11222CE8D14069C19253F09B0D1CD635E20B323782A87D13DE82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_085603_126604_E6FE8313 
X-CRM114-Status: GOOD (  12.52  )
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

Add the parameter to control STBC function in testmode.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 1 +
 drivers/net/wireless/mediatek/mt76/testmode.c | 6 ++++++
 drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 009d20a..9ff249e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -527,6 +527,7 @@ struct mt76_testmode_data {
 	u8 tx_rate_nss;
 	u8 tx_rate_sgi;
 	u8 tx_rate_ldpc;
+	u8 tx_rate_stbc;
 
 	u8 tx_antenna_mask;
 
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 883f59c..6b59e08 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -11,6 +11,7 @@ static const struct nla_policy mt76_tm_policy[NUM_MT76_TM_ATTRS] = {
 	[MT76_TM_ATTR_TX_RATE_IDX] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_RATE_SGI] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_RATE_LDPC] = { .type = NLA_U8 },
+	[MT76_TM_ATTR_TX_RATE_STBC] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_ANTENNA] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER_CONTROL] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER] = { .type = NLA_NESTED },
@@ -131,6 +132,9 @@ mt76_testmode_tx_init(struct mt76_dev *dev)
 	if (td->tx_rate_ldpc)
 		info->flags |= IEEE80211_TX_CTL_LDPC;
 
+	if (td->tx_rate_stbc)
+		info->flags |= IEEE80211_TX_CTL_STBC;
+
 	if (td->tx_rate_mode >= MT76_TM_TX_MODE_HT) {
 		switch (dev->phy.chandef.width) {
 		case NL80211_CHAN_WIDTH_40:
@@ -336,6 +340,7 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   1, hweight8(phy->antenna_mask)) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_SGI], &td->tx_rate_sgi, 0, 1) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_LDPC], &td->tx_rate_ldpc, 0, 1) ||
+	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_STBC], &td->tx_rate_stbc, 0, 1) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_ANTENNA], &td->tx_antenna_mask, 1,
 			   phy->antenna_mask) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_POWER_CONTROL],
@@ -472,6 +477,7 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_IDX, td->tx_rate_idx) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_SGI, td->tx_rate_sgi) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_LDPC, td->tx_rate_ldpc) ||
+	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_STBC, td->tx_rate_stbc) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_ANTENNA) &&
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_ANTENNA, td->tx_antenna_mask)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_POWER_CONTROL) &&
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 4d22627..00c1659 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -25,6 +25,7 @@
  * @MT76_TM_ATTR_TX_RATE_IDX: packet tx rate/MCS index (u8)
  * @MT76_TM_ATTR_TX_RATE_SGI: packet tx use short guard interval (u8)
  * @MT76_TM_ATTR_TX_RATE_LDPC: packet tx enable LDPC (u8)
+ * @MT76_TM_ATTR_TX_RATE_STBC: packet tx enable STBC (u8)
  *
  * @MT76_TM_ATTR_TX_ANTENNA: tx antenna mask (u8)
  * @MT76_TM_ATTR_TX_POWER_CONTROL: enable tx power control (u8)
@@ -50,6 +51,7 @@ enum mt76_testmode_attr {
 	MT76_TM_ATTR_TX_RATE_IDX,
 	MT76_TM_ATTR_TX_RATE_SGI,
 	MT76_TM_ATTR_TX_RATE_LDPC,
+	MT76_TM_ATTR_TX_RATE_STBC,
 
 	MT76_TM_ATTR_TX_ANTENNA,
 	MT76_TM_ATTR_TX_POWER_CONTROL,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
