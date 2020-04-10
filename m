Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ED9C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A4B92084D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byhqcM/c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VdR8i1aT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A4B92084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaNepOJX+rBrQwm6oUhj7mkegYD2TOu6TMMEic/L0OQ=; b=byhqcM/cNE252+
	BQYqKMkavkL7/hw40GGcgkEMsCkoQ+jxqIfOcyPdw50qd4HmQ9b8yqyvtKZum8aDJV+TTUaOZVLCA
	7xj6NbT1Fc0dDGDJ0dRCRz/FK4PHr1JtkR0fzy/SsI13hZetE74g8dpll5VN/uIIDmSrQ9SHlKFm9
	1UeknsMfMcy1oxkdB4FsmD3qn2sy2H9Aece1Xpqive99MkTatzRv9H8GizLRPdzXtR0wJd+FXp5CW
	V3zu+59aY5pOXbhmcF7gnXfgXjrwQVvqr048RAbtbW1x1SnttApFP2QNLnsouPK9wTrNJ/Qowg2Cq
	7LwU2xsYum6E8x8LR5Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2ey-0000Ir-BV; Fri, 10 Apr 2020 23:02:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2et-0000Ct-HQ
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 23:02:01 +0000
X-UUID: 13fd5b2b0399413bafd497bc0d18df78-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MIvmGv2w9GSD2whpWf+Sw+fOtLcWbT81bwWiGHhLCdA=; 
 b=VdR8i1aTOulVMhaiXvWnMZChKdAYSCf5YYLvQom0KwpowrL5+nWmtRIIoPeP3DXAQ5nLBgH+2gCqZCkYsGJNnwzDZZKkcW0g4MKoRdKz0NCq8BCElqcc4QSYc05DLAUY6iSZIfngYxFRCb3h1u/GOpoiUE3PU8hDfFVnuvgoZas=;
X-UUID: 13fd5b2b0399413bafd497bc0d18df78-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2082401411; Fri, 10 Apr 2020 15:01:58 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 04/16] mt76: adjust wcid size to support new 802.11ax
 generation
Date: Sat, 11 Apr 2020 06:51:19 +0800
Message-ID: <8bf00322cb80c1ff2e9b137e97b987f1534a4d25.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_160159_579004_2D156001 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The newer 802.11ax devices (i.e. MT7915E) can connect to much more
peers than previous generations.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 8d27af61b62e..c5e44c896097 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -181,7 +181,7 @@ enum mt76_wcid_flags {
 	MT_WCID_FLAG_PS,
 };
 
-#define MT76_N_WCIDS 128
+#define MT76_N_WCIDS 288
 
 /* stored in ieee80211_tx_info::hw_queue */
 #define MT_TX_HW_QUEUE_EXT_PHY		BIT(3)
@@ -201,7 +201,7 @@ struct mt76_wcid {
 	struct ewma_signal rssi;
 	int inactive_count;
 
-	u8 idx;
+	u16 idx;
 	u8 hw_key_idx;
 
 	u8 sta:1;
@@ -268,7 +268,7 @@ struct mt76_rx_tid {
 
 struct mt76_tx_cb {
 	unsigned long jiffies;
-	u8 wcid;
+	u16 wcid;
 	u8 pktid;
 	u8 flags;
 };
@@ -441,7 +441,7 @@ struct mt76_mmio {
 struct mt76_rx_status {
 	union {
 		struct mt76_wcid *wcid;
-		u8 wcid_idx;
+		u16 wcid_idx;
 	};
 
 	unsigned long reorder_time;
@@ -618,7 +618,7 @@ enum mt76_phy_type {
 #define mt76_hw(dev) (dev)->mphy.hw
 
 static inline struct ieee80211_hw *
-mt76_wcid_hw(struct mt76_dev *dev, u8 wcid)
+mt76_wcid_hw(struct mt76_dev *dev, u16 wcid)
 {
 	if (wcid <= MT76_N_WCIDS &&
 	    mt76_wcid_mask_test(dev->wcid_phy_mask, wcid))
@@ -786,7 +786,6 @@ static inline bool mt76_is_skb_pktid(u8 pktid)
 static inline u8 mt76_tx_power_nss_delta(u8 nss)
 {
 	static const u8 nss_delta[4] = { 0, 6, 9, 12 };
-
 	return nss_delta[nss - 1];
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
