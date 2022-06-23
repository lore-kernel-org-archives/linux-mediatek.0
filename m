Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 11:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M8LL77i9MZsurzgzQThFuy+5XB29uwaI4W8sktp79pQ=; b=LUfxPZABM1p11GQAuT2y/FRDYV
	9SwpOvMPipkGY3torR6jEcn4YtVM+Dp/gEAHQOTqu14IffmwcQyXVNdVUr59K9qfYEJmQsUa1skV+
	ZU9qhtDv4Z++v0X0zHYZ3QPjHwJ7uG5Ot4pESd7TebFI/Hp9lNqotkuBZfexAZR5G34qAzrKFgd/w
	4LS/8EcK4h4RKmIYRUzrgMIavHA0B9Drr0xuBvlj9NV8mAR6LYVsfdlGpzcj5SP44nYzkl6ePqw14
	yfUMiprZ62fsp9hG0G0RgmilWwODU5sKJHX4Jc0tFcGwtA9/X7xVzqxawoELYHKvE8AOYuoiMPPkQ
	2GoMBUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kvv-00EhV7-2D; Thu, 23 Jun 2022 11:23:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kvb-00EhQX-QT; Thu, 23 Jun 2022 11:23:17 +0000
X-UUID: 8831f563c09c4c24b18db42be69a3bb1-20220623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:689809e1-7a19-4147-a510-c3779710f688,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:4f5d4938-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8831f563c09c4c24b18db42be69a3bb1-20220623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1540349857; Thu, 23 Jun 2022 04:23:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 04:19:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 23 Jun 2022 19:19:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 23 Jun 2022 19:19:51 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Yee Lee <yee.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] mm: kfence: remove kfence_pool from leak trace
Date: Thu, 23 Jun 2022 19:19:34 +0800
Message-ID: <20220623111937.6491-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042315_910033_71E77109 
X-CRM114-Status: UNSURE (   7.37  )
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

From: Yee Lee <yee.lee@mediatek.com>

Since the latest patches of kmemleak separated its address management 
to two, phys and virt, rb-trees, the kmemleak_free failed to free kfence_pool
in the virt tree. It caused unexpected scan the blocks and triggered
kfence faults.

Reference: 
https://lore.kernel.org/linux-mm/20220611035551.1823303-1-patrick.wang.shcn@gmail.com/

 ==================================================================
 BUG: KFENCE: invalid read in scan_block+0x13c/0x838

 Invalid read at 0x000000003dc26873:
  scan_block+0x13c/0x838
  scan_gray_list+0x1f0/0x478
  kmemleak_scan+0x63c/0xd64
  kmemleak_write+0x618/0x8cc
  full_proxy_write+0x70/0x138
  vfs_write+0x108/0x314
  ksys_write+0x7c/0x14c
  __arm64_sys_write+0x20/0x30
  el0_svc_common+0xa8/0x144
  do_el0_svc+0x30/0xd4
  el0_svc+0x38/0x15c
  el0t_64_sync_handler+0x88/0xf8
  el0t_64_sync+0x1a0/0x1a4

 CPU: 0 PID: 128 Comm: sh Not tainted 5.18.0-mainline-40996-g7d83a175ff4a-dirty #1
 Hardware name: linux,dummy-virt (DT)
 ==================================================================
 
This patch change to call the memblock alloc with the flag to skip leak tracking.
And the latter kmemleak_free can be removed too.


Yee Lee (1):
  mm: kfence: skip kmemleak alloc in kfence_pool

 mm/kfence/core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.18.0


