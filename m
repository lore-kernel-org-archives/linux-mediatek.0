Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YPYJvhhNzq9T0SsvLnmdTfenibtq7YQ1BqcLyPoDkM8=; b=d//Is5876BJxSl
	B2okFhj9qoHaHUqaE1n5WwwFvSpCmTamU88l9Wf8RvhGGe1O9v45FcB+0BCy973Z4L73WncoDqCB+
	5cAKjQFMe0lrEDyNWOV5WyQTBgtnxlafxKRTnvQhaP02fg8p5Eg/JdaG9Y8q9g+Z59Bb4F1EqW5KW
	rGpGh+hE0N94WoFGr6bwZQ5ciUe+IwjB6CCNcm0GWjv8rcYJMwZBpdHTUNRF7F5kFpyLlTcBBpezN
	bbQspujYeJLp9cvVVCnlczypUzn4E2boEaMAd4LzSnso9x1+3L3n9p8xpQi9mBo+krFyeExZg8y0l
	MPCTu3fpDnhgBm6QTgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqeVo-00BDdd-DV; Fri, 26 Nov 2021 16:55:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqeVk-00BDc9-9y
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 16:55:47 +0000
X-UUID: 127f1d75497e415ab99dc2edb01ff0b9-20211126
X-UUID: 127f1d75497e415ab99dc2edb01ff0b9-20211126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 101309543; Fri, 26 Nov 2021 09:55:40 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 08:55:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Nov 2021 00:55:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 27 Nov 2021 00:55:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, Deren Wu
 <deren.wu@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
 <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: mt7921: use correct iftype data on 6GHz cap init
Date: Sat, 27 Nov 2021 00:53:16 +0800
Message-ID: <20211126165316.1662-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_085544_381233_823DDE65 
X-CRM114-Status: UNSURE (   9.43  )
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

Set 6GHz cap to iftype data which is matched to the type of
current interface.

Fixes: 50ac15a511e3 ("mt76: mt7921: add 6GHz support")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 5a64126..5540b2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -178,7 +178,7 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80211_band band,
 			if (vht_cap->cap & IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN)
 				cap |= IEEE80211_HE_6GHZ_CAP_RX_ANTPAT_CONS;
 
-			data->he_6ghz_capa.capa = cpu_to_le16(cap);
+			data[idx].he_6ghz_capa.capa = cpu_to_le16(cap);
 		}
 		idx++;
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
