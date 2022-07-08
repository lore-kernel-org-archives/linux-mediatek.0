Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6BAC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7pHoUslMblfVbyIx0lWXRntrqphelkvvFUFBYzEfj4=; b=oEpmOGMaxci42EANcvUe5cDfFf
	Oq3Ug8RYHnWx9kjA/wMJaQN4sPZvTommnZa4Wy+EP0q39+JqnkdqJLG+NhMZ3RJOcPrZa7JydbkiG
	dpDA674OcgD5XzLl+CYsKXs5lBGxymXFVJ4/99cmBBKGOjjYCvh7RVHhrNzXnu7V/L+C6LGj8ox66
	a1U1NgG+IJd7ehWYITKKPBuIhRJGoU8lXsPaBGcOgDv8po9yrhNFuBNcOUYpKsrX+klyGnT46cKNj
	D7B2RkOBZlH4nwdkX/fkYpPYoRGFbBMQ5w39TJk9AQxNmFl3ysLu+Dfnu6y+ftAzg1pteFIhOLZp1
	MkDjzWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kmj-0035RN-B4; Fri, 08 Jul 2022 10:00:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kmh-0035PY-9f
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 10:00:28 +0000
X-UUID: 7e54715ddec04d32be35c982afd5ae8d-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e88d44d8-e7f1-4ad0-a9ec-d6753b056271,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:29,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:34
X-CID-META: VersionHash:0f94e32,CLOUDID:0320f8d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7e54715ddec04d32be35c982afd5ae8d-20220708
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 71846595; Fri, 08 Jul 2022 03:00:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 17:59:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 8 Jul 2022 17:59:41 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Felix Fietkau <nbd@nbd.name>, Money Wang <Money.Wang@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Evelyn Tsai" <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, MeiChia Chiu
	<meichia.chiu@mediatek.com>, MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Subject: [PATCH] mac80211: fix a center frequency recalculation issue in ieee80211_chandef_downgrade
Date: Fri, 8 Jul 2022 17:58:23 +0800
Message-ID: <20220708095823.12959-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_030027_395794_35896895 
X-CRM114-Status: GOOD (  11.12  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

When mac80211 downgrades working bandwidth,
the cent_freq and cent_freq1 need to be recalculated.
There is a typo in the case of downgrading bandwidth from
320M to 160M which would cause a wrong frequency value.

Reviewed-by: Money Wang <Money.Wang@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
---
 net/mac80211/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index bccc3a309ed0..bcb4aa7d7599 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -4075,7 +4075,7 @@ u32 ieee80211_chandef_downgrade(struct cfg80211_chan_def *c)
 		/* n_P20 */
 		tmp = (150 + c->chan->center_freq - c->center_freq1) / 20;
 		/* n_P160 */
-		tmp /= 80;
+		tmp /= 8;
 		c->center_freq1 = c->center_freq1 - 80 + 160 * tmp;
 		c->width = NL80211_CHAN_WIDTH_160;
 		ret = IEEE80211_STA_DISABLE_320MHZ;
-- 
2.36.1


