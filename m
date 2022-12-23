Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8798C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7vP9AmIc7exdMlaPxDaWmhgtLnhX7HZ3tBM0yG+NGk=; b=1/k1A1/h/p6ChcJ5cSUtjcxPFQ
	zdFoKTXDQHUpp+RadU5AJuE58V99nqbJ62IEGIfEzFgQHEU7B77RzZAWXO3YwgqX8Nt6Iy/sHjckQ
	4unWRHLnYo1cdsSNbgf7LjOUCTZpCD+YgzajXnjDxBu8I9x0aoPVS3hoZeddP6PTXf6i8tnSHZgm1
	pTwr5CAp2cUkIjLaD8mZDFupUtRi75c/CnROOcWyKPACOfO5kfsHoOhHxhg3ZTDxeMaBmGlqgzoI8
	NkWBBiMoYepC0yo7wZPd6F7R2VwgbisMztyqG7oilDqqV1sjYOURXOsfOM23RDi8xjwnKEeJYk6bA
	terVbpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fMA-006Rqs-9M; Fri, 23 Dec 2022 10:32:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8f72-006HVm-OA
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 10:17:15 +0000
X-UUID: 7ff89acc9e2645c6be8ff272ab314c2b-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Q7vP9AmIc7exdMlaPxDaWmhgtLnhX7HZ3tBM0yG+NGk=;
	b=X9NGpQ//oOxgsDHeTSDVcIDCKU1JQ4jCtNBPZEUZ/iM83dDhKRf3Roo1kSV81xdSxR5/FGy5B5e+AShpokqdBBvzGxhK1M0uAXvTC3SZ/mh2LD0tPAT3sm0EWYVjgPY5aU6/JcRyTkHJXaR8tWEsNH8V6qB4mufc73k0XpNZVKU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:90777e15-7b53-4ad9-96b6-a86caeaac3d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:36f9388a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7ff89acc9e2645c6be8ff272ab314c2b-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1852162070; Fri, 23 Dec 2022 03:17:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
Subject: [PATCH 1/4] wifi: mt76: mt7996: fix chainmask calculation in mt7996_set_antenna()
Date: Fri, 23 Dec 2022 18:13:45 +0800
Message-ID: <20221223101348.11504-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_021713_053561_0A6CCAEC 
X-CRM114-Status: GOOD (  10.78  )
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

Fix per-band chainmask when restoring from the dev chainmask.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 4421cd54311b..c423b052e4f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -880,7 +880,10 @@ mt7996_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	phy->mt76->antenna_mask = tx_ant;
 
 	/* restore to the origin chainmask which might have auxiliary path */
-	if (hweight8(tx_ant) == max_nss)
+	if (hweight8(tx_ant) == max_nss && band_idx < MT_BAND2)
+		phy->mt76->chainmask = ((dev->chainmask >> shift) &
+					(BIT(dev->chainshift[band_idx + 1] - shift) - 1)) << shift;
+	else if (hweight8(tx_ant) == max_nss)
 		phy->mt76->chainmask = (dev->chainmask >> shift) << shift;
 	else
 		phy->mt76->chainmask = tx_ant << shift;
-- 
2.25.1


