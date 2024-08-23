Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAD3C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1cL9EeZ4+4EpZOIxL5FlEKqQ7oajrUqL8HBJ40Wupw=; b=IhHTMyNiiFsV4f/xasv2a5XMxA
	v5nmyEjvhBuCh7nJL5KK5OkX8da855/wvr1N25JLHRSjJgR56H5jBp42XZx8DiiH0+fXlUAmgbN08
	rTE0aDscj8LbSgvo55sakhIiPeccXae0HlfxNR7VvrQojG4MAdbTrgM27TwC2ODW0Hg1dTRZecUEq
	Cw/O2xzeLBr2IykKuJRwM429NKqPi5I30Oo0N07ymBZ7ZsOiRzq2Z/VfSob71HkBFlF+3zjavsgbd
	N+y57dl1dzVPkqWNyj/aFBBll1Vj0cztvaz1GpnAejw9B6Lilc8wY43jVBfr4s5rixrnThqgmP+3z
	jo4LnVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shW8w-0000000HHrd-3aVY;
	Fri, 23 Aug 2024 15:24:02 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shW8i-0000000HHnm-3iNu;
	Fri, 23 Aug 2024 15:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724426625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YY61u2QHEh3TyX+mPY4Akk3f68nTPIaSz9fOYvcxGEVOzn271buw29BZN8C1ra8zE7cxbwxLLNIkkNDMXFwO2PrcDSkzuro3fYYE2nCI8WTN24ciXYP81+1nadfQ0Ux0JV0hh3cSaShyOJX1vYnnQhrrNbeMQU3q7JHCaijDS+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724426625; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P1cL9EeZ4+4EpZOIxL5FlEKqQ7oajrUqL8HBJ40Wupw=; 
	b=cHQ9lr75NVT2jt7GsCDKXQADoqxVgqLn3HR8I2VhWxm9AbCiKn+Y/Hc+Jtz9bIKZe8DXP5jlOobNMQNksLfqK9S6qlxwT8rqxHXPmvkctm1Yr7s6bsongP7CTYPQOK6cyX2UWfvh/Kid+wJYep9C3iDNXapxiEV9VyeTdbLJ3nk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724426625;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=P1cL9EeZ4+4EpZOIxL5FlEKqQ7oajrUqL8HBJ40Wupw=;
	b=fbJDTmRzLXEIIPjhgcxLVu290CQcBX/tPN52Nbrx3/q27PyRC9zkhPSbQTVzIP1I
	bqfYAkhqxf6NUiiESl/HaqgkRjcM/mt4PrTXJfQAOayPmXpN9FIIYf2wu0ENwQ4wl/Y
	mBIj+Xy1u0RmuEWkpoQVg3nfrZvFif1NjDQBlYdc=
Received: by mx.zohomail.com with SMTPS id 1724426623925742.9251945533158;
	Fri, 23 Aug 2024 08:23:43 -0700 (PDT)
Date: Fri, 23 Aug 2024 17:23:38 +0200
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
Subject: Re: [PATCH v4 6/7] media: mediatek: vcodec: replace
 v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Message-ID: <20240823152338.n7i7cnvolvke2hqp@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-7-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-7-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_082348_976614_35A368D3 
X-CRM114-Status: GOOD (  21.25  )
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
>There isn't lock to protect source buffer when get next src buffer,
>if the source buffer is removed for some unknown reason before lat
>work queue execute done, will lead to remove source buffer or buffer
>done error.

This is really hard to understand, can try wording this a bit clearer?
Stuff like: if the source buffer is removed ... will lead to remove
source buffer, just leaves me scratching my head.
And there is a spinlock in the m2m framework in `v4l2_m2m_next_buf` so I
suppose you mean something else when you say that there is no lock to
protect the source buffer?

You might not know all reasons but for this commit description you
should at least know one reason. Please highlight a case how this can
happen, so that you can justify the change.

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 30 +++++++++++++------
> 1 file changed, 21 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index 8aa379872ddc..3dba3549000a 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -321,6 +321,7 @@ static void mtk_vdec_worker(struct work_struct *work)
> 		container_of(work, struct mtk_vcodec_dec_ctx, decode_work);
> 	struct mtk_vcodec_dec_dev *dev = ctx->dev;
> 	struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->last_vb2_v4l2_src;
>+	struct vb2_v4l2_buffer *vb2_v4l2_dst;
> 	struct vb2_buffer *vb2_src;
> 	struct mtk_vcodec_mem *bs_src;
> 	struct mtk_video_dec_buf *dec_buf_src;
>@@ -329,7 +330,7 @@ static void mtk_vdec_worker(struct work_struct *work)
> 	bool res_chg = false;
> 	int ret;
>
>-	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_next_src_buf(ctx->m2m_ctx);
>+	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> 	if (!vb2_v4l2_src) {
> 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
>@@ -381,17 +382,28 @@ static void mtk_vdec_worker(struct work_struct *work)
> 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
> 		if (src_buf_req)
> 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>-		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
>-	} else {
>-		if (ret != -EAGAIN) {
>-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
>-			ctx->last_vb2_v4l2_src = NULL;
>-		} else {
>-			ctx->last_vb2_v4l2_src = vb2_v4l2_src;
>-		}
>+		vb2_v4l2_dst = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
>+		v4l2_m2m_buf_done(vb2_v4l2_dst, state);
>+		v4l2_m2m_buf_done(vb2_v4l2_src, state);

This is another case where you just remove again completely what you
have added in the previous patch.

>
> 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>+		return;
> 	}
>+
>+	/* If each codec return -EAGAIN to decode again, need to backup current source
>+	 * buffer, then the driver will get this buffer next time.

I would reword this like:

	/* Store the current source buffer for the next attempt to decode,
    * if this decode returned -EAGAIN */

>+	 *
>+	 * If each codec decode error, must to set buffer done with error status for
>+	 * this buffer have been removed from ready list.
>+	 */
>+	ctx->last_vb2_v4l2_src = (ret != -EAGAIN) ? NULL : vb2_v4l2_src;

Okay and here you add the same thing again as in the previous patch but
differently, this collection of commits feels more and more to me like a
work in progress. Please make sure in the future that each commit does
one job and does it completely.
It is not only confussing but also makes it hard to read the changes as
the bigger picture is missing in these tiny commits.

Please try to combine the patches where possible.

Regards,
Sebastian Fricke

>+	if (ret && ret != -EAGAIN) {
>+		if (src_buf_req)
>+			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
>+	}
>+
>+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> }
>
> static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
>-- 
>2.46.0
>
>

