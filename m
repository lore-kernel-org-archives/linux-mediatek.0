Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499EBC19F53
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=; b=QVyPoqeDgTMo9/md/aaRNjN6Jw
	qI7pUsWpur1W/sUgnv25mSe3Hb+I2IzER6WwwHJHSg80kAB15a8iQH97KRfuBzq2DZpxYXcNW9d5x
	mpN3CTumDmZTBzCb8zDW7VrsCKEhCdaEkx0pm8wviqarvqe3+IPf+7BGra4ZlVGfzvu1P+8TaWQ1Q
	Z+X3Iw3l1svwao+Bo1LG8PJWkdCzU9FZt5zuGtZoHupUDXMrrgMUqI/nPy7rQABc9ze7G2nDj1XSv
	HKfipAbWztNSdObdGfyc7t0i+IhdODUeluSOwkG8geMc/uNbHdi8vjgH5xDp/ctaUceSgNx1nMAWU
	rhVpMeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tf4-00000003YAx-0X6K;
	Mon, 29 Apr 2024 16:15:26 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYr-00000003FQ1-0ZFf
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:04:59 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2351c03438cso2009470fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403096; x=1715007896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=;
        b=dpfhdF9Eun2gaFTf2F7N+xteLIY6RxLFshuqqCDcGFC0rnQmlFizE0KKbI0fbaOm5F
         bMRuUdJSkTbOqkPkGJiw3Jcdj47YVbvyJwqX/O0OQk3r9bTK0zOWSPKUKWQgOVG6gv7c
         fhT1rPZQgI9rnv8h6cjxI24bV5PF9IUZZc59M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403096; x=1715007896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5IbU7HBHK5ZSrS81fN3o3XopIPldfFFy8PdyHH7F6Q=;
        b=AuwNE83OrG846vmtnrtnG94+oEoO/ve2h0Dui/9uPyp/8fwV8waX188EC1RIphSyVI
         HuT8I7ZLIIcWovlnL6Dsu9HpN9Q2oC93qfrWEBFGduTIfAVudqe+1XRz8qX3R3ZziKus
         Wndcak9x0TuqNZ6aP2Hdz7vZ2kKAs9gToLgXA9CGX1+zGS3dMop6dv7aMNDXVNjBepbx
         p8DcA94AVJvlwKDJSTJdoNg02Uxrguq3YYzfNs4Phg0LM3Dy3EDRxRgf9Lmq/tfLHqmT
         nPkJhNPUg8jTpaB889dnSOr9UNlBO1L2lzFi1oUa76Uphg4iv1+mXWLeaBTrbzlqAc48
         zltg==
X-Forwarded-Encrypted: i=1; AJvYcCW/gPXpmNCAscINSPC2qZ9JqMjHomcO++Rz1F0lfeU1exytOMMLqwZJ5bG1iggNtWPPlKX9swY54yk+khtvPq+OwhiEguIIN3JvXhwkhXzmAO8u
X-Gm-Message-State: AOJu0YyhjFoqhCEgkB8gmSfmFlkh4WVNx2GoWRXrvE9/mjWgl0PeYjZG
	1U+yw0ZWJ73rG6CD/0QZMOqXgfNIQdX9uidgOceZWipDDsDkuxDjx2qLNb+5/w==
X-Google-Smtp-Source: AGHT+IGVAH/IwNYZ4S96l7NvgpYNIEj4hEsjMjcli1Y8ndu6kmVsTG4AE2U+O+g2MrONF6L3wD0YHA==
X-Received: by 2002:a05:6870:2401:b0:233:55b8:edf1 with SMTP id n1-20020a056870240100b0023355b8edf1mr12050766oap.8.1714403095753;
        Mon, 29 Apr 2024 08:04:55 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:51 +0000
Subject: [PATCH v3 12/26] media: platform: mtk-mdp3: Use refcount_t for
 job_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-12-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080457_344671_361E1AAC 
