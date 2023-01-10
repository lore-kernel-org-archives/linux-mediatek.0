Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EB4C54EBC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 03:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uv/WBNw5113cc8E4woYRu/RQdfYiytsFQZZPKQSptSY=; b=pCmP11tQBEYFPKC5n91UTvJfff
	zT7Bp5wlTVi4C74nheHlbZ/NogAPaDaGRo1YlXawYvC8jOp1PNkpWyPUSTV8xLjhyo+Bsn5UlbgQ9
	ZqqAMzY0H8yu8ElNtNvGtTwqODO1PRsiYGDW8iVdb9KU4EBL7tW3uJD0DDlQxzFtZDeER6eB8c9lS
	uVCKFu/ejV2NdSpPMJxVU9TZSfHwqjZGs+BFh07SAb2w0ltiFEaPpPApYqjssTpH9Tto1IrUP0zt7
	gFa0gm4oqWCWzKn8MDmmJZ7AlYD9dlJRaqgyZu01kTfdH8zOLoERrshmsDSITV33DGj+u1YiiJHUe
	unQVLuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF54s-0053Yu-4F; Tue, 10 Jan 2023 03:13:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF54o-0053Wg-U2; Tue, 10 Jan 2023 03:13:28 +0000
X-UUID: a4590f57523d439faf65b3a0cbc73e8a-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uv/WBNw5113cc8E4woYRu/RQdfYiytsFQZZPKQSptSY=;
	b=tqIBQAzKHG1fBpdZP7XlHB0sw++dhwtEd75msRFVqB/JFAD3VtY+rOXEuVCMpnh9o5X6ec3XEFnHh+qSPxsKVK+dSElBP/Wc0O6lQW5ILHJs5FAQ37B8BOP4N+QMFLT16KFIDihXWBC49HIzFQeszoMxvkYK5EulSA6R3QMKCQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:a7b8c102-41eb-4077-8d99-28910d611ff8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:fc69c78b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: a4590f57523d439faf65b3a0cbc73e8a-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 390334026; Mon, 09 Jan 2023 20:13:20 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 11:12:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 11:12:44 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Miles Chen <miles.chen@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] firmware: meson_sm: stop using 0 as NULL pointer
Date: Tue, 10 Jan 2023 11:12:42 +0800
Message-ID: <20230110031242.4917-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_191326_987270_02BA3A9A 
X-CRM114-Status: GOOD (  11.09  )
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

Use NULL for NULL pointer to fix the following sparse warning:
drivers/firmware/meson/meson_sm.c:85:24: sparse: warning: Using plain integer as NULL pointer

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/firmware/meson/meson_sm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 77aa5c6398aa..3f5ff9ed668e 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -82,7 +82,7 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
 
 	sm_phy_base = __meson_sm_call(cmd_shmem, 0, 0, 0, 0, 0);
 	if (!sm_phy_base)
-		return 0;
+		return NULL;
 
 	return ioremap_cache(sm_phy_base, size);
 }
-- 
2.18.0


