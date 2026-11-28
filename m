Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AC606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iJxFwYAU;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=j/HZeWMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=; b=iJxFwYAUi5mcA1yjYs/w6trff1
	bQRtjnTezzeCMrc0bgyRMXc70UrUJGMeVaM76y0WVDYMWc221kzO352h6T8VT96Dyrm0uFAjgoMXs
	LdxcFmzpbwMQTHBrzYwVNgmhiMSyizKIwtCYKUWdF0xl13eygmltk7pZlaCXC8chDWa/vZ/1szrMx
	jpa6ML4FSA8TX6v7Tkwucyn0MQpYZPc1PgRMmkKo3Y5o3vEA1AL6+JYjXG49P8SOMgVgZ2dBJXJnI
	t2iJTVKpmNyv2mm8//M3nu2rG3qScwPdSquge4vXq3TWmp2vRCBsiX18ii/xAv8Ij2zRPN2k1wkwk
	VmmNzkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDBa-00000000Uay-23uv;
	Sat, 28 Nov 2026 07:49:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXDAT-00000000U1n-0H3i;
	Sat, 28 Nov 2026 07:48:25 +0000
X-UUID: 12146f18eb0011f1a36277631523a8d6-20261128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Sf1pQlbMbiIrjnz8/66tGMCRdtP6utc4O8nw4rUQzS8=;
	b=j/HZeWMQyCCFufNzb0BZnZWsBqAW2Xnotuvz319M5ra58Ct0/sWFeUdAny/1/rC7RnyRebeKtoAMUlkqijAt1Gr7ZtIo1O0q3Ww79ruLQqE3Vu1FKEu9EX7DOpBpUAoApOdi6OTxVoXz2LZl4RLuy+ld8nBcMnuHrqo1o+qcW7w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dd2299cd-a3e6-453f-a8d7-340f3d06fa19,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:3352e666-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12146f18eb0011f1a36277631523a8d6-20261128
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1506861484; Sat, 28 Nov 2026 00:48:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 28 Nov 2026 15:48:13 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Sat, 28 Nov 2026 15:48:11 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Ricardo Ribalda
	<ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li
	<haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
	<tfiga@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v10 06/14] media: mediatek: vcodec: add debug information
Date: Sat, 28 Nov 2026 15:47:52 +0800
Message-ID: <20261128074800.3108429-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
References: <20261128074800.3108429-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_234821_119566_0F6322AB 
X-CRM114-Status: GOOD (  10.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Print hevc/av1 output format and 10bit capture format
information to debug.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521f..a9e52a320 100644
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
+				    "\tcapture format: MT2110R (10bit raster mode)\n");
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
2.51.0.windows.2


