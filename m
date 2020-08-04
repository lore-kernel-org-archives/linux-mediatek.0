Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6D9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:52:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44898206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXtNTMLw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XumVHIxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44898206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kl3qzsF5e/N7z80Nt2WmQT+ZNT/93mG0XC2+QtBx7cs=; b=FXtNTMLw5cRmqV4CGWbxJK8DQ
	YqeceF1GUdUo32M+cMzDTEz5d4BqiEk17f9yqVQQSzSMiG6IWj5Fx/a3/HWsuQO0nPXpWaIYPayC1
	uz+2KvqXMV/QNrHt9hH7y56VacXDQgMhykXQoiOZiKzcyNmuiqQIqu8yD/RmOkneDOXY5JrPyFaS5
	1QTUp+IYl90T7l6tL6Q0Uds7tQK/po5LZNeHwj0z3zCF2Xe9kIo0MR2BN+TAZZYqPa49aLsO54RMJ
	Ef8EOdGp5hoUVa8EWnPY+KlFwvGPEK+m2Mv406gVikkFOoIbXPOd8ekstgMwFX1mfHGsJWs+1fBj0
	ob/BgfaEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2o0D-0001b4-CL; Tue, 04 Aug 2020 03:52:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nzW-0001BY-6J; Tue, 04 Aug 2020 03:51:56 +0000
X-UUID: 71cf6d6bab8d481aa90eca97c3241643-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k20Imll3mFuaXvAX4eUIHQnObVq0eM6kD80gXzk30Vo=; 
 b=XumVHIxVJpr2Lj37DloeBctAwA7vu+WlAmQ51SJtie4qWUku8dQNMiKiSrGyF1mDq0pka4cWlRmiOAwSaowAUoY5YPIuhhQ6dOQaT9ILCzQNeGEABfptBQ/kpgA1Uz1VqtIr/Gx6fqP/RfsDetCrd1T59ocPMJVdf7Se7xyeuc8=;
X-UUID: 71cf6d6bab8d481aa90eca97c3241643-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1306845646; Mon, 03 Aug 2020 19:51:46 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:42:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:04 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v11 20/28] media: platform: Change the colorspace of jpeg to
 the fixed value
Date: Tue, 4 Aug 2020 11:40:54 +0800
Message-ID: <20200804034102.22983-21-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_235154_900891_DAA8778B 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Jpeg doesn't support colorspace conversion, so it shouldn't accept any
other colorspace in S_FMT.
Change the colorspace of jpeg to the fixed value.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v11: no changes
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 01f4656fe2b3..0376bd3bdbbb 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -320,10 +320,10 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 					   pix_mp->pixelformat, fmt_type);
 	q_data->pix_mp.width = pix_mp->width;
 	q_data->pix_mp.height = pix_mp->height;
-	q_data->pix_mp.colorspace = pix_mp->colorspace;
-	q_data->pix_mp.ycbcr_enc = pix_mp->ycbcr_enc;
-	q_data->pix_mp.xfer_func = pix_mp->xfer_func;
-	q_data->pix_mp.quantization = pix_mp->quantization;
+	q_data->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	q_data->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	q_data->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
+	q_data->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev, "(%d) s_fmt:%c%c%c%c wxh:%ux%u\n",
 		 f->type,
@@ -846,10 +846,10 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
 	int i;
 
-	q->pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
-	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	q->pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
-	q->pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
 
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
 				      V4L2_PIX_FMT_JPEG,
@@ -863,10 +863,10 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
 				      V4L2_PIX_FMT_YUV420M,
 				      MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
-	q->pix_mp.colorspace = V4L2_COLORSPACE_JPEG,
-	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	q->pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
-	q->pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
