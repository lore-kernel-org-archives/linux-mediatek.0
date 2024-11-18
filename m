Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED20BD43FED
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bupWu58wFlbrYCb8nodGJcVmV3Ojq4m8SJykFoWlCUo=; b=QpaD31X1kFsFj4ZUuExzBagRQP
	8H7Gw0N3hgPRJv6WldfL1qH36wtbaJzXgE3Xn8A45mIgGEJcMhIaKUW2o4rknvfsJCGQmlkhraAzO
	mce0OjmS5ngkBuGESH0el/c9y/ngT2pvVGcIrVblgjUC6KobXVTIh9iIV3kAKrAjsKBNxSj2FheJh
	jkjUvMCRa1+JTJ1vUkEPWswhJVBi3x0D2GLMJ+9jC2Va+ZDG4BNgU7LsXyxcIXEfn3aRsai/iGRwD
	datOlLIwDC/QBVbQD0nlej0G0e/JRwui7AObOO/tPxE4a5XBcVCvUxtoRspMiqHgcPhyrBD0hAdnf
	JfmUISUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwra-00000008jA6-4BVZ;
	Mon, 18 Nov 2024 08:12:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwoC-00000008iek-098G
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Nov 2024 08:08:33 +0000
X-UUID: 48b77bdca58411ef82ff63e91e7eb18c-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bupWu58wFlbrYCb8nodGJcVmV3Ojq4m8SJykFoWlCUo=;
	b=Bs2WsHTPQdisWU/qjcKVMacjZjEalWwVhgDIDoOsw/TTr35bRFKkLmDslr6NPMz+q4hV2IjOgcw7fgZRyhcbX6ukeZDjiEN/uxUfPC7JEhJ2JEp7AkkUZBNo2MaVE23CjjpASwMRTG91qQM0dpvWG6K9xcAvJmIHUfnVYPN6QbE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:6f4eaae7-175e-4f16-9c3d-b5716765f4fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:947e394f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 48b77bdca58411ef82ff63e91e7eb18c-20241118
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <benjamin-jw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 682813712; Mon, 18 Nov 2024 01:08:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 16:08:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 16:08:18 +0800
From: Benjamin Lin <benjamin-jw.lin@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Money
 Wang" <money.wang@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>
Subject: [PATCH] wifi: mac80211: fix incorrect timing to initialize station NSS capability
Date: Mon, 18 Nov 2024 16:07:22 +0800
Message-ID: <20241118080722.9603-1-benjamin-jw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.230800-8.000000
X-TMASE-MatchedRID: 439J4N2hqK3S/7ipJ1OBvPVFR4sC8dPyTJDl9FKHbrn8yBPolNpM2MPr
	YKJeXuZuuW76JsuTd2VXcbk9NdYP6o9Tk4aumaegEdFsavUQKAfJ5SXtoJPLyAHj24s7wUMNo8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgjMejjvPkBr6/PeWIFJydjuY+W2R+jVGyN2f4SYTMagnSAl
	9/socB8nw6mE2j5X6hk8hwTGR/EFPXFyu5iuz7D7WMOxHu6tdLuTusilhZ2GR5lSmbrC6fdtr/T
	o2FgNrjDLMIOOVTHz2nbLeYgH6K31Zca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.230800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7B0B3A4090CBA7A2D500AD6C5FBB8B2633A6FC145C6DBEE76583253DD46845CC2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_000832_078295_DF701CD0 
X-CRM114-Status: GOOD (  10.27  )
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

Station's spatial streaming capability should be initialized before
handling VHT OMN, because the handling requires the capability information.

Fixes: a8bca3e9371d ("wifi: mac80211: track capability/opmode NSS separately")
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
---
 net/mac80211/cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 6c0b228523cb..d58b24671a66 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1935,6 +1935,8 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 						    params->eht_capa_len,
 						    link_sta);
 
+	ieee80211_sta_init_nss(link_sta);
+
 	if (params->opmode_notif_used) {
 		/* returned value is only needed for rc update, but the
 		 * rc isn't initialized here yet, so ignore it
@@ -1944,8 +1946,6 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 					      sband->band);
 	}
 
-	ieee80211_sta_init_nss(link_sta);
-
 	return 0;
 }
 
-- 
2.45.2


