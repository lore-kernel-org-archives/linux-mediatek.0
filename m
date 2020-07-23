Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D745C433E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE4C120723
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVlFoAqs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NKiH+zBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE4C120723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iqO5XKXCInuhV/p74EP1friAsp/fmNxUGdLdGn+8u9E=; b=mVlFoAqs9ZaFYDQ/3Wqr2dV71
	cBu579r7i0u2zRU+pV6ev9kFn1c7xZatmFuAu2OnFjAmg3Wlr4nyujtj8qaiQft9qcsOWkZ9X95Cu
	HrUH75UZs6JIWrdLLV8VC3Rm24NXdD+s73YWxFObAUmwGHvwylW0C/mtwDdu1u3PXhEgWMLoEmKN0
	3qcDXS27V6PS61fhdp5RLYUUcRUnAaY07Lisi/9GeR+L6cEwEwshr8SVIiCUnmSRvaO0FaNOB4j2E
	ffODu7BBhEJK7oRI0L7UZRRbmk7eiG7h8trvyc8Buey90mgF38a98SsFONeDhkMUIkgXxczz7YhFF
	0sp6niR4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRlK-000670-Mt; Thu, 23 Jul 2020 03:19:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRin-0004yz-AR; Thu, 23 Jul 2020 03:16:38 +0000
X-UUID: 69f573ed93a84bf48fae054c9ee8428f-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5qxiN19UNnnzIWoPjqLAZDNGGcHWrAH9dd/CpJtMBoQ=; 
 b=NKiH+zBHphoSOiX92f9Z2o9k7GbsMBdP9nB7Xteg0ll5O2G0f9ORzz+rBZm2slPArfcl4zqHpsLHzzk27mwQbaogMRweBzxyOVT55bWP3NpAndrwYOye0nG7l6D/Ke9XZl2Ll8gEk0zrvPV2r8/xihRVkrROt29b41s53d4eQd0=;
X-UUID: 69f573ed93a84bf48fae054c9ee8428f-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 511347258; Wed, 22 Jul 2020 19:16:26 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:32 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 21/28] media: platform: Refactor
 mtk_jpeg_set_default_params()
Date: Thu, 23 Jul 2020 11:04:44 +0800
Message-ID: <20200723030451.5616-22-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_231637_537936_1A68CFF0 
X-CRM114-Status: GOOD (  10.45  )
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

Call mtk_jpeg_try_fmt_mplane() to replace the original computation of
sizeimage and bytesperline, because that mtk_jpeg_try_fmt_mplane()
already did it.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: new add patch
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 0376bd3bdbbb..7881e9c93df7 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -844,7 +844,6 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
-	int i;
 
 	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
 	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
@@ -856,8 +855,7 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 				      MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
-	q->pix_mp.plane_fmt[0].bytesperline = 0;
-	q->pix_mp.plane_fmt[0].sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
+	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
 
 	q = &ctx->cap_q;
 	q->fmt = mtk_jpeg_find_format(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS,
@@ -870,13 +868,7 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
 	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
 
-	for (i = 0; i < q->fmt->colplanes; i++) {
-		u32 stride = q->pix_mp.width * q->fmt->h_sample[i] / 4;
-		u32 h = q->pix_mp.height * q->fmt->v_sample[i] / 4;
-
-		q->pix_mp.plane_fmt[i].bytesperline = stride;
-		q->pix_mp.plane_fmt[i].sizeimage = stride * h;
-	}
+	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
 }
 
 static int mtk_jpeg_open(struct file *file)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
