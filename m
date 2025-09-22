Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441BCAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 21:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0xkXv2rAOqeadwBfbHxi6+JkjJBy+wx/AP8Zs/wjb8c=; b=Z/i+vTrJPZ53dXIk0rx0OFGrIF
	sIs1aZqXTahSmdpFOT3uQdPakaougXXuFnt/NMAD1KLHpD38z1r7h0DGT+s8+7GSneZmS2v7eyANF
	FnXGxTNfx4aPFk5FNic8jc9YO+yMfZZ8cS0FvHpkARU0tkVnkDBTty1lmnZAlPS9DdeJWba6JtsrZ
	nfoTDrEo3Qh1xdD8ltjqTlIAO15o3bFJxiWn3t/vbfKYUPHB3LPs7UfO2Q7Norc0x28nEbUFrrxD2
	gJjxgVN2WsQYQSgs1dHnA+JlSqhoAjFisIdXSY8GLMbkB0DDDGEeJk9PgyYzdGjBBTsF50SWE3IVQ
	gpI/YO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0oO4-0000000Bada-2fqa;
	Mon, 22 Sep 2025 21:47:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0oO1-0000000Bad3-3p3F
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 21:47:55 +0000
X-UUID: c639b9e697fd11f0a52f393f94899d25-20250922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0xkXv2rAOqeadwBfbHxi6+JkjJBy+wx/AP8Zs/wjb8c=;
	b=Sxwa2nSaTh5NRT5/0DB4SlY5NgshdSzHVTY09zdnwRD6SDTsRoF3IQ7VUoEpV/KG3IsFyT18WwNAp9cA0SG/RFJ0f3nENS50ixAp+wAog2lSyF5gXPlpnH33C+N+R2HwyTkD70t7CFh49h8Xp5Nvmk3RA1znPq8d3+HQmsqz2Ug=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:e5a08ed5-d00a-43eb-a217-05269a329cde,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:38291085-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c639b9e697fd11f0a52f393f94899d25-20250922
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1197833671; Mon, 22 Sep 2025 14:47:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 23 Sep 2025 05:47:41 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 23 Sep 2025 05:47:40 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@medaitek.com>
Subject: [PATCH] wifi: cfg80211: fix width unit in cfg80211_radio_chandef_valid()
Date: Mon, 22 Sep 2025 21:47:37 +0000
Message-ID: <02e27f91195aebcc1d80351fba4a01a719bfeccf.1758577296.git.ryder.lee@medaitek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_144753_960263_312B388A 
X-CRM114-Status: GOOD (  11.14  )
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

From: Ryder Lee <ryder.lee@medaitek.com>

The original code used nl80211_chan_width_to_mhz(), which returns the width in MHz.
However, the expected unit is KHz.

Fixes: 510dba80ed66 ("wifi: cfg80211: add helper for checking if a chandef is valid on a radio")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/wireless/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index d12d49134c88..55925d6f800f 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2992,7 +2992,7 @@ bool cfg80211_radio_chandef_valid(const struct wiphy_radio *radio,
 	u32 freq, width;
 
 	freq = ieee80211_chandef_to_khz(chandef);
-	width = cfg80211_chandef_get_width(chandef);
+	width = MHZ_TO_KHZ(cfg80211_chandef_get_width(chandef));
 	if (!ieee80211_radio_freq_range_valid(radio, freq, width))
 		return false;
 
-- 
2.45.2


