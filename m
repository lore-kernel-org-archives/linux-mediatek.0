Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF020C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C8A720738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0cQK51Yg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QllXcQva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C8A720738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NO5zZHQuwc+N0608FZwxfV6rUA2txRx2KcreuoqlGGo=; b=0cQK51YgEyNZawBGdOfliILad
	XanM/jDqlFdD8Sy1IteGxwVQtORrrFli1EBcxF6ilLr+uteJ/fP55t0Z0IO0Ga17GEztFsKI/E5eW
	sFQRFlsESzhHTju1zivTOyFedDiZRW2VXn8l8fUjpzDiEZP9WLlseJwOPBOyi1+Phl1J2IOlT7PfB
	JfEPHUfZL3tIq7Ke845coXxrPkKbADjof+Vz8TGtg0s3wIbsuRu1T0nIhyRtn9McxZNOf/q46NmLn
	EJu88GCSnJny09bZotkoQYbZbVaKKiOpNoRyOuBt7yGatyEuo9hk7JJ8gC378W4i8zQ3FOThtHkCT
	uOCM/bHdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94QQ-0002Xb-6K; Fri, 21 Aug 2020 10:37:34 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94QO-0002WY-1a
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:32 +0000
Received: by mail-pg1-x544.google.com with SMTP id m34so798965pgl.11
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p5ysidPZyRWdeECygkw5/tjlDUm7P4m3Td9H5p5iiOo=;
 b=QllXcQvafwdxZtqCOWYNuOpr5bk3EVyJhW4ve3i3V6F8CPxZfPfuCYKOpteZvfbSWQ
 jVDZ9ABjjKcr3jDHnLC+xDtUicUOM8Ld4koytB4iMeEd2VkFkAGxhoX/ZVNmFq4dX7iR
 5FEkIlSTKHlJdiaGljctSN4bguGNRwS27iCXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5ysidPZyRWdeECygkw5/tjlDUm7P4m3Td9H5p5iiOo=;
 b=B4gbRKmH+kXAbst3PwHG22sIX9QnWhCCAWA4N0nUaqZSISdDoksjY72LIv8sEmSsRV
 aJf5nQz4Q7QH65An0sWmCJSt8UW2NUsBxwvJVGIfWoQOyVk41cXfZeUW9fU4xMyXkAG5
 6lPF3Uc7wvP+R6Y0cpd3cLXlt7SBRDweXfp0cYSuMNOIE4G4gk100GNis+SFmidejFT2
 Csy2GoGLTouODJMYUcXxLuU7jopFTvRSQ/wDp00/GDu3hwBWMO9Ss2wAg4ovPTn36Eur
 6eQd6DGPIYgAkarPOc7te0EX8mxWtTho899CuUOKMpfv/LczfYWKoimnBpZD9G93Bi4A
 njpg==
X-Gm-Message-State: AOAM531uUo5JaDwgx7GaDGKGUTmnaMPYSQaQ1qYuNJuMiAIcgkW6w1cL
 gZ3gsJ/8F5aXaOIFBma+SMpgNQ==
X-Google-Smtp-Source: ABdhPJwFeTw+XO7IIO3hIBMzDU1dUX0aLZcDBZNoCjlCGYvip1tLKkM+/8qFTxgpvgudTqGdGsdaUg==
X-Received: by 2002:a65:480a:: with SMTP id h10mr1840003pgs.304.1598006250395; 
 Fri, 21 Aug 2020 03:37:30 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:29 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 17/17] media: mtk-vcodec: venc: fix invalid time per frame
 in S_PARM
Date: Fri, 21 Aug 2020 19:36:08 +0900
Message-Id: <20200821103608.2310097-18-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063732_106117_1942070D 
X-CRM114-Status: GOOD (  12.74  )
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
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
