Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFCCC36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m9EjBbOxyoiI2wKi1uLjAzEdktlVYSr76yh0tHokIek=; b=f23O3Nb0tp8wCgseTjX1JI2Rxq
	iobNm2nmq2VlBFKdrvspwYI0NjkD0BRbNIgqB4RcyL2TrYNUekFDJvCGldQR1XNZiRAWVV+M2udk0
	KNXSU1YbJ8pmba8IA1dblACagcfmmowHpZ6GrgR0Cnsv7nu+PaKjiM39il3oOW9XXO4fba9qXh5JM
	Q9GHcXSDSDrnu/BRAoRB3wFFUHtZXF0zfC4aXapGeg15HsOnDFjGmkKbsXqA8VQsbeSCqbF+PuPNJ
	ywHqTTF9BNHYTiJ6VfVgSdyxeoUB80g5bXEUpArbW2oydyMM83gb9V3q5TjVK8pr7otWQQ/Ex8HNc
	cnOB/drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WgQ-00000007WC4-30pZ;
	Wed, 09 Apr 2025 14:45:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W6d-00000007Oev-3Lcm
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 14:08:45 +0000
X-UUID: 22417376154c11f083f2a1c9db70dae0-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m9EjBbOxyoiI2wKi1uLjAzEdktlVYSr76yh0tHokIek=;
	b=qkHFp3xJ/HCQSxqLYnN6/GB2Th0Fb061lm3QJf2HkJyC8MQSMCySf++gouk6b2SrAYKhvH/2NwK+wSkOYXlXtLGP75NNSnVdRglcECtw+0jn1S9tTlxIXDTRVfag+Rc85aoxa05uZwZE4/b6PyEmfEdJmKNijDgMFzWSI1y2RRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2072090f-1172-4100-bde5-818e0b6a580a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f857e0a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 22417376154c11f083f2a1c9db70dae0-20250409
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1345608093; Wed, 09 Apr 2025 07:08:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 22:08:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 22:08:36 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v3 00/10] Add MT7990 support
Date: Wed, 9 Apr 2025 22:07:40 +0800
Message-ID: <20250409140750.724437-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070843_843228_02E94D7D 
X-CRM114-Status: UNSURE (   9.75  )
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

v3:
 - no need to wait response for SDO command (03/10)
 - modify indentation of switch case bracket (09/10)

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


