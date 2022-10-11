Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A17C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 02:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CxXP6CzobnL6sVNisn2kNutVrGf5dAauzM+XPwU5cAc=; b=eGdL5K7B0pk+o2mDf69We5s2o0
	OWKH67O0RpX1Q2a8ZdxXfI8v2lfN4JJu5fZSOVkGGlNta0tdsg9EzY7Pi9IMaW4McSiK1H8GPJYUd
	eF4YxCFoNoOC8EqUUPMOU57Vx+ccTaE1tztRdd+iiAHh1jqrth7jt5LIc91aN2D05cYeSBBN69aOK
	pNxXW4g1Ga3nl/nTLWgVsNX2jtgRyJnb4Dt4ykV4H7ZpI2Dl70xTK/dp82kFsiG3uzF6gsX5SvwrC
	ZQUKhuOOmJ0Rwa7Pl60wat2x23g6/zGv4s4FwxWFsoCd0dPq90u780JJpGWqRusC6zOMuEyT3wwHm
	nfVjMZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi56E-0031px-Uu; Tue, 11 Oct 2022 02:34:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi56C-0031pQ-OX
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 02:34:30 +0000
X-UUID: 02868b2457f140b3aba93c8880dc17d4-20221010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CxXP6CzobnL6sVNisn2kNutVrGf5dAauzM+XPwU5cAc=;
	b=bEQRRGuJo47tAq44Qf+ExrlWkzc4cILvjdl5NzZU+RcHq6mVTf6Otu6/ouOEySRXQS6eTkO2mGOueFyFkYXKXCPpy2T95UZSSp0FEQYD4KEleNNJaogDXj882u01w4H/9rxuv17j3dnQbbPQqSsOrQWJfp6eQcxc0kDITIpOn9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9307e026-dfb1-448f-8f50-9511b29d1ea7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:91b9d3fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 02868b2457f140b3aba93c8880dc17d4-20221010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1443729617; Mon, 10 Oct 2022 19:34:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 11 Oct 2022 10:03:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 11 Oct 2022 10:03:44 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: prevent unexpected nss setting from eeprom
Date: Tue, 11 Oct 2022 10:03:43 +0800
Message-ID: <efa6ba9cd8ad5124f58e05155cc05008b14c5edf.1665453585.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_193428_820994_3B399B2E 
X-CRM114-Status: UNSURE (   8.93  )
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

Add a check to prevent unexpected nss configuration from eeprom.

Fixes: 4d8053df67c5 ("wifi: mt76: mt7915: rework eeprom tx paths and streams init")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index e2482c65d639..6c5155223087 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -191,7 +191,6 @@ void mt7915_eeprom_parse_hw_cap(struct mt7915_dev *dev,
 		path = 4;
 
 	/* read tx/rx stream */
-	nss = path;
 	if (dev->dbdc_support) {
 		if (is_mt7915(&dev->mt76)) {
 			nss = FIELD_GET(MT_EE_WIFI_CONF3_TX_PATH_B0,
@@ -206,6 +205,11 @@ void mt7915_eeprom_parse_hw_cap(struct mt7915_dev *dev,
 
 		if (!is_mt7986(&dev->mt76))
 			nss_max = 2;
+
+		if (!nss)
+			nss = nss_max;
+	} else {
+		nss = path;
 	}
 
 	nss = min_t(u8, min_t(u8, nss_max, nss), path);
-- 
2.36.1


