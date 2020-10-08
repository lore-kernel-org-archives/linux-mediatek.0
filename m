Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BACC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 16:58:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E1BB21D7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 16:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJBnbixf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kYHE9qHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E1BB21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bBlORTnv5AywVsxOg8nBqTDFTL1HCVwCuHYYDt6xHVo=; b=NJBnbixf5MsFdUnU28QwAFe9eJ
	yOguZACOdExqkUrV2lsAXkXuMXIp0Wc/zVonrsiXxHOtptKfAcB9TdTvRHcXwwauW85sxXC0dh+Pu
	Axwfez/1yea0SOYScDY8bqSdNptXuZ4Ym6S8FR6GC8bL5xEbbs2wDuuJaHmmfFTXqszoJ0xwGiGrw
	RTgCPZdkGDc7LYtny26WiwBBx8lGXAD400rQQfuUTJktvYSIBhrPkwTaEGlcCdONO/uK3t3JdRS2y
	ejqvMQpBWqArE28Lx9zJFw2EON7PqAzg8DgyTDDuw+2W46uA7qsZo5kCa57f3Z2/qBVwWEO3U021x
	XAmUlEPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQZEn-0006in-PP; Thu, 08 Oct 2020 16:57:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQZEi-0006hl-Sg
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 16:57:51 +0000
X-UUID: 31075114b26346e7bf516908d427ead7-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=B9S3JQEMt9isWDCJIhLxXkAqVd6tOOBHmeP5jMCSV68=; 
 b=kYHE9qHrAaH6FRLFua3lqJ/WUWllkW0aislJJutKX+61Jw/HrtN0xsRxnRTN1gW7rjgEmhNDU+X6E8qftNROsB3P+Snc1M9apnUhUedFRbuW+ssA9vQoyZZzX5Yh4DHP9arcI7IKZ1pGDpykUvY7rGJ+207u+dtcFQ2Q1J148rg=;
X-UUID: 31075114b26346e7bf516908d427ead7-20201008
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 302808926; Thu, 08 Oct 2020 08:57:40 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 09:57:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Oct 2020 00:57:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 9 Oct 2020 00:57:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/2] mt76: mt7915: update ppe threshold
Date: Fri, 9 Oct 2020 00:57:35 +0800
Message-ID: <e1beae5f3177c82fa73635a8a96fa95be609149e.1602175329.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_125749_664384_C2B4741B 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update ppe_thresh capability to sync SDK setting.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  | 43 +++++++------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 5f238bc63c2a..738b4ed8b7e7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -357,35 +357,24 @@ mt7915_set_stream_he_txbf_caps(struct ieee80211_sta_he_cap *he_cap,
 }
 
 static void
-mt7915_gen_ppe_thresh(u8 *he_ppet)
+mt7915_gen_ppe_thresh(u8 *he_ppet, int nss)
 {
-	int ru, nss, max_nss = 1, max_ru = 3;
-	u8 bit = 7, ru_bit_mask = 0x7;
+	u8 i, ppet_bits, ppet_size, ru_bit_mask = 0x7; /* HE80 */
 	u8 ppet16_ppet8_ru3_ru0[] = {0x1c, 0xc7, 0x71};
 
-	he_ppet[0] = max_nss & IEEE80211_PPE_THRES_NSS_MASK;
-	he_ppet[0] |= (ru_bit_mask <<
-		       IEEE80211_PPE_THRES_RU_INDEX_BITMASK_POS) &
-			IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK;
-
-	for (nss = 0; nss <= max_nss; nss++) {
-		for (ru = 0; ru < max_ru; ru++) {
-			u8 val;
-			int i;
-
-			if (!(ru_bit_mask & BIT(ru)))
-				continue;
-
-			val = (ppet16_ppet8_ru3_ru0[nss] >> (ru * 6)) &
-			       0x3f;
-			val = ((val >> 3) & 0x7) | ((val & 0x7) << 3);
-			for (i = 5; i >= 0; i--) {
-				he_ppet[bit / 8] |=
-					((val >> i) & 0x1) << ((bit % 8));
-				bit++;
-			}
-		}
-	}
+	he_ppet[0] = FIELD_PREP(IEEE80211_PPE_THRES_NSS_MASK, nss - 1) |
+		     FIELD_PREP(IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK,
+				ru_bit_mask);
+
+	ppet_bits = IEEE80211_PPE_THRES_INFO_PPET_SIZE *
+		    nss * hweight8(ru_bit_mask) * 2;
+	ppet_size = DIV_ROUND_UP(ppet_bits, 8);
+
+	for (i = 0; i < ppet_size - 1; i++)
+		he_ppet[i + 1] = ppet16_ppet8_ru3_ru0[i % 3];
+
+	he_ppet[i + 1] = ppet16_ppet8_ru3_ru0[i % 3] &
+			 (0xff >> (8 - (ppet_bits - 1) % 8));
 }
 
 static int
@@ -516,7 +505,7 @@ mt7915_init_he_caps(struct mt7915_phy *phy, enum nl80211_band band,
 		memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 		if (he_cap_elem->phy_cap_info[6] &
 		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
-			mt7915_gen_ppe_thresh(he_cap->ppe_thres);
+			mt7915_gen_ppe_thresh(he_cap->ppe_thres, nss);
 		} else {
 			he_cap_elem->phy_cap_info[9] |=
 				IEEE80211_HE_PHY_CAP9_NOMIMAL_PKT_PADDING_16US;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
