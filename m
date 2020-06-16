Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BB3C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B56320C09
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 12:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFaDo1NG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tR/VQaUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B56320C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiVt6RxUiAw8fXfwCyDcWSstNZ//QukeNTADPo+vZ54=; b=XFaDo1NGKYIh4X
	RyQr6JQeXj5bKuMAmrlf/dSpP07j4n+qWrCrXtHecM9jw8kHn0EtNMrdGcCGv99xsBf0C2YlABD5N
	W1SZ0ca2EIYkLoxpsUfampuq6aLNeVghtvDJnAWETm7pXS7ZcLiJwiB0VysyUH6ZwmQECzqenFf5w
	Ydlh79NEVGnOjvRIcYyee2sqBhS487/+jt+gX83NCPb0O7yEGjvtEk7ZhPJjCEHzJb2fd6Hdv51h4
	YnqqKNNrTM2Ho4obv68X+g0qUexZEkP7CXVF7Srqs15XPlwjgWPw/2kdEpNeg6T30DhxvaDXtvwMA
	A0/8eWrHjZlIoMsqMZlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlB9T-0005FI-9G; Tue, 16 Jun 2020 12:57:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlB9G-0004yO-RB
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 12:57:08 +0000
X-UUID: be349b61d258404a91a56bbb865e9a64-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zlMoMDUbTsExrKd8RFq8cHNFiYg9RxmBmUZDOlfOEwY=; 
 b=tR/VQaUPdCvsFeGMG5dgw5gSlyWdyZj8X5glEToHWPvPRGOOKmkSF3EdtpjmoPz/YMi2wtZW+LPnmE8OBVa2qu4jQrww23EPzmntIkD+XXG0u+/u3GOaMt2Q4I6u92DkqxZuH2Cw4hkT60OHl39qlYLb7/MvEJLSS0J7a6EKZpM=;
X-UUID: be349b61d258404a91a56bbb865e9a64-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1110514140; Tue, 16 Jun 2020 04:56:49 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 05:46:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:46:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Jun 2020 20:46:54 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 2/4] mt76: extend DT rate power limits to support 11ax devices
Date: Tue, 16 Jun 2020 20:46:11 +0800
Message-ID: <08d8c206b15e705489fab96dbe9dd8a77874c4a4.1592276165.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
References: <9ae2b6233284b60206e3513f7bf2eb03d2fbd724.1592276165.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_055706_905455_31148339 
X-CRM114-Status: GOOD (  10.55  )
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

Enable parsing per-rate txpower limits from DT for 11ax chipsets.

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 63 ++++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt76.h   |  1 +
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 334606b07693..87a5d2db05e1 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -221,6 +221,41 @@ mt76_apply_array_limit(s8 *pwr, size_t pwr_len, const __be32 *data,
 	}
 }
 
+static void
+mt76_apply_mcs_limit(struct mt76_power_limits *dest, u32 mcs_rates,
+		     const __be32 *data, size_t len, s8 target_power,
+		     s8 nss_delta, s8 *max_power)
+{
+	s8 *pwr = (s8 *)dest->mcs;
+	u8 pwr_num = ARRAY_SIZE(dest->mcs), pwr_len = ARRAY_SIZE(dest->mcs[0]);
+	int i, cur;
+
+	if (mcs_rates == ARRAY_SIZE(dest->ru[0])) {
+		pwr = (s8 *)dest->ru;
+		pwr_num = ARRAY_SIZE(dest->ru);
+		pwr_len = ARRAY_SIZE(dest->ru[0]);
+	}
+
+	len /= 4;
+	cur = be32_to_cpu(data[0]);
+	for (i = 0; i < pwr_num; i++) {
+		if (len < mcs_rates + 1)
+			break;
+
+		mt76_apply_array_limit(pwr + pwr_len * i, pwr_len, data + 1,
+				       target_power, nss_delta, max_power);
+		if (--cur > 0)
+			continue;
+
+		data += mcs_rates + 1;
+		len -= mcs_rates + 1;
+		if (!len)
+			break;
+
+		cur = be32_to_cpu(data[0]);
+	}
+}
+
 s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 			      struct ieee80211_channel *chan,
 			      struct mt76_power_limits *dest,
@@ -231,9 +266,9 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 	const __be32 *val;
 	char name[16];
 	u32 mcs_rates = dev->drv->mcs_rates;
+	u32 ru_rates = ARRAY_SIZE(dest->ru[0]);
 	char band;
 	size_t len;
-	int i, cur;
 	s8 max_power = 0;
 	s8 txs_delta;
 
@@ -282,26 +317,14 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 	val = mt76_get_of_array(np, "mcs", &len, mcs_rates + 1);
 	if (!val)
 		return max_power;
+	mt76_apply_mcs_limit(dest, mcs_rates, val, len, target_power,
+			     txs_delta, &max_power);
 
-	len /= 4;
-	cur = be32_to_cpu(val[0]);
-	for (i = 0; i < ARRAY_SIZE(dest->mcs); i++) {
-		if (len < mcs_rates + 1)
-			break;
-
-		mt76_apply_array_limit(dest->mcs[i], ARRAY_SIZE(dest->mcs[i]),
-				       val + 1, target_power, txs_delta,
-				       &max_power);
-		if (--cur > 0)
-			continue;
-
-		val += mcs_rates + 1;
-		len -= mcs_rates + 1;
-		if (!len)
-			break;
-
-		cur = be32_to_cpu(val[0]);
-	}
+	val = mt76_get_of_array(np, "ru", &len, ru_rates + 1);
+	if (!val)
+		return max_power;
+	mt76_apply_mcs_limit(dest, ru_rates, val, len, target_power,
+			     txs_delta, &max_power);
 
 	return max_power;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 9c5488ffbe5e..d50871653de1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -584,6 +584,7 @@ struct mt76_power_limits {
 	s8 cck[4];
 	s8 ofdm[8];
 	s8 mcs[4][10];
+	s8 ru[7][12];
 };
 
 enum mt76_phy_type {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
