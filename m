Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA3C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7azo2/6Pc2l05YdYlR2d13DFpKuPLRe+Qz8nF2x/92g=; b=0qMRnPZxdNYZ8ofnO2IEpbP47q
	7t0djrB86NrTSd6SiCazQ7BwdfJ4ykeEgkWWBGuC5SLDQLF2E2X28pzxzZm19pL5l2X7DD3MwKl9A
	pbmITdSiWqKGPjpB2lQHCdEuvYZQrpM/e1h0bEOqBkE2la4pRhcU/uWf05JOFiDeWtBgqCgWFw6kC
	eEAn2Blhp6TOalKiekvJ21LmLRKNIfL0n5etQEAW3wCtOe6a2C1izohMh2Wt5b1IQk8F0wva34ESz
	vcwYyfhuaEhwF5ZLEelbm/deAqits7882TelHzTKm3qINcov8GyUVTqgslU7yXALAFVfl745iDUXI
	4F+p74Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYF4-0038bK-2A; Sat, 31 Dec 2022 09:33:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYDv-0037pS-Km
	for linux-mediatek@bombadil.infradead.org; Sat, 31 Dec 2022 09:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7azo2/6Pc2l05YdYlR2d13DFpKuPLRe+Qz8nF2x/92g=; b=OUj3otGvjv/gSw0vpO59WWIkd2
	piVtc5SvY+oo4dYxmkTZnNdApZBtUo36+BU4tcaDYDoRclhYn/fL7eA8Wwk/RS7K09jn4DzmP5t0C
	pspfLwGRhrdHxj26a78hevM6RD7kFzQI5dNddW/3WaEqS/MJ3aG/OGl+Xf1is5EEZuqU6BRnDHJW8
	Y97qq6ltGsaBNxy8OLhPA08sIF5rrk5hlMJqeBCYMu2tyUv0XQw9xzgKALYQXhAqyj72gFpOdr7m4
	hZtRqdPH7gA7wXSDjnM8lL9I/Lp+R238xTvvplIMt7pXUhwTwCThGZQznQ3RcpMVLFSCgQtPaYbcW
	FrGEVwRQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pBYDl-00H8NV-12
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Dec 2022 09:32:09 +0000
X-UUID: 6f07dbf93edf4bc8ac6238f104f317c6-20221231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7azo2/6Pc2l05YdYlR2d13DFpKuPLRe+Qz8nF2x/92g=;
	b=D476IcQMTLrv5hzhgep64TGOfCSWPphSm4/SFQERylG+cUXa8uBBW0upu0rqWhQU7OL6nLD7zfl02LxOWej05MsfBC3qj03BYyu0jjtAaVz52G1im8QTH8ynpFz6dyUCXZiF4Qk1EwXUq0SlFtlYH1KXAUqkgn0bpRSJdAFwIBU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:3fb3ffd6-a8e6-4adf-8d80-7ab849b11c20,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:c0ad4b53-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 6f07dbf93edf4bc8ac6238f104f317c6-20221231
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1213316924; Sat, 31 Dec 2022 02:31:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 31 Dec 2022 17:01:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 31 Dec 2022 17:01:41 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix invalid remain_on_channel duration
Date: Sat, 31 Dec 2022 17:01:10 +0800
Message-ID: <09a2d41d349593e1cf4a542d076c1a49bd135d3e.1672476252.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_093206_068350_6253E6D0 
X-CRM114-Status: UNSURE (   9.86  )
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

round_jiffies_up() may change the duration reported from chip. We should
take the real timeout for current channel privilege.

Fixes: 034ae28b56f1 ("wifi: mt76: mt7921: introduce remain_on_channel support")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 8930b5a4467c..ba344b2e059d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -174,7 +174,7 @@ mt7921_mcu_uni_roc_event(struct mt7921_dev *dev, struct sk_buff *skb)
 	wake_up(&dev->phy.roc_wait);
 	duration = le32_to_cpu(grant->max_interval);
 	mod_timer(&dev->phy.roc_timer,
-		  round_jiffies_up(jiffies + msecs_to_jiffies(duration)));
+		  jiffies + msecs_to_jiffies(duration));
 }
 
 static void
-- 
2.18.0


