Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD354606A8A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 03:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jk5sw075;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=iYTLhieL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=spdj9tInNKmufCVtnlPiJgZob6JverZRoi62iSXN0xc=; b=Jk5sw075nWM6GPiLril2IMDmkA
	3K+yf3uZrcWXSQY7+zZoLqlN88BTIhcGaHdw9PQnriUVcbnMcoQ3m9K/xJ3CuqasY5ZoHffrjFM6G
	oHP8qJcLldl6Uo+X4PRGFF1c0uyRV1E1AJ9GOByOcldb+oz4bjN0tqO249N20Z3ko2aomkK76cEWB
	zhRvsxsaYHQOj7RTX5XhupZFyYjZSxco8Eck2AnHK1pJGPU7cN30oFP2ejRjYO14FRdNw6vd4E8Ce
	U30vP52UAT+HvdFrrQKLONT0Rv4bSFRc4UaP1Y8BwDqzXCI0Z48DcWDdb3fPft/+X0gFKlU9MEklV
	Eo8qxqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9u0-00000004UKt-1QJC;
	Tue, 17 Nov 2026 03:30:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9tm-00000004TpL-2F4C;
	Tue, 17 Nov 2026 03:30:28 +0000
X-UUID: 359ebc8ae23711f1afed4741b24580c9-20261116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=spdj9tInNKmufCVtnlPiJgZob6JverZRoi62iSXN0xc=;
	b=iYTLhieL+kZDjHHkDEYFWxPWAMeWzTdRdiekGex75A7srOcKcvBGEeNXw2OZr40UIEROQfHPMasnvLMkYWNTiORfDZUvJo+5A0GiBfvKpgT1gBt7mlQh+Hq7TcribLZvETOCMra//cgYLda/DC9wqIfYZMFk0SQQCHJSCorpkQE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2dbcd493-bce3-4fd8-a5c6-0a021cdeda3c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:d082d552-04ef-4094-bd73-078046ac4d80,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 359ebc8ae23711f1afed4741b24580c9-20261116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1648049698; Mon, 16 Nov 2026 20:30:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Nov 2026 11:30:14 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Nov 2026 11:30:13 +0800
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
Subject: [PATCH v9 13/14] media: mediatek: decoder: fill av1 buffer size with picinfo
Date: Tue, 17 Nov 2026 11:29:49 +0800
Message-ID: <20261117032950.1425556-14-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_193022_635366_324BC2A8 
X-CRM114-Status: GOOD (  11.95  )
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

The buffer size of y and c plane has been calculated in vcp/scp,
can fill each frame buffer size with picinfo directly.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c     | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index ffb28bad0..2d6e08e72 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1812,18 +1812,19 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 {
 	struct vb2_buffer *vb;
 	struct vb2_queue *vq;
-	int w, h, plane, size;
+	int plane;
 	int i;
 
 	plane = instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
-	w = vsi->frame.uh.upscaled_width;
-	h = vsi->frame.uh.frame_height;
-	size = ALIGN(w, VCODEC_DEC_ALIGNED_64) * ALIGN(h, VCODEC_DEC_ALIGNED_64);
 
 	/* frame buffer */
 	vsi->fb.y.dma_addr = fb->base_y.dma_addr;
+
+	vsi->fb.y.size = instance->ctx->picinfo.fb_sz[0];
+	vsi->fb.c.size = instance->ctx->picinfo.fb_sz[1];
+
 	if (plane == 1)
-		vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
+		vsi->fb.c.dma_addr = fb->base_y.dma_addr + vsi->fb.y.size;
 	else
 		vsi->fb.c.dma_addr = fb->base_c.dma_addr;
 
@@ -1846,8 +1847,10 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 		}
 
 		vref->y.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+		vref->y.size = vsi->fb.y.size;
+		vref->c.size = vsi->fb.c.size;
 		if (plane == 1)
-			vref->c.dma_addr = vref->y.dma_addr + size;
+			vref->c.dma_addr = vref->y.dma_addr + vsi->fb.y.size;
 		else
 			vref->c.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
 	}
-- 
2.51.0.windows.2


