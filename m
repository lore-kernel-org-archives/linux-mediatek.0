Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29683C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xnEriNYuJ+gQuwuDEbWWl/0zL8PaLW5rMUygXWAZFe8=; b=euwLGwgnPfS5Omjk7ITqEWnYU4
	tfKzt1u1w23BbZmEvcgJjX9vpTFbOVOWnkINMhA/OFa42X9NoCGgxQ+gWZgdXYTyl1fiz9z1eMxsP
	8MjVtWy0nX9bPBduB9cRrFghiLVoc+s/7JBtxdK7xkTmlQLxRf+4lyrdah1mrjwmZGU36dTN/2z0Y
	yvk+kXV5GKCG2jUcGDObuX55IGwXqsGWFsmp0wyA48MP+HeD8daWg1fIyJGpU6px2OnflrQZ+7UiW
	NDW8nC0qa+OgP6S2WmIxlxUfiQEsPKF4yKTNgi3J8R6U5ndQtoD86nBfhgzbvyyAICZEc6FG5vbze
	cSAeXs/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hlz-006AGZ-Pc; Mon, 04 Jul 2022 08:49:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hlw-006ADk-Kb
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 08:49:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id z1so2201815plb.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 01:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xnEriNYuJ+gQuwuDEbWWl/0zL8PaLW5rMUygXWAZFe8=;
        b=QWTmYN34OAag4G/WUeu87bDQWcWiFQu5Nx192xyHrdPvROX9gfPYARTnBXhE9NyU2n
         XHwz50ysJ/Ck85II8/6GH9qLRkQcElfBt7j9GSphZr4LRcClPpq8n6kXqLUVAUldLxJA
         jTC115rf3RHCznW80jLlV6q/gxp4RB4umoaRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xnEriNYuJ+gQuwuDEbWWl/0zL8PaLW5rMUygXWAZFe8=;
        b=MGgv7QtwpQMWJyWEggX1ukJ0neipyRJkk0CK7o7k0FkYJ+I8Cqy6JhXntGwV4P9Ae3
         oCMvP6gT/EA+XCau3p2tKWO24j4J9RAO2//iQgNkVppSnMlLZNTof9AVPqleWAWIhc++
         qqLYUv9su+9FGxFO3xU1YeQGz28mAM/OV6nR6BquBTH/ywNb1LjTJvPTHOiLSGedZzzE
         R4qPhICm0fRT8SqVNHlPdTDy0Q22sgwl+j36y1AT1NBNpKYIf3mI/oBmJ0dDMuQrcdzz
         9ckyOI0gAlWQlNb/h5533p3Al+22QaCpIALo7QPjrUbh6sihti0O0ruHN06c9YCIiVGN
         QQxA==
X-Gm-Message-State: AJIora//vjvn5ZinQ6v1DfV0x7Pm1tjCrB4MD2H0c55aD7x9t9DkG1GT
	5ppefZkGhQpd8HSZcMrpfXjhPA==
X-Google-Smtp-Source: AGRyM1snabMZLbYQYTTtsCz88Vow5ixcBi7ao2OpFSlj0Wz3Sy8FxpBgdIuAx7cueZJSeCsvVK3kEA==
X-Received: by 2002:a17:90b:474b:b0:1ef:86ac:2a58 with SMTP id ka11-20020a17090b474b00b001ef86ac2a58mr5842915pjb.26.1656924575113;
        Mon, 04 Jul 2022 01:49:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:bdd0:6a17:90d3:15e4])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b0016be4d78792sm1347926pla.257.2022.07.04.01.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 01:49:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] media: mediatek: vcodec: Initialize decoder parameters for each instance
Date: Mon,  4 Jul 2022 16:49:30 +0800
Message-Id: <20220704084930.1625768-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_014936_739976_E17ED6BD 
X-CRM114-Status: GOOD (  11.96  )
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

The decoder parameters are stored in each instance's context data. This
needs to be initialized per-instance, but a previous fix incorrectly
changed it to only be initialized for the first opened instance. This
resulted in subsequent instances not correctly signaling the requirement
for the Requests API.

Fix this by calling the initializing function outside of the
v4l2_fh_is_singular() conditional block.

Fixes: faddaa735c20 ("media: mediatek: vcodec: Initialize decoder parameters after getting dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was found during backport of mtk-vcodec patches onto the ChromeOS
v5.10 kernel, which caused one of our tests that does multiple concurrent
decodes to fail, as some decoder instances didn't have their
requires_requests and supports_requests flags marked correctly.
Evidently my previous testing of culprit patch was not thorough enough.

This fixes commit faddaa735c20 ("media: mediatek: vcodec: Initialize decoder
parameters after getting dec_capability") in the media stage repo. This
could either be queued up after it, or squashed into it.

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 55dffb61e58c..e0b6ae9d6caa 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -208,11 +208,12 @@ static int fops_vcodec_open(struct file *file)
 
 		dev->dec_capability =
 			mtk_vcodec_fw_get_vdec_capa(dev->fw_handler);
-		ctx->dev->vdec_pdata->init_vdec_params(ctx);
 
 		mtk_v4l2_debug(0, "decoder capability %x", dev->dec_capability);
 	}
 
+	ctx->dev->vdec_pdata->init_vdec_params(ctx);
+
 	list_add(&ctx->list, &dev->ctx_list);
 
 	mutex_unlock(&dev->dev_mutex);
-- 
2.37.0.rc0.161.g10f37bed90-goog


