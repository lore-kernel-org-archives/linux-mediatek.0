Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8EAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLWhqdv9Lf/raDbcUz7GbywP65tHkDSnKUGye8OTIA4=; b=o360h3BsLu5J+9XHNUfx39mW/9
	7Ew5PDuFHdk8gxiqcOHQidHQM2y4hRAHPAac8oQiOaLL8U3NIIj0vsz46OdbF77Ytts73ft+yppkT
	PRevgoR2ikBkS1hvAUNxEk6Zm1KRbJ8U8i52WTgQvHegCX/oiDlCn6vaOQnvazpHr1LFRpLeLevuh
	BMsnTSo3L3CKbw5VtY5uDa5WdcdvnJ9Ph9DvXpPFT+VfJpkRtlUBYrtN78YTsoOVvGHO2xwP4jQSo
	1J3m+BMw7UgMocJdZ9w7eiGk9wCEGnNz7d2CPOVkVlEy7yj4vwZkSHH30h2/G1cXUuwlT44PtFe0I
	hg5MTypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fse-006rd4-TK; Fri, 23 Dec 2022 11:06:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fsV-006rUU-Kr
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 11:06:17 +0000
X-UUID: edb16fa177fa4313ab654eecf6995517-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dLWhqdv9Lf/raDbcUz7GbywP65tHkDSnKUGye8OTIA4=;
	b=mLPT3JJO167fJc1xU6Sj5SWILwJS6NpH6goUy9N6B0RCSiG6/24ADE89+5YWn4NmhBvDwUcueU8Sh8C1I9zfmGcc6CF5u6c4iIKjSCCIYenUPHq2kc5cXkAJwBztZn4p4zWg9sRRVK2l868M3m/A+MMHcDxTsB4EY4Ec1cLp4QM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a1d8cb64-d7c8-4679-840b-6dec8288e2ed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:2871c8f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: edb16fa177fa4313ab654eecf6995517-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2023285355; Fri, 23 Dec 2022 03:57:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Dec 2022 18:16:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 18:16:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/4] wifi: mt76: mt7996: do not hardcode vht beamform cap
Date: Fri, 23 Dec 2022 18:13:47 +0800
Message-ID: <20221223101348.11504-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223101348.11504-1-shayne.chen@mediatek.com>
References: <20221223101348.11504-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_030615_727238_40FFBF1C 
X-CRM114-Status: UNSURE (   8.79  )
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

Use the sts variable when setting vht beamform sts cap.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 64e8dfd06e9f..7a9692a66ed8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -465,7 +465,7 @@ void mt7996_set_stream_vht_txbf_caps(struct mt7996_phy *phy)
 
 	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-		(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+		FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, sts - 1);
 
 	*cap &= ~(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK |
 		  IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
-- 
2.25.1


