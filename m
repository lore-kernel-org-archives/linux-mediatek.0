Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C7C07E95
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22CCA613B1
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22CCA613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/H/S44GTRvpoPD4mxkkcZFclAa+Xfri1z7TsfAusv7k=; b=IklUlr7NKShHF/
	kUmhqV7RiknrrkEq9NaFv8aLcRf9W1DIMlyUqJdP3BZy06eP4KJCOa0mUfCBt+oEY56+S4bgLB4ma
	SuocKj5A6vz7e2ciriSWTAhMy0q1+EciTX5m/cGlj99vD+h6o8uRdA2D2KueBo+da9/HPD+XxlW/w
	Is0OxrtIb2lq6tMCSHOu4lvXWLzBO7cMfXipQMFE839ULPqc/f9Xj+bfC3PrIqrH8L0qF7mfmKOw+
	i8FSnMXigXh7XiL+k74RBhtxlU63Fa/rWwQrEmQtx3+zB2hRcWJAu4yJY7MM4MVjAL5RJ/dwRd+Gf
	tyhcSfUTQoph4QUOqbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0BR5-0072qs-Tf; Sun, 04 Jul 2021 23:22:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BBx-006tgu-AF; Sun, 04 Jul 2021 23:06:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31F4F61936;
 Sun,  4 Jul 2021 23:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625439985;
 bh=/FSnNNOCk5OXokZXqDDrrMtWOMQjuygAvziNQZGw/TY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOEL9+L9TziJ64W5cojcAiLH5y2LRO0f8vCdALbqR9W5rMGMdlqXURbSGa/nmrgWI
 xBBkGGkd4JVmErIivIQ740HawhJGlACzSIgMJN8dsadPNpKmTjV+YdIPCFDIDzKYBW
 wAscwpdGAkosSRxn8XteVxAjdvr37BM8YGHItuLnnO3c/0UvtKE/S9dWluC3G2C01P
 aE2ZdtedtQ3oYvEfekRSgTyLOBm4eWsFpGfUwkGrEgrQAs5+31NPyqD0QGI25q8KrJ
 pOpT9hrb+7o8JrMbtgWGQEkIqlWDXGTWhKe7YmNunG5WkoEpkcV+33ScqT+oCn5fIa
 uGndfT0VloYjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 06/80] media: mdk-mdp: fix pm_runtime_get_sync()
 usage count
Date: Sun,  4 Jul 2021 19:05:02 -0400
Message-Id: <20210704230616.1489200-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230616.1489200-1-sashal@kernel.org>
References: <20210704230616.1489200-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160625_471139_2BAEF5F8 
X-CRM114-Status: GOOD (  12.56  )
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit d07bb9702cf5f5ccf3fb661e6cab54bbc33cd23f ]

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

While here, fix the return contition of mtk_mdp_m2m_start_streaming(),
as it doesn't make any sense to return 0 if the PM runtime failed
to resume.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index ace4528cdc5e..f14779e7596e 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -391,12 +391,12 @@ static int mtk_mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct mtk_mdp_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->mdp_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->mdp_dev->pdev->dev);
 	if (ret < 0)
-		mtk_mdp_dbg(1, "[%d] pm_runtime_get_sync failed:%d",
+		mtk_mdp_dbg(1, "[%d] pm_runtime_resume_and_get failed:%d",
 			    ctx->id, ret);
 
-	return 0;
+	return ret;
 }
 
 static void *mtk_mdp_m2m_buf_remove(struct mtk_mdp_ctx *ctx,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
