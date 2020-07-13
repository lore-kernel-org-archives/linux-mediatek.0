Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB66C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17F92068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ZtiHSSv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQneNRTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17F92068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3ALEvHuwlWoOrmPquZFiUqubJOS1V5oB7UQ00JRmxz4=; b=1ZtiHSSvGnAdzUn4nm/kSAO7w
	GkFWsCR2rm2zXh6HQQwnI3k4+2BpwPK4swFS7af59Xdhx75ZsJf+B23KLFSDvieGooHBWPZT6XOQA
	gdRaW78YOVAMBSSB84/fboJe2fpHAF8mXV3rvKQix4mIMzE5oMYpzzGWWGfwGEDdMy9trLlVPlsgi
	97/jW5sLyDCXVsd0fx2e7MB2BbxgkDdnWF16Jvf2aSAaMSQoNgBBpwGTzVdCUaqWZ1OGVOBqb65Pa
	04CN4MRDeY64SO7bwKMBZGCpPtxlDQ/qqg7jph+v1VuF+fxZnKuv/Oxhw+wottcpsbc01A6GjwVcj
	w2X4PcWWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurfA-0000v4-CJ; Mon, 13 Jul 2020 06:10:04 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurf8-0000sd-1k
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:10:03 +0000
Received: by mail-pf1-x444.google.com with SMTP id i14so5535533pfu.13
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gB83jD2FpTYfBDRkUJH8DvVVofs2yRFQbXc2yeSZvmk=;
 b=mQneNRTvRh7TEV8oSckX8BzrplvT9JWTPgTge++Ykp1B5RphqvW7GoZJ7CuLCG5NUG
 ALY50gHRt/NcNRLiQoXmQFstFkEHgQkNYkl7cQQe6wc1diyCVsgb0FDopMACd33C9vqe
 SGZDpkH8trEfdC9w/dw0KWhHA4PTUTO9iYCas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gB83jD2FpTYfBDRkUJH8DvVVofs2yRFQbXc2yeSZvmk=;
 b=PUDsi6Yu8mAsPMCHGIl3DRpvFqCbISaNGoGibaInpFTYsX7c1SGnW0rv9hOmiaZIaz
 51atWhYmfVgZOopr4bIJaJUwTVjLHO1Swfos/9dyzRLvYGYEVxna7eUDIjS38vxtcZHB
 yH+KNaMKo3Zz9MjkXRaPETamqe+MuMhe6U3nNlCkCH6DFO3QlSrbm4WHk89eYoPJDhAh
 rdVCViJSRYXXYoUwK3uoT7k5N48/aZit9o9q9avEc0fQZWu1dIJIlF2VTOCBGHrvoWCp
 nA0tC0++/kELzSa9qBGwUC/MakCMNFbe77AVjrE3w7nLMLwhp7ECEB+fWTEmS1qtvWQS
 YjCA==
X-Gm-Message-State: AOAM530It3KPrNTNMffly3n8bEMwpazb7K86qRd20SE+tPeFN5dfeRiJ
 WlGDl4WJGQn/89EXVO6XTXFR8Q==
X-Google-Smtp-Source: ABdhPJw7xh/m0JWlcTmFBX/gTdG+Hj4V1YLkVAmb10CsnxvzrbYdCbIFz51djjnYzpvhScMv8yE81Q==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr66187991pgh.255.1594620600025; 
 Sun, 12 Jul 2020 23:10:00 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:59 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 16/16] media: mtk-vcodec: venc: fix invalid time per frame
 in S_PARM
Date: Mon, 13 Jul 2020 15:08:42 +0900
Message-Id: <20200713060842.471356-17-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_021002_181608_01DEBC1D 
X-CRM114-Status: GOOD (  11.03  )
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

v4l2-compliance expects the driver to adjust the time per frame if it is
invalid (numerator or denominator set to 0). Adjust it to the default
value in these cases.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 09baac2dbc36..82b04714f750 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -200,14 +200,18 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 			      struct v4l2_streamparm *a)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct v4l2_fract *timeperframe = &a->parm.output.timeperframe;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return -EINVAL;
 
-	ctx->enc_params.framerate_num =
-			a->parm.output.timeperframe.denominator;
-	ctx->enc_params.framerate_denom =
-			a->parm.output.timeperframe.numerator;
+	if (timeperframe->numerator == 0 || timeperframe->denominator == 0) {
+		timeperframe->numerator = MTK_DEFAULT_FRAMERATE_NUM;
+		timeperframe->denominator = MTK_DEFAULT_FRAMERATE_DENOM;
+	}
+
+	ctx->enc_params.framerate_num = timeperframe->denominator;
+	ctx->enc_params.framerate_denom = timeperframe->numerator;
 	ctx->param_change |= MTK_ENCODE_PARAM_FRAMERATE;
 
 	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
