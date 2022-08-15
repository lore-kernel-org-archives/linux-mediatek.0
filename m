Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF16CC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 03:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f/DNrOHjuuOkqJPFhLJHldmqWG8aZc2jc5hg+27lVc0=; b=0BTHBCaK3UIh0YFyIwLz6pWfs0
	ipcW9p6b+rcPk6UynqRFeZrpzcrZuRgquZcBabfFgDP6NvUi2yv/iZjZKobGxRQcPDUqokQhW8M/G
	jcDFdc27schF92FSdzT4Qb2U1CljdwJ6V6FfvK8SJ7aDogJxtqKAnE4BYQmvPn4GGjSS7X6qFmw8P
	e25vgcriLw980G8nDJKlGYKx8z1xalX2dmBlkEQLl5/Wlo10hVXOFbJiLrsNAX/f8W0TEo1O4Po78
	+Jzxl7qM0+8SEiy+XJqGee7O/E7qCSNpgIdhDH6miUvuCqrrKF49hSktH1nQd9bwE4JMcdv4X6F1C
	FnIzDAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQxv-00AutY-Jz; Mon, 15 Aug 2022 03:40:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQxs-00Aure-Fs
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 03:40:33 +0000
X-UUID: e203ae2dcbf34f48809cd5d44b9d2bfe-20220814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=f/DNrOHjuuOkqJPFhLJHldmqWG8aZc2jc5hg+27lVc0=;
	b=PYLGVofGuu4UgKo5bDFPULPpY/3pgEho9cpvegbgVpy8Sq2D8N+5nbF9vk4Mu4SaVMCVFbkvKRfXCBQkCTZ3Ze+hBnh2pxCynT06jQgV0vtjDcepxHZlIa+/kaAWRVuRqPLV7q/HzoSSSFCW/WeDhjoYUvBJOYS3E8pqEzFHHh8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:6e593841-8577-4cdc-8976-240fb8deb683,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:38
X-CID-META: VersionHash:3d8acc9,CLOUDID:0a8ca79c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e203ae2dcbf34f48809cd5d44b9d2bfe-20220814
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1649553420; Sun, 14 Aug 2022 20:40:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 11:29:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Aug 2022 11:29:47 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix mcs value in ht mode
Date: Mon, 15 Aug 2022 11:29:31 +0800
Message-ID: <20220815032931.28367-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_204032_564643_6A9CD25E 
X-CRM114-Status: UNSURE (   9.00  )
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

Fix the error that mcs will be reduced to a range of 0 to 7 in ht mode.

Fixes: 70fd1333cd32 ("mt76: mt7915: rework .set_bitrate_mask() to support more options")

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f83067961945..e99fdacc11ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1360,7 +1360,7 @@ mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 	struct sta_phy phy = {};
 	int ret, nrates = 0;
 
-#define __sta_phy_bitrate_mask_check(_mcs, _gi, _he)				\
+#define __sta_phy_bitrate_mask_check(_mcs, _gi, _ht, _he)			\
 	do {									\
 		u8 i, gi = mask->control[band]._gi;				\
 		gi = (_he) ? gi : gi == NL80211_TXRATE_FORCE_SGI;		\
@@ -1373,15 +1373,17 @@ mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 				continue;					\
 			nrates += hweight16(mask->control[band]._mcs[i]);	\
 			phy.mcs = ffs(mask->control[band]._mcs[i]) - 1;		\
+			if (_ht)						\
+				phy.mcs += 8 * i;				\
 		}								\
 	} while (0)
 
 	if (sta->deflink.he_cap.has_he) {
-		__sta_phy_bitrate_mask_check(he_mcs, he_gi, 1);
+		__sta_phy_bitrate_mask_check(he_mcs, he_gi, 0, 1);
 	} else if (sta->deflink.vht_cap.vht_supported) {
-		__sta_phy_bitrate_mask_check(vht_mcs, gi, 0);
+		__sta_phy_bitrate_mask_check(vht_mcs, gi, 0, 0);
 	} else if (sta->deflink.ht_cap.ht_supported) {
-		__sta_phy_bitrate_mask_check(ht_mcs, gi, 0);
+		__sta_phy_bitrate_mask_check(ht_mcs, gi, 1, 0);
 	} else {
 		nrates = hweight32(mask->control[band].legacy);
 		phy.mcs = ffs(mask->control[band].legacy) - 1;
-- 
2.18.0


