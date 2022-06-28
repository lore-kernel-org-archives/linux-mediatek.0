Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F34CCA47F
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8B2z6IPndmsVzjNP4/LzyYmoTz2wVna9IEAuZjAXSDg=; b=WW5qJE+AnBQey+CPtO9luAmyXg
	KpyGbXlAkglZbJVdOFuDLkJm/LEUdGo8FAl8753F0zQG2kqAyDewtQ9/vS5yMnVgGZhoozqmHCIps
	jythQJdbj+hKAe6wZqIV+gct5D5OK1GKnxTfQqX0wp0vIKFIIcAPOLVu6kwtKrZXdJlHktLG4mqLQ
	Putz/VZndLDWaEci1C/Ha6NRTowEDgGrMAEirfAKOWIiOSuTyRaezVBvRWpXRxKl23Xz0xJTkli73
	+2XJ03KQeA2DJbWteE5B255v1slCSDO/47OamynrBuvMTPe58fFZJ7Cd8MwRL6y5XmINAtuROkBBk
	ZMXsPDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6AAe-0068HW-SW; Tue, 28 Jun 2022 12:18:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6AAQ-0068Be-KE; Tue, 28 Jun 2022 12:18:07 +0000
X-UUID: cdfe5688c3f54f58bcdfc1ccee3d0c6a-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:c28d9641-7c6a-476d-bf79-f4203a7832e4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:dbbdfe85-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: cdfe5688c3f54f58bcdfc1ccee3d0c6a-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 389162432; Tue, 28 Jun 2022 05:17:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 28 Jun 2022 19:37:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 19:37:17 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/1] mm: kfence: fix unexpected leak scan on kfence pool
Date: Tue, 28 Jun 2022 19:37:10 +0800
Message-ID: <20220628113714.7792-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_051806_706288_0F49EBAD 
X-CRM114-Status: UNSURE (   7.68  )
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
to two rb-trees, phys and virt, the kmemleak_free failed to free kfence_pool
from the virt tree. It caused unexpected scan the blocks and triggered
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

This patch applies kmemleak_ignore_phys() to replace the original kmemleak_free and
adapts it to the late enabling case. 

v1->v2:
 - use kmemleak_ignore_phys() to bypass the scanning.
 - move out the freeing opeartion from late enabling as it's trivial.

Yee Lee (1):
  mm: kfence: apply kmemleak_ignore_phys on early allocated pool

 mm/kfence/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.18.0


