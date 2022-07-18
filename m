Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AF1CCA479
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmKeM7/9lMLm5u9FkA2W991UUN5LuNBAidJ3ZeNlSWM=; b=378oKF4LXm2gEZcQPgH9EmClZG
	VdqNbJ1soJq16rRzt5nvywrc3GmOFMST39os3I0U+6rbwPxGiUmdbnAY3WK0GDyZIrZwSGwgK3EW/
	hbeOS+jDIBYtEJgT2CDNuMjT9mKWt6AZEBA4Q92hhlGmvxUfRLL3AgRxkVNqCcmT42ICfpS2CEccS
	QPy4YykftW6PmnUOpe25J57YV4ddyT+R17sDXBtWXdz1F0Rw1gxNmk79yluXc/fP1A1BE3JB7T/w9
	BSCyRq0/Fz6qNrTuaqsHAHpiqIUWvneeVX3XUeeBt2nJlOQlRl2Z8Qs6igDyDfQWTKzyLZvASEGMt
	OOEw4AhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXjo-0018oz-KN; Mon, 18 Jul 2022 20:53:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDXjl-0018Qy-Ig
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 20:53:07 +0000
X-UUID: 584ab132f9f24dc3bb336f3fe7132bfe-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5b98f3d1-2f0c-4279-abd9-1374d159c2e7,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:b14e9e64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 584ab132f9f24dc3bb336f3fe7132bfe-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 706119631; Mon, 18 Jul 2022 13:52:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 04:52:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 19 Jul 2022 04:52:17 +0800
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
Subject: [PATCH 2/3] mt76: sdio: poll sta stat when device transmits data
Date: Tue, 19 Jul 2022 04:52:14 +0800
Message-ID: <1655553ca765a8c18abd6f9bb7e861e9eb590b24.1658176763.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <aa7d7ed8f3a817525ab8c7b736f1ce52490a835e.1658176763.git.sean.wang@kernel.org>
References: <aa7d7ed8f3a817525ab8c7b736f1ce52490a835e.1658176763.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_135305_646314_FAD59DF1 
X-CRM114-Status: GOOD (  12.69  )
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

It is not meaningful to poll sta stat when there is no the data traffic.
So polling sta stat when device have transmitted data instead to save
CPU power.

That implies that it is unallowed the stat_work to work while MCU is
being initialized in the really early stage. That is a required patch
for ("mt76: mt7663s: fix the deadlock caused by sdio->stat_work")
because mt7615_mcu_set_drv_ctrl pointer isn't set done until MCU is
ready.

Fixes: d39b52e31aa6 ("mt76: introduce mt76_sdio module")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index aba2a9865821..3b9bb7cd08ad 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -478,7 +478,7 @@ static void mt76s_status_worker(struct mt76_worker *w)
 		if (ndata_frames > 0)
 			resched = true;
 
-		if (dev->drv->tx_status_data &&
+		if (dev->drv->tx_status_data && ndata_frames > 0 &&
 		    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state) &&
 		    !test_bit(MT76_STATE_SUSPEND, &dev->phy.state))
 			queue_work(dev->wq, &dev->sdio.stat_work);
-- 
2.25.1


