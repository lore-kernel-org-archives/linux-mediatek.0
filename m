Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF236C07E95
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:41:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A878E61246
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A878E61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7J+keW5ndJByvTWcqdQMQ6gcz1cLWCPpSENv9Wvfg8=; b=vZ975A3shYRSdb
	dswRyBRdR47jH+7C84fXgVyQCOD+/NKmvSp4L5ZZFnTtO133mRgSUtp94IMHpNJaPkkxLROKyKM03
	KVbudPl/vgU+0zmfryyxQkGLN/kcsrENptAYfErXfjU7AD+Vx9XXBm+mrs+F+71rKVg4pNO1pJd0y
	FlgzVEzBsvIzrK+HyA9L/SVAbkzhMQ/3MlVY466YmVnS6+/wdtBy4lmsTQms3rQNtmiEMySo5hCMU
	SrG8ak7ECUYJKX/ZYcgM9G91TQFEX/iB88w1GKtadKQ65zTItP0anwvWk/LijJPHymX/JSD4o2c0H
	0zB5iJkC0B9SYTa0QheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0BjD-007BMI-O8; Sun, 04 Jul 2021 23:40:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BDk-006v9b-NN; Sun, 04 Jul 2021 23:08:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72F20615FF;
 Sun,  4 Jul 2021 23:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625440096;
 bh=uAPpcxsYPuPDVvfQ114HosmJn/2knSHCbfPiPY2r8DQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sj/nXQdwuXNeooFIOYYnD67edU3qDSwGicf847A13bJW/4ZJM07qEt5PJqo5AXz07
 WQugp9u3YEejJ5wlLm8HFdNejd0ZIKA68tgtoyJmlmEXsndb5eYo/DyCQXZBwKEZ24
 FDBQDNWZTvfDbzfUDchKkblePfMyaW2N8Pfj7hWAbmamGbfLg9pKSwGLnbCzA3LTZS
 TK10HqblLbgdLidbEWKLdD1UXm8a18VLhOdTyUzJMdtTcydwZmRdF87ZDAnFrvqpDO
 WjAYSc2/KoBkqTEPmfzzBRQahoWl65nRKRRk/REi0zZnVbbFgTGFb37zUYaa+RTO7Y
 LuEzYNSdm5M8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 09/70] media: mtk-vcodec: fix PM runtime get logic
Date: Sun,  4 Jul 2021 19:07:02 -0400
Message-Id: <20210704230804.1490078-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160816_811139_435D5337 
X-CRM114-Status: GOOD (  14.17  )
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

[ Upstream commit 908711f542c17fe61e5d653da1beb8e5ab5c7b50 ]

Currently, the driver just assumes that PM runtime logic
succeded resuming the device.

That may not be the case, as pm_runtime_get_sync()
can fail (but keeping the usage count incremented).

Replace the code to use pm_runtime_resume_and_get(),
and letting it return the error code.

This way, if mtk_vcodec_dec_pw_on() fails, the logic
under fops_vcodec_open() will do the right thing and
return an error, instead of just assuming that the
device is ready to be used.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 +++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 8 +++++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 145686d2c219..f59ef8c8c9db 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -126,7 +126,9 @@ static int fops_vcodec_open(struct file *file)
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-		mtk_vcodec_dec_pw_on(&dev->pm);
+		ret = mtk_vcodec_dec_pw_on(&dev->pm);
+		if (ret < 0)
+			goto err_load_fw;
 		/*
 		 * Does nothing if firmware was already loaded.
 		 */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index ddee7046ce42..6038db96f71c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -88,13 +88,15 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
 	put_device(dev->pm.larbvdec);
 }
 
-void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(pm->dev);
+	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
-		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+
+	return ret;
 }
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 872d8bf8cfaf..280aeaefdb65 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -12,7 +12,7 @@
 int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
 
-void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
