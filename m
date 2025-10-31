Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05083CCFA04
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtPt9S/dRICeSuTOWbXBIStFl3r42xpbJLKfvKyvRTo=; b=Wy/Hz24PC1R+U1tPRBnFBUdFiL
	IZjKHYx/egoLKsrteN/SXjqFH/u2aXD/WJqSoIVr/jxaekPl9Sul7j+/Gt/Pf7jE3ETvlQbe3yuIb
	i9KhABYG8UZlg4V8g1xcGsjOroaXv/qBlBx+XYv4rnF9r4Tpq/N3p2Us0cEjfA3FgWfvZjXTD0S+g
	WxQd8FFaV+jby6fnKSLZmL1aI620GwZvYwAv1bvWK1p108+vK0aTfm0Dz3heZbuBjQw3qRhpMXouT
	ni4IgXZd4KxBHM2C4Gmskmm8zAdbvbg2NMQboIaDi3kkT/ci3KOMyy0DJg1+SHgt+LDyhMshrNWyE
	/WNGLdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3R-00000005k3K-0v3u;
	Fri, 31 Oct 2025 09:04:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3O-00000005jzU-07Gm
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 09:04:15 +0000
X-UUID: 8f0812f2b63811f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xtPt9S/dRICeSuTOWbXBIStFl3r42xpbJLKfvKyvRTo=;
	b=ahFQkRBV2OnXooV9BpYWWyEDhGx609C3MinaIDO66UtTOuFMgLzKug8yRqlUJbTqdU2XiYsWJqdh8NRm6tRGqk/qaymeb8C+tc+OPxAFvX4y9JuKGbLxDcnxZYajxollzud/dr+FFX3DX3vBwoUtzygPcyoABnc58zVMUDT7k9c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:66d6fc31-f3b6-430c-ba56-1e8bb4a310f2,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:c928fcdf-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f0812f2b63811f09f706fa2197c6ceb-20251031
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 57696845; Fri, 31 Oct 2025 02:04:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 17:04:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 17:04:06 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 6/6] wifi: mt76: mt7925: disable auto regd changes after user set
Date: Fri, 31 Oct 2025 17:03:52 +0800
Message-ID: <20251031090352.1400079-7-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
References: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020414_074929_F645E85D 
X-CRM114-Status: GOOD (  11.56  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Add regd_user flag to block automatic regulatory domain updates
if set by user.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/regd.c | 7 ++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fe1a7e386fc7..ac3049360bab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -738,6 +738,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	int ret, i, len, offset = 0;
 
 	dev->phy.clc_chan_conf = 0xff;
+	dev->regd_user = false;
 	if (!mt7925_regd_clc_supported(dev))
 		return 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index 4565e1132b36..292087e882d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -173,6 +173,10 @@ void mt7925_regd_notifier(struct wiphy *wiphy, struct regulatory_request *req)
 	struct mt76_connac_pm *pm = &dev->pm;
 	struct mt76_dev *mdev = &dev->mt76;
 
+	if (req->initiator == NL80211_REGDOM_SET_BY_USER &&
+	    !dev->regd_user)
+		dev->regd_user = true;
+
 	/* allow world regdom at the first boot only */
 	if (!memcmp(req->alpha2, "00", 2) &&
 	    mdev->alpha2[0] && mdev->alpha2[1])
@@ -224,7 +228,8 @@ int mt7925_regd_change(struct mt792x_phy *phy, char *alpha2)
 		return 0;
 
 	if (!mt7925_regd_is_valid_alpha2(alpha2) ||
-	    !mt7925_regd_clc_supported(dev))
+	    !mt7925_regd_clc_supported(dev) ||
+	    dev->regd_user)
 		return -EINVAL;
 
 	if (mdev->alpha2[0] != '0' && mdev->alpha2[1] != '0')
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index ed2606e9251a..8388638ed550 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -231,6 +231,7 @@ struct mt792x_dev {
 	bool hw_init_done:1;
 	bool fw_assert:1;
 	bool has_eht:1;
+	bool regd_user:1;
 	bool regd_in_progress:1;
 	bool aspm_supported:1;
 	bool hif_idle:1;
-- 
2.34.1


