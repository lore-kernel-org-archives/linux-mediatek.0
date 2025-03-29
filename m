Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9AAC36013
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Mar 2025 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AKOfDWOa6YPYRz1gzTUCF1QBJ75c/q7qL+CFu7q0BYc=; b=PtB2f3RMcvuB0S2+/qkVTtOmRr
	8XjRb+UG51Xy6ywvxeo4QXW1q3jl9XcHBVGPzBWcAQqI0TLmtOUXYxWiKvdIVJVVlcs2bO1CzuIu/
	FOLkZXoQrMf4aOmneVf6XxzQqmk3yr+3LtNef1nPm5ihewpUjzhB87xKHcrWMzRjS8HKVsxoWtz4F
	7cyv4NTaRiD0A9WwvvIzcauJMq09fyHJ1FMVlGf5gpZk+oi1ft47fW5ERCqNXPQd0CMvZGhbnFdwb
	20E3cBUJ2PUDXvK5Au2assuO4+Ax4NyMHrwVQ8Dza+mPpxO05MJOKMrn1Cevp8E0Af2DO2NrWrdtB
	5Vy0ER4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyYPV-0000000FHhP-3kow;
	Sat, 29 Mar 2025 15:47:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyYPS-0000000FHdQ-1ZY9
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Mar 2025 15:47:47 +0000
X-UUID: 24e2c16a0cb511f0a1e849db4cc18d44-20250329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AKOfDWOa6YPYRz1gzTUCF1QBJ75c/q7qL+CFu7q0BYc=;
	b=MDAuvGstBXhl6ygPpMWQs+kCUCzPT7cItYQGNwAN4NopGXQrfCnPGS3XX/LeSltaqSEz+oyN+5nlZ5DrJRzUWBKj2vklcDos78W5DFEknQCkPyszE0gepoBIv+NLDl4efEGcrpKCjzMFb2anr2xbEWHwiP0sW0c/ZpPG7enbLfQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2677ca9c-9517-4d1b-a0b6-7da6e59929c0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:e3f9b64a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 24e2c16a0cb511f0a1e849db4cc18d44-20250329
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1544685211; Sat, 29 Mar 2025 08:47:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 29 Mar 2025 23:47:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 29 Mar 2025 23:47:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v2 00/10] Add MT7990 support
Date: Sat, 29 Mar 2025 23:47:20 +0800
Message-ID: <20250329154731.2113551-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_084746_413054_3D511CAE 
X-CRM114-Status: UNSURE (   9.82  )
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

v2:
 - remove accidentally added tag in 03/10
 - fix variable used uninitialized in 06/10
 - add target tree name

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


