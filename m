Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC17C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 20:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB6A61260
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 20:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB6A61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YdKcNhskGrAwtFWrS0SZViIjS/qmBQEJFgb9BRyH/gk=; b=Ooleq/02fIAaIy
	ZWQApw6uVq+JSGMehuOEMyoPYGaG3CZquQCvkKcjRePeYvtz7Wq2WNARHGaTmbojke91swaKbx9XZ
	y3j60LRyGz+sTrSgLEwMt8ULkkzSrrU7Yb3AWRQGY4GWcxJFMzR71DnSOjNbqHN/GDYx9C23Gqh0A
	eNGJfl424Lt85t2UoiEg8rAJYU+IFu/ns2jENcrqQorRMjt1KMpEyQAJYVL5i/bGEZILtSD/W+zHs
	/3kQ0mvdC4B1Q6yQACAfWzpT9B9MtBm4w4chbmoyl2J1+MgKqaaPnJAvib2Mj+n5WgT977SHIscc/
	o2RD2JndSbShiZosVZpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3lTi-00Ez4C-9f; Wed, 14 Jul 2021 20:27:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3kjc-00Eccd-26
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 19:39:57 +0000
X-UUID: cd96d7a02b564cd296679fe4a8292807-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OtxoZqYKc/gu1uWdCq4sNBX9BBjWZOtjHuQzbqOGpr0=; 
 b=YCPJv3kuSTk7Fgx8yYIVro+wDjc1BmpNknR0vqv6rHezTIcB2hU7V/yjK/20hC/DlKQktBjXTI2m1u2OBnaeAl6NgzHKl2MBp8qaOkBQA4oSc8PjENTUVh+pMvTunw7PkMoXSOk1KwB1XIQ12hLc7x8kIpa+poLg7mxI2xJhYis=;
X-UUID: cd96d7a02b564cd296679fe4a8292807-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 55047727; Wed, 14 Jul 2021 12:39:51 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 12:39:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 03:39:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Jul 2021 03:39:42 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix endianness warnings in mu radiotap
Date: Thu, 15 Jul 2021 03:39:41 +0800
Message-ID: <042666b307b7a424680bd20b6ac3bd3a74e3a1f7.1626291427.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_123956_171307_8B7DD4A0 
X-CRM114-Status: UNSURE (   9.40  )
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
Hi Felix, could you help to fold this into previous commit?
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index f1574538315d..cb7397f53045 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -292,19 +292,19 @@ mt7915_mac_decode_he_mu_radiotap(struct sk_buff *skb,
 			 MU_PREP(FLAGS2_SIG_B_SYMS_USERS,
 				 le32_get_bits(rxv[2], MT_CRXV_HE_NUM_USER));
 
-	he_mu->ru_ch1[0] = FIELD_GET(MT_CRXV_HE_RU0, cpu_to_le32(rxv[3]));
+	he_mu->ru_ch1[0] = FIELD_GET(MT_CRXV_HE_RU0, le32_to_cpu(rxv[3]));
 
 	if (status->bw >= RATE_INFO_BW_40) {
 		he_mu->flags1 |= HE_BITS(MU_FLAGS1_CH2_RU_KNOWN);
 		he_mu->ru_ch2[0] =
-			FIELD_GET(MT_CRXV_HE_RU1, cpu_to_le32(rxv[3]));
+			FIELD_GET(MT_CRXV_HE_RU1, le32_to_cpu(rxv[3]));
 	}
 
 	if (status->bw >= RATE_INFO_BW_80) {
 		he_mu->ru_ch1[1] =
-			FIELD_GET(MT_CRXV_HE_RU2, cpu_to_le32(rxv[3]));
+			FIELD_GET(MT_CRXV_HE_RU2, le32_to_cpu(rxv[3]));
 		he_mu->ru_ch2[1] =
-			FIELD_GET(MT_CRXV_HE_RU3, cpu_to_le32(rxv[3]));
+			FIELD_GET(MT_CRXV_HE_RU3, le32_to_cpu(rxv[3]));
 	}
 }
 
@@ -339,7 +339,7 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
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
