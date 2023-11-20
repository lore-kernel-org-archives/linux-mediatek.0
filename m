Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CDBC54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BsSCm70mq5AoV9r7Z1lc9GCE2m40BM4QlABLaPUH+30=; b=2cjjeWqPwHwxnOyvYjr87PWn0d
	PQc/+nDcLFC5G1Gs+OYqB0XNfTq2Oud7JLfG4iyvsXkcpZo453p9YsJ2ScalNros1YpT+N7xI9ewH
	OuM5z2HZ9+AMqHh6viCBCorhJaYEdoFMZPOqOeCUHAR7RmH67dfI/6MWfO9q8HCwOSnimqWAnB/ws
	39DwZlkngDx+7842+I3rOFQt5h7l21xcUDSxlqP9TVEhBl5wsol2+z5SrA0hutxg9X8z5a6errbxc
	SJLPXncd2UDxiZb1WQDbgPd1aOEy8GBdRgy1loZaaIGKsuK6WxCtdhx3e6BbqRhPnCULAHRq52YTv
	EhlElqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r52Cd-00Bs6z-1Q;
	Mon, 20 Nov 2023 11:12:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r52CV-00Bs5M-1m
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 11:12:28 +0000
X-UUID: ab4fa232879511ee86758d4a7c00f3a0-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BsSCm70mq5AoV9r7Z1lc9GCE2m40BM4QlABLaPUH+30=;
	b=n3EhlIYTCS10n3MOdmjyLZAp1oK31SUpMiDTPTNUQ+DYpSR6TQK5lsAdffneDDQCKEdfBow3reBX9UXF3j/bGGWWV6fdYbnJm/QtW0W2gG+jdnUQos6jlYXT3zGl0uAwQo5xjeu3osWA0wWrLe9ShBgQWU8F+99s2ZuTpx3eXWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:bb002a15-e9a4-40e4-8105-220a28557e81,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e88cbcfc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ab4fa232879511ee86758d4a7c00f3a0-20231120
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1191532312; Mon, 20 Nov 2023 04:12:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 19:12:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 19:12:14 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<MingYen.Hsieh@mediatek.com>
Subject: [PATCH 0/3] wifi: mt76: mt7921: series with CLC patches
Date: Mon, 20 Nov 2023 19:12:09 +0800
Message-ID: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.977900-8.000000
X-TMASE-MatchedRID: 4M8Lw78TDBAiTMmg/YMPl/mF8IFnUmgvvtVce6w5+K/kCKFvqJHeycGw
	54FJXlHCglNnMw5K+QHf/Q5fuxsUmuHXfiMoZowZA9lly13c/gFflOpBqBHTt2JkJOQVCIpwXaT
	Eoipb2i/i8zVgXoAltmHJPdY2OmlS0C1sQRfQzEHEQdG7H66TyN+E/XGDLHcMcEwR/lUrI4/IAQ
	yo5EcbTaUygT9zhjsMFBNIqkML13AuAU3sQBBsfa8dqR+7hPzjIoYkU2kqUYAkrkfkoD8DTS/Im
	xChdfO6jofsMjQaxVwyYjbiqIQ3CsykhtyXcigD6rVdgBjDT2oh1j2M6LiVMg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.977900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 08E8DD8199CB859747E7CEFA4FEED6DEC11740009BDF273A8FB543E727143A562000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_031223_738754_C31C5DD5 
X-CRM114-Status: UNSURE (   5.11  )
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

From: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>

Sync internal mt7921 patches for CLC.

---

Ming Yen Hsieh (3):
  wifi: mt76: mt7921: fix country count limitation for CLC
  wifi: mt76: mt7921: fix CLC command timeout when suspend/resume
  wifi: mt76: mt7921: fix wrong 6Ghz power type

 .../net/wireless/mediatek/mt76/mt7921/init.c  | 23 ++++++++---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 38 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 11 ++++--
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  3 ++
 5 files changed, 65 insertions(+), 11 deletions(-)

-- 
2.18.0


