Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168FCC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 23:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awf52PWX99zWl1Jsz6Lnfb2a9qCJ9lvQu6X8wsILhmQ=; b=hZnCWKIaXY0zTJidtPZAX5tEdK
	PUuwakztagWsoqmiXiJnY97gkRIAvFKxheDQX5OLGORrdyw0rWUIARrGN/IK2ni7e+AZ74aWTAXbp
	keGrJwY3e/qNGKS3uH9yJuj8236tj8n8CfJiGzMoPs1dJhxCsDq45XVNf00P9bH6gLLdH3OReSZ3v
	eXHqv5g1msap2hss5foZgrpUem0JlWPOuJb6TN8sEvphUKNPMJs/oXJNjAjN++Wxj6ikKlFWt4JN6
	uBgoTROnf66vjGIMokazc1szIhcUSzLVJ0Xkj3Hf6ZqUFuIhQ82+goCb8JbQdtMg7Wj6Ud7WNSz3o
	ajQwM/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIly-00CwWN-Ab; Wed, 20 Jul 2022 23:06:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIlu-00CwU7-Nl
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 23:06:29 +0000
X-UUID: 01ce1a0215b84834bed09a3382a36952-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:514c8d85-4d2c-4f7a-a3ac-50145415b70a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:53c4d464-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 01ce1a0215b84834bed09a3382a36952-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1019773399; Wed, 20 Jul 2022 16:06:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 21 Jul 2022 06:25:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 21 Jul 2022 06:25:42 +0800
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
Subject: [PATCH v2 4/4] mt76: mt7921u: remove unnecessary MT76_STATE_SUSPEND
Date: Thu, 21 Jul 2022 06:25:40 +0800
Message-ID: <e09496b4600b00254485ce684c881729b8909e1f.1658355599.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5f835553ee8b76e4a4ed83f9562eaa0b1a24c1e6.1658355599.git.sean.wang@kernel.org>
References: <5f835553ee8b76e4a4ed83f9562eaa0b1a24c1e6.1658355599.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_160626_832799_8DDD29DD 
X-CRM114-Status: UNSURE (   8.98  )
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

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: add the Acked tag from Lorenzo
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 613d5cefffc7..54d11bfb45e2 100644
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


