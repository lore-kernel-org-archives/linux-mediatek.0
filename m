Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0765DC04A6A
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C00yyw7N4UE3CQr7IQj99NXJeOHNCH/zFRWE/gdHGS8=; b=2Brx0LWQzwvXYGE/zRFCkl5MDe
	QwVBmnmeM7ExmIO7KBK/da9NLpCeQ0qftPae6AHeYNL6lbPaZYzBFjfr8oWnxZgwyDEUkdvOnhy6j
	1OGsME4Qw3uL05oSP8kdasI9PD3aaAIyfIu2z7sToPAleSENX8KMb9EXAu37snuqSnN2tJbQPw9LQ
	HyEJO4Wc/1asGFe3FKc1I1Ww7M0dxG6Pw1t7Ff9sRZqWyLEPYyPNCAfy4C2YKjxwn0JYkthKHDfJ9
	lxuabIbhBGuoaC+1CIWQqaAB+liOM5y50iDc/c8FOdz+hUGPfTA5zF8h7IxyZuEt5orlUc0qNMAeK
	ellAsUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOES1-006xVS-2P;
	Tue, 25 Jul 2023 09:35:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOERy-006xUS-0y;
	Tue, 25 Jul 2023 09:35:28 +0000
X-UUID: 925fffb62ace11ee83ed1395ce914268-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C00yyw7N4UE3CQr7IQj99NXJeOHNCH/zFRWE/gdHGS8=;
	b=FG8WaoZJmjZ0ymIWxlWPaBDqgnjO1quo6vgPCoaMZ4oxt/6e/KyxLLzgAOGyRVnnyKNzu4I6cjrPLsWIO7e46bMm6EoOySSmmZ4Nz0ZD2IzK6Ct/E1vKp2pgeSZj51KAGSHks2gLVm8q+GJg+L+de0vr5nkxRhbvN0dS+EPSfYk=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:a9af9f01-3831-42f6-9935-d0b1ec1832de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.29,REQID:a9af9f01-3831-42f6-9935-d0b1ec1832de,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:e7562a7,CLOUDID:fa186e42-d291-4e62-b539-43d7d78362ba,B
	ulkID:230725173521PY17USMJ,BulkQuantity:1,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM,TF_CID_SPAM_ASC
X-UUID: 925fffb62ace11ee83ed1395ce914268-20230725
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1009685775; Tue, 25 Jul 2023 02:35:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 17:35:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 17:35:17 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>,
	<linux-mm@kvack.org>, <linux-modules@vger.kernel.org>,
	<casper.li@mediatek.com>, <akpm@linux-foundation.org>,
	<linux-arm-kernel@lists.infradead.org>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/8] Add GDB memory helper commands
Date: Tue, 25 Jul 2023 17:34:50 +0800
Message-ID: <20230725093458.30064-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_023526_344682_DC5CBA83 
X-CRM114-Status: GOOD (  11.06  )
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

This patchset is based on v6.5-rc3.

Patch 1-2:
 - Add kernel module releated command.
Patch 3-5:
 - Prepares for the memory-releated command.
Patch 6-8:
 - Add memory-related commands.

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

 scripts/gdb/linux/constants.py.in |  59 +++
 scripts/gdb/linux/mm.py           | 579 +++++++++++++++++++-----------
 scripts/gdb/linux/modules.py      |  32 +-
 scripts/gdb/linux/page_owner.py   | 189 ++++++++++
 scripts/gdb/linux/pgtable.py      | 222 ++++++++++++
 scripts/gdb/linux/slab.py         | 322 +++++++++++++++++
 scripts/gdb/linux/stackdepot.py   |  54 +++
 scripts/gdb/linux/symbols.py      |  23 +-
 scripts/gdb/linux/utils.py        |  20 ++
 scripts/gdb/linux/vmalloc.py      |  56 +++
 scripts/gdb/vmlinux-gdb.py        |   7 +-
 11 files changed, 1356 insertions(+), 207 deletions(-)
 create mode 100644 scripts/gdb/linux/page_owner.py
 create mode 100644 scripts/gdb/linux/pgtable.py
 create mode 100644 scripts/gdb/linux/slab.py
 create mode 100644 scripts/gdb/linux/stackdepot.py
 create mode 100644 scripts/gdb/linux/vmalloc.py

-- 
2.18.0


