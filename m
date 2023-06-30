Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034A0EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sKy101p5HU/qooc4J0ScSB6mcgQFBWY7U9kbkvkQRhU=; b=WnjIm03Qzgfmr3nCeSe2ddnMvO
	g/Tswx/PRq55Ev9HmjX+H2H3Cjd1s/NrHTPc22oplgyuX6HtGIQeFwanq3Vrhf/3jb48wRRPeEXrL
	UgNq66e+f+MXuzDKCAYcLSveMEI9XBBf1lP+PnRZ4rYuaeWYLQe5EPNVP3ynyGszg+uuwvdc4SbCx
	erOlmkK4+6AseAKzjSC+keN1fumDGicBD/tHDaEsbaKYv7YJBQo27GHL2IVmZgHP7bVmvxlXlMg9B
	1D5hwpuW29EwW0p5OMh6QZGBKIRRdPSKh5gasX9iqB9NzR5rGmbG6O4vxg+T1mgSeWL96ndCr8Hkp
	CarsAJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFAL5-003HQB-1Q;
	Fri, 30 Jun 2023 09:22:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFAL2-003HPN-1i;
	Fri, 30 Jun 2023 09:22:49 +0000
X-UUID: a8cac96c172711ee912e1518a6540028-20230630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sKy101p5HU/qooc4J0ScSB6mcgQFBWY7U9kbkvkQRhU=;
	b=KDEAW50ONMvKIja5Tg+8tN19BhrXM6wLcV/Zimjpz90oP5ehs3jmKXqAWYgJsUaQgqju9d9l5ykLVhJliRTZcd+EEtfb/bVUc7kPfRRkzpkaZ8+L9x0WZpAOV+6xTx4kk2Fh34/rtex1CbsjlS0dB9maPVwLHtVu5VN5UwNcGeY=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:120cd210-a5ba-4983-a295-16c8829126cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:120cd210-a5ba-4983-a295-16c8829126cd,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:30d179da-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:230630172209LT550K0G,BulkQuantity:1,Recheck:0,SF:38|29|28|16|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: a8cac96c172711ee912e1518a6540028-20230630
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 527176480; Fri, 30 Jun 2023 02:22:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Jun 2023 17:22:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Jun 2023 17:22:05 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
	<brauner@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>, Andrew Yang
	<andrew.yang@mediatek.com>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] fs: drop_caches: draining pages before dropping caches
Date: Fri, 30 Jun 2023 17:22:02 +0800
Message-ID: <20230630092203.16080-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_022248_580733_0F9D45A1 
X-CRM114-Status: GOOD (  11.58  )
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

We expect a file page access after dropping caches should be a major
fault, but sometimes it's still a minor fault. That's because a file
page can't be dropped if it's in a per-cpu pagevec. Draining all pages
from per-cpu pagevec to lru list before trying to drop caches.

Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
---
 fs/drop_caches.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/drop_caches.c b/fs/drop_caches.c
index e619c31b6bd9..b9575957a7c2 100644
--- a/fs/drop_caches.c
+++ b/fs/drop_caches.c
@@ -10,6 +10,7 @@
 #include <linux/writeback.h>
 #include <linux/sysctl.h>
 #include <linux/gfp.h>
+#include <linux/swap.h>
 #include "internal.h"
 
 /* A global variable is a bit ugly, but it keeps the code simple */
@@ -59,6 +60,7 @@ int drop_caches_sysctl_handler(struct ctl_table *table, int write,
 		static int stfu;
 
 		if (sysctl_drop_caches & 1) {
+			lru_add_drain_all();
 			iterate_supers(drop_pagecache_sb, NULL);
 			count_vm_event(DROP_PAGECACHE);
 		}
-- 
2.18.0


