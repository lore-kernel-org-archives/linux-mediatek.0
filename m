Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BBFC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 14:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66D5610A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 14:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66D5610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HRkMFqzxVqDp/cJXx8q+4/ZJLPHhLzKV5MRD7JB5XEo=; b=kRf4acsPWsn6Ih
	3yc8hMF3QXkMTtdSYbSBwxLe6msmavMqmppEnstANouzL/nrTopBiD0NYS9+fBzgZVN0k//99xPKD
	n5EMpzpcjL81N/Yz/6ULojm5F4UwVyCT5+7eHNok+wI1qHuGHtRWSIR6DSJynkfpOQFK/EIQHKx63
	VpnSh2OvbfCN0KmKt5aSQ24VcRpW0hzvkiU4rBLDH354TCnURYR5HPcFk2D1Na/BDLDylIKReBQnf
	YshNuYeMQc//8BJ2/TYXdw7mYcWnqcSYFYW0xLrphrPuHW3EzApJqIbACdXV+7XZnmsAmg/D/8Gte
	VRuKAKTb9zo0B5d8/cSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttAH-00AlK1-3V; Thu, 17 Jun 2021 14:38:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttAD-00AlIN-Cs
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 14:38:40 +0000
X-UUID: 7cb29b33e68d4265ad1a8475374908c0-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rrkqqJMAQ1WX+O3DwW8Vj4wSjMICIXhKdJowpSpL3CM=; 
 b=RoZtWd05g/GaTuFrxaLXvVh+gzfICnxGX4bUCyIBp0iTLx1tWQiy6UTGpJHSLzM3YlJmPjUg7OEK3Bt0HPoSMUutCR6TMzPy9liHTatdWxSe5fBAUxySkNKBZbVZnyLx+YikEpJcMr+m0dXiHZkIWAhe5vervBTpL58MQ9aH4IQ=;
X-UUID: 7cb29b33e68d4265ad1a8475374908c0-20210617
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1369529418; Thu, 17 Jun 2021 07:38:30 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 07:38:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 22:38:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 22:38:27 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 <jemele@google.com>, <yenlinlai@google.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: enable HE BFee capability
Date: Thu, 17 Jun 2021 22:38:25 +0800
Message-ID: <8cec066575cafcb4a09a3f83625d98b4d76f65dd.1623929134.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_073838_911391_74BD1BC8 
X-CRM114-Status: UNSURE (   7.81  )
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

From: Deren Wu <deren.wu@mediatek.com>

Enables HE MU/SU beamformee functionality

Signed-off-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index f062088780c2..426e76a45f73 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -80,8 +80,11 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80211_band band,
 		he_cap_elem->phy_cap_info[1] =
 			IEEE80211_HE_PHY_CAP1_LDPC_CODING_IN_PAYLOAD;
 		he_cap_elem->phy_cap_info[2] =
+			IEEE80211_HE_PHY_CAP2_NDP_4x_LTF_AND_3_2US |
 			IEEE80211_HE_PHY_CAP2_STBC_TX_UNDER_80MHZ |
-			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ;
+			IEEE80211_HE_PHY_CAP2_STBC_RX_UNDER_80MHZ |
+			IEEE80211_HE_PHY_CAP2_UL_MU_FULL_MU_MIMO |
+			IEEE80211_HE_PHY_CAP2_UL_MU_PARTIAL_MU_MIMO;
 
 		switch (i) {
 		case NL80211_IFTYPE_STATION:
@@ -103,7 +106,15 @@ mt7921_init_he_caps(struct mt7921_phy *phy, enum nl80211_band band,
 			he_cap_elem->phy_cap_info[3] |=
 				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_QPSK |
 				IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_RX_QPSK;
+			he_cap_elem->phy_cap_info[4] |=
+				IEEE80211_HE_PHY_CAP4_SU_BEAMFORMEE |
+				IEEE80211_HE_PHY_CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_4;
+			he_cap_elem->phy_cap_info[5] |=
+				IEEE80211_HE_PHY_CAP5_NG16_SU_FEEDBACK |
+				IEEE80211_HE_PHY_CAP5_NG16_MU_FEEDBACK;
 			he_cap_elem->phy_cap_info[6] |=
+				IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_42_SU |
+				IEEE80211_HE_PHY_CAP6_CODEBOOK_SIZE_75_MU |
 				IEEE80211_HE_PHY_CAP6_TRIG_CQI_FB |
 				IEEE80211_HE_PHY_CAP6_PARTIAL_BW_EXT_RANGE |
 				IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
