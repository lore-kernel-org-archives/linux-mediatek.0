Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6EFC04A94
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yIA+2vIzbKX+LVlxn9e4QPp6knbsnBKT0RZyRYqmwg0=; b=pNYkZxc044ckehQSQFmgS83MbN
	02GyYJ2OYbG3Ydle0LZ/SUqwtVwvr7vDOjDvcOqmWRw8o6eRVZATjbEjHOcUv+PZnWHJwbohAXYHH
	FV+Yy3Ij54d+/bSilzlOYZi4gArTVe3NzTNvlx7k1KPh1oGoiSa944Q3hWH6FwcYfD3H8BbDnpToH
	VfgFKy7Qzxq9A9xY3/NBHMn+jFsrJkCBi92OU8Eg7Bvek+w70YkzpNvRvXmhZCe38pz0875iwDq7F
	1zpW/EBGYHluV2UYqVFipZoA1K6inDJpO18hDro7MKTLfAzsyMFl/NxEEvd8lTE+KQQJzgTTZsWlS
	Mwq+SMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRr-002bdl-0t;
	Tue, 01 Aug 2023 14:34:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bY3-2Z
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Aug 2023 14:34:04 +0000
X-UUID: 705a376a307811ee83ed1395ce914268-20230801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yIA+2vIzbKX+LVlxn9e4QPp6knbsnBKT0RZyRYqmwg0=;
	b=Y7MWv9oonDm4DiwaW7wwCJVdkIGk7F/+CumNv+FK+zk0Dr8xDStqFCcdcIFjdA4Z+V8ZiSjBZ/Nn2PHTkJlKi8fTyoUmX/QZwS0BliPGCwHkR1nsA/Tqvrft9IqDNsh/vf13tDIJdryn6e0WpxoWAM5FHb1J/eeWfNpFmak6sWk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:22ce9dce-773a-4667-a7b2-ce2852778d05,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:22ce9dce-773a-4667-a7b2-ce2852778d05,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b26fb242-d291-4e62-b539-43d7d78362ba,B
	ulkID:230801223355G2QWLQOE,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 705a376a307811ee83ed1395ce914268-20230801
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 77941192; Tue, 01 Aug 2023 07:33:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Aug 2023 22:33:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 1 Aug 2023 22:33:51 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 0/8] wifi: mt76: mt792x: add mt7925 support
Date: Tue, 1 Aug 2023 22:30:24 +0800
Message-ID: <cover.1690863143.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_073401_902631_C0704D03 
X-CRM114-Status: UNSURE (   8.90  )
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

This patch set adds more functionalities for mt7925 to reuse common layer,
connac and mt792x. This is a preliminary patch to add mt7925 chipset support.

Deren Wu (8):
  wifi: mt76: connac: introduce helper for mt7925 chipset
  wifi: mt76: mt792x: support mt7925 chip init
  wifi: mt76: connac: export functions for mt7925
  wifi: mt76: connac: add eht support for phy mode config
  wifi: mt76: connac: add eht support for tx power
  wifi: mt76: connac: add data field in struct tlv
  wifi: mt76: connac: add more unified command IDs
  wifi: mt76: connac: add more unified event IDs

 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  6 ++
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |  4 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 60 +++++++++++++------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 33 +++++++++-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  6 ++
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 49 ++++++++++-----
 7 files changed, 123 insertions(+), 36 deletions(-)

-- 
2.18.0


