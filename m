Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3146C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B437520738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zw6baJ91";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m/R1f9To"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B437520738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFnwnPnB0MKipudEkzt4744am+7/10Esy1tBthNikG0=; b=Zw6baJ914lG+IgPbIAz0KKNHV
	yE0MoEI09QERt0Elq8Sf3C7MxiZHxRNM0M+LEdq2hVSG8KcudTf5q6+fv6cXqQ9AZXW17f2oeKki1
	a05VnajMMzy6D6EdGHLjm3qwXQRG+CKnjLtngOBKmPVieQ/ossIMkqCJX5rdbIg0i0PZUMzEj74UM
	do3y0Y4fQgXT52TMu5maibRXY17Sxm74Vyg2BzefjCHsbppnEmPAD4i/F//TUY7rhZLAOue18noEO
	fC60jrqqPxg1k0BzIa2kH7vlSdA6emCcAQETy4Dy/uBnH8psjwAsyV1KM+xgeKoFAzPnYHoQnOdxS
	fyVaunlPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Q9-0002O4-19; Fri, 21 Aug 2020 10:37:17 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94Q6-0002MC-KV
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:15 +0000
Received: by mail-pl1-x642.google.com with SMTP id y10so685240plr.11
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ekjLtdTB1tlhAjxDSbKswQOhIE9zJ8hB2G5KwSjR5pQ=;
 b=m/R1f9ToXYY/+PVRjHvpCuIsIRuwpVURsaigb7iTY1yPgNsKT2u77UDTwskqBOgKUl
 NnMNY+4zlpvL6GG3zSdsKdM8sqYlEzBFlHMLF+/yYAbr574opDOqS3Xb66vt+PXwigCu
 QMjtcqHyNGLhDz7x95f3PRqPyFPyTHeeWXEHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekjLtdTB1tlhAjxDSbKswQOhIE9zJ8hB2G5KwSjR5pQ=;
 b=hL7yehlK2Xp8diOcgojHV6QiXuiA8j4ttuB1SVuQ76fpuIDlPdec9TLJYw5hsOeXGs
 e8t3pXRsy9VupbtoSzv2IqoIuTrm9Ljv1vs3l0gubOOCI3EAekBmx14mj1e4r0k6kWMV
 tShazrDWxEPiWk//Y5eUWq07DDngq9YBZfAYK08bMyAx8Pjoz6XbIhb0sQP3CF8gLI8x
 Tjhm5EyxGvJMnaFuUpCgKSRMwExYoQtDlesuANg0q5wHVEGpingbn1S1JH1CNJLArcb4
 Hq9KGWoDs0zuiqM5oKPQEikzovkSi+UGg7hgDgoJ4BlkEnAeBOoj0g7TZr9HQX909R7X
 6Hsw==
X-Gm-Message-State: AOAM530X3ZGR42VgLJgTBWVoYotSPDbasZIXjSK3SC8vU6fGCxgxzUiS
 tL0vMp+454JcVa2tWSF05uVBoA==
X-Google-Smtp-Source: ABdhPJzcIKlchcjtfsSPdntvdlGRT/ghRkAj3ul1YF/GP+TM/O6jn9gAhwaC+lY4FoWRJt/Km/XZ2g==
X-Received: by 2002:a17:90a:cd06:: with SMTP id
 d6mr1933357pju.202.1598006232939; 
 Fri, 21 Aug 2020 03:37:12 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:12 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 12/17] media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS
 control
Date: Fri, 21 Aug 2020 19:36:03 +0900
Message-Id: <20200821103608.2310097-13-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063714_742039_7345411E 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This control is required by v4l2-compliance for encoders. A value of 1
should be suitable for all scenarios.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f2ba19c32400..f833aee4a06f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1206,6 +1206,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+			  1, 1, 1, 1);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
 			  ctx->dev->venc_pdata->min_bitrate,
 			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
