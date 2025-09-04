Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEA4CA1017
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 03:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLjx4aXw8Lpg0rQ9hR6MyNgnpatBxF3Rp0U6C78VT/k=; b=CFibKZBkKRNDl6d7tXiGWu3oaE
	+rZQnvTLJiPXUbJ1Nwtre/zgMWAUGk6YuNsNdGv+kXtUSJsISHeljBkC1XWNekd5lDsCBTe2qasGH
	tR4OomkdND51HVKcRsC75VwwFCilPy7dQ9CRor6x1dcW847chcBD66uJ9oKONENMzDdfxbbCTs9tF
	i1WLjiXWbIlPAGMnJtPtKpCRkI02qBGk0CIpKwVId7BKQDEDK0Hp4B/HXxFniSCj+cdtUQFD3lY8X
	Kr2+o94aFTkTulBkJOFQkakQBXe8F3jJ/rtEum1dSKHUZa0n6BxEM9ns4PFMKkq4hL2HH2tHG7R/o
	0uFhiCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jq-00000008Zub-1Cmc;
	Thu, 04 Sep 2025 03:07:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jp-00000008Zt6-0n8K
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 Sep 2025 03:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dLjx4aXw8Lpg0rQ9hR6MyNgnpatBxF3Rp0U6C78VT/k=; b=IKPzpdTC/NKHLmnXpBUeV8FWrB
	PwfFfxla8hjznwbY18q1PMGtgWIP4co8LHP8a9oLI17IZ4GD4vi1n2BgzwqwxXd8oWPe+rk5SuP0b
	VLQbVppvQ/cj1ET/3nzDgGlKGN2Lvu8mZLYiK8Wx/sLTw9JvnKHMsvpj85BtSBjaU5T24GOpvlxPr
	5gn0S4rBiPz6nPRvmZqB/7s+oqlunemOFSfsO5rjopdWIu2vgr6LDSNwRW01SbgAqWF43U0nODcXt
	r750qLAcWntT21md0MT3PTyOxO6ANfkwaQF6yZIkzInwktVBuOc1QYuasWKT0oguafJIXgnqkXQL4
	3zhhLJ2Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Jl-00000004Gxe-1xyI
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 03:07:23 +0000
X-UUID: 3df3f35a893c11f09eb0dd999d3936bf-20250903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dLjx4aXw8Lpg0rQ9hR6MyNgnpatBxF3Rp0U6C78VT/k=;
	b=Fdn0zqGSGyeCgUAYwnCvDoksUi0s5OwGo7LDmoZ/81iE88jezbDPjcR5k0CaC2WoohXATbS6BfVXZmt0bXad81XZg/OtgHg+ZA+FXkXpTX/DA9YfnPd8IVik69yDT9gwb4xUQikZ/QeFgEPCzo8oKxUYThLCG7/HhS6bUPbDVKg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:6c708bef-0707-44b8-8094-620637d47f39,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:4536f2a8-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3df3f35a893c11f09eb0dd999d3936bf-20250903
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1728461489; Wed, 03 Sep 2025 20:07:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 4 Sep 2025 11:07:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 4 Sep 2025 11:07:04 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 3/4] wifi: mt76: mt7925: prevent NULL pointer dereference in mt7925_tx_check_aggr()
Date: Thu, 4 Sep 2025 11:06:48 +0800
Message-ID: <20250904030649.655436-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
References: <20250904030649.655436-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_040722_212347_23A1E9BA 
X-CRM114-Status: GOOD (  11.54  )
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

Move the NULL check for 'sta' before dereferencing it to prevent a
possible crash.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 122aa6e9070a..ff9f628ba005 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -845,11 +845,14 @@ static void mt7925_tx_check_aggr(struct ieee80211_sta *sta, struct sk_buff *skb,
 	bool is_8023;
 	u16 fc, tid;
 
+	if (!sta)
+		return;
+
 	link_sta = rcu_dereference(sta->link[wcid->link_id]);
 	if (!link_sta)
 		return;
 
-	if (!sta || !(link_sta->ht_cap.ht_supported || link_sta->he_cap.has_he))
+	if (!(link_sta->ht_cap.ht_supported || link_sta->he_cap.has_he))
 		return;
 
 	tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
-- 
2.34.1


