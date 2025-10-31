Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147C9CCFA00
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g2bHH6elkTX7dT7zGw2clqTWCwh+eDW53GJJ8jXiJDM=; b=vMLEl5JTicVHOqvOCEpS3ob96o
	8dMKqwTamJ+Akkvi+mDdS6pvA/fjMD8G3WzJwjfa27TeFj9RYl4yul9wuhS5y2jyfu6XiI88vr+lR
	ifdE5/XAR93UwfwMF3bPknwhEtypqt/Qz8OLZEgXHyv6xKlixglSh9n8aEGyzHm7/CObTfRfq/38r
	58GJPCDI2r4EhtekZyFkEGo72ykCoqGw4Jl1wlnwUkPAR62p/A5ji5EEYhn5m9vC5GUzw5AfN8NZV
	I21AmGm5OWwL32RHnYKh2FHCwESSaLowNa1jBSfSVjgQlrBJDw1cHLMAKcYE5ga6G8CNjlO0vQsVH
	c+U4GGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3Q-00000005k2R-1Syy;
	Fri, 31 Oct 2025 09:04:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl3M-00000005jzU-0eJZ
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 09:04:13 +0000
X-UUID: 8eb6f214b63811f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g2bHH6elkTX7dT7zGw2clqTWCwh+eDW53GJJ8jXiJDM=;
	b=R5g3NVIJd5BceXAGW7w8noMOv/hz+f2uqws5vr1mU8pEfriC20pLbKUnIl4bsDAZK23r3Yuw4yQ5sQWH3pT0tP5VG7URsTOfZMmacc/6SPgFkZc6svwWrkXHAyvCBFq+RHtk6A3eiDIGpG3kN79z/3TCVtKweIadAs2IrN3QAKY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9712c5a0-eaba-4636-bf22-894bd736b62b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d7acc518-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8eb6f214b63811f09f706fa2197c6ceb-20251031
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1952414047; Fri, 31 Oct 2025 02:04:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 17:04:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 17:04:05 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 0/6] wifi: mt76: mt7925: update the regulatory domain control
Date: Fri, 31 Oct 2025 17:03:46 +0800
Message-ID: <20251031090352.1400079-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020412_283850_7B0B6B56 
X-CRM114-Status: UNSURE (   7.71  )
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

This patchset introduces a series of improvements to mt7925. The main
goals are to enhance compliance with 802.11d specifications, improve
runtime regd switching, and ensure user-set regulatory domains are
respected.

Ming Yen Hsieh (6):
  wifi: mt76: mt7925: refactor regulatory domain handling to regd.[ch]
  wifi: mt76: mt7925: refactor CLC support check flow
  wifi: mt76: mt7925: refactor regulatory notifier flow
  wifi: mt76: mt7925: improve EHT capability control in regulatory flow
  wifi: mt76: mt7925: add auto regdomain switch support
  wifi: mt76: mt7925: disable auto regd changes after user set

 .../wireless/mediatek/mt76/mt7925/Makefile    |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 148 +---------
 .../net/wireless/mediatek/mt76/mt7925/mac.c   |   5 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  26 +-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  13 +-
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   2 -
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7925/regd.c  | 265 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/regd.h  |  19 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   2 +
 10 files changed, 302 insertions(+), 184 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/regd.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/regd.h

-- 
2.34.1