X-CRM114-Status: GOOD (  15.05  )
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

Use an API that resembles more the actual use of job_count.

Found by cocci:
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 10 +++++-----
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c |  6 +++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 1d64bac34b90..ea2ea119dd2a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -524,7 +524,7 @@ static void mdp_auto_release_work(struct work_struct *work)
 	mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 			    cmd->num_comps);
 
-	if (atomic_dec_and_test(&mdp->job_count)) {
+	if (refcount_dec_and_test(&mdp->job_count)) {
 		if (cmd->mdp_ctx)
 			mdp_m2m_job_finish(cmd->mdp_ctx);
 
@@ -575,7 +575,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd->comps,
 				    cmd->num_comps);
 
-		if (atomic_dec_and_test(&mdp->job_count))
+		if (refcount_dec_and_test(&mdp->job_count))
 			wake_up(&mdp->callback_wq);
 
 		mdp_cmdq_pkt_destroy(&cmd->pkt);
@@ -724,9 +724,9 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	int i, ret;
 	u8 pp_used = __get_pp_num(param->param->type);
 
-	atomic_set(&mdp->job_count, pp_used);
+	refcount_set(&mdp->job_count, pp_used);
 	if (atomic_read(&mdp->suspended)) {
-		atomic_set(&mdp->job_count, 0);
+		refcount_set(&mdp->job_count, 0);
 		return -ECANCELED;
 	}
 
@@ -764,7 +764,7 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		mdp_comp_clocks_off(&mdp->pdev->dev, cmd[i]->comps,
 				    cmd[i]->num_comps);
 err_cancel_job:
-	atomic_set(&mdp->job_count, 0);
+	refcount_set(&mdp->job_count, 0);
 
 	return ret;
 }
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 5209f531ef8d..c1f3bf98120a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -380,14 +380,14 @@ static int __maybe_unused mdp_suspend(struct device *dev)
 
 	atomic_set(&mdp->suspended, 1);
 
-	if (atomic_read(&mdp->job_count)) {
+	if (refcount_read(&mdp->job_count)) {
 		ret = wait_event_timeout(mdp->callback_wq,
-					 !atomic_read(&mdp->job_count),
+					 !refcount_read(&mdp->job_count),
 					 2 * HZ);
 		if (ret == 0) {
 			dev_err(dev,
 				"%s:flushed cmdq task incomplete, count=%d\n",
-				__func__, atomic_read(&mdp->job_count));
+				__func__, refcount_read(&mdp->job_count));
 			return -EBUSY;
 		}
 	}
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 8c09e984fd01..430251f63754 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -134,7 +134,7 @@ struct mdp_dev {
 	/* synchronization protect for m2m device operation */
 	struct mutex				m2m_lock;
 	atomic_t				suspended;
-	atomic_t				job_count;
+	refcount_t				job_count;
 };
 
 struct mdp_pipe_info {
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 35a8b059bde5..0e69128a3772 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -104,14 +104,14 @@ static void mdp_m2m_device_run(void *priv)
 	task.cb_data = NULL;
 	task.mdp_ctx = ctx;
 
-	if (atomic_read(&ctx->mdp_dev->job_count)) {
+	if (refcount_read(&ctx->mdp_dev->job_count)) {
 		ret = wait_event_timeout(ctx->mdp_dev->callback_wq,
-					 !atomic_read(&ctx->mdp_dev->job_count),
+					 !refcount_read(&ctx->mdp_dev->job_count),
 					 2 * HZ);
 		if (ret == 0) {
 			dev_err(&ctx->mdp_dev->pdev->dev,
 				"%d jobs not yet done\n",
-				atomic_read(&ctx->mdp_dev->job_count));
+				refcount_read(&ctx->mdp_dev->job_count));
 			goto worker_end;
 		}
 	}

-- 
2.44.0.769.g3c40516874-goog


