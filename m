Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53625C7115C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69VBIZfQNwWsu8uaGX5IB4wz7qaAKWYG3oiO37LImtE=; b=o+LCrlsCPUq2XRugCqDg4ONpGg
	IBbgBwVop1zJ8vXl2i001If+zu93TiK11iBDrXc/ihbRjaXkKaNvln81vD4M2MWm12mn/Ef7SrtIk
	4oRngNl08RCwEwcxlViqnbzcaHN9YfO090lzZQsmpmpFqa/6zcH5xDeLi19g6r6J0X1ol0mogItBR
	bpsju7ck8Yzf6ENoCPiz4RW/0BrXu7/vFi5QlgMtGwqczvKVnO3um97JpVRWhOm7WZ5OeaTaAco8z
	FE4+6QDbFe/NgqeBvVtKUGyLQD74muOdZEd8kXMQmVQKl4YjjaR0DGljNunqN4e0UZElgDJepNqMS
	LLvsKxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULjw-000000080RF-3LAu;
	Wed, 25 Jun 2025 08:44:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKze-00000007smA-0Yqc
	for linux-mediatek@bombadil.infradead.org;
	Wed, 25 Jun 2025 07:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=69VBIZfQNwWsu8uaGX5IB4wz7qaAKWYG3oiO37LImtE=; b=RrysKydRxjwsby/HNvekC34E/1
	d+3pLRUaWp01PGovNZgy2u7CldXAlKgqpMZCFD9fIeVc1hlcb3FxTsEIUvcPhDkQjVXTvWLkWYj+u
	KJbah+Xb+LldrZvapUv907Gn694jwCoOInKXa88pcULQZC8Mk/K4NfX0Xl/YqoQOYn/zlcZOioPli
	wCa8kEuGiaV+dx0KLnQ0sIsDlOAV/Mh6EkiAfH0+pN8SzzR3jcmExt3LEhes515WNF6ow8D7vPqRq
	zQSlol3FNMDgK34UlR/q0LdxpQZl8G88LV7dZWQJpwHBjh75N4wBBtu1hWSP0iB1gt6PwKZGOe3bV
	L8ipKQ3A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKza-00000005fHg-1OjG
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jun 2025 07:56:29 +0000
X-UUID: df1d4928519911f09f706fa2197c6ceb-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=69VBIZfQNwWsu8uaGX5IB4wz7qaAKWYG3oiO37LImtE=;
	b=YN7b5j++SDPry9fA3RlPmaxihivVGzEsttAXlk7K5N9gCiHY6piyhha+skRj3Lj76sH7Xv9cCl5bgqNk7qILFBuqEWpccsklQwojey0NvtpxhNAsKMZM7NJn/YW8vPXr//CoZIVfRwYdit+8gl9Usu5xZua69o2yzvVUDWyrPBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3398755f-d0a4-4af9-b7a2-e27483c2ba81,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:9eb4ff7,CLOUDID:fa1f8c73-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: df1d4928519911f09f706fa2197c6ceb-20250625
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1401103788; Wed, 25 Jun 2025 00:56:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 15:56:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 15:56:12 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: set NO_VIRTUAL_MONITOR flag to improve monitor interface handling
Date: Wed, 25 Jun 2025 15:56:11 +0800
Message-ID: <20250625075611.1407687-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_085627_204380_E58FBBD1 
X-CRM114-Status: UNSURE (   7.53  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Enable IEEE80211_HW_NO_VIRTUAL_MONITOR to ensure the driver is notified of
all monitor interfaces and their channels.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index b59ab29f8ce0..bdb4fefc6d36 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -696,6 +696,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 	ieee80211_hw_set(hw, SUPPORTS_VHT_EXT_NSS_BW);
 	ieee80211_hw_set(hw, CONNECTION_MONITOR);
+	ieee80211_hw_set(hw, NO_VIRTUAL_MONITOR);
 	if (is_mt7921(&dev->mt76))
 		ieee80211_hw_set(hw, CHANCTX_STA_CSA);
 
-- 
2.34.1


