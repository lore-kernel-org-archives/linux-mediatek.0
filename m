Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B9C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 02:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LoDR6yW5PhaOI9nXfn4sNBMu5ukjVwmKI+VJR2t82HE=; b=aH5ua1YYjcfwA74487L2y43xKu
	pQ427k7Zs3xUQdZA73MMaNYf9gmZPRQlZYBMHTOTRcFORfIzFtCLHWa3wEDUIUKoMKc1uB7L97qMe
	MUqyOrW0u+S/6n1Dfnb1ku52142nQZZRmaQfAzxeNLjN+87ST8zcEMVHve/f1ksnsVg0CYgGdw0KP
	zUyNlYECJeUcAey+ShSZy25zkqWE2dDrS0RcKE/UWur3ZVzvTbt4kZAgnm4XgTsS57YS3e4EFNyOO
	9YGMHQHYweTIHzj66sJylnk1AuYnpUJPPxKxxw//B+R+VZfowzN5kE5YEkIxtIUtitAoMN0gbYitL
	3mTv+dIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhzS-008ur1-0y;
	Wed, 06 Dec 2023 02:50:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhzO-008upZ-2r
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 02:50:20 +0000
X-UUID: 2e18546893e211ee9b7791016c24628a-20231205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LoDR6yW5PhaOI9nXfn4sNBMu5ukjVwmKI+VJR2t82HE=;
	b=hXGY7TC+sxlmrtHGpr5yMl4ASXuMFXHMLrgQe8fK3E8Bn41W9p5ZRa2U3KmNl9s+I7oONg2xzYx7irNl6hgXzBfH1NbVCIEWZxaDuQ8pdKDAjHoXauvNHaJZJ4BqZekNl9u04sjxtR4X06+zKWj/tfQhouZ1+nj9qF7KYf+/TSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:9c9d1a90-bcb5-4cea-b869-5cf98d32b637,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:16e6dc60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2e18546893e211ee9b7791016c24628a-20231205
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <allen.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1992625269; Tue, 05 Dec 2023 19:50:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 10:49:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 10:49:38 +0800
From: Allen Ye <allen.ye@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, "Money . Wang" <money.wang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Allen.Ye <allen.ye@mediatek.com>
Subject: [PATCH] wifi: mac80211: Update bssid indicator with real BSS numbers
Date: Wed, 6 Dec 2023 10:49:11 +0800
Message-ID: <20231206024911.7668-1-allen.ye@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.102400-8.000000
X-TMASE-MatchedRID: kgKXJcFYqZi2jsN8aguKvC97pb4g5HCtvtVce6w5+K9bLUcJ8BGOxWD/
	jkY+Hb4O08QE6X8k+fyUTQ2JYQzY2yE6c9JYhNJ6k3ewifG2MNPm1SQ5tAvJo9qtffjsN+cnq3c
	ttlDobAypYSDa5JlKKGijwWv+7EDclwV2iaAfSWcURSScn+QSXt0H8LFZNFG73Yq8RVaZivWmra
	jv7qH7k7zHx35ro84oE/svZgTKKT+OAG8otMPC8qehxTSuqyLn
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.102400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F1F1717A581B2F9DE085D79198B1B8E48C4B0560DDCDE47B740B2AA210E968702000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_185018_922216_9D211463 
X-CRM114-Status: UNSURE (   8.48  )
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

The cnt member in mbssid is the count of total number of MBSSID elements
instead of BSSID. Therefore, we fix this by reading the MaxBSSID Indicator
field directly.

Signed-off-by: Evelyn.Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Money.Wang <money.wang@mediatek.com>
Signed-off-by: Allen.Ye <allen.ye@mediatek.com>
---
 net/mac80211/cfg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 606b1b2e4123..f90bcd59f85a 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1164,9 +1164,11 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 	/* copy in optional mbssid_ies */
 	if (mbssid) {
 		u8 *pos = new->tail + new->tail_len;
+		const struct element *mbssid_elem;
 
 		new->mbssid_ies = (void *)pos;
 		pos += struct_size(new->mbssid_ies, elem, mbssid->cnt);
+		mbssid_elem = (const struct element *)pos;
 		pos += ieee80211_copy_mbssid_beacon(pos, new->mbssid_ies,
 						    mbssid);
 		if (rnr) {
@@ -1175,8 +1177,7 @@ ieee80211_assign_beacon(struct ieee80211_sub_if_data *sdata,
 			ieee80211_copy_rnr_beacon(pos, new->rnr_ies, rnr);
 		}
 		/* update bssid_indicator */
-		link_conf->bssid_indicator =
-			ilog2(__roundup_pow_of_two(mbssid->cnt + 1));
+		link_conf->bssid_indicator = mbssid_elem->data[0];
 	}
 
 	if (csa) {
-- 
2.18.0


