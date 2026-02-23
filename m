Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9241AE98DF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+XH2HAzLPZ9530IfeM/72WceJHI53X8avol8hUZiP4=; b=YGV7v2sflsTPFb5qdER9gFq+9c
	KDZD/8f50jr/gqiNqH1YoDSaxfdSN2NfxsZp0sGnowF4Xq8NgSa5vNumYOTTNgaVOuBnyb52H4kD2
	Pl1u/HhQMM5M9LfAClYGCHJtQlY3yS+vyh9XkVjogj+7QZCyfzrFLmhVeeY4Nfy4Ar08MG1Uh9Cu2
	+EyNtepMli2a3y/wNQtCWzr8ktWYCi2mCTuOJCXEX6XDhSqcV9yRv1ziKeY6Q9Us0mOetaVFS2rph
	rgA7AUytMJ7rh+WeYLSor6qFn+QNUK4vxRW8oYG+2LLSqEO9Kd2rq461QPUpdIsZV1T45mF6z4ZvT
	8JSLCyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQXA-0000000HOFY-0xmv;
	Mon, 23 Feb 2026 07:39:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQX6-0000000HOCz-0DdU
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:39:09 +0000
X-UUID: ba314c30108a11f1ad39f32c34db0b1c-20260223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N+XH2HAzLPZ9530IfeM/72WceJHI53X8avol8hUZiP4=;
	b=LOFbo1F6tLrKpb8G/6cePCpSc04WuV2dxuSSLnTxY2AnEIhNGgLiaKduRlWnFuSk8EOzQv7q38eKEJY9r+rX5WY0B8v9OQZo6x5e5sq0rWcNVkDAOtk/QCMOj5RDTjQB6cHttPeqfqAK57Ko51dFqd7my4HD4w9zkvwFZlQuOnk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c46a0a8e-9d0d-493d-8134-c90868c77633,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:42e8e2e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ba314c30108a11f1ad39f32c34db0b1c-20260223
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1447835888; Mon, 23 Feb 2026 00:39:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 23 Feb 2026 15:39:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 23 Feb 2026 15:39:01 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>
Subject: [PATCH 5/5] wifi: mt76: mt7921: disable auto regd changes after user set
Date: Mon, 23 Feb 2026 15:38:54 +0800
Message-ID: <20260223073854.2464232-5-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223073854.2464232-1-jb.tsai@mediatek.com>
References: <20260223073854.2464232-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_233908_090119_E47BFAE3 
X-CRM114-Status: GOOD (  10.93  )
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

Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/regd.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4e455aad2f4c..3806798081a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -419,6 +419,7 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	u8 *clc_base = NULL, hw_encap = 0;
 
 	dev->phy.clc_chan_conf = 0xff;
+	dev->regd_user = false;
 	if (!mt7921_regd_clc_supported(dev))
 		return 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index b53fa1f5c6db..58d68d7cf1a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -118,6 +118,10 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct mt76_dev *mdev = &dev->mt76;
 
+	if (req->initiator == NL80211_REGDOM_SET_BY_USER &&
+	    !dev->regd_user)
+		dev->regd_user = true;
+
 	/* do not need to update the same country twice */
 	if (!memcmp(req->alpha2, mdev->alpha2, 2) &&
 	    dev->country_ie_env == req->country_ie_env)
@@ -169,7 +173,8 @@ int mt7921_regd_change(struct mt792x_phy *phy, char *alpha2)
 		return 0;
 
 	if (!mt7921_regd_is_valid_alpha2(alpha2) ||
-	    !mt7921_regd_clc_supported(dev))
+	    !mt7921_regd_clc_supported(dev) ||
+	    dev->regd_user)
 		return -EINVAL;
 
 	if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
-- 
2.45.2


