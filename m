Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A81FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mu0K2f455RiKxumx5vD+/pZBXQChYIagGzSjzSngBm0=; b=ck7wlsYKSdEJUtj1w/oEI9sdoa
	v49HnnhHwWqcgzQoOewdVbgXkVJW+UzOsFLPCRbRneID/0hXeE/Q67fMtStFjDQTEd7g6X244Q/Sr
	lqRT3JLHOe3SHlxvjKUPEB8LsBnn32eYyWlw7NUMo/ilIdMY680yoYRPKYEjnKZ9ZR0s8xeWW5eEH
	OmoEtyJ3bjKOVlrzZ+tyyYvmsnR+Cmr4wVcM41hC3sUI7GbUK9x/Nv43J5PPBXYEzvvcK2BpMY4bN
	sVeEdEQPLI1v/t8MRUikeGZZVsKnrgV2MziCxTEO9s+f9nbJxSTFGCccn6g/yxea1sWswvGlhvRPx
	7i8N+0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IT-007LRW-86; Wed, 06 Jul 2022 08:22:09 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IO-007LM6-T7
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 08:22:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id q82so6270291pgq.6
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mu0K2f455RiKxumx5vD+/pZBXQChYIagGzSjzSngBm0=;
        b=IkoTUqFiTmQZXtRFGpGLXQ4ml/3Z6/OBUz2WSlHak9MOD3hgcxye6EFaXNayZrAqrD
         DL4w3r4d5R16hnZEiRzcpl55Yl71jz0rLwHdPu3psiEANvb4Ak8I8a9b7vGQul864/v+
         uK8Nm/r9LKUBqk/NQBwElbsdhHk/454R/QlVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mu0K2f455RiKxumx5vD+/pZBXQChYIagGzSjzSngBm0=;
        b=SqpxlYHI4SEJgk8ZCZRfzVatD5VododHfz91OqC4LY/3uEQb/YmAgNjGULtOPIRCDV
         YoZ8rfmJq+3ZPCZezeufsbGZsw9V1DEJlH2u71A1X7KsohPrVcZmsCjziP3NKhsA/ObC
         eGyYoyJsvBpIo/U4vAediVpkQJ1GdWy8nEFEHQlED8/97NmKPhIo5rtO1/KNOPtMhc+Y
         CSorO0jTNrtMupLm5ihWeih97OTATM5uMpTmXtvCdLCri7XUlq6orvbebdsIOqjeyRYO
         xy5lImSVn16M7ZqyNYyzdmliX/RxfBZQa0CA5hu60pxV5OkRYyYfhjSTJuxZh8od6GTN
         Jxug==
X-Gm-Message-State: AJIora8It2YNWkl2waemuLlt+IyCIQ9LwWsjSwAEo0ugj2LPwtgmQ+lX
	4iUPQN0ScoFejB5qpca4rs82mA==
X-Google-Smtp-Source: AGRyM1vHLjJtUAAMKtGVRWIY3QAluyKTCS5Lmqxp1AvtumrW0o/Cqy6NG/Xj5zwHDstMtEEaF4H9qg==
X-Received: by 2002:a63:6984:0:b0:40d:9ebe:5733 with SMTP id e126-20020a636984000000b0040d9ebe5733mr33885451pgc.170.1657095722163;
        Wed, 06 Jul 2022 01:22:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74a3:a7a4:af57:d7f])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm20767040pjb.2.2022.07.06.01.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:22:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 2/6] media: mediatek: vcodec: decoder: Fix 4K frame size enumeration
Date: Wed,  6 Jul 2022 16:21:34 +0800
Message-Id: <20220706082138.2668163-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706082138.2668163-1-wenst@chromium.org>
References: <20220706082138.2668163-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_012204_979785_5E2B8F20 
X-CRM114-Status: GOOD (  15.12  )
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

This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
Read max resolution from dec_capability"). In this commit, the maximum
resolution ended up being a function of both the firmware capability and
the current set format.

However, frame size enumeration for output (coded) formats should not
depend on the format set, but should return supported resolutions for
the format requested by userspace.

Fix this so that the driver returns the supported resolutions correctly,
even if the instance only has default settings, or if the output format
is currently set to VP8F, which does not support 4K.

This adds an copy of special casing for !VP8 and 4K support. The other
existing copy will be removed when .max_{width,height} are removed from
|struct mtk_vcodec_ctx| in a subsequent patch.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c    | 2 --
 .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 +++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 5d6fdf18c3a6..fcb4b8131c49 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -595,8 +595,6 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
 
-		fsize->stepwise.max_width = ctx->max_width;
-		fsize->stepwise.max_height = ctx->max_height;
 		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
 				ctx->dev->dec_capability,
 				fsize->stepwise.min_width,
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index f1c0276c9026..5da9901e93a3 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -360,6 +360,13 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 
 		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
 		mtk_vdec_framesizes[count_framesizes].stepwise = stepwise_fhd;
+		if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+		    fourcc != V4L2_PIX_FMT_VP8_FRAME) {
+			mtk_vdec_framesizes[count_framesizes].stepwise.max_width =
+				VCODEC_DEC_4K_CODED_WIDTH;
+			mtk_vdec_framesizes[count_framesizes].stepwise.max_height =
+				VCODEC_DEC_4K_CODED_HEIGHT;
+		}
 		num_framesizes++;
 		break;
 	case V4L2_PIX_FMT_MM21:
-- 
2.37.0.rc0.161.g10f37bed90-goog


