Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7674C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 08:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBBB61AFB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 08:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADBBB61AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6fXF0VOndooN9/tii9OpRaR9ZBXKqibpb9n5g/588Ns=; b=JSMVZwMjSoXDZ2
	FsldOCFbuorRH4XO2Q5ndp9PXr3FLG9RmW6OobXgoJKghvVlvahnBbFTOZKzxAObD5fjQfNIa4cO8
	aGKHx5VFRanGjs/w2NclCSq02PWNB3ogYX3g5BfaDBXJZB1ycr7UVbDOi2NQxgsFYLLxP+/8zaWug
	xA+zVcbGm4bA+wW//NRczpDFM7CZynm6uo0xCKcyEt8FiNfOxhbIG8hv0t2GWL6ZvZ9ZTMY/MLKsB
	ZHqgF+9r2ydGWIu79C1WmPzByvb/STTGljCHSVDVCu6Gm0IwfjNkeuLh84+fvRcKPXYhFG0Hkt1yB
	UYj7407GiU4kSyKwJjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnzft-009r0R-BL; Fri, 19 Nov 2021 08:55:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnzfp-009qwT-3D
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 08:55:11 +0000
X-UUID: 6257dba0662444de8fad808bc451c25e-20211119
X-UUID: 6257dba0662444de8fad808bc451c25e-20211119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1663308258; Fri, 19 Nov 2021 01:54:56 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Nov 2021 00:53:29 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 19 Nov 2021 16:53:27 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 19 Nov 2021 16:53:26 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH] mt76: fix the wiphy's available antennas to the correct value
Date: Fri, 19 Nov 2021 16:53:23 +0800
Message-ID: <cbdfacdab1672161c5abf3eca2510dca3f3a7951.1637311782.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_005509_206260_6BCFA6D4 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

the wiphy's available antennas may be incorrect
When ext phy's antenna_mask is different from main phy

Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 62807dc..a07a3bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -411,8 +411,8 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_AQL);
 
-	wiphy->available_antennas_tx = dev->phy.antenna_mask;
-	wiphy->available_antennas_rx = dev->phy.antenna_mask;
+	wiphy->available_antennas_tx = phy->antenna_mask;
+	wiphy->available_antennas_rx = phy->antenna_mask;
 
 	hw->txq_data_size = sizeof(struct mt76_txq);
 	hw->uapsd_max_sp_len = IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
