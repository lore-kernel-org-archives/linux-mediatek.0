Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 05:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MGC57ZA8H94zF3VEpw/yvhOgYUkysoOBX1CSK0hN0PI=; b=mtM7pZAXkDnCQd
	7xY5sTy6FzVWnybgY8hA7RHXrzsF3vyhh9724p0yfDzul4Q28w0kVo/Xv+DdTIsXgFv+mD9AYR6US
	EaT2IOfg1yPLf3ywWiWcwVIyNtv99HntW0OKrh24Y8qrHz2CBus7QZvgETgovDTy47YDzrkREnPHJ
	H0aB3BxC8zvGjaOrwMxlByUaKGKes41DguIhsibLpTjbJKK8RH7hLyDt4sFNFG2aYrjjPKnALk+st
	SV4kMqxjeb61Kmsdc0lv2lXwUgB9YyBzAoot5I1Uxk1Tdj48aFJNWmhKubC3YKt8vkV8EKoy2Fhvy
	S0TN2KjvXOOMnzfBqpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOvKH-00F4AL-O8; Tue, 01 Mar 2022 05:45:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOvIw-00F3dj-8m
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 05:44:11 +0000
X-UUID: 01744aad0ef94c4ead0724e877022b87-20220228
X-UUID: 01744aad0ef94c4ead0724e877022b87-20220228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <evelyn.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1069728861; Mon, 28 Feb 2022 22:39:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 21:29:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 1 Mar 2022 13:29:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Mar 2022 13:29:26 +0800
From: Evelyn Tsai <evelyn.tsai@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Rubio Lu <Rubio-DW.Lu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix DFS no radar detection event
Date: Tue, 1 Mar 2022 13:29:10 +0800
Message-ID: <b55fec95a7708491a78027cc9a30ba7faa0dd18b.1646106090.git.evelyn.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_214410_367199_B50017E3 
X-CRM114-Status: GOOD (  10.41  )
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

Driver needs to carry region definition when radar detection starts.
Need to remap nl80211 DFS regions to chip region definition.

Signed-off-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Rubio Lu <Rubio-DW.Lu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 1da551f0b389..a99079313ac2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2364,10 +2364,23 @@ static void mt7915_dfs_stop_radar_detector(struct mt7915_phy *phy)
 
 static int mt7915_dfs_start_rdd(struct mt7915_dev *dev, int chain)
 {
-	int err;
+	int err, region;
+
+	switch (dev->mt76.region) {
+	case NL80211_DFS_ETSI:
+		region = 0;
+		break;
+	case NL80211_DFS_JP:
+		region = 2;
+		break;
+	case NL80211_DFS_FCC:
+	default:
+		region = 1;
+		break;
+	}
 
 	err = mt76_connac_mcu_rdd_cmd(&dev->mt76, RDD_START, chain,
-				      MT_RX_SEL0, 0);
+				      MT_RX_SEL0, region);
 	if (err < 0)
 		return err;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
