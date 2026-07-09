Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83385C44503
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=miRr2Vh2qV0uzgDRTJNRMD3Yv5mTPwM32SzzMgMj50I=; b=1a799uOQ3efuq/tPl/XpDkrK+G
	muwECoHVf61vG7FwcKx0xV49eA9KA66pgey4AKGQhtpvtKqXs9NJ4GoyIH/ZUxfDtE/qYFt/21McN
	Hw8/d/WTQz/gQJWTuun4SqL71O2ftf9QIhqxZTIzlF5k/NIY4qv7b5kL/vTvThIXkyQ1GEvwB4tzl
	wW64Lcxg1LyO/hSNvnUgBlmdOFyUQhcKKAYauUEbojE3sV1b1NIgrjxUVT0lcmoIINAMTpvTmkZPB
	6L7otYqHqgJS4ffm6dGCXpMMVHEZ7pkRVrkAv4EpfQuSjFF5QxSMnRs8YuhtVysj2jmkTiMH+eHDC
	qju8ot4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjcR-00000001Mjd-0vGi;
	Thu, 09 Jul 2026 07:56:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjcN-00000001Mgd-0qxn
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 07:56:25 +0000
X-UUID: a94959e87b6b11f1acbe4559397dec65-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=miRr2Vh2qV0uzgDRTJNRMD3Yv5mTPwM32SzzMgMj50I=;
	b=stHWIHxDZ6hmqVUNy2JgwS0egw2Wu2wPX9XUp7CnfxLC2eE/q4rimHLvvhD+cDALPI2WPfeJ8uaM5LfcmpYQWrX4DZjOj9FtGdufQJynR9EshJMTaBUunESsJ7jxOseSVMVx4c43iiCpzjxso4bQwVTdpUbna/sYTdwGMUBLK38=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:6b8675a7-e6f8-4151-b43a-f86096ebcb63,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:653eee14-ea64-44d4-98db-4e1fb89955a3,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a94959e87b6b11f1acbe4559397dec65-20260709
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1575973859; Thu, 09 Jul 2026 00:56:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 15:56:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 15:56:13 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Yf.Luo@mediatek.com>, <kun.wu@mediatek.com>, <deren.wu@mediatek.com>,
	<sean.wang@mediatek.com>, <quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>,
	<leon.yen@mediatek.com>, <litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, Eason Lai <Eason.Lai@mediatek.com>
Subject: [PATCH 0/3] Fix TX performance degradation when IOMMU is enabled
Date: Thu, 9 Jul 2026 15:55:55 +0800
Message-ID: <20260709075558.1654164-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_005623_255692_DBC9B135 
X-CRM114-Status: UNSURE (   7.54  )
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

From: Eason Lai <Eason.Lai@mediatek.com>

This series adds a TX preallocated buffer mechanism to fix the TX
performance degradation observed after enabling IOMMU.

Currently this feature is only enabled on MT8196, where it has been
validated.

Eason Lai (3):
  wifi: mt76: Separate skb and page_pool_buf pointers in mt76_txwi_cache
  wifi: mt76: mt792x: Add TX page pool support for IOMMU-enabled systems
  wifi: mt76: mt792x: Restrict TX page pool to MT8196 platform

 drivers/net/wireless/mediatek/mt76/dma.c      |  55 ++-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  15 +-
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |   6 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   2 +
 .../net/wireless/mediatek/mt76/mt792x_dma.c   | 330 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  10 +-
 drivers/net/wireless/mediatek/mt76/tx.c       |   2 +-
 drivers/net/wireless/mediatek/mt76/wed.c      |   6 +-
 9 files changed, 398 insertions(+), 32 deletions(-)

-- 
2.45.2


