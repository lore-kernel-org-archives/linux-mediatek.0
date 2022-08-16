Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29AFC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 00:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pk12J1PvmWS5oCrmECy0Iw17fYlCMUVZW45eZEevfVo=; b=Mt4TBmDN4LtCc07KWER4RdnImd
	gR11QYP9Hn/p/yC5xvvcwFoUGNe6s5CmHWBNZ6TrWrhzgRWRyYoUw554DSFSPjaHRXINlB6QtoQeo
	cqPPtwvdthvSwK7/vXAWiCh4Gz/2jGzmQlOk1QsMRRC6wIhNMR6GHHyEGpcY/BjUrb5f2Ts7LcouO
	95Lu8mftUJKRAQuEGLtfo+lAt6biIlOOLVFZP/HEL9uJqmng1krBsPSOfXY8VpyyEEZLJNmWkYbo8
	xDuDeZopbXCcT97uq9/PHPhyPILeZYEUoM8RlvBikcRUXsytiTWqFN+d1DUGbkHLhYOdizlbTHW9o
	gpqf2a/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNkDl-007rj3-QC; Tue, 16 Aug 2022 00:14:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNkDi-007rbh-0B
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 00:14:11 +0000
X-UUID: 53b03ed0bf924052b64bda243b38ac35-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Pk12J1PvmWS5oCrmECy0Iw17fYlCMUVZW45eZEevfVo=;
	b=l0IxEBSFcAQKiHc1pwoY7si6uGj2V5XY97TBSvQATtI5Xf3JicAgoEiOzSMDICA3wXsH0bbBe0Nh0gRUW04yVvZnmc58S5+ydfCxo5XFz7ImpUkSsDMeJxf6yND8Nq4UyWZZZt7bw08b0JJOBKBEls0xNWCok3dafdwFtrZOyew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:06e1adfa-4db5-495d-92fa-420155d8ff69,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:5a4c63fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 53b03ed0bf924052b64bda243b38ac35-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 972250933; Mon, 15 Aug 2022 17:13:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 08:03:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 08:03:55 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/9] wifi: mac80211: allow enabling chanctx until hw registration
Date: Tue, 16 Aug 2022 08:03:39 +0800
Message-ID: <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1660606893.git.objelf@gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_171410_094483_659732B9 
X-CRM114-Status: GOOD (  10.62  )
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

From: Sean Wang <sean.wang@mediatek.com>

MT7921 device can be supported with the channel context depending on
the newer firmware so that we need a way to enable the chanctx related
methods until hw is being registered.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 net/mac80211/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 5b1c47ed0cc0..98d05ed1a081 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1011,6 +1011,14 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 		return -EINVAL;
 #endif
 
+	/* check all or no channel context operations exist */
+	i = !!local->ops->add_chanctx + !!local->ops->remove_chanctx +
+	    !!local->ops->change_chanctx + !!local->ops->assign_vif_chanctx +
+	    !!local->ops->unassign_vif_chanctx;
+	if (WARN_ON(i != 0 && i != 5))
+		return -EINVAL;
+	local->use_chanctx = i == 5;
+
 	if (!local->use_chanctx) {
 		for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
 			const struct ieee80211_iface_combination *comb;
-- 
2.25.1


