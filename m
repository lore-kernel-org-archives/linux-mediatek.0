Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1A1C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMcsDBNWBREStH35HB2OhDvVYxMFa8VdX15TyxtmJp0=; b=S32wH/qajyJe3V
	n4CUKkbl+z2Y9RW0HqpPdDpKudfNpIMEe1+Syt8o8QOY6AQvMVQySP5GKvfUIIe9B1Cs8gZoTomt6
	iRWey6ymnTJqudiMewZBWo87kaCiai7CsTZuC4LoEeBcWxUX0eGmpB4IfFFJPOSWxnlNXIziPwUkT
	F4Qm6B6sut+JTUpLgXa7av0VWPsePZiS5Zim+D1n25cjbVCvIteLXcVO5ZTSK0Mzv9AGwAwG+jozU
	hNWq0J11zutv0yxQVDQlTbDbshT45DkxyS6LTXDWdbuJJAiMefuqstFJ1kDIBFQ3FUuwi+GX4zH4y
	9MjbATsgfCT08i52E2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxOaX-00H9nX-IE; Wed, 15 Dec 2021 07:20:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxOQ6-00H61c-7Q; Wed, 15 Dec 2021 07:09:47 +0000
X-UUID: b4bad539416f4ef7abec789ebad8961c-20211215
X-UUID: b4bad539416f4ef7abec789ebad8961c-20211215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1307919430; Wed, 15 Dec 2021 00:09:42 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 22:59:47 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Dec 2021 14:59:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 14:59:38 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 08/12] media: mtk-vcodec: Add format to support MT21C
Date: Wed, 15 Dec 2021 14:59:22 +0800
Message-ID: <20211215065926.8761-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215065926.8761-1-yunfei.dong@mediatek.com>
References: <20211215065926.8761-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_230946_292128_67844627 
X-CRM114-Status: GOOD (  14.87  )
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

From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Needs to use mediatek compressed mode for mt8192 decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c   | 7 ++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h         | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 01bb96f3b30e..21895fbed4c5 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -81,7 +81,7 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
 
 #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
 
-static struct mtk_video_fmt mtk_video_formats[2];
+static struct mtk_video_fmt mtk_video_formats[3];
 static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
 
 static struct mtk_video_fmt default_out_format;
@@ -361,6 +361,7 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
 		num_framesizes++;
 		break;
 	case V4L2_PIX_FMT_MM21:
+	case V4L2_PIX_FMT_MT21C:
 		mtk_video_formats[count_formats].fourcc = fourcc;
 		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
 		mtk_video_formats[count_formats].num_planes = 2;
@@ -387,6 +388,10 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
 		cap_format_count++;
 	}
+	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MT21C) {
+		mtk_vcodec_add_formats(V4L2_PIX_FMT_MT21C, ctx);
+		cap_format_count++;
+	}
 	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
 		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
 		out_format_count++;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 077352453759..773887578454 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -362,6 +362,7 @@ enum mtk_vdec_hw_arch {
  */
 enum mtk_vdec_format_types {
 	MTK_VDEC_FORMAT_MM21 = 0x20,
+	MTK_VDEC_FORMAT_MT21C = 0x40,
 	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
