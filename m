Return-Path: <SRS0=nyHv=HT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1B8C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Feb 2021 12:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9252864E76
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Feb 2021 12:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9252864E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4eKg6afu+6n4pAZYdKnRBo6SHuporcQyHFCtfQ5D794=; b=mUZCafLBr35Beq2udXWRS7Bzkz
	Y5pDUm42r/10w42RYpQ40i1uTeieobMYAqASuz60hAygzsP6XY6Ys6kQlEhypeZO88bdyJMfgFFIf
	MHPCF0ReRWHr+oIfVXLJcTv8gEdVz8yDMLEQjA5qcnkTIstDfr65uWiJiTJATZRPRWRae57YxWQ2r
	c/Iy7X16OaqMEnF6Ra9XnzRSkUqmVqvPEblgGclnatpcmF+DusXXYssv7Ith3TgOwMentO2QIwlbr
	c5VnVoTRBC3aVgt/bjTIfJAOUZhUHozZKCX9RWJaDOljxIaUSnnRWvj9W7QewhNIZv6R5t3l5X4v4
	+o8p4sSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCLeL-0000g2-9x; Wed, 17 Feb 2021 12:09:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCLeG-0000eX-RV
 for linux-mediatek@lists.infradead.org; Wed, 17 Feb 2021 12:09:42 +0000
X-UUID: 6f9b624ff17e44e6be296c168d15ed51-20210217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4ZRn8yoP58SuUqIsw6df9r8D+qim72oAhlgMKoWdaI4=; 
 b=O5thrsEh0HBNa1RyNBt2XxW6Jw4/xYG1OCgRhX4lXuwsuKZDzN7AocXV3UWVkOAcj8UbbMH8pOmvdRBh38oHJhg9A+RxLriNXn4wt4BqI0HLcO43+qKMc/dxETZdwJEk4E6w7GbP1HjIHLWa8ueQX4KrHnyPKYi7m+HvFzOIwBg=;
X-UUID: 6f9b624ff17e44e6be296c168d15ed51-20210217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 903861646; Wed, 17 Feb 2021 04:09:32 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 04:09:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 20:09:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Feb 2021 20:09:22 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: enable radar detection for non-offloading
 firmware
Date: Wed, 17 Feb 2021 20:09:21 +0800
Message-ID: <6316b1b277fa1ec36972d4043e3109d51ef9662f.1613563280.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B2150D646FAAF0BBE92045F79C86FC20BAC6E077EEE5C3289C2C4E8E4844BD52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_070941_674703_444EF535 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The non-offloading version should support radar detection.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 88a2ee7e7143..debeb66ce182 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -338,7 +338,7 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 	hw->sta_data_size = sizeof(struct mt7615_sta);
 	hw->vif_data_size = sizeof(struct mt7615_vif);
 
-	if (is_mt7663(&phy->dev->mt76)) {
+	if (mt7615_firmware_offload(phy->dev)) {
 		wiphy->iface_combinations = if_comb;
 		wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
 	} else {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index f2dd56674acb..72587def7422 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -2238,7 +2238,7 @@ int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy)
 	bool ext_phy = phy != &dev->phy;
 	int err;
 
-	if (is_mt7663(&dev->mt76))
+	if (mt7615_firmware_offload(dev))
 		return 0;
 
 	if (dev->mt76.region == NL80211_DFS_UNSET) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
