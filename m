Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA23C10DCE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 02:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lkky2+2gf5KSjnXjeHOkgH+At/uP60zFAcftF3L3xOA=; b=BCqFmeT09OHsonqpyPhDkUmLRp
	X/70A+BqCy9Qh+FJ4/x3ecx+WwsI3id8YB1gl1GLXNSaT4M+4Bb7VjM56Kmx+2lVkJrkDKYSDLdYF
	mpzxrBwi+4ne8pzXxoOBxqxTYB4BXLa4j9JeF60zDjLOjZCK8NCeG3xyZbHLcYSCD82KRgMI87CsV
	Efuq6l+k7UluowlB57OJnEBxv300x+2row7x/dPA5HxpoCoSzGI1TLz5kJFXbThqbPeRngITuVHaU
	tZy79JgfjvI8IcsdjK6fl3Ul3tesTLQKrMmAp73p2YvFl69rq8NF9r7lHSegRAkVQNyCcX/RmuoWY
	lUPjY8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhyD-008uiE-3C;
	Wed, 06 Dec 2023 02:49:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhyA-008ufw-08
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 02:49:04 +0000
X-UUID: fe5f9aa693e111ee86758d4a7c00f3a0-20231205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lkky2+2gf5KSjnXjeHOkgH+At/uP60zFAcftF3L3xOA=;
	b=e4g9PBgZx87IB85KjcL0tXwXwl/rxKFGuGJnRxg3KeukwExqMxyzsIRSAJnihVmYRHIEam1v2OzBVqfqmbQgKJABH3fPY/AKURn/LsyOn6Lc/4GhoHw9j3jfM0mrGzlg+3dor6/fp32Ju46JGsTU6w6qfq+7UoH8C/zHFaf/e1M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:717b0dc2-63fa-4610-a7d2-f5dc07026344,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:fc4e7473-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fe5f9aa693e111ee86758d4a7c00f3a0-20231205
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <allen.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 404279108; Tue, 05 Dec 2023 19:48:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 10:48:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 10:48:16 +0800
From: Allen Ye <allen.ye@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, "Money . Wang" <money.wang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Allen.Ye <allen.ye@mediatek.com>
Subject: [PATCH] wifi: mac80211: Fix SMPS action frame ht cap check
Date: Wed, 6 Dec 2023 10:47:08 +0800
Message-ID: <20231206024708.24831-1-allen.ye@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-4.650400-8.000000
X-TMASE-MatchedRID: MfleD8Y7obIiXL+V+zm5iRz2MDiYujy5J/I0ITC6MIXtrvVsQ0WdM3VR
	68i/XPHyIeBgEHp7T0GISleZ//blDUl8m7ENQmOXGfRQPgZTkiosL3b83U5aWdEsTITobgNEU7g
	EPucszGePqQJ9fQR1zo3/d0NuPcI1dzV8xDXMCuTuykw7cfAoIFY5BBJri9sdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ19+9ZqEp9FTiOzrPFOrvm+E2taTfkzTK6SSmgndBeJfEt5C8QACngQ6Axq
	h5n9t0n/POc2x/QXMENRquzAcsw5jW1wfllTMfMEm//fmW4iWAXRoPmWO3jekxwdkPqCq7vDEyN
	+J8hd+jCS9WgDXVPCvqy+VVvqH2X
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-4.650400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C38E01A2F9F061E7AA757A5702C2F5699F2967AF10FCF3B65BEAD53E233032E82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_184902_092096_A42A2FC1 
X-CRM114-Status: UNSURE (   9.85  )
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

From: "Allen.Ye" <allen.ye@mediatek.com>

Since there is no HT BSS in 6GHz, the HT Cap check would stop 6G HE/EHT
BSS from processing the HT action frame for SM Power Save which can be
also used in an HE BSS. Therefore, we remove the HT Cap check in 6GHz and
add the HE check accordingly.

Signed-off-by: Money.Wang <money.wang@mediatek.com>
Signed-off-by: Allen.Ye <allen.ye@mediatek.com>
---
 net/mac80211/rx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 64352e4e6d00..f8cd14dc58ec 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3482,7 +3482,8 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	switch (mgmt->u.action.category) {
 	case WLAN_CATEGORY_HT:
 		/* reject HT action frames from stations not supporting HT */
-		if (!rx->link_sta->pub->ht_cap.ht_supported)
+		if (status->band != NL80211_BAND_6GHZ &&
+		    !rx->link_sta->pub->ht_cap.ht_supported)
 			goto invalid;
 
 		if (sdata->vif.type != NL80211_IFTYPE_STATION &&
@@ -3502,6 +3503,12 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 			enum ieee80211_smps_mode smps_mode;
 			struct sta_opmode_info sta_opmode = {};
 
+			if (status->band == NL80211_BAND_6GHZ &&
+			    rx->link_sta->pub->he_cap.has_he &&
+			    !(rx->link_sta->pub->he_cap.he_cap_elem.mac_cap_info[5] &
+			    IEEE80211_HE_MAC_CAP5_HE_DYNAMIC_SM_PS))
+				goto invalid;
+
 			if (sdata->vif.type != NL80211_IFTYPE_AP &&
 			    sdata->vif.type != NL80211_IFTYPE_AP_VLAN)
 				goto handled;
-- 
2.18.0


