Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0090C77B75
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 May 2023 05:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pu8LKqsig3D4xWskONiRV4lN2sw9wjTq20UJ5LvIF0Q=; b=Hp39O29DsmQAhcwtsKiDw9eZEq
	oI6Ph0CznHG/lwQQ3nAkeiESTKH60X0or0qxCc8FXyJ6Z8AEadkqXtOZo/65WuUve9DPXtGdrwEfA
	SmueB7ohS9O0gf/djkMWCibJe4sTKtbmpRauAZXfIWVEjyHCWxHd/+lY3EZoGdGLCA43p4NgBbmqv
	RVEb80GEJQfo7JjfYlPiYQNDL9Wt2NCsaZdoDpM2bNt+PWrBaXyfYNM6wrnZYK7gINPeCPqJcPftt
	kIwJpnZpdzRP/6hmSPaZkrzGJSPGvEyX3U3kBPWbZ2wePOjnHQ0dfwsqTkxAlqxB06hP36+SlL4bP
	VZSvQGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvAuI-00CceQ-2T;
	Sat, 06 May 2023 05:56:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvAuF-00Ccdf-00
	for linux-mediatek@lists.infradead.org;
	Sat, 06 May 2023 05:56:32 +0000
X-UUID: bb719206ebd211ed912e1518a6540028-20230505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pu8LKqsig3D4xWskONiRV4lN2sw9wjTq20UJ5LvIF0Q=;
	b=WNnDqcZq5DNGvIdgEuqXTtJaP2xGn+yTNHoqxL4gU9vG+/tbWDwwSSZwHuaRq1n7+1DKcs9abq+WwlN7EWo8ZKP78aMQQcE0daE4mbfqY6UwJesNTsry/oUO2mVsCA969gDiZs1N6XlZqf6aQhs/eaIG5BTHBA+VD3XEuUDjwYw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:9b345631-86aa-4fd5-a081-c74a8e8be625,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:697ab71,CLOUDID:e86bea30-6935-4eab-a959-f84f8da15543,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: bb719206ebd211ed912e1518a6540028-20230505
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1717812171; Fri, 05 May 2023 22:56:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sat, 6 May 2023 13:46:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sat, 6 May 2023 13:46:21 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Himanshu Goyal <himanshu.goyal@mediatek.com>
Subject: [PATCH] wifi: mt76: enable UNII-4 channel 177 support
Date: Sat, 6 May 2023 13:46:19 +0800
Message-ID: <93627d88b400b8b4bfd667583904912cc303909f.1683328995.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_225631_043015_77D41DD3 
X-CRM114-Status: UNSURE (   7.38  )
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

Enable support for the 5GHz channel 177 with center frequency 5885MHz and
operating class 125 based on IEEE Std 802.11ax-2021 Table E-4.

Signed-off-by: Himanshu Goyal <himanshu.goyal@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 467afef98ba2..cd3aac4cc06f 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -76,6 +76,7 @@ static const struct ieee80211_channel mt76_channels_5ghz[] = {
 	CHAN5G(165, 5825),
 	CHAN5G(169, 5845),
 	CHAN5G(173, 5865),
+	CHAN5G(177, 5885),
 };
 
 static const struct ieee80211_channel mt76_channels_6ghz[] = {
-- 
2.18.0


