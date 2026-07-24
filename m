Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3091C531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bqCu3XbxSgPpATVjIcDE5cbl5QlWnkiGM1cLYPhR9hs=; b=emki+Vez7PQPWaJYCJSCT1hjTL
	qplHtbkLDd27EvHGcNeLpB+MSPJ3GJei61n8wLbYhwgriWPNuDOf7Lc6t3tMZheyJFgZeg/ZpeGr3
	culya7RHK5n8boEgDMdIWoedYdSUwaJ1CSaPAnmYipE2+ij0Qio3OCsKHPU5IrSDj5inNNWWZwF3M
	rtQO529pdcTHcXKrAWL/ouGxc3NhBAAyXAo/i2KS5aUZuRfkH7iQ2NDy66Tf7ZghHMvkWgwQ8k6TB
	exu+GsirhRC34kzXQfK5w3AtINaAuB2NijGjSXE0KU0AOG6AZr5uqmoTq5qK8e2Q0Y9l2d9TgLI80
	9S0JGDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBdK-0000000FszC-2a6N;
	Fri, 24 Jul 2026 08:51:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBdI-0000000Fsyh-2ZTq
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:51:53 +0000
X-UUID: e7f73e44873c11f1afed4741b24580c9-20260724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bqCu3XbxSgPpATVjIcDE5cbl5QlWnkiGM1cLYPhR9hs=;
	b=IoLtEupJfCrYRKG3vu/FLbcFA7U1WsnHH5iOFwkxRhau6/w/y/y+8th40hk6NkEZ6YBaR+x6gYc3qR2cF37ts2AN+UTKvsEM0xs6pLcJiOsXKzoRTLuUojQ94VRF93aZNhDCF5WfwwavIwp5KJDczZzsOVc8YzZxvWlTDdEJ+dM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:ae0ec9a7-0d24-4bd9-8dc9-077403a5d1c2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:49f7dc5f-762a-4584-baab-4eebe609beea,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99|1
	00|102|154,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e7f73e44873c11f1afed4741b24580c9-20260724
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 327123717; Fri, 24 Jul 2026 01:51:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Jul 2026 16:51:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Jul 2026 16:51:46 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<litien.chang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: connac3: use __le32 for mt7925_regd_rule fields
Date: Fri, 24 Jul 2026 16:51:44 +0800
Message-ID: <20260724085144.3156287-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_015152_664893_1800505A 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

The mt7925_regd_rule structure is parsed directly from the firmware
regulatory event, whose fields are little-endian. Declaring start_freq,
end_freq, max_bw, eirp and flags as u32 misrepresents this wire format
and triggers sparse endianness warnings on big-endian aware builds.

Change these fields to __le32 to reflect the firmware byte order.

Fixes: 4ce639ea518f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/regd.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.h b/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
index 2feacf42dc22..373992558974 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.h
@@ -13,11 +13,11 @@ struct mt7925_regd_rule_header {
 };
 
 struct mt7925_regd_rule {
-	u32 start_freq;
-	u32 end_freq;
-	u32 max_bw;
-	u32 eirp;
-	u32 flags;
+	__le32 start_freq;
+	__le32 end_freq;
+	__le32 max_bw;
+	__le32 eirp;
+	__le32 flags;
 	u8 rsv[12];
 };
 
-- 
2.18.0


