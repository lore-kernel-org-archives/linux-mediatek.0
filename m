Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373A2C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:29:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028DC613BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028DC613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RvzfRR5flrhnswJJSKtfRmL3MSGcSOv5i9a+6/RxpkM=; b=xctO8qLoRdXvYH
	j5OxJl5/kGvH29fhic6vMksSZ3witxnTkaRDPGDtmtixwjwGCZY9kjNqQkV8lnSdN4a9tQWo82uPe
	Z0wP8TbQyiuvsSLrWhTYcS3fk+OwLRgxTazHKyeDZ5RA7KvQ1VEvrAVrg8Dr5/EPXBAy1LsaT/PNk
	/MwXI8qOKWNmX2IcGqfTrRgQKshJ2wnesJtdIfPJnL/v8Hnab147j6qVMZ5e1LO59qpCEnoH4Uyoh
	bqC6G6wFdgQ69SNd990lGVT0Vv0JD2Lc/NqdjDVCd3m++0xA904UY+0zfzebW5lPFr6sYVzgMuaoP
	qe5QQICnrluV4hn16JTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3oJk-00GIGJ-8I; Wed, 14 Jul 2021 23:29:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3lMa-00Ew4G-LI
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 20:20:15 +0000
X-UUID: eeb81f191b494549bcb4530689f334c7-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=C0mu53xOdkFFCH19z2wnMXCQ5I3zptS7FVNBfUP8Fz4=; 
 b=RpxvVlkue5vMH/C4/Vm+fwKzKSTL8qNVUSvD3QSmvKJfhmg1B0qbzOPtNsKHjtXHx0BOWTnLzZLDKi807cEghw4VHi5g/UfkorkwGGcVQkVrHfcTp8VikCeZbGObFf3i0IgOASc+PKou6b5bF+ZhhofVCbNuvk9dmBcLX/MZPeA=;
X-UUID: eeb81f191b494549bcb4530689f334c7-20210714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2022038805; Wed, 14 Jul 2021 13:20:08 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 13:20:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 04:19:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Jul 2021 04:19:59 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: fix endianness warnings in mu radiotap
Date: Thu, 15 Jul 2021 04:19:57 +0800
Message-ID: <b4a1c893d91ab7cfae9765e8e7ec3369220211ad.1626293825.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_132014_174056_C3EF6FB5 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix sparse: sparse: restricted __le32 degrades to integer

Fixes: e63fadb87fe1 ("mt76: mt7915: report HE MU radiotap")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2 - use le32_get_bits instead of FIELD_GET.

Hi Felix, please help to fold this into the previous commit.
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index f1574538315d..b74db3e61098 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -292,19 +292,16 @@ mt7915_mac_decode_he_mu_radiotap(struct sk_buff *skb,
 			 MU_PREP(FLAGS2_SIG_B_SYMS_USERS,
 				 le32_get_bits(rxv[2], MT_CRXV_HE_NUM_USER));
 
-	he_mu->ru_ch1[0] = FIELD_GET(MT_CRXV_HE_RU0, cpu_to_le32(rxv[3]));
+	he_mu->ru_ch1[0] = le32_get_bits(rxv[3], MT_CRXV_HE_RU0);
 
 	if (status->bw >= RATE_INFO_BW_40) {
 		he_mu->flags1 |= HE_BITS(MU_FLAGS1_CH2_RU_KNOWN);
-		he_mu->ru_ch2[0] =
-			FIELD_GET(MT_CRXV_HE_RU1, cpu_to_le32(rxv[3]));
+		he_mu->ru_ch2[0] = le32_get_bits(rxv[3], MT_CRXV_HE_RU1);
 	}
 
 	if (status->bw >= RATE_INFO_BW_80) {
-		he_mu->ru_ch1[1] =
-			FIELD_GET(MT_CRXV_HE_RU2, cpu_to_le32(rxv[3]));
-		he_mu->ru_ch2[1] =
-			FIELD_GET(MT_CRXV_HE_RU3, cpu_to_le32(rxv[3]));
+		he_mu->ru_ch1[1] = le32_get_bits(rxv[3], MT_CRXV_HE_RU2);
+		he_mu->ru_ch2[1] = le32_get_bits(rxv[3], MT_CRXV_HE_RU3);
 	}
 }
 
@@ -339,7 +336,7 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 	he->data5 = HE_PREP(DATA5_PE_DISAMBIG, PE_DISAMBIG, rxv[2]) |
 		    le16_encode_bits(ltf_size,
 				     IEEE80211_RADIOTAP_HE_DATA5_LTF_SIZE);
-	if (cpu_to_le32(rxv[0]) & MT_PRXV_TXBF)
+	if (le32_to_cpu(rxv[0]) & MT_PRXV_TXBF)
 		he->data5 |= HE_BITS(DATA5_TXBF);
 	he->data6 = HE_PREP(DATA6_TXOP, TXOP_DUR, rxv[14]) |
 		    HE_PREP(DATA6_DOPPLER, DOPPLER, rxv[14]);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
