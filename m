Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CB3C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:36:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DF920708
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8YpIt2I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qCjRRGFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4DF920708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9LLAik5uCVkX6R04GuvnlTZZDWuzJHSUtje2jowlswU=; b=E8YpIt2IokGdIsiV0rKNJA4YG
	cqvb3Byu09OpttoNbpMcM/8Zm/C89fZd9JdUqTCVE6/JQiNv860I0pIvBn82vESoCS9SvOPRBSAb3
	pBjxgDQ/gjHwqzcmR5Pnqa3Nhkf5cxaO/e2y799y1KU31igtt0iDNZ9PxDRwDQFCo05ZmG7Uk68DD
	NHLSycGsXdY15Hr9kAzdTbfo8TCuvY9864FGPC3iwxd2NWEuccNeWL02cPM0QjQVxeLR9isF4h9yD
	y7wOv0+EkbQzn5UJmm+wJwZ3n5/3hwcN0sfJfygpDVoQEaZIcgp34iYA+6wUDHOOAiGkERdnlFAPQ
	wYgIQtgAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRodf-0000sS-7t; Mon, 12 Oct 2020 03:36:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRoda-0000pO-Qs
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 03:36:42 +0000
X-UUID: 5010609b2bf546d7a2969293b5da17cf-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1C3zflfx2s+KzWYaoiZsMJZCys0IJqzAQ1/HIbiKSH4=; 
 b=qCjRRGFbiYqeDbSGciR7vduzjzhQh+t1twZBgcMoeOrcakrjss7TD1GTB7QkBynSGu2X4Mhz8kd8stjcSZvGv4XXElV9aiTLEWFvjNhzZfB3O9PV4BZEbRkzb4zzrvF8UlU3YdH0AIvg5d/8hPXcR/RFizfymneWMoUBWR7hl1k=;
X-UUID: 5010609b2bf546d7a2969293b5da17cf-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 907508962; Sun, 11 Oct 2020 19:36:32 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 20:26:30 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 11:26:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 11:26:25 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 06/10] mt76: testmode: add support for HE rate modes
Date: Mon, 12 Oct 2020 11:25:34 +0800
Message-ID: <20201012032538.21314-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012032538.21314-1-shayne.chen@mediatek.com>
References: <20201012032538.21314-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 09CC6FF2875DF2C761E7C19B27DC23A6E7DAC8E7C99941BBD19E3BBBE80905B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_233639_044240_8796BB77 
X-CRM114-Status: GOOD (  11.23  )
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

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
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
index 3c09aa5..7efad68 100644
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
