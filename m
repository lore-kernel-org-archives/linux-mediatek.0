Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED37CC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:58:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF4C2068E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zA5jVhtF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IYI7sKCY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF4C2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2g1/Egoi4fVK8EnVq9sQinhmEm+qfinRks6teJgv8AM=; b=zA5jVhtFm3ksd89hwfaUwV6hin
	x2zjO+3J2X1l/aSaEjjjprikBsFJ61iioznI9hdzteEynb7GS4vygsu/IWWPrMQR7+V1gnh/cWzcL
	V+mdtY4bo7BFmdtO1v+aOwaakbMlWRmrb+SUMLbxUxfm60GXZ+qM40teFhvTqW1QlaCF00lX9/HEe
	AkgHN+Ha44HVF/JhvcDeeAg6e8x7OiwpPA1vI1bzWPMFf3U07D1Ia3TM3P1PZ+0sBhEYctHmcB6Ch
	tZfxKL/j/zO6cMaqn7iekP11EqhR14y8dGcobU7fnif4Dahe4ISHuMxnFp9bnPcg4Pvcm99sCPw/e
	pLyzWd3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSsO-0003sp-9z; Mon, 05 Oct 2020 15:58:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSsJ-0003rK-Lz
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 15:58:09 +0000
X-UUID: f0426093e0a84431a5bd1144cf8be1ad-20201005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ki3wTt7d1tvRrJ2MPiGpeliJV3ST6qE/ddjlBK6ldMA=; 
 b=IYI7sKCYNmCiWPaOLv063Hrbd6uYxQ4JXI79b/3l8kalxPlLGncBVqEcEf54FZ4JR2ko1YDMNemi3ThtcH6nbo8W9c5cE/Nhdk6C3foOevISJ20HfehmsNgjdYrt5VQBvTg4RgfqAr1eoNTBcbebm+G7Hc8jBJFyqRWFYtn55nc=;
X-UUID: f0426093e0a84431a5bd1144cf8be1ad-20201005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 657191306; Mon, 05 Oct 2020 07:57:59 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 08:57:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 23:57:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Oct 2020 23:57:54 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7915: update ppe threshold
Date: Mon, 5 Oct 2020 23:57:52 +0800
Message-ID: <b381936001c1d62e520283b83d5492bdcdd5cf4f.1601913208.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: AD7E908D8DDEDB847D2F270C7FD6F6B51A40574D610DE60E869CDEE11431880B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_115807_872969_80197CD6 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: linux-mediatek@lists.infradead.org, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
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
index 5884c0ce45e5..f340cc5f78da 100644
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
