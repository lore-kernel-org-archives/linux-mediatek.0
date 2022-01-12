Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D10C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0gKtdU5m6GbqQsZn5Mj1E/52h7UP+LvZ4eYLnwxEME=; b=XabP0LKZylpdUS
	4wEY+DNhWEMpBJ4aVJzOVO0dsyjtxT3ln61xOPIT/f8fhNfF1Q5Y+p/dGPCNUOh6bA86qDTyhN7ta
	5ZqH0pYG2DtQpfGtBg5gil8Bmj5w9xc19jGCVTYtUt7FESm66iVKoPNkOJvpisLrRgUknuNhY/7Fr
	0bSd1zOOkqhsPu/vQ2FwV0+mTalk/Ynqr1PPR67OPN8Nxlo+EIIoM6omotKevbCq4/pOLGdTFKetz
	m+UWDgwDVtYgyJs99snBGuZLZTT2EEYXqzWmGjuE84P5T+n7dkPbNK6YlMtybEP0KKI1VJz7jGQyq
	Lu2oq4fb7o3k7eXr8HoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7aM0-001ssU-9v; Wed, 12 Jan 2022 09:55:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7aLN-001sch-2c; Wed, 12 Jan 2022 09:55:02 +0000
X-UUID: 1ff81724505b4120a78b51ac9f099af6-20220112
X-UUID: 1ff81724505b4120a78b51ac9f099af6-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1506292915; Wed, 12 Jan 2022 02:54:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 01:49:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 12 Jan 2022 17:49:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:49:32 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho <stevecho@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v18, 05/19] media: mtk-vcodec: Support MT8192
Date: Wed, 12 Jan 2022 17:49:09 +0800
Message-ID: <20220112094923.16839-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112094923.16839-1-yunfei.dong@mediatek.com>
References: <20220112094923.16839-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_015501_147007_1146331E 
X-CRM114-Status: GOOD (  13.48  )
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

Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
Adds MT8192's device private data mtk_lat_sig_core_pdata.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.h   |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c     |  4 ++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c        | 16 ++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index e08886a600a3..66cd6d2242c3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -68,6 +68,7 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index af235fa4c487..c17927f79e22 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -392,6 +392,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8183-vcodec-dec",
 		.data = &mtk_vdec_8183_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8192-vcodec-dec",
+		.data = &mtk_lat_sig_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 3d9f47555884..183cd67a334a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -357,3 +357,19 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
 };
+
+const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
+	.chip = MTK_MT8192,
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = NUM_FORMATS,
+	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
+	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.vdec_framesizes = mtk_vdec_framesizes,
+	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
