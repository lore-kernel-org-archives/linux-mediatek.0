Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA70C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6oveps4DwZyjx7Lo/bkkZCFv0Cut+y/Y1Be0D4ooTM=; b=45Gdnd6GBXww6cfIw/hj12MMIo
	S1CLabh51TJAxGiBDrfs4ZVVRolHYD3M+I+R+T5d6VnfxqPsKEZiDaDX1zRgK02ZjLnBSQf3Tbh7e
	/yCRL8u0QueimkOxgZL056vpAlcsCP3uGSAgSbhBP2PrkIvv1IntsZ1VHBbs6EwZAXpLYL+sdEHcl
	7AQitmQPM0g+a3gLq7SAhW6mzE6yEdjcf7tiTROHqTgt5WS0BzqqiLIalzcmOXNsHu2ajFqZB8VBJ
	eK6PDUj0meDcSa42YfzknHAVORueVFfMsPBXrP9jbIukGAA/R9VfGZ3o22xybu/ydhaJtykHlrsP+
	r6DCjGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shASi-0000000DXgW-1KVp;
	Thu, 22 Aug 2024 16:15:00 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAPk-0000000DWr5-0g9N;
	Thu, 22 Aug 2024 16:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724343112; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AGCLLuOTPFmktZHK2UbZoDIgJ/8Oe+1WFWpy8SZSGokqVofHXvgl/x8IvxmRWosGS0Zos3K3hqcCh0IBta2eORekDsQaTFN8r0bL97dDDobqWliVfsEC8bMNuldeS828d4ex6LBbRm55IO8+F7OvG6GP8Kj0pW0uHui6DDrcynI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724343112; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g6oveps4DwZyjx7Lo/bkkZCFv0Cut+y/Y1Be0D4ooTM=; 
	b=LHgpdv4wWG108Ao4aHayTRSkoSbNts+zRMjv2JqFstadGTH5NEbFfm5SVnp7PsCL+mIKkqoq29AX7Kqp6qgzvonLoh7/G45tHDXX+Zyq0MH7DOrs9gBi3vGuTz/gt4XDAz0lk87KqaTabv5mqzMFyVUz0R7dRfOoOooMmDWdUkI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724343112;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=g6oveps4DwZyjx7Lo/bkkZCFv0Cut+y/Y1Be0D4ooTM=;
	b=gYbxUTovw4k9Y5lglq6Y/q4jYSjFApYFwFfOt01mLUy6OeG7yD/8vq3+eeUBocHz
	CYak82arKAH8GsT8z22ohShZ9UPq89oiqDCsu+Ug1S6mtlGTvfoCxbaQy03eJTyE54A
	w+tbh6bZtDBK+/vmfoRJlsM1MMt47LRUc1//ioxA=
Received: by mx.zohomail.com with SMTPS id 1724343110302766.1410833559867;
	Thu, 22 Aug 2024 09:11:50 -0700 (PDT)
Date: Thu, 22 Aug 2024 18:11:45 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 3/7] media: mediatek: vcodec: flush decoder before
 stream off
Message-ID: <20240822161145.jv7i45wlajcxpazw@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-4-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_091156_258087_69958887 
X-CRM114-Status: GOOD (  12.34  )
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

Hey Yunfei,

On 07.08.2024 16:24, Yunfei Dong wrote:
>Flush decoder will reset the driver to flush status. If lat or core
>work queue in active before flush when stream off, will lead to get
>dst buffer NULL or buff done with one non-existent source buffer.
>
>Flush decoder when stream off no matter output or capture queue
>calling stream off firstly.
>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 ++++++++++---------
> 1 file changed, 23 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 7080ca3e18b0..fc4ee1fb7cd1 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -882,6 +882,29 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
> 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
>
>+	if (ctx->state >= MTK_STATE_HEADER && ctx->state != MTK_STATE_FLUSH) {
>+		/*
>+		 * The resolution hasn't been changed when STREAMOFF is called.
>+		 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
>+		 * is called.
>+		 */
>+		ctx->picinfo = ctx->last_decoded_picinfo;
>+
>+		mtk_v4l2_vdec_dbg(2, ctx,
>+				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>+				  ctx->id, ctx->last_decoded_picinfo.pic_w,
>+				  ctx->last_decoded_picinfo.pic_h,
>+				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>+				  ctx->last_decoded_picinfo.buf_w,
>+				  ctx->last_decoded_picinfo.buf_h);
>+
>+		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>+		if (ret)
>+			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>+
>+		ctx->state = MTK_STATE_FLUSH;
>+	}
>+
> 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
> 			if (src_buf != &ctx->empty_flush_buf.vb) {
>@@ -894,28 +917,6 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 			}
> 		}
>
>-		if (ctx->state >= MTK_STATE_HEADER) {
>-			/*
>-			 * The resolution hasn't been changed when STREAMOFF is called.
>-			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
>-			 * is called.
>-			 */
>-			ctx->picinfo = ctx->last_decoded_picinfo;
>-
>-			mtk_v4l2_vdec_dbg(2, ctx,
>-					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>-					  ctx->id, ctx->last_decoded_picinfo.pic_w,
>-					  ctx->last_decoded_picinfo.pic_h,
>-					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>-					  ctx->last_decoded_picinfo.buf_w,
>-					  ctx->last_decoded_picinfo.buf_h);
>-
>-			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>-			if (ret)
>-				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>-		}
>-
>-		ctx->state = MTK_STATE_FLUSH;

you just changed this routine in patch 2/7, why was patch 2/7 needed if
you remove it right away in the next patch?

regards,
Sebastian Fricke

> 		return;
> 	}
>
>-- 
>2.46.0
>
>

