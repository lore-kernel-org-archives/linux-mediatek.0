Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B59C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oXeTgdcj9nsKO7GXyOuyAqS8S9WAFNWi1J96P/2W/fI=; b=u6Fv37svdFftXN
	5PMuo0BeIJjS6ogLl3g0PWFg1hFeBAolOeUGWJ2XHPq3jRncID2x+zYd8hTxtWtRgIpV6zUdbmQTV
	1EJigBPmLI9t7cowEw6V0yXWXbtpzQqmg6y7mF4GKIQJH6ZPfiAHhnRIXfOronSBvVmnzrbumHU7I
	y5S4gie1IqrxExLEsogPPfgKQjk6KXolTmiEQOMMcvAJY/DOq4JZngRPMRoAGXHiVfTKahQJjV1Qw
	9J4hxRqFmApM7B344Zi6yUY02tkddOf4J1HxRrRVGCweL1bOk0RZ99WgTvp/QUDRz6RnN71FeuCK4
	I9xOAmeNGE2VXFRVZlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCA2z-005s1p-Vo; Tue, 25 Jan 2022 00:50:58 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC9hY-005kBh-1v; Tue, 25 Jan 2022 00:28:50 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V2nnv0z_1643070520; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V2nnv0z_1643070520) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 25 Jan 2022 08:28:41 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mchehab@kernel.org
Cc: matthias.bgg@gmail.com, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: mtk-vcodec: Remove duplicated include in
 mtk_vcodec_enc_drv.c
Date: Tue, 25 Jan 2022 08:28:39 +0800
Message-Id: <20220125002839.92004-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_162848_334101_05AA944F 
X-CRM114-Status: UNSURE (   6.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix following includecheck warning:
./drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c:
linux/pm_runtime.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 507ad1ea2104..a3870628c9f0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -15,7 +15,6 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
-#include <linux/pm_runtime.h>
 
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_enc.h"
-- 
2.20.1.7.g153144c


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
