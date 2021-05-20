Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A105C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:48:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E39611BD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E39611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L5zj95hFqXekZl3R/5eWv93HmvpeQXrohC6FfrTS4Co=; b=ialn7T6ARpaMx3CIwBqEcVLJF
	J9vbFP4Up/RyiATGwvR2egM7eMtrfXUggIhjarAi4ehO4LJGDelD1l7zQtWr8ja+zK2isrL0W7MKU
	8Rjn25QIopYrBfE3OcQ+wNrttW+a9kKAVNN+YtY88m5S0RaEyktBGc1yiShQDM5lDZrdog3Ho9Awj
	O7CF7xFU3KeZFlPYhyt8C9Zd65x5K3trXZRh8pu3PLc3JjdoQ4ZRZ4D71SY4LUK94BuAHeTr91bYd
	F/OAmfkKGxWLgEfndMbisx6vozHpk/8veDjPpVeRxlz3JFRtACP3BAxDsEv2lGN0Dk3E25zF+ECd+
	vEPemCwKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZfb-005nLr-Ur; Thu, 20 May 2021 03:48:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZfY-005nLD-2D
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 03:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=mdcluweu/59sIopz+dTcBKd3QYaK8lq0Klgg9DjX0B8=; b=uNzHI22VB+JI04z4/kkmdmXQ1N
 agZ644v+TnxK2SXM2zonwl+bBtiF/+/KASALiTkZgjRI/Xrc+ddUJb6vjbNsASUocxXKZI8KcT1MK
 To3wAajL3lVC07kEAGaTaDSc6RYadQ58eXF361HFpCespjKPKGUWlRA+cT+ivNH7AphurL94NfzZ3
 f3ClYxTgPmccoA8NkTmm0v+DcVTrXOJaodAwNg/TxDD/ES0+FNGfPn5VMZcFoLZFh6lPg4oRbC9ED
 ClijSGZhH0liY1+VuNjCeSOMEDjIoLaSLurePJ0UZY94pEqpITj1FLPJa5XbNRgbg7Mmq0xwUrMLU
 2ZryRstg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZfT-00FumR-Oa
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 03:48:18 +0000
X-UUID: c1744ea118fb4851aec9a20627a5dbc0-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mdcluweu/59sIopz+dTcBKd3QYaK8lq0Klgg9DjX0B8=; 
 b=nUQ9FU8JLAibFu2r7JljUOhGthRg8rmtrUfXjE3gt0erDQBpCEr01QB/ebjdPJopz8SuNfaxtWep7GY2O8Efd/LP67BjDJZGU0Ly+ce7J+9WHdHJwxZrf8Ffwat7Wlkuac/4aubQYOQ1yh4ZIamQ/j8J0tjbeMg97zGscu7IVrY=;
X-UUID: c1744ea118fb4851aec9a20627a5dbc0-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 286434640; Wed, 19 May 2021 20:48:12 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 20:47:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 11:46:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 11:46:57 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "YN
 Chen" <yn.chen@mediatek.com>
Subject: [PATCH 6/7] mt76: mt7921: fix OMAC idx usage
Date: Thu, 20 May 2021 11:46:40 +0800
Message-ID: <1621482401-29025-6-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
References: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_204815_825823_A48D6531 
X-CRM114-Status: GOOD (  12.33  )
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

From: Sean Wang <sean.wang@mediatek.com>

OMAC idx have to be same with BSS idx according to firmware usage.

Fixes: e0f9fdda81bd ("mt76: mt7921: add ieee80211_ops")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 55 +------------------
 1 file changed, 1 insertion(+), 54 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 5dbccbefe047..472afd4ea487 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -224,54 +224,6 @@ static void mt7921_stop(struct ieee80211_hw *hw)
 	mt7921_mutex_release(dev);
 }
 
-static inline int get_free_idx(u32 mask, u8 start, u8 end)
-{
-	return ffs(~mask & GENMASK(end, start));
-}
-
-static int get_omac_idx(enum nl80211_iftype type, u64 mask)
-{
-	int i;
-
-	switch (type) {
-	case NL80211_IFTYPE_STATION:
-		/* prefer hw bssid slot 1-3 */
-		i = get_free_idx(mask, HW_BSSID_1, HW_BSSID_3);
-		if (i)
-			return i - 1;
-
-		/* next, try to find a free repeater entry for the sta */
-		i = get_free_idx(mask >> REPEATER_BSSID_START, 0,
-				 REPEATER_BSSID_MAX - REPEATER_BSSID_START);
-		if (i)
-			return i + 32 - 1;
-
-		i = get_free_idx(mask, EXT_BSSID_1, EXT_BSSID_MAX);
-		if (i)
-			return i - 1;
-
-		if (~mask & BIT(HW_BSSID_0))
-			return HW_BSSID_0;
-
-		break;
-	case NL80211_IFTYPE_MONITOR:
-		/* ap uses hw bssid 0 and ext bssid */
-		if (~mask & BIT(HW_BSSID_0))
-			return HW_BSSID_0;
-
-		i = get_free_idx(mask, EXT_BSSID_1, EXT_BSSID_MAX);
-		if (i)
-			return i - 1;
-
-		break;
-	default:
-		WARN_ON(1);
-		break;
-	}
-
-	return -1;
-}
-
 static int mt7921_add_interface(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif)
 {
@@ -293,12 +245,7 @@ static int mt7921_add_interface(struct ieee80211_hw *hw,
 		goto out;
 	}
 
-	idx = get_omac_idx(vif->type, phy->omac_mask);
-	if (idx < 0) {
-		ret = -ENOSPC;
-		goto out;
-	}
-	mvif->mt76.omac_idx = idx;
+	mvif->mt76.omac_idx = mvif->mt76.idx;
 	mvif->phy = phy;
 	mvif->mt76.band_idx = 0;
 	mvif->mt76.wmm_idx = mvif->mt76.idx % MT7921_MAX_WMM_SETS;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
