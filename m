Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF956C43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:33:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F9B2145D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 11:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z3GFxJwK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EaUeINj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F9B2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjs6SN/ePrd0xIY3x2XHULvqkdiJk7HbZohGcShwHME=; b=Z3GFxJwKydOqvSeWV0tiOySjw
	B5KZZiFw2rWxKuYLzWkBei0t44nLSEAEmXg4HJszS/YKLwPNYWkZKSf/fFXUv8IoP6Z8TaHj5zQ3/
	E1NGHPInjm0+ulh0EaB2bq34XaYzSV1JdjWgfbxZwO4BLQyU7h6GGpG0QrdqeWa6Tz3j08JB3a0CK
	AK1LNpLbH4ZL+h4GklL7SYttQfUSdGr9zCNQ3RAg11RXsFNhRkVKypvi+fB/VWt7qHhxUisdcNB4B
	PTRDeawquBF+HC9HCa7Y7UmpEMGTFh9DFz0hu5BhjixFgjaZyMOqy2VDK4AYeCcUhwY7uPPeI98ae
	zBth9W6iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQUAv-0003SH-8c; Thu, 08 Oct 2020 11:33:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQUAr-0003Q1-JS
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 11:33:31 +0000
X-UUID: 811172f351304bb4bdb9f943d2524aff-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Jr3PpmPxf4YpQ1WSV2Kg/UqnZIP4x9uYIzuLKETeUII=; 
 b=EaUeINj3Ffqk/jKAv905dvRjm5afHop5UV5ve5Xs2KJB5N+xZzBZmxHrNXzbj56YvX0NmKXe5noXsP1AicjzKKzbnxxXiTa9B8aVuBWNZhbvnq9qdGg3hg+9/h3Jo/ZnvsSzNaWggOn3Iujpglc/rcjILq29dGfo9pcZKejd2iA=;
X-UUID: 811172f351304bb4bdb9f943d2524aff-20201008
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1545370251; Thu, 08 Oct 2020 03:33:17 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 04:33:16 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 19:33:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 8 Oct 2020 19:33:13 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 06/10] mt76: testmode: add support for HE rate modes
Date: Thu, 8 Oct 2020 19:29:00 +0800
Message-ID: <20201008112904.10620-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201008112904.10620-1-shayne.chen@mediatek.com>
References: <20201008112904.10620-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_073329_832607_658EFBF2 
X-CRM114-Status: GOOD (  11.03  )
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

Extend enum mt76_testmode_tx_mode to support various HE rate modes.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/testmode.c | 6 +++++-
 drivers/net/wireless/mediatek/mt76/testmode.h | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index f37a460..d1b1716 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -84,6 +84,10 @@ mt76_testmode_tx_init(struct mt76_dev *dev)
 	info->flags = IEEE80211_TX_CTL_INJECTED |
 		      IEEE80211_TX_CTL_NO_ACK |
 		      IEEE80211_TX_CTL_NO_PS_BUFFER;
+
+	if (td->tx_rate_mode > MT76_TM_TX_MODE_VHT)
+		goto out;
+
 	rate = &info->control.rates[0];
 	rate->count = 1;
 	rate->idx = td->tx_rate_idx;
@@ -152,7 +156,7 @@ mt76_testmode_tx_init(struct mt76_dev *dev)
 			break;
 		}
 	}
-
+out:
 	skb_set_queue_mapping(skb, IEEE80211_AC_BE);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 11869ce..d57692e 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -147,12 +147,20 @@ enum mt76_testmode_state {
  * @MT76_TM_TX_MODE_OFDM: legacy OFDM mode
  * @MT76_TM_TX_MODE_HT: 802.11n MCS
  * @MT76_TM_TX_MODE_VHT: 802.11ac MCS
+ * @MT76_TM_TX_MODE_HE_SU: 802.11ax single-user MIMO
+ * @MT76_TM_TX_MODE_HE_EXT_SU: 802.11ax extended-range SU
+ * @MT76_TM_TX_MODE_HE_TB: 802.11ax trigger-based
+ * @MT76_TM_TX_MODE_HE_MU: 802.11ax multi-user MIMO
  */
 enum mt76_testmode_tx_mode {
 	MT76_TM_TX_MODE_CCK,
 	MT76_TM_TX_MODE_OFDM,
 	MT76_TM_TX_MODE_HT,
 	MT76_TM_TX_MODE_VHT,
+	MT76_TM_TX_MODE_HE_SU,
+	MT76_TM_TX_MODE_HE_EXT_SU,
+	MT76_TM_TX_MODE_HE_TB,
+	MT76_TM_TX_MODE_HE_MU,
 
 	/* keep last */
 	NUM_MT76_TM_TX_MODES,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
