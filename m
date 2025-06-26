Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB8C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jun 2025 03:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o9zZenT208Kdh9QhO8IBxP3KLL+36xJprHwoxaJOxRs=; b=mRPulZ6AkQGeyanhDOXcpZQS/n
	Assl/A9RrKvhAtcLjfCYZaefwrprzEvUocVtme/UtFrJFZJU5Pdn94+GosXRC9VUTcqAMHmYEeysv
	tkAiW2r6IkUcLeTGiRM6ohs7+G0aU7MNNW1Bui3vJMq6NO8N/vE2uQtYyVdRe+NGjrAUuJhRyhOpX
	sZxaCFQORGUQaqM09KlIfAWb1xhWgL+H+Vhcp95yy2LseOz++o/qeTijvSPLA0VEgKfbVSiwr25+j
	WAgwQM0GrBKXNGRW5IlSIoDWmYMG5cexGt2I30irPmzSke5k5WMuyIkYmS0CAjw1PJS2ttCAGXkvI
	oulIRDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcvW-0000000AVIs-02ex;
	Thu, 26 Jun 2025 03:05:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcfK-0000000AUA6-3F5E
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Jun 2025 02:48:43 +0000
X-UUID: 0d3e06aa523811f09eb0dd999d3936bf-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=o9zZenT208Kdh9QhO8IBxP3KLL+36xJprHwoxaJOxRs=;
	b=QLs+eZZz5xQ1mWAIQ+2guEJiLu/NSdjyscqY2RKsn0aeH6CEdlxXLf8iKcaFsPHZQjEA9htvRTMiYalGQlnNT+YQzf2OhLY7l3XbG22bOigkPyVodVq29ILW1BsThEjMoEKSZhb2ZTh6dxfXKARbXeCVAuvgg0ENnLCTQpUmaqg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:08a8158f-60f3-43e0-aee4-7383c9f7cb9d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:de353682-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d3e06aa523811f09eb0dd999d3936bf-20250625
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 981928464; Wed, 25 Jun 2025 19:48:34 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 26 Jun 2025 10:48:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 26 Jun 2025 10:48:31 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: break the outer loop if target nontransmitted BSSID profile is found in ieee802_11_find_bssid_profile()
Date: Thu, 26 Jun 2025 10:48:25 +0800
Message-ID: <20250626024825.2231721-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_194842_816775_F4E5707C 
X-CRM114-Status: UNSURE (   7.60  )
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

If the target nontransmitted BSSID profile is found, the outer for-loop
should be broken, otherwise the "profile_len" might be incorrectly
overwritten.

Fixes: 5023b14cf4df ("mac80211: support profile split between elements")
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 net/mac80211/parse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/parse.c b/net/mac80211/parse.c
index 96584b39215e..a985a439051a 100644
--- a/net/mac80211/parse.c
+++ b/net/mac80211/parse.c
@@ -815,6 +815,9 @@ static size_t ieee802_11_find_bssid_profile(const u8 *start, size_t len,
 				break;
 			}
 		}
+
+		if (found)
+			break;
 	}
 
 	return found ? profile_len : 0;
-- 
2.25.1


