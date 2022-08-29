Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C13ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eQl4HguJF698EUmW3cND9JYx9xNxNepzFMaODTcI3wE=; b=homrOtxf5CbKnIC2F6P8PqnHpo
	d2pK12nJSFl3hxI1xdPABQlw3I6TuNbODhkBaELmtrnazPZ5A5DutMycahQZGHWwx0jybx+KdZFjq
	pCdExJBQAanAAdCjCicp8EdxIvDPYJP0sUAUn9yDFwiWx+upXUxMBN1f1ChTa+h/Z+XArJ1cwMoGC
	aW8LIlTpgA5mAl1+AHu3nwwOrNhOSuPMl2OoiYGEoq5ygnPYVJA/+ojWS7KB2iwrziN7WkFA5RbeK
	PKwB5HYvvi5nk87YgJKj3+zJ/d92omTHT16/RAXJhUdODFSsVW7oJ8PziaMIFy6yluOKbaZxn5x5r
	ePCfTsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSniD-00D8Ri-HC; Mon, 29 Aug 2022 22:58:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSniB-00D8Po-Et
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 22:58:32 +0000
X-UUID: 35ee8f0e405843e8bf1dcce40734719d-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eQl4HguJF698EUmW3cND9JYx9xNxNepzFMaODTcI3wE=;
	b=X7dwxyekkX7bpN4zSqXQu03mctFyYMK71kvaqU/qp9K7eDST2BYY8Zyvej5XhvHOeAYXcwZjf1F6JtsNN3dggmHAI6x2Tl4CDYa62kmdm3iofR0lYxgS/W2MjjpT404/MRkTFLTwQrmqDOIBA1UJRmF/OcuePSWu59N5Qd+1Q6E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:81b9a3d4-37b4-4b9a-b1e4-83deaf88b6db,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:30,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:30
X-CID-META: VersionHash:84eae18,CLOUDID:5324f8cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 35ee8f0e405843e8bf1dcce40734719d-20220829
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1726156138; Mon, 29 Aug 2022 15:58:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 06:57:46 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 30 Aug 2022 06:57:46 +0800
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
Subject: [PATCH v2] mt76: mt7921: reset msta->airtime_ac while clearing up hw value
Date: Tue, 30 Aug 2022 06:57:44 +0800
Message-ID: <1c3f22097ebc54bcf055208e8ae5f4d3807513c6.1661813328.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_155831_527194_1620BCA8 
X-CRM114-Status: GOOD (  10.02  )
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

We should reset mstat->airtime_ac along with clear up the entries in the
hardware WLAN table for the Rx and Rx accumulative airtime. Otherwsie, the
value msta->airtime_ac - [tx, rx]_last may be a negative and that is not
the actual airtime the device took in the last run.

Reported-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: only reset msta->airtime_ac at the assocation
---
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 1438a9f8d1fd..33bd64fe5c74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -752,6 +752,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
+	memset(msta->airtime_ac, 0, sizeof(msta->airtime_ac));
 
 	mt7921_mcu_sta_update(dev, sta, vif, true, MT76_STA_INFO_STATE_ASSOC);
 
-- 
2.25.1


