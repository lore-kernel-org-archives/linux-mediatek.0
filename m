Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B42C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eXDqlpTsqWqRvvWR0zBMDMwmsobZmJGj+X3G2IkLF+Q=; b=iGYZWTTzHXSWNZtnyW4lASIG5q
	tctbJgQ+WZej41hc1XKoQNJToiZ/jjNR2OfaffVu1HBb4TJIjkmCQYNPtFfT2i7FylZRWrVPIaZ3x
	oxM4FSgV/CRN/m5cOfpsJyRf/4QpkqWYVzseAYJ+llTellZ0GKWXDq1EFbL3CBmYE/Upv6JWTqKHW
	W/Ju60LwDQEKFEAOmyFJxgxaMXHUC4PioqynXiUML97ytVvzeLcntM+nsJvK3NkjJ9WCmUrLzmbe4
	T+Kmgwmds4Bol67/rtrzSlzi/LwNXKT2881xl665thLla9mqmsAMfXPGOfJcOFtfwaK/saci6+Aoa
	avnMLQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2WFK-00B7o3-8A; Sat, 18 Jun 2022 11:04:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2WFH-00B7jO-IP
	for linux-mediatek@lists.infradead.org; Sat, 18 Jun 2022 11:04:05 +0000
X-UUID: caad1a1084314f6dacae3e4633ddde83-20220618
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:be98b9c4-49ce-4d0c-b907-a94859562d65,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:4088ff48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: caad1a1084314f6dacae3e4633ddde83-20220618
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 642597276; Sat, 18 Jun 2022 04:03:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Jun 2022 04:03:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 18 Jun 2022 19:03:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 18 Jun 2022 19:03:36 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
	<Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: enlarge maximum VHT MPDU length to 11454
Date: Sat, 18 Jun 2022 18:56:44 +0800
Message-ID: <a1ce62906f2d06135dacfea67c48ab207642497e.1655549139.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_040403_668478_EE05E123 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Deren Wu <deren.wu@mediatek.com>

Enlarge maximum MPDU length to 11454 that both mt7921/mt7922 can support.
After this fixing, we can get better performance.

Fixes: 5c14a5f944b9 ("mt76: mt7921: introduce mt7921e support")
Tested-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 79023992715e..af594b10f47f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -306,7 +306,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
 	dev->mphy.sband_5g.sband.vht_cap.cap |=
-			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991 |
+			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
 			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK |
 			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 			IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-- 
2.18.0


