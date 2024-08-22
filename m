Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86364C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYmsMO86M+MRWiuSffdR3RZ+erob4a0FODJM/LZV2Xk=; b=lFHghxigMfPow2PivgBuhbxTQF
	QIrSEqTcUwnYCfkMOan7FTeUSnQXkrjdJHQxxSTVZBXniQQz2W2EXa27ov6/6/AzX6VoZNuB+Z3jV
	8rLD317ljLWx412HLWYtBDA7cxbKZ0zXN3YSrzNg3OLoez5bkivhomYgrmfYLFkNj8DftA53dUFja
	kB+ygtqro+waqblqjV5SCPWYsVEXAJzJp2KyPhqsOTihyXndhHkQqNfvhVslmrTi2Q+oXsux7EVF2
	oL1GpUUfjMSw8pwv6qJY4SkwFGy1+HZaxIZ8WFjs4PqMFhT+a5yRmVOt6OTcYoe7WjCRRWWDvHrSp
	6pvA50pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAAI-0000000DSlL-1Qo8;
	Thu, 22 Aug 2024 15:55:58 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh9nz-0000000DLzQ-3inI;
	Thu, 22 Aug 2024 15:32:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724340769; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7AUM2Xbxn4Eof2YYSDtDTHdvd0McWkZt01OmEg6CgIsGm5c9LXrIZe5PnH60OgVNlCbcy/x7hnLUhWDx02zuiD4PmC/fpbBC1Qy7lqXS4QYoIdMRRLVaWIZvjbWTs2jO2/H/kqtJTKfMtTR8fkaIFOdaEi06y2mmoR3m2LiRPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724340769; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GYmsMO86M+MRWiuSffdR3RZ+erob4a0FODJM/LZV2Xk=; 
	b=GWoMp+tNXjBNDLmNdWJHV1aJjfDIRBJCNf3tXBNCjr6TcvyehGapuEsoLpAgiARm7CtNcPhhNsSwngpLrRQ0ADi2aGUoJW+HlJ99ptNq25ITk1lF8+/hVIQoCcSFHCae4FZ/qICQSx1EZBfV2S3S2UWiBfi8jn2vCl08Qqu3h/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724340769;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=GYmsMO86M+MRWiuSffdR3RZ+erob4a0FODJM/LZV2Xk=;
	b=Dh42t0xbRWLCxW8F/S+l3+cGdiaONmsgqzKhPpkFvWgV00U9Ola2pFyK5IUqbmln
	M1bvoYPZYshyS50jbWdLQDW+VTSO8acHmPzprwIJ9XdByer014S4QfoLHLrEm5qmikT
	21NlW+22JIjnZ5iD/akskU/YrRqQwFXZbOWLmdEE=
Received: by mx.zohomail.com with SMTPS id 172434076798266.91759029586126;
	Thu, 22 Aug 2024 08:32:47 -0700 (PDT)
Date: Thu, 22 Aug 2024 17:32:42 +0200
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
Subject: Re: [PATCH v4 2/7] media: mediatek: vcodec: change flush decode
 order when stream off
Message-ID: <20240822153242.sewrferyfh3u5g4h@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-3-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_083255_996526_4A1E97F0 
X-CRM114-Status: GOOD (  12.79  )
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
>The buffer remove and buffer done of output queue is separated into
>two works, the value of owned_by_drv_count isn't zero when output
>queue stream off before flush decode.

You have to try this again, I cannot make sense out of your message.

What do you mean with:
"The buffer remove and buffer done of output queue is separated into two works"

I suppose this:
the value of owned_by_drv_count isn't zero when output queue stream off
before flush decode.

should be:
therefore the value of `owned_by_drv_count` isn't zero while flushing
the decoder in the STREAMOFF(OUTPUT queue) IOCTL.

right?

>Changing the flush decode from capture to output when stream off to
>make sure all the output queue buffers are set to done list.

I'd change this section to:

Flushing the decoder during STREAMOFF(OUTPUT) instead of during
STREAMOFF(CAPTURE) makes sure that all buffers on the OUTPUT queue are
set done.

The rest looks fine.

Regards,
Sebastian Fricke

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 +++++++++----------
> 1 file changed, 22 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 2b787e60a1f9..7080ca3e18b0 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -893,32 +893,31 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> 			}
> 		}
>-		return;
>-	}
>-
>-	if (ctx->state >= MTK_STATE_HEADER) {
>-
>-		/* Until STREAMOFF is called on the CAPTURE queue
>-		 * (acknowledging the event), the driver operates
>-		 * as if the resolution hasn't changed yet, i.e.
>-		 * VIDIOC_G_FMT< etc. return previous resolution.
>-		 * So we update picinfo here
>-		 */
>-		ctx->picinfo = ctx->last_decoded_picinfo;
>
>-		mtk_v4l2_vdec_dbg(2, ctx,
>-				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>-				  ctx->id, ctx->last_decoded_picinfo.pic_w,
>-				  ctx->last_decoded_picinfo.pic_h,
>-				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>-				  ctx->last_decoded_picinfo.buf_w,
>-				  ctx->last_decoded_picinfo.buf_h);
>+		if (ctx->state >= MTK_STATE_HEADER) {
>+			/*
>+			 * The resolution hasn't been changed when STREAMOFF is called.
>+			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
>+			 * is called.
>+			 */
>+			ctx->picinfo = ctx->last_decoded_picinfo;
>+
>+			mtk_v4l2_vdec_dbg(2, ctx,
>+					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>+					  ctx->id, ctx->last_decoded_picinfo.pic_w,
>+					  ctx->last_decoded_picinfo.pic_h,
>+					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>+					  ctx->last_decoded_picinfo.buf_w,
>+					  ctx->last_decoded_picinfo.buf_h);
>+
>+			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>+			if (ret)
>+				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>+		}
>
>-		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>-		if (ret)
>-			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>+		ctx->state = MTK_STATE_FLUSH;
>+		return;
> 	}
>-	ctx->state = MTK_STATE_FLUSH;
>
> 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
> 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>-- 
>2.46.0
>
>

