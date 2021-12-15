Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDF6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hPv0gHBuLHB2Ra9pb2VIY39dwAg49ZSnilw8ieZDvc=; b=hWov+oO/J134b5
	84P+DCV1lq5cNsm+mHbQyAaBo8nOGm3CENq9r/lf/ROdH4/LogqoV7jRx01P3iEdcKsUTbrIufsVv
	VK5dJvH9v1yIYvOL8YkGUdcD/eDCvFAyehOYk5peC6EmZYB8LqleOOFTR/uaK+PvJ6JyCxmr1TCBX
	hu1mPWlgcR8sCY098AqlB+4oPXeqF26ufBIhUk5pK+sR1tpcOZtM/zjra87iIkJI3tAwI4pW5/p8K
	rq2t9i3BpZjTbDvquDG4qZL8zXL6aeWrwOSNN0sdgLnziYx4hG9l33slpoRxwNQjus+gWvQW/FtBS
	7tTdrLMvQT9kxE2wyOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxNr7-00GtQA-12; Wed, 15 Dec 2021 06:33:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxNjr-00Gpa1-PC; Wed, 15 Dec 2021 06:26:09 +0000
X-UUID: 4c621ab1c0b84d8eab9c10c75b0a4f29-20211214
X-UUID: 4c621ab1c0b84d8eab9c10c75b0a4f29-20211214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2063526933; Tue, 14 Dec 2021 23:26:05 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 22:16:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Dec 2021 14:16:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 14:15:59 +0800
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
Subject: [PATCH v14, 05/19] media: mtk-vcodec: Support MT8192
Date: Wed, 15 Dec 2021 14:15:38 +0800
Message-ID: <20211215061552.8523-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215061552.8523-1-yunfei.dong@mediatek.com>
References: <20211215061552.8523-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_222607_836522_BB2AFE30 
X-CRM114-Status: GOOD (  11.87  )
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

Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
Adds MT8192's device private data mtk_lat_sig_core_pdata.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.h   |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c     |  4 ++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c        | 16 ++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 46783516b84a..e30806c1faea 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -67,6 +67,7 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 3ac4c3935e4e..b7a51e96d4ba 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -393,6 +393,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
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
index 8f4a1f0a0769..26e4d6f4ec04 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -358,3 +358,19 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
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
