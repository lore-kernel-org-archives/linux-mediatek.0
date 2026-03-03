Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6630E67A69
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 05:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCjjyYhJ4HYmnwuhzmO9x5JF1+U4F7Qc+706jJJi/dU=; b=tSFV9WvGtp81o+twdrnxrm+W4R
	qz8/Beogj+bHVq/OAhfaOAWXFBb9KFt0/+k1BacUPH+tyTVwn8zxQoaY/9rUElF98a13NPwUI5X6q
	T4NogysQo2vPRe1n02lSUIH+W9LM9U0AtYsJuOxxPgtF/jb49t1mT/ziziSoigns0DtQe4WotSjZK
	xRcvukYFEc168QLL3R2nhSIeuoy32rxPAKHDmTVL7xJD2NIXwiT7cB/ZCvYwqqCgOW2LmIngXWLYC
	8LG8IsO+hoeF3EmyEbSsl37oxigQRQ2VVMAHrKmoo9qX5CthVLrNzrZnNOpIT7KTA7pYnCbZg+J0v
	WopUAhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRK-0000000EYcG-3FX8;
	Tue, 03 Mar 2026 05:37:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRH-0000000EYZv-2nYG
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 05:37:00 +0000
X-UUID: fe53e45216c211f1a16f0188aa809bee-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FCjjyYhJ4HYmnwuhzmO9x5JF1+U4F7Qc+706jJJi/dU=;
	b=YSNA8Bndt1rXr5PqtwvacplZ+KPiyaqT2WW1diIRShf3dSB1Nw8f7gE+T8ARXXtXpbXBzzJkg72Vd3jOp3zPwdKmBCCrKlHD0UfIIM3zxYetrhL1ycPUkF7czFV2fi6sKk9KtZRtplC3lowygeAhFcLMn+0g3Ty49VqiLkAiMPQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:abddfc0f-4dc1-48e8-ac7b-2d8b03b984dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:57bb31f1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe53e45216c211f1a16f0188aa809bee-20260302
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 805425296; Mon, 02 Mar 2026 22:36:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 13:36:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 13:36:54 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH v2 5/5] wifi: mt76: mt7921: disable auto regd changes after user set
Date: Tue, 3 Mar 2026 13:36:37 +0800
Message-ID: <20260303053637.465465-5-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260303053637.465465-1-jb.tsai@mediatek.com>
References: <20260303053637.465465-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213659_707170_62980C8B 
X-CRM114-Status: GOOD (  11.63  )
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

Add regd_user flag to block automatic regulatory domain updates
if set by user.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
v2: no changes
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/regd.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 3e605a9ab919..25b9437250f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -419,6 +419,7 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	u8 *clc_base = NULL, hw_encap = 0;
 
 	dev->phy.clc_chan_conf = 0xff;
+	dev->regd_user = false;
 	if (!mt7921_regd_clc_supported(dev))
 		return 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index 229aa59e60f3..f122e418d825 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -117,6 +117,10 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct mt76_dev *mdev = &dev->mt76;
 
+	if (req->initiator == NL80211_REGDOM_SET_BY_USER &&
+	    !dev->regd_user)
+		dev->regd_user = true;
+
 	/* do not need to update the same country twice */
 	if (!memcmp(req->alpha2, mdev->alpha2, 2) &&
 	    dev->country_ie_env == req->country_ie_env)
@@ -168,7 +172,8 @@ int mt7921_regd_change(struct mt792x_phy *phy, char *alpha2)
 		return 0;
 
 	if (!mt7921_regd_is_valid_alpha2(alpha2) ||
-	    !mt7921_regd_clc_supported(dev))
+	    !mt7921_regd_clc_supported(dev) ||
+	    dev->regd_user)
 		return -EINVAL;
 
 	if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
-- 
2.43.0


