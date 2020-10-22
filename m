Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8531FC55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:39:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF9322249
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWznw8p1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f7G0maA8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF9322249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vi1kyXzK3BHmZHJJleZk65RL1qsYJblCKwuWL8PAC+8=; b=IWznw8p1DXu9e862/tBxgmwDp
	uIyTCgX7/9fllNy6GCv6E2KRYaWucLzXP/1QDZ/BSnwOmjKI6I1n7HOx1PVQWkKQvHWzB/9i0tCwj
	G31jzJie3OdOmq/yz+fw3NJN5A3wPbVmTx0FEKDGoim5zTZjtOqym8J4ICIkqleI+r8rLDgGumvwe
	qUTKNpb4QvAzsdU0+WCDaT5AGkI2En5XmX9A4QrVfNJJhXQdbAeBxP3R9EkSAuN7euzW7Y5iGWkiD
	vYUOw3ahGgNr9vT5aHqwx8Gra9Xe0oaJujp5Rn9LdHDE6f9tP0PMgEGObruAhk0GaNUku238p+13n
	H9QLSl4ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVQVC-0003TA-6I; Thu, 22 Oct 2020 02:38:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVQV9-0003S9-Nb
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 02:38:53 +0000
X-UUID: d19739f9f71b4328b99f3a50be2af94d-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IV3VKhX62l8SB/s3LSR95ku9WRinPqcgkb7E4fEt4ck=; 
 b=f7G0maA8I0ur7hDWvDwkVfFP/i+9SKZwFXBJiME181wUmcAHCsj1DFQ1fsf89sEVFJB8Rl5R9W67LVYLMHiDe0mk85xRAJZw2GRvNkx/Z+0mJo2b9+dsgHTOlHMShYCoL377wszI7zXUcZ4L2nVJ66Nn3UwA2gAQj1JmoXPp7nc=;
X-UUID: d19739f9f71b4328b99f3a50be2af94d-20201021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1444053197; Wed, 21 Oct 2020 18:38:48 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 19:28:46 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 10:28:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 10:28:38 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v4 03/10] mt76: testmode: add tx_rate_stbc parameter
Date: Thu, 22 Oct 2020 10:28:13 +0800
Message-ID: <20201022022820.3077-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201022022820.3077-1-shayne.chen@mediatek.com>
References: <20201022022820.3077-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_223852_004489_BA5AD4BE 
X-CRM114-Status: GOOD (  13.39  )
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
