Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4108ED1A431
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Oct 2024 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JLrq4jh7iY7GGut+rE11sLUmd1GJCvUrdKijk30RG0=; b=M5PFTdgxWf+rYHUMUDQm/2k8IC
	2sAGqqFIEzDfjMEvRXB3okxVWnZqYKFIBnWaMSB7V0qa2Xg49B8GPk2ykGDgCoyFw9NswE2psPV+9
	6S7fSXDERvU38H2cz1w+W+T+E2KkKT8yAg/c+bOdZ8wqnIvBZauLZRXw8oMJBOgYHeBGntEPXg+md
	9EMOGaQCZmymB4nfYz6r/Mgrzjx+6xVFK07CuudnquwSMW5xh1xE+nSHz7Kdez01thiWfOztOZku3
	rqTnQ8DHguFEYBz2mfDn19ZIaAemQqdfYGVqPsKObYV/3GmZknUpjr9idlTxxrwN6HnXG847HbyZs
	QaqhjTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szVtb-00000000fDL-1CS9;
	Sat, 12 Oct 2024 06:46:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szVqq-00000000ePC-1p0o;
	Sat, 12 Oct 2024 06:43:46 +0000
X-UUID: 50e08902886511efb3adad29d29602c1-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8JLrq4jh7iY7GGut+rE11sLUmd1GJCvUrdKijk30RG0=;
	b=WbkGJuZ+ohct5OZtGtLtVOEsz32ewDbmkaKiSz7hohrgP1Z4Xc0+DX10WQ1LqrsmVE5CZ8WrgzmzFehVsQSFt1a4QI+PHVxGtp4OUWm7Uj/tPdyjbUpI2zMoMA5Z1U4CY6WXJ9uwNjdSVG0FXyY7DIU/Eu00I88tt4GVrHA5Px8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:fc578968-0ed0-4aab-a67d-c7cf74514a0c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:837a2241-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 50e08902886511efb3adad29d29602c1-20241011
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 221821915; Fri, 11 Oct 2024 23:43:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 14:43:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 14:43:36 +0800
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
Subject: [PATCH v5 5/5] media: mediatek: vcodec: remove media request checking
Date: Sat, 12 Oct 2024 14:43:29 +0800
Message-ID: <20241012064333.27269-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241012064333.27269-1-yunfei.dong@mediatek.com>
References: <20241012064333.27269-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.264300-8.000000
X-TMASE-MatchedRID: 6sPUm7w8jTpmcP5F4hatbcnlbo5l7mGFBLtx+64GFanjsTquy0JRi4ma
	Qfsqx1XAWKuGHPyQzf64VxGFQBNJeJCoy9iDotiwDB+ErBr0bAPvJY9pBzgg1Fczpnf2wfW+/Ge
	vfoH427ppx84QoERxMGxnReZpseJrr78SC5iivxwURSScn+QSXt0H8LFZNFG71sULACB0qRKxf9
	Tzwx1gOqKw3PkULyG3d4zmm+qXAcRik/4smOcoJdNvcdbCGmtVlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.264300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DCA4312830AE28DABF4307C3097E27151D7C7F52A3EA48E5C4C3701D04C698F22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_234344_643950_EF5042A6 
X-CRM114-Status: GOOD (  10.67  )
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

Setting the buffer status to error if the media request of
each source buffer is NULL, then schedule the work to process
again in case of access NULL pointer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d213b0f532a9..01a63618f0c4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -359,10 +359,14 @@ static void mtk_vdec_worker(struct work_struct *work)
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
 	/* Apply request controls. */
 	src_buf_req = vb2_src->req_obj.req;
-	if (src_buf_req)
+	if (src_buf_req) {
 		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
-	else
+	} else {
 		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		return;
+	}
 
 	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret && ret != -EAGAIN) {
@@ -380,8 +384,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		vb2_v4l2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 		v4l2_m2m_buf_done(vb2_v4l2_dst, state);
 		v4l2_m2m_buf_done(vb2_v4l2_src, state);
@@ -399,8 +402,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	 */
 	ctx->cur_src_buffer = (ret != -EAGAIN) ? NULL : vb2_v4l2_src;
 	if (ret && ret != -EAGAIN) {
-		if (src_buf_req)
-			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		v4l2_m2m_buf_done(vb2_v4l2_src, state);
 	}
 
-- 
2.46.0


