Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112A3C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 01:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIo8KPUlpPNqfHS68SSFf2vAusregks14Dyr/xVu2iQ=; b=3zmd8Z2SXcx3Uv
	a9oa/KlTDA7NdXj+dOBiGplKlIkhaflYLVO53imqvI/GMcK7xcirmKQKoCxObVzPTsylOrQIGRnIX
	UufkNg6aBtM5GlAVDVTgm0xhwuHCkmW9dtEzbP0qIVOrxPr1xkpi6ILbZlMCka017Iw9cBlYKYPui
	JSUNSiRc0Xo3lLAUys7b78Wp5yck5EFIk0K5BdfZkLeD2ERChyBuI2iskyUiZH8++0GJhreR7zLne
	t7ifvyPEWvJpbhRr9STlYpqq3y5s8uMbhsGuWtgAZjdE9zPAdJ9D37/Pllakwg6IbBam4oeJgeEF4
	D9QrV2yoz/IGHr3m54+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn9hc-005gri-KK; Sat, 07 May 2022 01:57:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn9gU-005gCS-3z; Sat, 07 May 2022 01:56:39 +0000
X-UUID: 66240891df7045808a67dee8aeaabecb-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8638d8ac-c49c-47c3-9a55-b60e2e03ad01, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3e548516-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 66240891df7045808a67dee8aeaabecb-20220506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1835405866; Fri, 06 May 2022 18:56:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 18:46:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 7 May 2022 09:46:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 7 May 2022 09:46:28 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,
 5/7] media: mediatek: vcodec: Different codec using different capture
 format
Date: Sat, 7 May 2022 09:46:16 +0800
Message-ID: <20220507014618.29412-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507014618.29412-1-yunfei.dong@mediatek.com>
References: <20220507014618.29412-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_185638_174356_16864AF3 
X-CRM114-Status: GOOD (  13.83  )
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
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 3859e4c651c6..d0f2dedcc911 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
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
@@ -577,6 +615,9 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
 		    dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
 			continue;
 
+		if (!output_queue && !mtk_vdec_get_cap_fmt(ctx, i))
+			continue;
+
 		if (j == f->index)
 			break;
 		++j;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
