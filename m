Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02F7C28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 05:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7/9qD9xLBxCprsdcm2KyVrAxQtaTMp4jDWc4NveFj4c=; b=nx6x3zvXrZTRPbuj0XhpCTsm1T
	TQWvyUQ+zoniAzFANLcsrF7kDdCGAs0hPtfZLWtOXLMoI3dh40xjluTCxD3YvEesodK0f+cacVWrl
	CKNC2Lnm8eg3Ols+uDp7xLQzDeQsfB4Ic9DaM2PZ39RUIPPOvNqtF/tuDyUp3cE6cMFL20g9NPTOC
	LcEWsMvQOqt7xlyHWADMgM8WwzMNGsmZn+Py8L28WuKNngCrfNi/3RiXu3/KRZ8OysSbXjYK6QjxA
	KfcrKUCbYNamHkCUZVLy/yAmicxJ/cCRDcbQlye7oAQkT5C2W9hfCkh/BCwcP3oWiFDB8lhW891w7
	QECAOCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fR-0000000CgCQ-3rg2;
	Fri, 28 Mar 2025 05:54:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fM-0000000Cg81-1uTB
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 05:54:06 +0000
X-UUID: 0b0d2f720b9911f083f2a1c9db70dae0-20250327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7/9qD9xLBxCprsdcm2KyVrAxQtaTMp4jDWc4NveFj4c=;
	b=JXHl+k08gZO4zi0KnBY3En4bP0znUaM2IMnN2m39w9jbgZe6xBx+iSONpLVxqx2hSaiRwBI0wQhU82HiRfs+daJGYdKkPBkj/G2z6oaqezhdUzlb1yYTVrWdtRemBHJHk6iirAIm9LWOfnIoja1wCsl8LntPCOqLqPurDuKvGN8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0df10100-fc83-4e43-872a-5a4d7f1226f2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1bcae6c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0b0d2f720b9911f083f2a1c9db70dae0-20250327
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 913877327; Thu, 27 Mar 2025 22:53:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 13:53:56 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 13:53:56 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 00/10] Add MT7990 support
Date: Fri, 28 Mar 2025 13:50:48 +0800
Message-ID: <20250328055058.1648755-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_225404_506239_5B2CFD59 
X-CRM114-Status: UNSURE (   8.22  )
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

This series introduces support for the MT7990 PCI Wi-Fi device, a Wi-Fi 7
chipset that supports Dual-Band Dual Concurrent (DBDC) on both 2.4 GHz and
5 GHz bands.

This series is based on:
https://patchwork.kernel.org/project/linux-wireless/patch/20250320015909.3948612-1-StanleyYP.Wang@mediatek.com/

Peter Chiu (4):
  wifi: mt76: mt7996: rework WA mcu command for mt7990
  wifi: mt76: mt7996: rework DMA configuration for mt7990
  wifi: mt76: mt7996: adjust HW capabilities for mt7990
  wifi: mt76: mt7996: add PCI device id for mt7990

Shayne Chen (2):
  wifi: mt76: mt7996: add macros for pci decive id
  wifi: mt76: connac: rework TX descriptor and TX free for mt7990

StanleyYP Wang (4):
  wifi: mt76: connac: add support to load firmware for mt7990
  wifi: mt76: mt7996: rework register mapping for mt7990
  wifi: mt76: mt7996: add eeprom support for mt7990
  wifi: mt76: mt7996: rework background radar check for mt7990

 .../net/wireless/mediatek/mt76/mt76_connac.h  |   7 +-
 .../wireless/mediatek/mt76/mt76_connac3_mac.h |   1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |   3 +-
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   2 +
 .../wireless/mediatek/mt76/mt7996/coredump.c  |   4 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 192 ++++++++++++------
 .../wireless/mediatek/mt76/mt7996/eeprom.c    |  41 +++-
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  18 +-
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |  42 +++-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   |  77 +++++--
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |   6 +
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 192 ++++++++++++++++--
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  50 +++--
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  21 +-
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  51 +++--
 15 files changed, 549 insertions(+), 158 deletions(-)

-- 
2.39.2


