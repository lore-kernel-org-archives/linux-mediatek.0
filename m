Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C639C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3823YOK4IFbm7xagfpp8cYGEfA4uo0c400a439st63M=; b=XxfUSKYtkdcgxLXyazaWtPRijF
	YwDc6zC3M8uKYa395+XtI/UbThj63kw9VYWfCl6bbkE9x+lDQQMqkZVq6rLpYFikDUZiLi/9l32b6
	xWtq1+jEebsdi8nVuynK9rY2p7dOc2I91700YHH9VSPAVeb6SgfFgaagI9PgbkE19EqXnh/ScydIX
	bsXsS+0gW4W3IOSNQiOik3JpB1d2KmeLQophQucwic5Lc7zMM+rWS9ZouFBaZRjBKJUMaBAgr3UPT
	L2aZxJRac2c5UsQIpEr34+jpM/QyE9y0IjyGRgEk3MF+fpAnRCTyYy3DRsXvi3i1Kdiga0CcEhmgf
	CL3glR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o915w-007gCy-6x; Wed, 06 Jul 2022 09:13:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o915t-007gAM-Q2
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 09:13:15 +0000
X-UUID: 691a27fcaeeb45e38c8fc4318b1b68cc-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cbb46b85-8f2b-4a39-b64c-14f52d3e60d8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:621a8f63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 691a27fcaeeb45e38c8fc4318b1b68cc-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <lian.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 727704296; Wed, 06 Jul 2022 02:09:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Jul 2022 17:09:04 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 6 Jul 2022 17:09:03 +0800
From: Lian Chen <lian.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Bo Jiao
	<bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Lian Chen
	<lian.chen@mediatek.com>, linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: address4 null frame using fixed rate to trigger WDS
Date: Wed, 6 Jul 2022 17:09:01 +0800
Message-ID: <20220706090901.88929-1-lian.chen@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_021313_874095_17705FFB 
X-CRM114-Status: UNSURE (   7.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "lian.chen" <lian.chen@mediatek.com>

WDS function need address4 package to trigger the AP create wlan0.sta.
while the address4 null frame is sent at a high rate.
the AP can not receive it.
so, using fixed rate to trigger WDS flow.

Signed-off-by: lian.chen <lian.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 3ab0dcd..d83ed59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -393,7 +393,8 @@ mt76_connac2_mac_write_txwi_80211(struct mt76_dev *dev, __le32 *txwi,
 	}
 
 	if (!ieee80211_is_data(fc) || multicast ||
-	    info->flags & IEEE80211_TX_CTL_USE_MINRATE)
+	    info->flags & IEEE80211_TX_CTL_USE_MINRATE ||
+	    (ieee80211_is_nullfunc(fc) && ieee80211_has_a4(fc)))
 		val |= MT_TXD2_FIX_RATE;
 
 	txwi[2] |= cpu_to_le32(val);
-- 
2.18.0


