Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01726C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 00:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPlojUoTV6eO5+XQEy/h8OUvuvUoALvHcaSlna0fkI0=; b=47iF6zvhimqUOJKGfvM4OQ5G4s
	1tuP/U8JWa2xbm3VOKcL8aOTK34fevmJA+6YTukjITEm3US0Brn+m97v12o34LjEFZ8X2Pe76IjES
	ICdDcXgcy7aw4Itm2ig0YXaC1cvLAqPuAFHDHTehxCxu1pb80vef5ijvfOaU0shggu0lUHeQ+cP6G
	pVC+NgBt6Rq9kY0EnQuklmekuJm9rRxf58QsPhVP8DQ7htnFFzW4BTUy/GbeSK7favs5Fsm4nh3HS
	Ao25vajQmBoBiAKDF8qgI6LhbOPKEHmXtsGFCbMZMBqr1YALU56jDCsYlg8wcusNbT4EIo5HP+E6x
	VOgb+DgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNk4k-007lNi-Bx; Tue, 16 Aug 2022 00:04:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNk4d-007lED-FF
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 00:04:51 +0000
X-UUID: 7f1634e5ab704cc8ba36985a3f5d1626-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iPlojUoTV6eO5+XQEy/h8OUvuvUoALvHcaSlna0fkI0=;
	b=hdD90ltrCgmxB5kqpElENaD7gKOY4cpWLYDQv2LBRXvl7daN2gRzG5+0Ak/+h3pHAdeUXpFtK32d22EzxxhYe7TI9uaZH+hb5djO/DTyZMfae1WbwosN4L3+jqi0ukkZfVVW1XEHR+ZegYtTDb0zYg8d3dQBHgIkvXcvzrL/pVg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:b23863eb-79b6-4032-860e-eb798d3ebdaf,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:5
X-CID-META: VersionHash:3d8acc9,CLOUDID:b07fe4ae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7f1634e5ab704cc8ba36985a3f5d1626-20220815
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 959144356; Mon, 15 Aug 2022 17:04:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 08:04:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 08:04:20 +0800
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
Subject: [PATCH 7/9] wifi: mt76: connac: accept hw scan request at a time
Date: Tue, 16 Aug 2022 08:03:45 +0800
Message-ID: <51d7ac3d29f5a6817265ba4c3bfd0d013dbc35ed.1660606893.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1660606893.git.objelf@gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_170447_604764_DD35F0A2 
X-CRM114-Status: UNSURE (   9.64  )
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

The current hw scan cannot accept multiple hw scan requests at a time, we
return the proper error code when the hw scan is still undergoing.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index c2ed5e755893..0ade122de632 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1536,6 +1536,9 @@ int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	struct mt76_connac_hw_scan_req *req;
 	struct sk_buff *skb;
 
+	if (test_bit(MT76_HW_SCANNING, &phy->state))
+		return -EBUSY;
+
 	skb = mt76_mcu_msg_alloc(mdev, NULL, sizeof(*req));
 	if (!skb)
 		return -ENOMEM;
-- 
2.25.1


