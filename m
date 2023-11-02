Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8928C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 10:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUHvHA+lLkppag52Gm1YO2SD7hGLuTdX9M42G1Nd1Mw=; b=OBJY2O9yVrKt7ZdL//E0nI2PF0
	hxvehS0PmyToGz39jubIyH37aDRxBzp1VYlIuOdDM9AHhMGsNooiIC5Ueb5r0XamM5o2apRldhi3B
	5IMNATFQ7wXz+yEUY9wPopk3lhx/tMBX7aMMEBnatOWBeFrEF9hO3fUWcxwzkKreqowokH2J9uvtA
	vgtuB8FHh2wEek2nfdnNFHksGcMV73mGvG+qx7UMk2R3f4SrHffKwFPEosC6G6pSuQWsKU4Fc5HBJ
	87irWs8JyktG4CZHrvdL+ZaTtq4Nuyh64aFumttoBlxBTkrfl6i9e9D747KF49smAyuNDOkSZcbxF
	5JP9dqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYc-0095Nm-00;
	Thu, 02 Nov 2023 10:04:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYX-0095MT-1G
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 10:04:09 +0000
X-UUID: 235a1c7c796711ee86758d4a7c00f3a0-20231102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IUHvHA+lLkppag52Gm1YO2SD7hGLuTdX9M42G1Nd1Mw=;
	b=oTGsPh+KNtz9iDbfKr2c9WFJK2bvGUhbqvnkRBuMwOpDvgQB1yfNRMDoqTwR4+9kY8j3oyV5s+JrHJkt3k6GIFZ7KVaO/pazL4hOYygR+eg3NirEqgv0pjIx/yWtf+ScjZq2pHxYppIVWNsIYzYmlULgkfW1r9mNDarmUeZ+GYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:263caea0-431a-4d3a-ab7e-02abdc8c51cf,IP:0,U
	RL:0,TC:0,Content:30,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:364b77b,CLOUDID:6458ef94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 235a1c7c796711ee86758d4a7c00f3a0-20231102
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 382545316; Thu, 02 Nov 2023 03:03:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 Nov 2023 18:03:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 Nov 2023 18:03:54 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/8] wifi: mt76: mt7996: fix alignment of sta info event
Date: Thu, 2 Nov 2023 18:02:59 +0800
Message-ID: <20231102100302.22160-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231102100302.22160-1-shayne.chen@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.412900-8.000000
X-TMASE-MatchedRID: VznsoVq3PH/PvAv72Y9dJeEbUg4xvs+wXru95hSuhjQFi3R9x/2qQgvQ
	UzpmNOPwG/X4wLQAwF/bCHv011Gy9YOI2R+9sePenIGynr5ObIZ9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8prJP8FBOIaKgG/fZK4o9WvFkqCLmLFIszRIz8SDcJnZHLwa3pLqr6IMo
	/g+Cw+KdPi211yvTylbAFleKqg/vpk8jF6ugepg+4NO4LS+npzhrzWpOQ1oLJ0BNB20+SxH7f8m
	JY57oZddJaBDYald1lvF9+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.412900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0648BE048D7B76D0CB2A8C3B86B2FE5C65FD4217677FEC18EE082FAA7D56E3C72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_030405_436026_64DB3D1A 
X-CRM114-Status: GOOD (  10.35  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Fix the alignment of struct mt7996_mcu_all_sta_info_event.

Fixes: adde3eed4a75 ("wifi: mt76: mt7996: Add mcu commands for getting sta tx statistic")
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 328edc354165..e23cc96c4dbc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -203,7 +203,7 @@ struct mt7996_mcu_all_sta_info_event {
 	u8 more;
 	u8 rsv2;
 	__le16 sta_num;
-	u8 rsv3[2];
+	u8 rsv3[4];
 
 	union {
 		struct all_sta_trx_rate rate[0];
-- 
2.39.2


