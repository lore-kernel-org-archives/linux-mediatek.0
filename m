Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E38C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 09:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8382077D
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 09:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yz9cOraH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ky4MTSmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8382077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHCNlvQGscsv4IQX3yjTvr+IrqwnUDajOlfHORFrO3g=; b=Yz9cOraH1bookF
	+f8Rct7FYoZOc8fL1/weTw1rwfzrbsSpsP0kKG/uUsm1uatab8np6st3VkABS4vH3wVqE1HNooRWQ
	JMkYSqPsyqwtJSqroO86Jhs/IFBkyt5TGClNeCu03B0FNxsodBgb8OoWzhccqljalMsbE9bL/8hqX
	JRasK8C+Cuob/4LzaoLp2wA9ku+FUdK5gAjbjMGX0quDJTyko6l0rIonyYc+s4euVl93CkShqHJTd
	gzbPeYcH5k10YLmVDa3Xapo7LVOku13Q7xj+bQo5NvNpX1NKH4u9R+iXn8NKMCwRcxRraRUvLQljq
	gbKhAhY3r9QJfWj4p3Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgltt-0003TR-Ux; Thu, 04 Jun 2020 09:11:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jglrF-0006xq-El; Thu, 04 Jun 2020 09:08:19 +0000
X-UUID: 220aedc5c82245d58109aabade4b9331-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pwxgK1X1XdIdmyvhCdOXj7GI0xWZ4kTcpeu8OdlT4i0=; 
 b=Ky4MTSmoXb74oZrlecKrnD5Y5kGMmh+1kNuHBUR3Ajk8DGJZv930559TIrnTSKpcL0YTXXOTCLwz3P1iXJaX3351foCuYL784FYKBRch7K63VARMVBsI8Xhg6MDpX7TKJdL+YkxtD3I5N6/9UUQ9sdY9aXkqEnDQTWACm9yXhE4=;
X-UUID: 220aedc5c82245d58109aabade4b9331-20200604
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 669344831; Thu, 04 Jun 2020 01:08:09 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 02:08:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:09 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH RESEND v9 09/18] media: platform: Delete zeroing the reserved
 fields
Date: Thu, 4 Jun 2020 17:05:44 +0800
Message-ID: <20200604090553.10861-11-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_020817_515601_C0A8F092 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Delete zeroing the reserved fields because that the core already
does it.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v9: new patch
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index bb4ebce881ee..bd1cc58324c6 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -198,7 +198,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
-	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
 	pix_mp->field = V4L2_FIELD_NONE;
 
 	if (ctx->state != MTK_JPEG_INIT) {
@@ -217,7 +216,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
 					   MTK_JPEG_MAX_HEIGHT, 0);
 
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = 0;
 		/* Source size must be aligned to 128 */
 		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
@@ -237,7 +235,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
 		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
 		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
 
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 		pfmt->bytesperline = stride;
 		pfmt->sizeimage = stride * h;
 	}
@@ -270,7 +267,6 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 
 	q_data = mtk_jpeg_get_q_data(ctx, f->type);
 
-	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
 	pix_mp->width = q_data->w;
 	pix_mp->height = q_data->h;
 	pix_mp->field = V4L2_FIELD_NONE;
@@ -294,7 +290,6 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 
 		pfmt->bytesperline = q_data->bytesperline[i];
 		pfmt->sizeimage = q_data->sizeimage[i];
-		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
 
 		v4l2_dbg(1, debug, &jpeg->v4l2_dev,
 			 "plane[%d] bpl=%u, size=%u\n",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
