Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D04C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dXRxtZvr+s2XVNzWzC29rU2+VQvIIaYQPfnDdLc66o=; b=iIKsaYkDgkTIFYHrBec/HwUXou
	K097NUjxLxUOWl0EX/MRhsdvOgQrvFDlehAsYJ1F744Bz02uC//nI3YtWd1DxVwszwkvDRGM9PPu2
	B7g1EQqj3CGN0jyCJWiQQo2rTYeVxs69vUvuKuGXTAm7jzWntgAV4Mjdo57iuGhlvxtQJh3x/Lvm8
	IbOuawYInmQnd+xDPlzH3EgioeDeAZ4G4AULbaf8nnKBQlDty65q2bjTCcJ4deb6L9Hcj+C4tdTkN
	PGzyBdKLwzGIr5mp1sL1cu6IUWXGrxXUYwlEBOUYjX/L/a1Kj7O/RlfbK6rGujsBkoTuiwSAkZMDe
	PeFsWZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrd-000TbU-Ov; Mon, 27 Jun 2022 11:25:09 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mra-000TWh-E8
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:25:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id go6so9020595pjb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7dXRxtZvr+s2XVNzWzC29rU2+VQvIIaYQPfnDdLc66o=;
        b=lCQwBZgKD56DJpohXiDdqChHVRMNjjSIqJXaJj7O+tImuokhzYLrf/x9F8WeAVXDLm
         QqC1o5Dd3iwCQnUcchQy2Yzm2viR+3DCLfQGVlr9mtRWSOsI3uJUFUi3FhZoVvQcx7aq
         FXZGJKa1Z/lT4IQCHxJq7hiO1ySSh4/+6HQk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7dXRxtZvr+s2XVNzWzC29rU2+VQvIIaYQPfnDdLc66o=;
        b=Gtt3Ry39nZCzkGTjNTKNDUs/DP6lOIpyGOgCZAqChqY4bWzTl6nbj2ZBAwEbgsfimr
         6gfK8Kojst9bkJQZblav6fIb/n7Bao6tfCCZLAFNAc1aeTSUqS4WEoWJueZdNHUAsdLJ
         wt+4RxyNLym7R7/tUKy+PfzLFw+SIg+s118V9yJcW9VONTk2CF+EJjIIbygwzWN0sA7Y
         qQthKi2lyGsM4jgMUOYXvbmdx9MjyD388tzs+scrplUUC0W47stzlhI7hRx0JCmU4Mhr
         aWduCAIveMgdQZ3OmOklBftxJKpgFVU53pz9UdRZjPVtTCkXXXt6hfasMcXQs3haStOZ
         6mAg==
X-Gm-Message-State: AJIora+aFKWokVNuz+ZQvCOQou5Y3JIqgxIsDo47YRLeJY8zQibIPcIc
	DyjhAHXrsQgExp5OpvYtGhGzDg==
X-Google-Smtp-Source: AGRyM1viOHWHl84VVlTGqpixiZ6FlTpaaah53khsejDs3LQ40SRGD8i9SytWAXzQY+IU7V1myB2eqQ==
X-Received: by 2002:a17:902:f10b:b0:16a:198f:bedb with SMTP id e11-20020a170902f10b00b0016a198fbedbmr14357909plb.16.1656329102608;
        Mon, 27 Jun 2022 04:25:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:25:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 2/4] media: mediatek: vcodec: dec: Set default max resolution based on format
Date: Mon, 27 Jun 2022 19:24:00 +0800
Message-Id: <20220627112402.2332046-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220627112402.2332046-1-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_042506_497685_82B0AB3C 
X-CRM114-Status: GOOD (  11.78  )
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

In commit b018be06f3c7 ("media: mediatek: vcodec: Read max resolution
from dec_capability") the driver ended up blindly setting the maximum
resolution to 1080p, even if the hardware and default output format
supported up to 4K. This would only be overridden by a subsequent
S_FMT call.

Correctly initialize the maximum resolution based on the default output
format.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec.c  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index fcb4b8131c49..f1b82d4c5be5 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -169,6 +169,16 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->sizeimage[0] = DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
 	q_data->bytesperline[0] = 0;
 
+	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+	    q_data->fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
+		mtk_v4l2_debug(3, "4K is enabled");
+		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
+		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
+	} else {
+		ctx->max_width = MTK_VDEC_MAX_W;
+		ctx->max_height = MTK_VDEC_MAX_H;
+	}
+
 	q_data = &ctx->q_data[MTK_Q_DATA_DST];
 	memset(q_data, 0, sizeof(struct mtk_q_data));
 	q_data->visible_width = DFT_CFG_WIDTH;
@@ -177,8 +187,6 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->coded_height = DFT_CFG_HEIGHT;
 	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
 	q_data->field = V4L2_FIELD_NONE;
-	ctx->max_width = MTK_VDEC_MAX_W;
-	ctx->max_height = MTK_VDEC_MAX_H;
 
 	v4l_bound_align_image(&q_data->coded_width,
 				MTK_VDEC_MIN_W,
-- 
2.37.0.rc0.161.g10f37bed90-goog


