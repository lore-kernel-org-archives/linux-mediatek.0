Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC135C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 18:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC848610F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 18:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC848610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vqoXJAmwkQHVqnzeztBh6DJagNUi0m7oiXnCw/PxaUE=; b=nYtXkp5LCxlAQ1
	j055mX68r1m+FhvaFpadN6gj4ymUSyLz8Eh13ZWSwtYn1r+bspS9TLcnNJFzOhlKRroq63y04g9Tm
	A6QaeNLz5uo57EE/ioAWt0l1EuHqxZxu5izNaFhFJ6rlzfJDdmOcLNP/gumdvUiZCtaBBG3PL4c/e
	Cu25fOu38Mn+NnlkeRvITEPXMxU+5bW9zLuCH1Md2wDgzSQw57VBgnoK6zOJmiiB78MrZPwr6MDDm
	PIMaEDZmgUU3zXs5Xf2jM0Bv+FChxy93FBPiw6hn4a3cmDYrrr1JNsYgVsNrjK6UdhhG6aHpZ4Hxg
	qsZLCGYnvYHZue1LUA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlFFK-008blj-0w; Thu, 11 Nov 2021 18:56:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlFFG-008blJ-7P
 for linux-mediatek@lists.infradead.org; Thu, 11 Nov 2021 18:56:25 +0000
X-UUID: 33148e19e24a4e4498a0a46f8df0a618-20211111
X-UUID: 33148e19e24a4e4498a0a46f8df0a618-20211111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 554532266; Thu, 11 Nov 2021 11:56:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 10:56:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 12 Nov 2021 02:56:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Nov 2021 02:56:07 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>, Fang Zhao <fang.zhao@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix SMPS operation fail
Date: Fri, 12 Nov 2021 02:56:06 +0800
Message-ID: <4a2b49ea3821561416a546810cd3151fdc5aa86c.1636656394.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_105622_318033_2817F7CF 
X-CRM114-Status: GOOD (  11.43  )
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

TGn fails sending SM power save mode action frame to the AP to switch
from dynamic SMPS mode to static mode.

Reported-by: Fang Zhao <fang.zhao@mediatek.com>
Signed-off-by: Fang Zhao <fang.zhao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 6 +++++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 79081abf3329..5021c8fd2650 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2135,8 +2135,11 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 			       IEEE80211_RC_BW_CHANGED))
 			mt7915_mcu_add_rate_ctrl(dev, vif, sta, true);
 
-		if (changed & IEEE80211_RC_SMPS_CHANGED)
+		if (changed & IEEE80211_RC_SMPS_CHANGED) {
 			mt7915_mcu_add_smps(dev, vif, sta);
+			mt7915_mcu_set_fixed_rate_ctrl(dev, vif, sta, NULL,
+						       RATE_PARAM_MMPS_UPDATE);
+		}
 
 		spin_lock_bh(&dev->sta_poll_lock);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3a496046fe21..92166679055f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2077,7 +2077,11 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 	case RATE_PARAM_FIXED_MCS:
 	case RATE_PARAM_FIXED_GI:
 	case RATE_PARAM_FIXED_HE_LTF:
-		ra->phy = *phy;
+		if (phy)
+			ra->phy = *phy;
+		break;
+	case RATE_PARAM_MMPS_UPDATE:
+		ra->mmps_mode = (sta->smps_mode == IEEE80211_SMPS_DYNAMIC);
 		break;
 	default:
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index e8501234f686..11728454b92c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -960,6 +960,7 @@ struct sta_rec_ra_fixed {
 
 enum {
 	RATE_PARAM_FIXED = 3,
+	RATE_PARAM_MMPS_UPDATE = 5,
 	RATE_PARAM_FIXED_HE_LTF = 7,
 	RATE_PARAM_FIXED_MCS,
 	RATE_PARAM_FIXED_GI = 11,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
