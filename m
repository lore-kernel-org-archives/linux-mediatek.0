Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB57AC021BB
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XYp6nqL/SIf1dkq4IbZ5jeSHZcsYeSObKvTPW+JE3bg=; b=g3LMIyrO4UWzvgjtuXFBvCPkHr
	UAUaaFPHeInTu4pCvkz/ajktaTRRuTXVpFniyxQwM30CCAPeDt7mXSJ8nW5NMfAwRkg77UTJnrVY4
	RCt8vMAsKUNNMlLS9XNTfaaAixUN2Ezr40T67vQnBTHg9l4DNl/W4NDIgbxlUwgslPNDSWklXrTwb
	LDX0K5gAQbW+r1HeHma52IkdILZboLzptioaYZB42asdChoTyVmH0hdbdZxNEJUYdlB265/YOa134
	LpzQ0yS18YH83EvKfiGP+bXVU85sMaJJ86cN341ROe981EstFESebk34GmuqN1lJ1W808S0zZyTUF
	sElUXgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYIN-0000000Dp9g-3JHu;
	Mon, 24 Feb 2025 13:14:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmY9M-0000000Dm1G-1Eas
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 13:05:33 +0000
X-UUID: 04a22068f2b011ef83f2a1c9db70dae0-20250224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XYp6nqL/SIf1dkq4IbZ5jeSHZcsYeSObKvTPW+JE3bg=;
	b=eWt5ocmZnWWfB2zK+oQWqlVwZ71Je1FEDuHrt+XWyR3QADcf2YetGoZFn4YjqlQbj6Aq+rQDrEutyEedx9zKsMZYjfoz+koRyG+uqcscePG5e3ZWnKAMM/4DRMg6hkvOMjhRymoUGQpfMjm0wWz+wIzFs5chjWjw5KWFFuo6CsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1da77162-67a4-4fbf-bc4e-49448374baea,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:c0a83029-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 04a22068f2b011ef83f2a1c9db70dae0-20250224
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <quan.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1487366621; Mon, 24 Feb 2025 06:05:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 24 Feb 2025 21:05:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 24 Feb 2025 21:05:24 +0800
From: Quan Zhou <quan.zhou@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Shengxi Xu
	<shengxi.xu@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Quan Zhou <quan.zhou@mediatek.com>
Subject: [patch] wifi: mt76: mt7925: Simplify HIF suspend handling to avoid suspend fail
Date: Mon, 24 Feb 2025 21:05:14 +0800
Message-ID: <34208c7280325f57a651363d339399eb1744d3b7.1740400998.git.quan.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_050532_432577_D42E6C93 
X-CRM114-Status: UNSURE (   9.83  )
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

System suspend failures may occur due to inappropriate
handling of traffic not idle event by the WiFi driver.
The WiFi firmware's traffic not idle indication does
not need to be tied to suspend. Fix the flow to ensuring
the system can suspend properly.

Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 04762a8eac51..740e5c62929a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -348,14 +348,10 @@ mt7925_mcu_handle_hif_ctrl_basic(struct mt792x_dev *dev, struct tlv *tlv)
 	basic = (struct mt7925_mcu_hif_ctrl_basic_tlv *)tlv;
 
 	if (basic->hifsuspend) {
-		if (basic->hif_tx_traffic_status == HIF_TRAFFIC_IDLE &&
-		    basic->hif_rx_traffic_status == HIF_TRAFFIC_IDLE)
-			/* success */
-			dev->hif_idle = true;
-		else
-			/* busy */
-			/* invalid */
-			dev->hif_idle = false;
+		dev->hif_idle = true;
+		if (!(basic->hif_tx_traffic_status == HIF_TRAFFIC_IDLE &&
+		      basic->hif_rx_traffic_status == HIF_TRAFFIC_IDLE))
+			dev_info(dev->mt76.dev, "Hif traffic not idle.\n");
 	} else {
 		dev->hif_resumed = true;
 	}
-- 
2.46.0


