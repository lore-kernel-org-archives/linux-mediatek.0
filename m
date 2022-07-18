Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECD5C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 21:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RUI1kr6i7/l5i427xx8ow3UcLSaDJj7HzMnvJiGc4k=; b=fYRIP5gPHKXE79kh6owIjytkTt
	xV9/NmReJkyT1EGUFQ5jtuZp+tEnQV0BkzcTNmdohyrk6Di8CGMDizmT+LRf41CJwIKcXDsVeeWPc
	+2Jv5+3KENtZLHP/Ev+8CufZB1tACZJ7m2qqMNr2z9N0PxexwU68naE91nwNPAo6dxqYr8wI/sIZC
	AmDZ3BCx5/spmS88DVMKc/i7NT1rLUUTN7btZmpPE6GbsyuLFRhmi0wmXwBhFU/tIt7iRUnyXfRNc
	keUw1B4qfvlvuDi6KOcDEfPtuxsA5AVIFUa0A9pIrdkhVnLKHoug2ERc6CBo9jgbk2PhWEIN/fvWT
	2FG2tj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYeV-001j15-DZ; Mon, 18 Jul 2022 21:51:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYeS-001j0a-6p
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 21:51:41 +0000
X-UUID: 979d9f230bd4401290656be8d837712a-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f9576d89-2dd6-4afc-8f43-ed92f3d0cd9c,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:d4944e33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 979d9f230bd4401290656be8d837712a-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1407019278; Mon, 18 Jul 2022 14:51:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 04:51:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 19 Jul 2022 04:51:30 +0800
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
Subject: [PATCH 4/4] mt76: mt7921u: remove unnecessary MT76_STATE_SUSPEND
Date: Tue, 19 Jul 2022 04:51:26 +0800
Message-ID: <2938c18e2a14e26de293adcf68cd851ca0a7474a.1658176701.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a1437e413116364ac9f3b777c7922ca0728ddc0d.1658176701.git.sean.wang@kernel.org>
References: <a1437e413116364ac9f3b777c7922ca0728ddc0d.1658176701.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_145140_271876_0A84483E 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Sean Wang <sean.wang@mediatek.com>

remove unnecessary MT76_STATE_SUSPEND manipulation to be consistent
with the mt7921[e, s] driver.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 124d62c0dfa4..a8ea03d4f990 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -313,8 +313,6 @@ static int mt7921u_suspend(struct usb_interface *intf, pm_message_t state)
 	mt76u_stop_rx(&dev->mt76);
 	mt76u_stop_tx(&dev->mt76);
 
-	set_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
-
 	return 0;
 
 failed:
@@ -354,8 +352,6 @@ static int mt7921u_resume(struct usb_interface *intf)
 			goto failed;
 	}
 
-	clear_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
-
 	err = mt76u_resume_rx(&dev->mt76);
 	if (err < 0)
 		goto failed;
-- 
2.25.1


