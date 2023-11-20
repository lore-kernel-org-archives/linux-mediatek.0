Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9E2C072A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 03:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BsSCm70mq5AoV9r7Z1lc9GCE2m40BM4QlABLaPUH+30=; b=G9kuVPgGnBYwuyPQFlzk5ff91B
	TqrepXvBue2TLHmWik3g+c9aQMVaEiTfHMFTlE3hvpkkFDaG4tnlGu1/0aNAWN2kZqjdl29V99JZl
	4l7KFb+WdrZN99zUrHan0ckfgfVo/btx2/K+lc8g3d/fXX6QP/X8ZLDlVkFu/E/Ntrdaxm0aO5PJ3
	FiqOW5klVw0ikUbaZX+lHGc6W4ipIu1qr7vsC/fp+66+EzxekEBwbjsawFC+J0/X9gV8hsOjhO63E
	CqXQJbVNAQKfWpdjES08nmdlxvPdR+xzVGGlUZgIYhaf0vCGJzRmD2i6tLeMq5NIewodrxfddQp1S
	LOz8Bz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uyK-00B1y8-1D;
	Mon, 20 Nov 2023 03:29:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uyE-00B1vW-0N
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 03:29:11 +0000
X-UUID: f525c68e875411ee86758d4a7c00f3a0-20231119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BsSCm70mq5AoV9r7Z1lc9GCE2m40BM4QlABLaPUH+30=;
	b=KK7XoF8M/a7yd/quMDSoIRMRklJhE/2d695bKn6eEVQomNg00lvt3vM3n4+r3wm6PBbvSweQxK+raLqARWZzu56LdCrSxKHL0U2rJyo2OEJmDNcYMhDbKR1A54vw5j+JSrjKHsG7He+sUltqvWbEj3EwbgyJjrWpw0Od6342yMk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:eef54064-cab8-40c6-8762-700c077c74fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e970d672-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f525c68e875411ee86758d4a7c00f3a0-20231119
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 251311949; Sun, 19 Nov 2023 20:29:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 11:28:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 11:28:27 +0800
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
Date: Mon, 20 Nov 2023 11:27:47 +0800
Message-ID: <20231120032750.19747-1-mingyen.hsieh@mediatek.com>
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
X-TM-SNTS-SMTP: 99405E5CF4B5ABF5C42E3E4112769B75C71BB9D2B69B452F404FC8A5F3A31E4B2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_192910_176524_2754DF47 
X-CRM114-Status: UNSURE (   5.04  )
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


