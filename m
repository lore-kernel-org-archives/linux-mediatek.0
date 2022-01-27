Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F23C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuHXhhf6SjVK7MzLKdsMjACK81/ijWD882Q4zNplzeo=; b=b3lUIw9WMXECuG
	5DIOHGxiTUSZNEgTJl2yWB2X3AgdSdOS7OE/aZepwtiMpulQZy9StjeyBMlbSR4iC+bDTtVpb/8L/
	wqxETAvGUQkc/om5pBJldDTX9bW2bHxDJG9oyeyAMRvWhcons1RhZph7MO5zqYgDlYCxkKLjbN/fw
	OQZU9pSSzk0cm0uJwJooZ+zBj6XrNLlyjPDA6YMOvuUvJljU706A2c8eIURbBbZRPDL8Ibot2sNxx
	Z0RuCTcPvGUC5xRePflpgTEoAL7e4NOCaUuSiavcPp8ljY2Go8686eekrRVAEV+rW1cNjsn4xIMUE
	zK+pbm7Z9Ay8hp5A+YkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuyT-00E9yD-3P; Thu, 27 Jan 2022 02:57:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCuxf-00E9YU-K9; Thu, 27 Jan 2022 02:56:36 +0000
X-UUID: de5901dab6864bc19bceee58dd805e0d-20220126
X-UUID: de5901dab6864bc19bceee58dd805e0d-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1068351164; Wed, 26 Jan 2022 19:56:33 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 18:55:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 27 Jan 2022 10:55:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 10:55:55 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1,
 5/8] media: mtk-vcodec: Different codec using different capture format
Date: Thu, 27 Jan 2022 10:55:41 +0800
Message-ID: <20220127025544.10854-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127025544.10854-1-yunfei.dong@mediatek.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_185635_693609_5A64CBE6 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Vp8 need to use MM21, but vp9 and h264 need to use HyFbc mode
for mt8195. Vp8/vp9/h264 use the same MM21 format for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 6ad17e69e32d..f2ced0147534 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -35,6 +35,44 @@ mtk_vdec_find_format(struct v4l2_format *f,
 	return NULL;
 }
 
+static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
+{
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
+	const struct mtk_video_fmt *fmt;
+	struct mtk_q_data *q_data;
+	int num_frame_count = 0, i;
+	bool ret = true;
+
+	for (i = 0; i < *dec_pdata->num_formats; i++) {
+		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
+			continue;
+
+		num_frame_count++;
+	}
+
+	if (num_frame_count == 1)
+		return true;
+
+	fmt = &dec_pdata->vdec_formats[format_index];
+	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
+	switch (q_data->fmt->fourcc) {
+	case V4L2_PIX_FMT_VP8_FRAME:
+		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
+			ret = true;
+		break;
+	case V4L2_PIX_FMT_H264_SLICE:
+	case V4L2_PIX_FMT_VP9_FRAME:
+		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
+			ret = false;
+		break;
+	default:
+		ret = true;
+		break;
+	};
+
+	return ret;
+}
+
 static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
 					      enum v4l2_buf_type type)
 {
@@ -578,6 +616,9 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 		    dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
 			continue;
 
+		if (!output_queue && !mtk_vdec_get_cap_fmt(ctx, i))
+			continue;
+
 		if (j == f->index)
 			break;
 		++j;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
