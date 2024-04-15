Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734AAC00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33KvbvTql7+TfuU6gagkdE47f06z1GuAxIph77Mkm3M=; b=BTtp4r2H1NXENzxZnJbqe/bC9S
	sIdZotKjMmRLlCWJAYFPSDkuZcTkXXr3BeRDCeSunlnoY0qN4X8i+DhMr8zwrehznZDJTRA9h+KYS
	y6uquoGfqcWiXfOHjlPAIzlfakP/nMHsG+aGbdHNGOChL4sFSHjWcKVYgTbs8XrdRg5LdwhQWdqq9
	ReNY/9QanRq9d0N2UbFys5rmt2SW8qRG3qWNUpI4sY3te/ZApEoEkYOndo0v0sfKH1lvXTajC0+i5
	dHuRhx9NDVdhT57HsmJa58p9ncl0GueMA2WFOEkjUBNg9QGZsFfWTUSFvQmtx9BSD9ligNNjNDimE
	elrybsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS77-00000009ceU-2WXR;
	Mon, 15 Apr 2024 19:35:38 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwS6E-00000009byU-0P1e
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 19:34:45 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-78edc0a81efso140420285a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 12:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209681; x=1713814481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33KvbvTql7+TfuU6gagkdE47f06z1GuAxIph77Mkm3M=;
        b=NyndJEUDFdFlQoLIe8VUDT3s+z8ovKKUuj4zIE5/jZplWEBNgvwyCCb1V1m5u5cUSA
         lp3O6f+LnRMDYwAl5WLxsk0wJEOAn1a3GcV9ZK1VfpvYw0u0Czp0ZzLDKPsmuxCogjXm
         qWFKGOaEQwJGz4MfsFojLPkd0jp1+0kPQiW3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209681; x=1713814481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33KvbvTql7+TfuU6gagkdE47f06z1GuAxIph77Mkm3M=;
        b=qMcJ81HF7vejdpm+Qj6ofLVldNZrSIdypewhmkZYQUJQHoUBlX5Ri5vJE+Eo3lN194
         7JzKLcoiF8wuJHL6c1zh/4FJgL+v9jyK0/AgCagVPJ7s/VNEVFbmgEeabhfT+RbKTxZN
         BnzUlElYf0EsMxGr8hCl44HwxKj59noJ6ImFBsgAdm75zZcccZIu1zgLczLOvnmxZ55s
         rdCEvBa6n5Orf7hsKzr+ZD+fq8jzxGnpXtiAWnYGvZu8dCNZjM9tfL2ujm8EhMqt9ezj
         sqIuHNL1KdpXfGyqoMRvYZjCLNAlxI8dkSp5vHP2HeAq2kTOzfeDZn4kCKn7+y4mGLma
         j7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHnS0/8h9037XNWY56tgvtxG0KodL+mABVd4gsDH5RSlS7RJjdjZcSaH0KysN5AvuME5Kt8StKr7SARlvzk+lMy2xEfzHhdWvqaOl/dkCV4+Xx
X-Gm-Message-State: AOJu0YzrYcxaRosMElYBsiB13C97oea6A4pejc9IEXiL+Qmh6XrTb9Pr
	ZpcHdqtRLKHVNXRlt1itn3Ev5jkGdM0HO4p3Tdx8PhOODAFlED8Ynvn2p2gRfg==
X-Google-Smtp-Source: AGHT+IHgMrhfCo+nCeS1fB2Q2DO/uvIOv0/GoxcEriQYnGbBf8HXaYl0FV1YT72ppySseLhcU5xKgw==
X-Received: by 2002:a05:620a:5719:b0:78d:6b8e:18d with SMTP id wi25-20020a05620a571900b0078d6b8e018dmr11861292qkn.64.1713209681163;
        Mon, 15 Apr 2024 12:34:41 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:29 +0000
Subject: [PATCH 12/35] media: platform: mtk-mdp3: Use refcount_t for
 job_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_123442_406919_95CC8882 
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
2.44.0.683.g7961c838ac-goog


