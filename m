Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C73EC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 07:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3242074B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 07:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kq/l0jcH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XuDlKBSE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3242074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KjOS33MatA4khotZNaWDjTz8+1QtpCG3UNopa7FQ5w=; b=kq/l0jcHAHdJ/l
	yHiBj/PSLpL06KayeIkZlWbakSsBQt6Jn/P89LxRROgm51W/XqTmUyoZCN0k93YO4rm8own3pdZeo
	3EmjBoFzYf/pFBAgbVsbkWtZ3O2+eTgVg9WqMDRXzEnrirusKYsDPLvDONLIULEt0PnKeetOErKMz
	KdjU/K3m1G/uH6B2VLeKGzP6ZdFHv3yhef36GrD3h+CAse34W2x0kTWbI78mpI3Uk1v8yz2d5QpHP
	TkSxQ+qd/Tz4x9KwSpkHj3bav7uIF8Cp+D6TWOweDu7vPpndeVxeqFTQszVe9N5CGDqbbP2NTEg4e
	vtH3bgGBxEaMG3igXoIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgkMP-0007lc-Aj; Thu, 04 Jun 2020 07:32:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgkM8-0007Uk-HO; Thu, 04 Jun 2020 07:32:06 +0000
X-UUID: 690efa9003344e7190b78c236a027adf-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CwLZiApyK6bUNwQh1RXzmg2IHc9+21e/FaYfMkX4XA8=; 
 b=XuDlKBSEYjRrSX4YDuF4LS7v2hVMBNTZ4HUylpF1lMyHEZ5Wuli6/QsZ6eocONUlee3hXOiRw57W3222CG5Z5CBBTGnnqmu7S8dPws4izXYHrjGI0DE6UHM3XK9P6oEJcvQKhsF6JkNvij9WhV8ceYVPx4kOoofZ/mXq4DkESTo=;
X-UUID: 690efa9003344e7190b78c236a027adf-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 737148564; Wed, 03 Jun 2020 23:31:53 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 00:29:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:26 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:25 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v9 11/18] media: platform: Use generic rounding helpers
Date: Thu, 4 Jun 2020 15:27:01 +0800
Message-ID: <20200604072708.9468-12-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604072708.9468-1-xia.jiang@mediatek.com>
References: <20200604072708.9468-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_003204_578673_1338709F 
X-CRM114-Status: GOOD (  11.88  )
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
 senozhatsky@chromium.org, sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use clamp() to replace mtk_jpeg_bound_align_image() and round() to
replace mtk_jpeg_align().

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v9: change the patch title description
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 41 +++++--------------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c |  8 ++--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h |  5 ---
 3 files changed, 15 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index bd1cc58324c6..c9c0357b2d6c 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -151,25 +151,6 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
 	return NULL;
 }
 
-static void mtk_jpeg_bound_align_image(u32 *w, unsigned int wmin,
-				       unsigned int wmax, unsigned int walign,
-				       u32 *h, unsigned int hmin,
-				       unsigned int hmax, unsigned int halign)
-{
-	int width, height, w_step, h_step;
-
-	width = *w;
-	height = *h;
-	w_step = 1 << walign;
-	h_step = 1 << halign;
-
-	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign, 0);
-	if (*w < width && (*w + w_step) <= wmax)
-		*w += w_step;
-	if (*h < height && (*h + h_step) <= hmax)
-		*h += h_step;
-}
-
 static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 				       struct v4l2_format *f)
 {
@@ -211,24 +192,24 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
 		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
 
-		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
-					   MTK_JPEG_MAX_WIDTH, 0,
-					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
-					   MTK_JPEG_MAX_HEIGHT, 0);
+		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
+				       MTK_JPEG_MAX_HEIGHT);
+		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
+				      MTK_JPEG_MAX_WIDTH);
 
 		pfmt->bytesperline = 0;
 		/* Source size must be aligned to 128 */
-		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
+		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
 		if (pfmt->sizeimage == 0)
 			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
 		goto end;
 	}
 
 	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
-	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
-				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
-				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
-				   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
+	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
+			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
+	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
+			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
 
 	for (i = 0; i < fmt->colplanes; i++) {
 		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
@@ -734,8 +715,8 @@ static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
 {
 	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
 	bs->end_addr = bs->str_addr +
-			 mtk_jpeg_align(vb2_get_plane_payload(src_buf, 0), 16);
-	bs->size = mtk_jpeg_align(vb2_plane_size(src_buf, 0), 128);
+		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
+	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
 }
 
 static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
index ddf0dfa78e20..68abcfd7494d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
@@ -153,10 +153,10 @@ static int mtk_jpeg_calc_dst_size(struct mtk_jpeg_dec_param *param)
 				param->sampling_w[i];
 		/* output format is 420/422 */
 		param->comp_w[i] = padding_w >> brz_w[i];
-		param->comp_w[i] = mtk_jpeg_align(param->comp_w[i],
-						  MTK_JPEG_DCTSIZE);
-		param->img_stride[i] = i ? mtk_jpeg_align(param->comp_w[i], 16)
-					: mtk_jpeg_align(param->comp_w[i], 32);
+		param->comp_w[i] = round_up(param->comp_w[i],
+					    MTK_JPEG_DCTSIZE);
+		param->img_stride[i] = i ? round_up(param->comp_w[i], 16)
+					: round_up(param->comp_w[i], 32);
 		ds_row_h[i] = (MTK_JPEG_DCTSIZE * param->sampling_h[i]);
 	}
 	param->dec_w = param->img_stride[0];
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
index 9c6584eaad99..7b0687f8f4b6 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
@@ -54,11 +54,6 @@ struct mtk_jpeg_dec_param {
 	u8 uv_brz_w;
 };
 
-static inline u32 mtk_jpeg_align(u32 val, u32 align)
-{
-	return (val + align - 1) & ~(align - 1);
-}
-
 struct mtk_jpeg_bs {
 	dma_addr_t	str_addr;
 	dma_addr_t	end_addr;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
