Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DD7E674B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p21M7mko/v90TFPnykxFUlxJZuzWC05tCWN+cJswq1Q=; b=4oBRRAxjXuSiF5RQGZZOXZEe20
	6VE28Z0bji77mIQpoCXG27GJco+tMdRbFAVgPPRJt16XE1mgN4DstdR37aEtV8KsB86j4RspfF4BU
	zKMZSx9j7KYGf59tJ2drsqWdnhIJ1u45HDR4k24fAPK/h6rF48cP3HmMwba6OrCIdIJ3zs7IN4iau
	SRmgeOBe/A40nocgtLm9VUKWJFEmhbMk1RBDp6O8EflLVP6HaaBjgyhR6UahlCdBdKldwzlY2aFtb
	ulJJ1G7EhIgOIGABGWSh6qYOBWwVxcsdkhwRVljZXbNDh7ee7KS55SlOySOdWUnCL4RoAwEF4ZKW7
	GN3oUYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mv3-00000006Flh-1caA;
	Fri, 01 Nov 2024 08:22:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mmA-00000006Dsj-3c8q
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Nov 2024 08:13:00 +0000
X-UUID: 17e0c85a982911ef9048ed6ed365623b-20241101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=p21M7mko/v90TFPnykxFUlxJZuzWC05tCWN+cJswq1Q=;
	b=h0GFmca9jhqQRvV7KAlK7oHjAxkdGwJ4lku7xJ1eA/tr/e4V6r8HQk8Z/wiutdoqEGg0fgXxWb4th+eEipcrpCIYXlQDpLJ8JBNGirItDTFxyoyCDBgDd20Mj+Y0N5Y9/lRv/P6IMKVVFqWYF/ZnBzp12p8WN5JvMRNpJLL/wr0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:1a06ff58-24c6-4f04-9fc2-44606e61f8cc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0fcdc3,CLOUDID:48ac6107-7990-429c-b1a0-768435f03014,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 17e0c85a982911ef9048ed6ed365623b-20241101
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 465993681; Fri, 01 Nov 2024 01:12:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Nov 2024 16:12:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Nov 2024 16:12:50 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: fix get wrong chip cap from incorrect pointer
Date: Fri, 1 Nov 2024 16:12:49 +0800
Message-ID: <20241101081249.27834-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_011258_930835_9CF9D0F9 
X-CRM114-Status: UNSURE (   8.59  )
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

Use tlv instead of skb, because using skb will get invalid data
with wrong offset.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0c2a2337c313..9b6aff463063 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -823,7 +823,7 @@ mt7925_mcu_get_nic_capability(struct mt792x_dev *dev)
 			mt7925_mcu_parse_phy_cap(dev, tlv->data);
 			break;
 		case MT_NIC_CAP_CHIP_CAP:
-			memcpy(&dev->phy.chip_cap, (void *)skb->data, sizeof(u64));
+			memcpy(&dev->phy.chip_cap, (void *)tlv->data, sizeof(u64));
 			break;
 		case MT_NIC_CAP_EML_CAP:
 			mt7925_mcu_parse_eml_cap(dev, tlv->data);
-- 
2.45.2


