Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19AAE7718B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2024 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fcQwHaODYzY5B8jzlndOF7RHeG7DDbHPryeyMjYiZUg=; b=YQRTpme4rU2l38sv3rdiS9MnkJ
	0ItUIuAt2exG3bGLvWTqx3xazTpKoKOo5BcsId+a0HnL7x+YlLcml7RTO7rDfe6ZZQ/xLWyo36f+U
	p0stepTmxDm6FuIclsyf5j+nDAH+U4ss/XmYFlcV/hUmZvTqw9SR7IM/6totoZo6IbvMtGl0Vw5Sc
	LVET3VR/kCU3uLpR1V3pi/pjlNxwwDbl3Dg+21EfMlqFlkaTw7J+4VyvJrWoP+hnfkHqdm6eUbrC8
	2hTEZal6F26wTW/6UM0mRsPmvWB86xzXaaRtRGhfJE2lo4MYxkk9Y6CeZdH36l1JfFXyGabjcYo2t
	I4JDNGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQLxr-0000000DOES-0r6J;
	Wed, 25 Dec 2024 07:37:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQLxp-0000000DODq-1bwg
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Dec 2024 07:37:54 +0000
X-UUID: 2123bf6ec29311ef82ff63e91e7eb18c-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fcQwHaODYzY5B8jzlndOF7RHeG7DDbHPryeyMjYiZUg=;
	b=bzFBlhVg0YyL8D+DerUkAWmwYzMOpcEYR1yyM+1qBSNYWYFiiyb9h6kJlSLK/z7HDBB8BqczQCr4vxDewOLkHoIdictm/88JomlVNF/FtCAhrspB8NsPjUQAD8KKPlasLGad4VeCodIHUPTZKi6gmf6an0UnK74+PXA1ZwgU0MU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:530e66eb-926b-444a-8955-91aab20be1a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:bfdbd618-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2123bf6ec29311ef82ff63e91e7eb18c-20241225
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1923511752; Wed, 25 Dec 2024 00:37:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 15:37:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 15:37:41 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: cfg80211: copy multi-link element from the multi-link probe request's frame body to the generated elements
Date: Wed, 25 Dec 2024 15:37:25 +0800
Message-ID: <20241225073725.847062-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_233753_437503_727A3F1B 
X-CRM114-Status: GOOD (  14.49  )
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

According to Draft P802.11be_D7.0 clause 35.3.4.2, if a multi-link
request requests an MLD with which an AP corresponding to the
nontransmitted BSSID, the corresponding multi-link probe response
shall carry a basic multi-mink element of that MLD in the frame body
of the multi-link probe response, whose location is outside of the
Multiple BSSID element carried in the frame.

Therefore additional handing is needed for parsing multi-link probe
response and generating the merged elements so that the MLD in the frame
body can be correctly copied to the generated elements. Otherwise, the
nontransmitted BSS looks like non-MLD.

Signed-off-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 net/wireless/scan.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 8e3d46bf4836..b244378e0bad 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -272,12 +272,19 @@ cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
 {
 	const struct element *non_inherit_elem, *parent, *sub;
 	u8 *pos = new_ie;
-	u8 id, ext_id;
+	const u8 *mbssid_index_ie;
+	u8 id, ext_id, bssid_index = 255;
 	unsigned int match_len;
 
 	non_inherit_elem = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
 						  subie, subie_len);
 
+	mbssid_index_ie = cfg80211_find_ie(WLAN_EID_MULTI_BSSID_IDX, subie,
+					   subie_len);
+	if (mbssid_index_ie && mbssid_index_ie[1] > 0 &&
+	    mbssid_index_ie[2] > 0 && mbssid_index_ie[2] <= 46)
+		bssid_index = mbssid_index_ie[2];
+
 	/* We copy the elements one by one from the parent to the generated
 	 * elements.
 	 * If they are not inherited (included in subie or in the non
@@ -316,6 +323,24 @@ cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
 			continue;
 		}
 
+		/* For ML probe response, match the MLE in the frame body with
+		 * MLD id being 'bssid_index'
+		 */
+		if (parent->id == WLAN_EID_EXTENSION && parent->datalen > 1 &&
+		    parent->data[0] == WLAN_EID_EXT_EHT_MULTI_LINK &&
+		    bssid_index == ieee80211_mle_get_mld_id(parent->data + 1)) {
+			if (!cfg80211_copy_elem_with_frags(parent,
+							   ie, ielen,
+							   &pos, new_ie,
+							   new_ie_len))
+				return 0;
+
+			/* Continue here to prevent processing the MLE in
+			 * sub-element, which AP MLD should not carry
+			 */
+			continue;
+		}
+
 		/* Already copied if an earlier element had the same type */
 		if (cfg80211_find_elem_match(id, ie, (u8 *)parent - ie,
 					     &ext_id, match_len, 0))
-- 
2.25.1


