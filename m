Return-Path: <SRS0=cDU4=FX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACF1C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 12:48:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B5723443
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Dec 2020 12:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B5723443
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kxXfPIplSQIk4mPoHDYtV/kEqflX+h99XZEjt+tSS7k=; b=boH3KuzjbXpV+lqzx3GzGrQBGg
	6QE9oyuL8Rkrpj1DzZZjBFDHD1Sc7+1uWBTugCSHQSi3FLfeNDMuw0NlCyyWgmUozdZPuIFYpnwQ+
	bDnTw9Ds5mio24n78shVva/ZZFJrjpQW0CGuwlm+sWO6q5olOmg+dgovScr+QG/KVtnH1jw3L/biQ
	mrlZC10kz6k/TDOFQIXsLQjHVBlSLLKXi6/mBVJ96h+w8TMGPRMZHEN3KnTiWHVZEeP6ou7HFzeSu
	Vdv2QjvG+dQCc8MQ7bm1f4wLh4dpBFppYrfpKq4lsVyHb/TH90FWt8bLi9QEOj5lpVjr1SNnAgMd8
	fc+K44VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqbeG-0002yN-VZ; Sat, 19 Dec 2020 12:47:49 +0000
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqbeD-0002xe-Ks
 for linux-mediatek@lists.infradead.org; Sat, 19 Dec 2020 12:47:46 +0000
Received: from localhost.localdomain ([93.23.13.5]) by mwinf5d70 with ME
 id 6Cna2400106YL0V03Cnau7; Sat, 19 Dec 2020 13:47:41 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 19 Dec 2020 13:47:41 +0100
X-ME-IP: 93.23.13.5
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: sean.wang@mediatek.com, vkoul@kernel.org, dan.j.williams@intel.com,
 matthias.bgg@gmail.com
Subject: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix a resource leak in the
 error handling path of the probe function
Date: Sat, 19 Dec 2020 13:47:18 +0100
Message-Id: <20201219124718.182664-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_074745_933311_ADBEB2EA 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

'mtk_hsdma_hw_deinit()' should be called in the error handling path of the
probe function to undo a previous 'mtk_hsdma_hw_init()' call, as already
done in the remove function.

Fixes: 548c4597e984 ("dmaengine: mediatek: Add MediaTek High-Speed DMA controller for MT7622 and MT7623 SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
'mtk_hsdma_hw_init()' can return an error code, it could be good to check
it as well.
---
 drivers/dma/mediatek/mtk-hsdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index f133ae8dece1..6ad8afbb95f2 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -1007,6 +1007,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	return 0;
 
 err_free:
+	mtk_hsdma_hw_deinit(hsdma);
 	of_dma_controller_free(pdev->dev.of_node);
 err_unregister:
 	dma_async_device_unregister(dd);
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
