Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E026C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 05:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D12861370
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 05:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D12861370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A4cb2+nZN/d4h8Ruw4B9St+rjeg88B0Ql90p+jr2KXk=; b=MOiU6EHODoZBkY
	7xDXr+DoJ+U5FbJAVOV1Y13mbk3OzC1T6mDg74wEGPCm0v3W8kzdJOv9bVTnyJ0Q2TTv6lk7jKrZt
	jwkZB1eU7kzns90x6WU/M16+yZ10NfXqgZdX4fEL4PEEhstQeh1NTsu0xFHsas+8Mri7DtmVjmrRZ
	JfzQDYkkTH44X7OpDiQ4Juesms6Hfm8v/aRT7/3b8vCUpP9zlfJzRH93en6f5fNCO7bxhLPY7gJoi
	VDNBosSqtOohwxWdvum+YpsXI9V6PtQeNFfl7+p7iJfvnjebzmEKgust/fL/p2/f+Tkklh7EsWOnq
	R0cN3+KvSyTRVIlUIsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3XgQ-00CNql-DJ; Wed, 14 Jul 2021 05:43:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3XgN-00CNq8-Be
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 05:43:44 +0000
X-UUID: bbe99d73f3f247f3a55bb6e90c5c99f4-20210713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=crvC2a3HvnD6eTR7IPJTlKZDnYuDGbdqCbUvBbGnwqw=; 
 b=bEvGO9hgHb0AJP1ij0rW51O3RPZV1aXHrl0RLIwVMFN7FZgr0ChfhH7ujp7g82tUiaodYWnQS5Bgs2l6vO8EUalV0QA4Y+m4V9QOq6xg+BreiDSbBcDCRNdSvMDOP4u0vYXCrbQGzwdyk62ufulwf6tpY5J4ADD/zNFhRl1xBDc=;
X-UUID: bbe99d73f3f247f3a55bb6e90c5c99f4-20210713
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1250576703; Tue, 13 Jul 2021 22:43:39 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 22:37:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 13:36:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Jul 2021 13:36:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] mt76 mt7915: take RCU read lock when calling
 ieee80211_bss_get_elem()
Date: Wed, 14 Jul 2021 13:36:49 +0800
Message-ID: <510ef14986079c731ea2879b3095831b60e4f648.1626240767.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_224343_443650_727D27B9 
X-CRM114-Status: UNSURE (   8.81  )
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

As ieee80211_bss_get_elem() derefences an RCU to return ssid_ie, both
the call to this function and any operation on this variable need
protection by the RCU read lock.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 863aa18b3024..4d2e5b5e6389 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -923,12 +923,15 @@ static void mt7915_check_he_obss_narrow_bw_ru_iter(struct wiphy *wiphy,
 	struct mt7915_he_obss_narrow_bw_ru_data *data = _data;
 	const struct element *elem;
 
+	rcu_read_lock();
 	elem = ieee80211_bss_get_elem(bss, WLAN_EID_EXT_CAPABILITY);
 
 	if (!elem || elem->datalen < 10 ||
 	    !(elem->data[10] &
 	      WLAN_EXT_CAPA10_OBSS_NARROW_BW_RU_TOLERANCE_SUPPORT))
 		data->tolerated = false;
+
+	rcu_read_unlock();
 }
 
 static bool mt7915_check_he_obss_narrow_bw_ru(struct ieee80211_hw *hw,
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
