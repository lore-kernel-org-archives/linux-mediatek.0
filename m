Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB7106FD89
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DR7rv7sxJEAxWeulaxRSLomxxIYwDbyOMGA2IwPmPZA=; b=I+6y84AW0Vft0rOt1Wsd+xb0Az
	BAAkrvTzovOPCxGBZWAOgVRri/9g672TkuB7mxjjVkwvJfhMqNinXDaq5OuohEauhDT+z3b+OEE4+
	rrHpf7BKR0N8G3/hlMGiJ5uvbN38tq4DhYrT3jc72eakH9p4GFEQZSJo1Yjz2/bYaoPOUvQW/h7gQ
	6o2X1wDyBOYaKuIfV7H4QcySFsIH0Uq5efw5oxnAEoQyX+KATlx83Dp0+xkBPvLlzxQSQAfv6r9N9
	RfWzjkmmKZVMk9vL3LdtMuuDmwNqw8GRNhkqsVn03Q7yYLzS5eWQI7LYHdjMOj6Q7f04xJ7tfZpg9
	2RCB3aaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vvp-0000000GqFO-0F85;
	Fri, 13 Mar 2026 06:23:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vvn-0000000GqEq-3rJd
	for linux-mediatek@bombadil.infradead.org;
	Fri, 13 Mar 2026 06:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DR7rv7sxJEAxWeulaxRSLomxxIYwDbyOMGA2IwPmPZA=; b=Fr+kxGmF5GxjRCfIXD7Un9yZZn
	eDvrXS7D9lGAj53mP+axJFjxSQodn1pg2C6JH7kwxHVeaELWTxlqlDVKzgLyfElPD33q+d9IDfCwt
	ZpsOUGiP2yOVVLPzwuQH7BcNxOQLqpLsUvE9Lw0xsWjxq5aFeCi56j2HGBR1Ks/6qF3JVfMqUScoT
	kt4HyNR23jTtgln6vgOlyZZNX4vIaFhj0mMi/b2o7gsjqinm7lEU0PtuTRjtcSN4k1MrT0HITeXJA
	ruClF+Sm9KmlYnJSlBlhGP3Kb751aKeH2DUKJ4yTxlXD2ELdJ85rc69qEDHpKpZ8ZrjyD9NOX0L2h
	H70HuIpg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vvi-00000002e6u-1rDt
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Mar 2026 06:23:29 +0000
X-UUID: 1d36376e1ea511f1a6de359d7043e138-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DR7rv7sxJEAxWeulaxRSLomxxIYwDbyOMGA2IwPmPZA=;
	b=Kmaa5wO436oOQ1vBjzPE8x59PfjxqZDSAzEh1RsxKDykDhxZoHW25ZYXaxavUPfsiY+wopqxzW3ZXU6QxKWWUwb504BV0licmlkWkfkVvsrxcnjHGS6du9WE2U7keFQT/8+HAxi/8zs+htO7FQnGkqbZ7GNxLhIM4ALu67O+EiI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a604805e-4651-40fa-92fe-c3ba0084396f,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:ef03add4-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:5,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d36376e1ea511f1a6de359d7043e138-20260312
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 643372038; Thu, 12 Mar 2026 23:23:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Mar 2026 14:23:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Mar 2026 14:23:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH wireless-next 1/2] wifi: ieee80211: fix definition of EHT-MCS 15 in MRU
Date: Fri, 13 Mar 2026 14:21:49 +0800
Message-ID: <20260313062150.3165433-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
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

According to the definition in IEEE Std 802.11be-2024, Table 9-417r, each
bit indicates support for the transmission and reception of EHT-MCS 15 in:
- B0: 52+26-tone and 106+26-tone MRUs.
- B1: a 484+242-tone MRU if 80 MHz is supported.
- B2: a 996+484-tone MRU and a 996+484+242-tone MRU if 160 MHz is
      supported.
- B3: a 3×996-tone MRU if 320 MHz is supported.

Fixes: 6239da18d2f9 ("wifi: mac80211: adjust EHT capa when lowering bandwidth")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 include/linux/ieee80211-eht.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/ieee80211-eht.h b/include/linux/ieee80211-eht.h
index f8e9f5d36d2a..a97b1d01f3ac 100644
--- a/include/linux/ieee80211-eht.h
+++ b/include/linux/ieee80211-eht.h
@@ -251,8 +251,8 @@ struct ieee80211_eht_operation_info {
 #define IEEE80211_EHT_PHY_CAP5_SUPP_EXTRA_EHT_LTF		0x40
 #define IEEE80211_EHT_PHY_CAP6_MAX_NUM_SUPP_EHT_LTF_MASK	0x07
 
-#define IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_80MHZ			0x08
-#define IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_160MHZ		0x30
+#define IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_80MHZ			0x10
+#define IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_160MHZ		0x20
 #define IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_320MHZ		0x40
 #define IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_MASK			0x78
 #define IEEE80211_EHT_PHY_CAP6_EHT_DUP_6GHZ_SUPP		0x80
-- 
2.51.0


