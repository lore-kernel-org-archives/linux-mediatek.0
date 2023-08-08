Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC4C001DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 08:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wurtuNfvllp7E5NLBLiT2rgzUIDAAvhWN0jPuBJRcQQ=; b=xhZE3tOSA1OXxuUhUnNzmqbtGH
	hm/QVqP6TtaYmffNeuMp8XrHtvhh4ME5sfW2leLaicm/lDVjpbck/y0Pswb/OPrVWKyF0fRykZSLi
	XZoAFnwMUA2NDsUkNXCEKYrm95WwCBqQO+9v4V9wAu9VLREyTpO8z0FNKCphfEn/xI4yKYu/Kj5s9
	LutyodNO2rSliaoMT3rul6KRQdaAy8m2YJ3DRMpgEVpFoj/6B4M3NHykPC++z30m6prrQx9AQ+dLf
	nqGUc5N1n6x5TsoYdOIXYxYwGNnMcAu9/Q8mFnCC2zBHTkHTCTXGdz0TxXuhHVfCktHPEWCGQnscq
	u6Vqkh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI6u-0021ea-1C;
	Tue, 08 Aug 2023 08:30:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI6r-0021e0-2U;
	Tue, 08 Aug 2023 08:30:35 +0000
X-UUID: d379ae6435c511ee912e1518a6540028-20230808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wurtuNfvllp7E5NLBLiT2rgzUIDAAvhWN0jPuBJRcQQ=;
	b=aPAUPytw2YNqa1NHOGGsRELxV8FqWqFgQ5/hXC5mtSvC/olgL8UUQ0Q/yn0/unYCpNe+x2jEnWm1ylB34AhBURheKbh4/1PT7hFe0oTEQrXQorthIOD8aJrItGfiu5LPofjMAZirhX7n44naC0sbhQ/oXEJyQNZ1nuBL9lRhH4U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b8a7382e-3828-4e30-8915-6dcb1ed75de0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:40b5f042-d291-4e62-b539-43d7d78362ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: d379ae6435c511ee912e1518a6540028-20230808
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1385285984; Tue, 08 Aug 2023 01:30:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Aug 2023 16:30:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 8 Aug 2023 16:30:24 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>,
	<linux-mm@kvack.org>, <linux-modules@vger.kernel.org>,
	<casper.li@mediatek.com>, <akpm@linux-foundation.org>,
	<linux-arm-kernel@lists.infradead.org>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/8] Add GDB memory helper commands
Date: Tue, 8 Aug 2023 16:30:10 +0800
Message-ID: <20230808083020.22254-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_013033_822120_95515956 
X-CRM114-Status: GOOD (  11.32  )
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

Hi all,

I've created some GDB commands I think useful when I debug
some memory issues and kernel module issue.

For memory issue, we would like to get slabinfo, slabtrace,
page_owner and vmallocinfo to debug the memory issues.

For module issue, we would like to query kernel module name
when we get a module text address and load module
symbol by specific path.

Patch 1-2:
 - Add kernel module related command.
Patch 3-5:
 - Prepares for the memory-related command.
Patch 6-8:
 - Add memory-related commands.

V1->V2:
 - Fix s390 build error with defconfig (Stephen)
 - Use freeptr_t structure for dereference freepointer
   in slab
 - Add CONFIG_STACKDEPOT statement to handle stackdepot
   is disable
 - Add CONFIG_PAGE_OWNER statement to handle page owner
   is disable
 - Rebase to linux-next/next-20230808

Kuan-Ying Lee (8):
  scripts/gdb/symbols: add specific ko module load command
  scripts/gdb/modules: add get module text support
  scripts/gdb/utils: add common type usage
  scripts/gdb/aarch64: add aarch64 page operation helper commands and
    configs
  scripts/gdb/stackdepot: Add stackdepot support
  scripts/gdb/page_owner: add page owner support
  scripts/gdb/slab: Add slab support
  scripts/gdb/vmalloc: add vmallocinfo support

 scripts/gdb/linux/constants.py.in |  52 +++
 scripts/gdb/linux/mm.py           | 582 +++++++++++++++++++-----------
 scripts/gdb/linux/modules.py      |  32 +-
 scripts/gdb/linux/page_owner.py   | 190 ++++++++++
 scripts/gdb/linux/pgtable.py      | 222 ++++++++++++
 scripts/gdb/linux/slab.py         | 326 +++++++++++++++++
 scripts/gdb/linux/stackdepot.py   |  55 +++
 scripts/gdb/linux/symbols.py      |  23 +-
 scripts/gdb/linux/utils.py        |  20 +
 scripts/gdb/linux/vmalloc.py      |  56 +++
 scripts/gdb/vmlinux-gdb.py        |   7 +-
 11 files changed, 1358 insertions(+), 207 deletions(-)
 create mode 100644 scripts/gdb/linux/page_owner.py
 create mode 100644 scripts/gdb/linux/pgtable.py
 create mode 100644 scripts/gdb/linux/slab.py
 create mode 100644 scripts/gdb/linux/stackdepot.py
 create mode 100644 scripts/gdb/linux/vmalloc.py

-- 
2.18.0


