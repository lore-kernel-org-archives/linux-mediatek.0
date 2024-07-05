Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CB8C3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 07:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYFcNWmfgI7sdVFz1bKkFAqD23lCibB0iUvKYSeV6Qc=; b=x768LM6stCuQqf4kj7ck/qIMlB
	UwarGW85eyBywDRxmx74Ugpb81o5Bwa3qfU6wwprB7LNMjnQHYvhBtk2p2iwkVU3OXOyG5FX3nzue
	n6hymZGKxnLySfv0T/AsxNKUIpDbES/kY0qSxfOXfx+c+rXfCBEW1TjZDAlt4UPbFDiNX8ToerMnk
	7ibnQTBcn4rs7U1t7g+KIPq8tE46Nt5M4zKhG76qCTL/7blKSEGjO+pqx4BlnzpiiBCWl2QQaz04j
	AaAGBr4EvQJCdX6p6vhoQhmfi2XlbK4TMee+exuu0BK+bhRi09TUwIRnKtmhmuj/gWRQXeKRftg6+
	fzPA7vOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdbZ-0000000FAvd-3jEG;
	Fri, 05 Jul 2024 07:43:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPdbX-0000000FAuo-2l1O
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 07:43:40 +0000
X-UUID: 48e84a7a3aa211efb2966dae1f787272-20240705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kYFcNWmfgI7sdVFz1bKkFAqD23lCibB0iUvKYSeV6Qc=;
	b=NjrVb+OEhJ0sacYPr60I/zIS7a6TStsItqOY+MfvqZJiSoVoSsBS78inufSK9Fn+8s9ATvYzFYNkReCvwylDm19+/eSFU7ellIlQJe8eN33q3YhDUIXf9cwkGyi8MTrhM0chv5pMBXX1LQKbMbgklrcFq3KUoCgqHZg+n/laJy4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:cd4a971a-1f34-4d19-805a-bae8c4953b40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:22fb1fd1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 48e84a7a3aa211efb2966dae1f787272-20240705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1603640270; Fri, 05 Jul 2024 00:43:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Jul 2024 15:43:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Jul 2024 15:43:31 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: cancel color change finalize work when link is stopped
Date: Fri, 5 Jul 2024 15:43:26 +0800
Message-ID: <20240705074326.11172-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.518900-8.000000
X-TMASE-MatchedRID: 0ym1mr0sZg+HTNZBcJlnyGBLcedPqO9/GSqdEmeD/nVh2fnHe1cil6cw
	fOzvS1WBIF2TWUCE/QsLcfJ0zamKdCJMyaD9gw+XngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AHCttcwYNipX6Lm79W+wVoditB5tUiQftltn0yqSy+1JPdjM3RPIeJUBgAgNR51n4VXbT
	ZTl9nm/U81hg7Kr3qpF3LZQUKUPII7urUQd9+Nu50x7RQB4+7LdmtRsRmKkASJZPT2ZDPuzPD2Q
	fzMDLjho65UufHcDvg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.518900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C03CD16EDCC8427BE143E7E0FDB0BB1CFD1C514B8533379E3A6C1C71A252461F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_004339_720489_B67FA702 
X-CRM114-Status: UNSURE (   6.44  )
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

The color change finalize work might be called after the link is
stopped, which might lead to a kernel crash.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 net/mac80211/link.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index 2e6e92defbca..1a211b8d4057 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -71,6 +71,8 @@ void ieee80211_link_stop(struct ieee80211_link_data *link)
 		ieee80211_mgd_stop_link(link);
 
 	cancel_delayed_work_sync(&link->color_collision_detect_work);
+	wiphy_work_cancel(link->sdata->local->hw.wiphy,
+			  &link->color_change_finalize_work);
 	wiphy_work_cancel(link->sdata->local->hw.wiphy,
 			  &link->csa.finalize_work);
 	ieee80211_link_release_channel(link);
-- 
2.25.1


