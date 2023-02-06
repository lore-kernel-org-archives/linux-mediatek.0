Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BEDC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pQGKOjFD0EPNmzhVI3is/MPjDoOLrtnUT5IvptZW2g=; b=prjRVnGkfoj87IKPnvHxnyOXf8
	wa2zqIg3ap4Kebyn2TfkFimQNte3bj5Idrb0eu9r0hbF2zvIQc8Fsc5FuQ8hHgdrYk0unNzcQCf5X
	hB8jDNKUOuCdiyPnSthet8W/TMUHuMVeSAnxAFbYI1rbTHd0DDgod4UAVt4eAQHyIAUr76P/8taXh
	2T5JD6IPIvM7ZJPnJhY1kbBSzjlJzAHozyd6+i91k0p16OmwkjRVw4Mk6tEk3on5Uri4pfkWt2M9z
	XmozSuhnpSzluQuQHdT6J2+dJmgQAIBk17a3zHGieba2Bss05KH3p6bE6Uiys3g6+qxKSgnV4yhHa
	LEK1OGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0IN-008QF9-V5; Mon, 06 Feb 2023 12:08:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0Hp-008Pwz-Ai; Mon, 06 Feb 2023 12:07:54 +0000
X-UUID: df2b3366a61611edbbe3f76fe852e059-20230206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2pQGKOjFD0EPNmzhVI3is/MPjDoOLrtnUT5IvptZW2g=;
	b=KwCB2xvoPlyEO8zcGeJa1fGnz1hosiJgDC1ZdUwVjU86lMdbW/G5RLCeRVgpejDmdKXc49O7bCUWH8BAIeXTB5ZLDt//k2i0aiC7MygsLDxim1JLIh3hoEgUv0yHGC/mk+aKm6MgV0ujb5xEy8C2Rv/iN9skiCj0BmFZ4LyBUGM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:c32d702e-d0e4-41b9-b84e-540a5db3bcce,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.19,REQID:c32d702e-d0e4-41b9-b84e-540a5db3bcce,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:885ddb2,CLOUDID:66667356-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230206200750OR2F9LCF,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: df2b3366a61611edbbe3f76fe852e059-20230206
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 280188326; Mon, 06 Feb 2023 05:07:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 6 Feb 2023 20:07:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 6 Feb 2023 20:07:13 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	<frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	<stevecho@chromium.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/6] media: mediatek: vcodec: Get get each instance format type
Date: Mon, 6 Feb 2023 20:07:06 +0800
Message-ID: <20230206120708.19631-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206120708.19631-1-yunfei.dong@mediatek.com>
References: <20230206120708.19631-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040753_401271_59F826FA 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
2.18.0


