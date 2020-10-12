Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D5C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:26:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF0C20776
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTE6amYi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GCpnpug/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AF0C20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hCtIjO0u0d1qEVBvLHNrEAxB1WQIEjRHzfctKSeAJdc=; b=jTE6amYi5HiLhl4SNLIWzzkRC
	7dJceTeG1Ve8qykmfa7wDwDtpmQbtBkVfHcifs08rZV0R/Dj+OryjYUSud2D3msN0aTowyxn9RJej
	HBBeePgWYeczoSMxo8joW7RMRdEfIRxzv4yJ3iFddjeWwPRu6qT/85thjBUrBR8IqZDhFXS2zhefd
	RK0g4Tv5qgcatS1ci0l/qXrUdV4VFH3qu4Zh+JybMdVtK0pwW4XjeWnkxh7pS20vuAeaP+ssZ+zu5
	PXiPmokRCKrudo1V2C7r807RNBYUN8Gng97wvf4GqUEhVp2UBGLYr/X+EVy7U4R4IBNVYbSak7q4/
	zkYRSOk7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRoTp-0007O7-6V; Mon, 12 Oct 2020 03:26:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRoTm-0007Ma-9h
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 03:26:31 +0000
X-UUID: 8f5b1461baef4b52b5dbec203249f832-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qecDgwq7YOsnxkF3T1NRIYX5PYBamH5VlKjTlQTAni4=; 
 b=GCpnpug/NrQJf3RdWjPz309+rGTD30LDIxJpa/N1gr3uIWtAgE994mAtmDnwMgeBsQoOaxZJoG+phc5C9pe/1znSUAxtPzRblMobfsaOyT0sWMKwtlyUHEg4/qx3u3YKlTGBqHfmjU+NLZHcViDhMjm0eaHoeFMqD1l40h8GmTU=;
X-UUID: 8f5b1461baef4b52b5dbec203249f832-20201011
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 43514459; Sun, 11 Oct 2020 19:26:25 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 20:26:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 11:26:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 11:26:21 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 04/10] mt76: testmode: add support for LTF and GI
 combinations for HE mode
Date: Mon, 12 Oct 2020 11:25:32 +0800
Message-ID: <20201012032538.21314-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012032538.21314-1-shayne.chen@mediatek.com>
References: <20201012032538.21314-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_232630_471947_6929ECEF 
X-CRM114-Status: GOOD (  13.91  )
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

Prepare for setting different LTF (1x, 2x, and 4x) and GI (0.8us,
1.6us, 3.2us) combinations in HE rate mode.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 1 +
 drivers/net/wireless/mediatek/mt76/testmode.c | 6 +++++-
 drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9ff249e..a0f225c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -528,6 +528,7 @@ struct mt76_testmode_data {
 	u8 tx_rate_sgi;
 	u8 tx_rate_ldpc;
 	u8 tx_rate_stbc;
+	u8 tx_ltf;
 
 	u8 tx_antenna_mask;
 
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 6b59e08..f37a460 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -12,6 +12,7 @@ static const struct nla_policy mt76_tm_policy[NUM_MT76_TM_ATTRS] = {
 	[MT76_TM_ATTR_TX_RATE_SGI] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_RATE_LDPC] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_RATE_STBC] = { .type = NLA_U8 },
+	[MT76_TM_ATTR_TX_LTF] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_ANTENNA] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER_CONTROL] = { .type = NLA_U8 },
 	[MT76_TM_ATTR_TX_POWER] = { .type = NLA_NESTED },
@@ -338,9 +339,10 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   0, MT76_TM_TX_MODE_MAX) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_NSS], &td->tx_rate_nss,
 			   1, hweight8(phy->antenna_mask)) ||
-	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_SGI], &td->tx_rate_sgi, 0, 1) ||
+	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_SGI], &td->tx_rate_sgi, 0, 2) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_LDPC], &td->tx_rate_ldpc, 0, 1) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_RATE_STBC], &td->tx_rate_stbc, 0, 1) ||
+	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_LTF], &td->tx_ltf, 0, 2) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_ANTENNA], &td->tx_antenna_mask, 1,
 			   phy->antenna_mask) ||
 	    mt76_tm_get_u8(tb[MT76_TM_ATTR_TX_POWER_CONTROL],
@@ -478,6 +480,8 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_SGI, td->tx_rate_sgi) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_LDPC, td->tx_rate_ldpc) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_STBC, td->tx_rate_stbc) ||
+	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_LTF) &&
+	     nla_put_u8(msg, MT76_TM_ATTR_TX_LTF, td->tx_ltf)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_ANTENNA) &&
 	     nla_put_u8(msg, MT76_TM_ATTR_TX_ANTENNA, td->tx_antenna_mask)) ||
 	    (mt76_testmode_param_present(td, MT76_TM_ATTR_TX_POWER_CONTROL) &&
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 00c1659..3c09aa5 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -26,6 +26,7 @@
  * @MT76_TM_ATTR_TX_RATE_SGI: packet tx use short guard interval (u8)
  * @MT76_TM_ATTR_TX_RATE_LDPC: packet tx enable LDPC (u8)
  * @MT76_TM_ATTR_TX_RATE_STBC: packet tx enable STBC (u8)
+ * @MT76_TM_ATTR_TX_LTF: packet tx LTF, set 0 to 2 for 1x, 2x, and 4x LTF (u8)
  *
  * @MT76_TM_ATTR_TX_ANTENNA: tx antenna mask (u8)
  * @MT76_TM_ATTR_TX_POWER_CONTROL: enable tx power control (u8)
@@ -52,6 +53,7 @@ enum mt76_testmode_attr {
 	MT76_TM_ATTR_TX_RATE_SGI,
 	MT76_TM_ATTR_TX_RATE_LDPC,
 	MT76_TM_ATTR_TX_RATE_STBC,
+	MT76_TM_ATTR_TX_LTF,
 
 	MT76_TM_ATTR_TX_ANTENNA,
 	MT76_TM_ATTR_TX_POWER_CONTROL,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
