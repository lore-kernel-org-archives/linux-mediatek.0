Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF3BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 11:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W+pQU79dplIq+8RiBbcyznpJdETmueXPluialFdgYPQ=; b=ORKsncejz5lSHq
	GFww7dsAjQ7fmrOGLpdku2LKOfEmxzCD/XtyET2gZE2ruXZD9kdh5P7cYI9z4xLzISERORtwM+XWc
	EXbSGHiTRU5fpV+lKzOqjN0D3szIU96SC4N7DVPKERJbB5wnXPFtG6dmWnRlZLlcfFmmkHKxv/Ooq
	H19dKWVgYYl8V180xQlOA+Phw1dqJHO2sLO2O7BpzV0jgFVK/l6sT2SwhJWvqhxeuxQrk5PLifGWO
	FOUHcg4sYVMS6qt/DjE2tWrDmiYE6HkAqGWyBsJRhWwTU+Td43+0ySAwU80DDHbqwZH2dGkfqg1eq
	WXDH03437Qc46dWiKPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsN7a-00GJHF-VG; Sat, 21 May 2022 11:18:10 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsN1o-00GFF9-UZ; Sat, 21 May 2022 11:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FijcdnWeNJHGkmGIXKvwmM4MTGHZdgWDIgV1eJ838sw=;
 b=HLWioN3D7KOIrKtH4lHd6OUnJLBBrp1vadDwRoGPWJKu9oUED85+q9kV
 tqgb0tuy46WU1Sr+AjRpPA4ZHAv1GnsdabNFfHAmxScFuF7d7ngXm8nuE
 A5k29y821XahNM3iJceVcTKt47A6DFvA5OAsqNYVgW2kN0ThF/5AnojrD 8=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727966"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:03 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Sean Wang <sean.wang@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: mediatek-cqdma: fix typo in comment
Date: Sat, 21 May 2022 13:11:11 +0200
Message-Id: <20220521111145.81697-61-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_041213_340646_F1E1DB3F 
X-CRM114-Status: GOOD (  10.75  )
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

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/dma/mediatek/mtk-cqdma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index f8847c48ba03..9ae92b8940ef 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -373,7 +373,7 @@ static void mtk_cqdma_tasklet_cb(struct tasklet_struct *t)
 
 		/*
 		 * free child CVD after completion.
-		 * the parent CVD would be freeed with desc_free by user.
+		 * the parent CVD would be freed with desc_free by user.
 		 */
 		if (cvd->parent != cvd)
 			kfree(cvd);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
