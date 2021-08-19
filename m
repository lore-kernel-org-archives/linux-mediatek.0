Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F187EC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 20:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E986610FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 20:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E986610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XPp9BxLEKBaJVAAC+i9tJpCeyhAeSrdeTEhZU8gHBdc=; b=DAL2OrlLk1MyCn
	iHM4ArLhPJOrCxWaZWZ9sDFSJyQO3y1ozeVrZV6K6Bh5vIrW6x7z8kZDE+m25oecUVBKxS/wu/+5k
	LHN5F91NVHo0uQezB+cxZLJWfxPardhTil8FFxXUs+hXXmJbEs4X3q9nW39q5hKWSgLAPmYjfbUL8
	/usc9jVl9dyaLE92gYyoKrnMcViRKbjqqg6/7K/fHG3ZCq6u3vRS9At1j9rD6xoNQBj0x3Za9jAWo
	L+Yfu8l+U6rEjTOmygl4unXWXg6KbJpJzj8RzuD0ioegn2Bxz9Q5yyhMponsxyFnw3NRLfPLjFvj+
	kYhYpU7Hl3YYpkkGWxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGof5-009QOr-6a; Thu, 19 Aug 2021 20:29:15 +0000
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGoes-009QN9-92
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 20:29:04 +0000
Received: from pop-os.home ([90.126.253.178]) by mwinf5d33 with ME
 id jYMT250033riaq203YMTFv; Thu, 19 Aug 2021 22:21:28 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 19 Aug 2021 22:21:28 +0200
X-ME-IP: 90.126.253.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
 andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mtk-vpu: Fix a resource leak in the error handling
 path of 'mtk_vpu_probe()'
Date: Thu, 19 Aug 2021 22:21:25 +0200
Message-Id: <3d4ba5d254044567653a006b18971658ec69560f.1629404378.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_132902_505665_C306138E 
X-CRM114-Status: GOOD (  11.46  )
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

A successful 'clk_prepare()' call should be balanced by a corresponding
'clk_unprepare()' call in the error handling path of the probe, as already
done in the remove function.

Update the error handling path accordingly.

Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index ec290dde59cf..7f1647da0ade 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -848,7 +848,8 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	vpu->wdt.wq = create_singlethread_workqueue("vpu_wdt");
 	if (!vpu->wdt.wq) {
 		dev_err(dev, "initialize wdt workqueue failed\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto clk_unprepare;
 	}
 	INIT_WORK(&vpu->wdt.ws, vpu_wdt_reset_func);
 	mutex_init(&vpu->vpu_mutex);
@@ -942,6 +943,8 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	vpu_clock_disable(vpu);
 workqueue_destroy:
 	destroy_workqueue(vpu->wdt.wq);
+clk_unprepare:
+	clk_unprepare(vpu->clk);
 
 	return ret;
 }
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
