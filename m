Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F06C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4LCrjhDaL8ypFniNCchNygF9gHvRZ2+FyqZFGJS8hII=; b=HDGDFFMLgig0JMPlS9WqJsPVZK
	C0IS+IazrhXwX0p0k2p89xxbktlufHRBi6UV/Ilh0eFVmYw1O3xVardDaDdEhGsyCjQynY0LI2XCz
	+QU8buTuSGhTrEFk1A6cynqb5yggSnZ6dDGH3xJMJ3Mt+hfNURsqwf+yz08HsMLmBj/YrBmA4iQ/k
	jJx4L+oF5dBtFn4dFrJC0iUmMR6z32I5CvdRpaj/JyW8mfJJUZKbUKOCeDJlihO+sRXN1hQLRIKT9
	NKdM/wGkctI8X3NwLDm5CBZb/9iI0akz0VR51MLx+1lYI+TkcvG7+R/FeudIO+Zw3upNR6pJ+OGU8
	HU0LYPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ECm-0000000BBKQ-0nUJ;
	Fri, 26 Apr 2024 05:33:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ECj-0000000BBJr-34UP
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 05:33:03 +0000
X-UUID: 6f37e852038e11efa8f1cd58ee6c2400-20240425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4LCrjhDaL8ypFniNCchNygF9gHvRZ2+FyqZFGJS8hII=;
	b=N+OcpvxNTgr4xPnEBv2WNf/k+PR2HgQjBSOWovv/pKpmQIPsO9ly6HM0cidZoEsQwLKP/CG53AqO6b3zETm2Em1CeMjcPgrgTMcyQZBJAiuoogeektSgX0SAdiW9hSJYf/5t5eLq80aolrDd6vz9FxrqdoCSgOVKKT4X1kGnktg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:1e7ca2e2-85ab-439b-a607-ead43101420c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:24c55ffb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 6f37e852038e11efa8f1cd58ee6c2400-20240425
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 931783608; Thu, 25 Apr 2024 22:32:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 Apr 2024 22:32:53 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 13:32:53 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix sparse warning for incorrect data type definition
Date: Fri, 26 Apr 2024 13:32:49 +0800
Message-ID: <20240426053249.7034-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_223301_809163_56267D13 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Sparse warn:
drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:263:20: warning: cast to restricted __le32

For the member of 'struct mt76_connac_rssi_notify_event',
replace data type of rssi from 's32' to '__le32'

Fixes: f01224e61c74 ("wifi: mt76: mt7921: cqm rssi low/high event notify")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404251728.k3Q4OQ2V-lkp@intel.com/
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 340942fd6785..6873ce14d299 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1460,7 +1460,7 @@ struct mt76_connac_beacon_loss_event {
 } __packed;
 
 struct mt76_connac_rssi_notify_event {
-	s32 rssi[4];
+	__le32 rssi[4];
 } __packed;
 
 struct mt76_connac_mcu_bss_event {
-- 
2.18.0


