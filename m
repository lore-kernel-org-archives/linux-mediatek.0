Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819D1C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3953022D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 23:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3953022D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xu9FDxyFCyaQSNAU0/GaoM3v5nwC/fdFqNn8MAXb8M=; b=Gbeqyj72VRSOKyIa7sy6E/0/TJ
	N7JLS7v5b8GWz7fR71MjolvHdJ1EgQcHNu9FcNk544Ooekls5Wb/BxLzrYM42+oTqkmnSHATFkPxd
	WbnhGUgdk0CGe9rZF3CKMpmK945Id25XmnHBJgrKhZFzmOsTZS6OYOJHE0FgzWUqsUnFRrm63hQuV
	raTQFPJbXNNSsdFRa7cg8AlpSK+Ws02Ng4mVWo7h1CeG+j+a9L4SfeAcrvn0wbIXpGcMq7kM25Qbh
	8/WYqnOSPR9GTsCpl3EXwU17as0q8isfI3l2KOaYydkKKg0eVPvHZbSimBLsOzS8c1MpmRSAyR5sR
	DbN34G/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxI3w-0003k7-DZ; Wed, 06 Jan 2021 23:17:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxI3h-0003cy-9r; Wed, 06 Jan 2021 23:17:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF82923339;
 Wed,  6 Jan 2021 23:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975060;
 bh=RuKbU26yuLZJAE82ECbyxWKAfxQoGE+1gpGy1pi6ErU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+oQrZOhV8uWRogTMJD4O/ez9I/Wy0nAK4BwCY8iCpKgMinLRhX3BWKsNpJbBRDfV
 LRaF/jWeIs4tCLU2E5cSej0rqMsI4gvUZjkmVsgnH8D0/LrQK40LEBiWJT159nAJad
 08nwmtoYqX3DUkZWV9/NkzjG4UJd6Qzh3WajQf/lTWxhNdURiKpCapMBQPmzpxPtdY
 Qz1FBI0m95m/q7lcb3oHdnE6STL8DsOYiAv66xD5VYH/iRNtZAc6dErwxJ4LFSroYL
 1VswneUBbwbZBmIKgypo9sIzUnX/N7wczp/LfA0lJYriybigoQPs5+6VV6Cdh/M3Xt
 VHauJxrZ4J3lw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/5] drm/mediatek: Remove redundant file including
Date: Thu,  7 Jan 2021 07:17:25 +0800
Message-Id: <20210106231729.17173-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_181741_424026_97F68834 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

Those file includings are useless, so remove them.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h | 2 --
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
index 6b691a57be4a..a1ee21d15334 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
@@ -6,8 +6,6 @@
 #ifndef MTK_DRM_DDP_H
 #define MTK_DRM_DDP_H
 
-#include "mtk_drm_ddp_comp.h"
-
 struct regmap;
 struct device;
 struct mtk_disp_mutex;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 8514d68bde32..25a24f69b986 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -10,7 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
-#include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/dma-mapping.h>
 
 #include <drm/drm_atomic.h>
@@ -26,7 +25,6 @@
 #include <drm/drm_vblank.h>
 
 #include "mtk_drm_crtc.h"
-#include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
