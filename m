Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62159C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzgHvxX4suLNdf1qFV/p7L0tXMGHaTG14SSEJaLhH+8=; b=3hPWfXQnjtN+QTyZdPDSN/WXPn
	BCLJI8vd9F714xo0BtQNIk+LhA4kjmV4gpK9dmiVDTYJuhRxJwckqTk0KLT5vLPwCSc1vkyYIoNZM
	sB3/TX10QnZcBajMxpUklSmwBIGk4tPKby8J9gDhrV7iIVGzU160nm6CYylfthoT9dQJwXbjVcdBu
	WLJe4mmI/FX2kDrnasNUDTtj2gVeeUgcvd+BmwbwCCxaahZXFS9o9WNVhnlxM4EvMqgFSbtuY3ZJW
	kINNjRQRp/3FarIuGW66cTwLIVTdrCSrwmxfWKWXCq/+lVD50V9Dxa7bUDrbr7wSIs/Da5SiAeTmR
	zffWHB7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCle-008cfX-1G;
	Mon, 20 Mar 2023 10:29:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peClb-008cdm-2t;
	Mon, 20 Mar 2023 10:29:29 +0000
X-UUID: 122d01aec70a11edb5598346aad47b14-20230320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VzgHvxX4suLNdf1qFV/p7L0tXMGHaTG14SSEJaLhH+8=;
	b=YKa8+AbYqJJlmfnu6lWW0bhYbKGMLn3vzZ5loPq1ZgljmxKKV1p+0l2X5WtNXk1rHyaXlAXdSxIXk0cN1jWkDnzhLUt7lUGOa5Nv8sZrM113o6zxbKG1IdiBWFPuPo02zkv/iPCOLfPiXjvhupIipl6jdX5J7dSF67tMMKD6WkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:9b385a60-437b-41c8-83a7-7af36e897755,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:8c87c8b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 122d01aec70a11edb5598346aad47b14-20230320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 30307581; Mon, 20 Mar 2023 03:29:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 20 Mar 2023 18:28:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 20 Mar 2023 18:28:43 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/6 RESEND] media: mediatek: vcodec: Get get each instance format type
Date: Mon, 20 Mar 2023 18:28:36 +0800
Message-ID: <20230320102838.8313-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320102838.8313-1-yunfei.dong@mediatek.com>
References: <20230320102838.8313-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_032927_942576_5E5293E5 
X-CRM114-Status: GOOD (  10.09  )
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

Adding echo command to get capture and output queue format type:
'echo -format > vdec'

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index 9e7d57d21cea..8a03f986a857 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -10,6 +10,34 @@
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
 
+static void mtk_vdec_dbgfs_get_format_type(int output, int capture)
+{
+	switch (output) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		pr_info("output format: h264 slice\n");
+		break;
+	case V4L2_PIX_FMT_VP8_FRAME:
+		pr_info("output format: vp8 slice\n");
+		break;
+	case V4L2_PIX_FMT_VP9_FRAME:
+		pr_info("output format: vp9 slice\n");
+		break;
+	default:
+		pr_info("unsupported output format: 0x%x\n", output);
+	}
+
+	switch (capture) {
+	case V4L2_PIX_FMT_MM21:
+		pr_info("capture format MM21\n");
+		break;
+	case V4L2_PIX_FMT_MT21C:
+		pr_info("capture format MT21C\n");
+		break;
+	default:
+		pr_info("unsupported capture format: 0x%x\n", capture);
+	}
+}
+
 static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
 				    size_t count, loff_t *ppos)
 {
@@ -33,11 +61,17 @@ static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
 				ctx->picinfo.pic_w, ctx->picinfo.pic_h,
 				ctx->picinfo.buf_w, ctx->picinfo.buf_h);
 		}
+
+		if (strstr(buf, "-format")) {
+			str_count++;
+			mtk_vdec_dbgfs_get_format_type(ctx->current_codec, ctx->capture_fourcc);
+		}
 	}
 
 	if (!str_count) {
 		pr_info("\t can not found useful cmd: %s\n", buf);
 		pr_info("\t -picinfo	     ex. echo -picinfo\n");
+		pr_info("\t -format	     ex. echo -format\n");
 	}
 
 	return count;
-- 
2.25.1


