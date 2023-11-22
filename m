Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CEC61D85
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 03:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Yh1gT0UDhie6zGabE2W9ULuFS2W4omY+h+RskpwRnA=; b=3t3SFTM/S17VWRV3cpeIHrWoIg
	9bXpMI3TCzrfzyQwrFyXnBp0m/q8nlmh5BESH6RsaIPGGYOHf8v1RGUz43pKFJfVSrtmuEd3N9QFk
	oikIK7a0qd/xP2daZvEAE25SVXgpD8xd0MM6lbTwFQvm8JzmwHMTuyioOASOUUKCFt67V4+63uwi2
	wFpf5d1IFcEZu3oLj3hP6ZTnrQbIrMCbleYCqI57tp3dij1Ykrrn011+V6mNwi2M7Q564KTo6H9Ec
	MO/4QCisz73S7EsoV5pV30YXQspn/r8Lm8vMRAW+euGAf7iz/UP+qgQq+y7iEWRot1B5J4ygD/B+n
	0hr3zkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dVw-000VYg-04;
	Wed, 22 Nov 2023 03:02:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dVt-000VY7-1W
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Nov 2023 03:02:54 +0000
X-UUID: 9af10fbc88e311ee86758d4a7c00f3a0-20231121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0Yh1gT0UDhie6zGabE2W9ULuFS2W4omY+h+RskpwRnA=;
	b=siVrkAwKwv9xOhA2pynUhhsT5FG4tCOZzCy1vH/u5AbF8xeTRiH59b4B4K/NUNXYnRltYdPZVXDTwVbDiSey3kzXD0PpfVDn25vE9t4z4elQeZuPRkI5uWlOzj5k2FHCMAsHeM3Mr1i2s5P3LWtRW27UPDL94bwVTXitt60Ft48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:fa779afb-79fa-40f5-af2f-9efae469e2ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:9928cefc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9af10fbc88e311ee86758d4a7c00f3a0-20231121
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1215525378; Tue, 21 Nov 2023 20:02:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 22 Nov 2023 11:02:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 22 Nov 2023 11:02:39 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: Fix potential he_6ghz_oper NULL pointer access
Date: Wed, 22 Nov 2023 11:02:37 +0800
Message-ID: <20231122030237.31276-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.360500-8.000000
X-TMASE-MatchedRID: 1R9kVYz+2gWKlsLPb8jwawPZZctd3P4Bh+w9Wz/xXDoKogmGusPLb8bX
	zAmc72fpJ7vDzKaAUziwZHMQdNbacR8TzIzimOwPlpYqKNmWxsHZs3HUcS/scCq2rl3dzGQ1Gpe
	evGsoI5d9r+SrozkFf04GYupf0ODaBvkak2FvxqUkqRIqhmd6vLkAQCRlGE7iP71lVwKowA7oRJ
	wffUpAimUQJZR/iHqQsT86m58CuFMXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCn7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.360500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 401B68C1F34588474A4B5349849C68AA102A9715CEDFF268D71F1A3B7B5BA5DD2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_190253_517935_7E991CFA 
X-CRM114-Status: UNSURE (   9.13  )
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

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 include/linux/ieee80211.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 3308e85..a23ec4c 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -2671,12 +2671,14 @@ ieee80211_he_oper_size(const u8 *he_oper_ie)
 static inline const struct ieee80211_he_6ghz_oper *
 ieee80211_he_6ghz_oper(const struct ieee80211_he_operation *he_oper)
 {
-	const u8 *ret = (const void *)&he_oper->optional;
+	const u8 *ret;
 	u32 he_oper_params;
 
 	if (!he_oper)
 		return NULL;
 
+	ret = (const void *)&he_oper->optional;
+
 	he_oper_params = le32_to_cpu(he_oper->he_oper_params);
 
 	if (!(he_oper_params & IEEE80211_HE_OPERATION_6GHZ_OP_INFO))
-- 
2.25.1


