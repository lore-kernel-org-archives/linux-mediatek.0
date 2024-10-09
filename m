Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FCBCEDD89
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NQTKdM4vZyZcthviWc61hdQAhVA9NguzLocJ/FEkpcI=; b=0PDJr12U3t2UWCR2vcnn+sefVg
	iwLphnkwC9CKgwiGviyapiET1jsChZ65aSdPCHJz/A63Dv2lSHOaHQfTJIfx46/Us53ajA7fItrHy
	kYd3JzqtYq4Q1mOEp+WAyYfFW0goM5ZyGage+Ekl7NdG0cLwVI6Avlp4id9QaFIuQUAf5ELa7dGlZ
	9MS4A8QucGFXIAmd2TyIh3pt2ezTPgDfjosjKIFsNKJZdFSvW3FbEEN39brO0JSJe4lHsCoY3nFg7
	NMkaAVcizP9pVW6igSH2uiIyU5ehnINIHHWqOiecIpnU8iyGWCJQCgwKIgjkpRZsSY6vprIWSDzOK
	N/EvSBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syVfo-00000009C4S-0HCz;
	Wed, 09 Oct 2024 12:20:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syVeG-00000009BqI-27Lt
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 12:18:38 +0000
X-UUID: 9749fc5e863811efb3adad29d29602c1-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NQTKdM4vZyZcthviWc61hdQAhVA9NguzLocJ/FEkpcI=;
	b=nb6Ss+xwcHjwytPEwmPBRpmsE4zAMtLSaQO0iyO7YZH5IZwULx6FjDc9K+Br+UzeRclb8ZPaY/S43zV0y+IAePd2QmVX02mj+ILVoIIF4FmLWR3xzxrK10CiH+GaBV/HiPA6RHHvE0g/cF2AKxg+u4XU2XjqiDEHzTBrILzN3P8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f855238f-215b-4663-b6d8-1aa92822b9d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c5eefe64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9749fc5e863811efb3adad29d29602c1-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1922780693; Wed, 09 Oct 2024 05:18:28 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 20:18:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 20:18:24 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: refactor BW limitation check for CSA parsing
Date: Wed, 9 Oct 2024 20:18:12 +0800
Message-ID: <20241009121812.2419-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.819000-8.000000
X-TMASE-MatchedRID: oFaSmDF7GFm1Hdke1yr598u00lnG8+PWLJXjpJzQSNN794qAHfSq0o5J
	LmS6k5zEhuKFbyQqx0iUTQ2JYQzY21Vju37PDEAuRsqQuQlRTh/DHSNFHFxB82I4wQ1Yq/d0KLW
	rCrDVHUni8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV8HTT+SR4FPAPOmsX18iyZqunJ293L/ptLw0l
	qvYKUL4cw9+0ZIYtPR7XInbTZpCJ+scJGZeOwhv3UJZ1ah02UmpryvLF/ssNilMM+FiTXvu3ZrU
	bEZipAEiWT09mQz7szw9kH8zAy44aOuVLnx3A74
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.819000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A1A985D773F6CBC2510A9CEADC8631F410762FC13E17CD4588541A99D275A3052000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_051836_618824_8B428C93 
X-CRM114-Status: UNSURE (   7.76  )
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

Refactor the BW limitation check to a more general format when
parsing CSA. Also, the original BW check did not account for BW
less than 160 MHz.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 net/mac80211/spectmgmt.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/net/mac80211/spectmgmt.c b/net/mac80211/spectmgmt.c
index 073ff9e0f397..c6015cd00372 100644
--- a/net/mac80211/spectmgmt.c
+++ b/net/mac80211/spectmgmt.c
@@ -377,13 +377,8 @@ int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 		/* capture the AP chandef before (potential) downgrading */
 		csa_ie->chanreq.ap = new_chandef;
 
-		if (conn->bw_limit < IEEE80211_CONN_BW_LIMIT_320 &&
-		    new_chandef.width == NL80211_CHAN_WIDTH_320)
-			ieee80211_chandef_downgrade(&new_chandef, NULL);
-
-		if (conn->bw_limit < IEEE80211_CONN_BW_LIMIT_160 &&
-		    (new_chandef.width == NL80211_CHAN_WIDTH_80P80 ||
-		     new_chandef.width == NL80211_CHAN_WIDTH_160))
+		while (conn->bw_limit <
+			       ieee80211_min_bw_limit_from_chandef(&new_chandef))
 			ieee80211_chandef_downgrade(&new_chandef, NULL);
 
 		if (!cfg80211_chandef_compatible(&new_chandef,
-- 
2.25.1


