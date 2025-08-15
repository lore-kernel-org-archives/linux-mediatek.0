Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA942CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rm7Nhb2K/2gPlpeW1wJWXwMgl81JmjYlQu1duohB3E=; b=uSh19lOwFq0LzqwwhyuNq9rDsH
	xvff1SH3AzIhu19o9En/NP1X1F/RLx0lM//B4Ho1jx7PuEuZf1Dvt2+sw8+1JojvBKfbt0Yj2a3vz
	g1fM9WktM2fh6xp0SJWwmqnDw6249GpMjoEMCgW/XWeGV7l/1k58STzyITTTZ7E9puD7uFWA6Nt0w
	oIkKuq/cC56XNY/FkTshD5SrXS75FqjySFQ1544lDFten62R5zfoXvkJhohvctwDacBb2R/XuhsUn
	nVV6cJUM16MqtkLfi5/3WgVkuPtW/92xsHdklWHl2fjdNrJG665d+wcs472IZqAsLE+RJbYI0ftw6
	RTAoXwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umr7F-000000027RL-30tH;
	Fri, 15 Aug 2025 09:52:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqBP-00000001v4o-0SE8;
	Fri, 15 Aug 2025 08:53:08 +0000
X-UUID: 3fc871a679b511f09f706fa2197c6ceb-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+Rm7Nhb2K/2gPlpeW1wJWXwMgl81JmjYlQu1duohB3E=;
	b=sFUkwxQgRoUFluTuyRP+cOGCmb7GOEb7OydTgXlW/QridOLPoWMV8HvkdTaQaoX35cHcRDnOimR0oUu9bgupJoUx1KCD26QQaP18KzK6a1gobvmjHY50MABVkYKEQIZk7R3hcxSq2H24VI1DRxBLs4WCEWL3b/Zz6jtiybLbi5I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:c1cc6cbb-9fa0-4771-b4fa-ab9c1856a8e0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:5b8e2b7a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fc871a679b511f09f706fa2197c6ceb-20250815
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2135434799; Fri, 15 Aug 2025 01:53:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:52:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:52:56 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 11/14] media: mediatek: vcodec: add debug information
Date: Fri, 15 Aug 2025 16:52:24 +0800
Message-ID: <20250815085232.30240-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250815085232.30240-1-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_015307_159494_8A49E12B 
X-CRM114-Status: UNSURE (   9.36  )
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

Print hevc/av1 output format and 10bit capture format
information to debug.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 5ad3797836db..79ccbe13735a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -29,6 +29,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\toutput format: vp9 slice\n");
 		break;
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: hevc slice\n");
+		break;
+	case V4L2_PIX_FMT_AV1_FRAME:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: av1 slice\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported output format: 0x%x\n",
@@ -45,6 +53,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tcapture format: MT21C\n");
 		break;
+	case V4L2_PIX_FMT_MT2110T:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110T (10bit tile mode)\n");
+		break;
+	case V4L2_PIX_FMT_MT2110R:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110T (10bit raster mode)\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported capture format: 0x%x\n",
@@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 
 		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
 			curr_len = snprintf(buf + used_len, total_len - used_len,
-					    "\treal(%dx%d)=>align(%dx%d)\n",
+					    "\treal(%dx%d)=>align(%dx%d) 10bit(%d)\n",
 					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+					    ctx->is_10bit_bitstream);
 			used_len += curr_len;
 		}
 
-- 
2.45.2


