Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03E5C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 08:11:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16AA61040
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 08:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16AA61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I2LqAJ8N3390fg/VVdm5PbD5uDSvciDwHIbx2R5WEpY=; b=m16DCEj8fNd0cOWjLFtOwfSqQs
	d1sAvD+YFfdFVblr8VfDJ9OTPsQK1+B8jprw2jiPyWXWoQOyve4C4CvuwcbWSTrcFZCvLAFN76qDN
	54M6+vn5zi+szNwdI9DhJJ1s4BK6b4jdRRYnnkSFIo7Fy4QjtKLqeD5w0WbffNEXmfFIWeksti1mr
	EjummSrb6Cbp1Hg8ceyJRNhPXfegLBRl5yIaXdxJhjTeUw/17vFQlvMlER5aiVQHSBsP1BQ3zAYZA
	MPRgl8x8c4HSCJlv1PABsiw3SRYUlHHgC/Y/8TeS7IkCur3SUdPzMKV1wlqCm6LarzhJ5ZdilKPKK
	pndW6hjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldTdl-00DQk3-LI; Mon, 03 May 2021 08:09:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldTa9-00DQZJ-7F
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 08:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=VNcMFKkGRt5XFY1NfztYLciasBPywBoidcnMEEfyfHI=; b=Pfx5nydxtWftFZHdOeIrjjhluL
 8rBO9mpV9TIdVlZXz30gTRH7zR1a7zEDPXkUswS87hq+nlZepO2B2YIwbUAPNVZSoudvzeIyKzZYR
 xrD4iTaINC3JfFvIQ+xaJ1gOZvhqr8X+qBj43WqnLW4/Fcp7KvgZNEReiIQuAbn/gMb6+kyciNwln
 HPGHfsZA18v4k2sWtmsXBNtOlw8kwpq6T5St0j6sH3N2OUA/jQStYZnW+ATZyqpj3qkFRZk65smzt
 7NLhhmdqBvRc8tS+X94R3ADBnoJVPKdI1Bl5GgfXV27TrVZpxJU9jCH3EJErlaPimXbEO5txmJgCt
 08Ak23Gw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldTa4-002uFf-L9
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 08:05:31 +0000
X-UUID: cdd1769169e647f1a72e40011cd94704-20210503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VNcMFKkGRt5XFY1NfztYLciasBPywBoidcnMEEfyfHI=; 
 b=WJ7smo2oJ2SJHN3IQaMZ17uhjFxbPh8QbpzwFBZJ0LoDZM2RyzOtq2aZDFHPkwS4s56a43wr1DgUS+i7IqGJLEKA/z+9tj/9WS1pPhWSMyT3RXwSdvgO2i9o5Q1op8z114hs6xy8kSy3Mk1NNuYnpMG+Qms5udyS6BIyEKw1dIw=;
X-UUID: cdd1769169e647f1a72e40011cd94704-20210503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 223366714; Mon, 03 May 2021 01:05:23 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 May 2021 01:05:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 May 2021 16:05:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 May 2021 16:05:19 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix tssi indication field of DBDC NICs
Date: Mon, 3 May 2021 16:04:37 +0800
Message-ID: <20210503080437.4697-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_010528_725910_14C6D74D 
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

From: Evelyn Tsai <evelyn.tsai@mediatek.com>

Correct the bitfield which indicates TSSI on/off for MT7915D NIC.

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 033fb59..7896e98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -99,12 +99,15 @@ static inline bool
 mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 {
 	u8 *eep = dev->mt76.eeprom.data;
+	u8 val = eep[MT_EE_WIFI_CONF + 7];
 
-	/* TODO: DBDC */
-	if (band == NL80211_BAND_5GHZ)
-		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF7_TSSI0_5G;
+	if (band == NL80211_BAND_2GHZ)
+		return val & MT_EE_WIFI_CONF7_TSSI0_2G;
+
+	if (dev->dbdc_support)
+		return val & MT_EE_WIFI_CONF7_TSSI1_5G;
 	else
-		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF7_TSSI0_2G;
+		return val & MT_EE_WIFI_CONF7_TSSI0_5G;
 }
 
 extern const u8 mt7915_sku_group_len[MAX_SKU_RATE_GROUP_NUM];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
