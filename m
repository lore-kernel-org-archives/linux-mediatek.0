Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F7DC52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 12:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XidCKBwilQdKIAPfiY223u/XUs5Gi5LF34Sh5zMVqVQ=; b=bbedRuChyWdSA+6CauGAur+O9p
	jFuS2pvz0E7/lY4XyPbwI9t63a/Q6HwXXpvLT9P5bfJ6gdG5rSm1XkUVtzbM+fjHZUzDZ7ZStfHVv
	VxBtTGE2ZhuPLfbxdV5EmpLizw/N6Eanhi4cjEdN++DHXop1FWYWARGF6D9SsiXECnKuGTkZ57BBE
	3iU4B++BeqzctRb+wWqJLanbZrL0WnQg73jHR4vRLQuhSEb4ip43dVDz5Np4g98IFTP9emRonRUpA
	pS0/tMbX1oSp4DbEUeLHDYAo74BH87Te9+Gl7Hh9ljcSk+l+QD5f1xwdhxCFyoTNB31L371XXwBSz
	bzhnJ2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTax-0000000GjHO-3xS9;
	Fri, 23 Aug 2024 12:40:47 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTav-0000000GjGy-107W;
	Fri, 23 Aug 2024 12:40:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724416831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lFoGHoIkT/mAibpILBItN6WgjmX/CI0oZ6D/NUXN2bKsfLT4+OvekFfrS4tKyAg6cgQa4YwYvPimxdicYZLp1IxTFi4jcRrP2EVb9A3sNMF0WuqNS75XVhT+ZBvwyj71T9QHWmz6bELKUN0qvQOSrySiwxsHUeBaSt2YPsE4t38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724416831; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XidCKBwilQdKIAPfiY223u/XUs5Gi5LF34Sh5zMVqVQ=; 
	b=WFmfAEFUVjd4vCnIncMyG6Pf7iUuLDiniGT4Q6rPomrCSJlCEGjbBmyofIbH2qkDUAzLE7cw3HeP3VqIO6E9zUU3ZUrjlmnDUsGvUlEpktZpEb/QhvuRU5jgMwnxmZXNxy3pDQnAY2PxLWV96SBhYG7dwfJKvcP9z8YopDtynNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724416831;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XidCKBwilQdKIAPfiY223u/XUs5Gi5LF34Sh5zMVqVQ=;
	b=Q5w8vDGcEiBTiX8f4Im0x0qNGvTrpQS657ZHR7GoEs+6v1pol95+beKfAoTFV/R+
	TczIkqqSKULDusEO/Yafth2OdM6KTLRhnWdGGPbs0iZCq7VDq3baveMZjtiB1i19wck
	h7ITkEmLdCcZra27DyGwlUT1M04aH2NfNUqkBh3o=
Received: by mx.zohomail.com with SMTPS id 1724416828944996.9773317618417;
	Fri, 23 Aug 2024 05:40:28 -0700 (PDT)
Date: Fri, 23 Aug 2024 14:40:23 +0200
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
Subject: Re: [PATCH v4 4/7] media: mediatek: vcodec: using input information
 to get vb2 buffer
Message-ID: <20240823124023.uhypfcixfsget26q@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-5-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_054045_371593_C5D39992 
X-CRM114-Status: GOOD (  14.76  )
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

I would rename the title to something like this:

media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M

On 07.08.2024 16:24, Yunfei Dong wrote:
>vb2 buffer may be removed from ready list when lat try to get next
>src buffer, leading to vb2 buffer not the current one. Need to get
>vb2 buffer according to current input memory information.

And I would rewrite the commit log like this:

Getting the SRC buffer from the M2M buffer-queue risks picking a
different SRC buffer than the one used for the current decode operation.
Get the SRC buffer therefore from the bitstream data, which was set up
earlier during the decode.

Did I get that right?

Also could you explain why this change is required in this series?

Regards,
Sebastian Fricke

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c     | 13 +++++++------
> .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c     | 15 +++++++--------
> 2 files changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>index 90217cc8e242..a744740ba5f1 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>@@ -1062,19 +1062,20 @@ static inline void vdec_av1_slice_vsi_to_remote(struct vdec_av1_slice_vsi *vsi,
>
> static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance *instance,
> 						 struct vdec_av1_slice_vsi *vsi,
>+						 struct mtk_vcodec_mem *bs,
> 						 struct vdec_lat_buf *lat_buf)
> {
>-	struct vb2_v4l2_buffer *src;
>+	struct mtk_video_dec_buf *src_buf_info;
> 	struct vb2_v4l2_buffer *dst;
>
>-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
>-	if (!src)
>+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>+	if (!src_buf_info)
> 		return -EINVAL;
>
>-	lat_buf->vb2_v4l2_src = src;
>+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
>
> 	dst = &lat_buf->ts_info;
>-	v4l2_m2m_buf_copy_metadata(src, dst, true);
>+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
> 	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
>
> 	return 0;
>@@ -1724,7 +1725,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av1_slice_instance *instance,
> 	struct vdec_av1_slice_vsi *vsi = &pfc->vsi;
> 	int ret;
>
>-	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_buf);
>+	ret = vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf);
> 	if (ret)
> 		return ret;
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>index 3dceb668ba1c..c50a454ab4f7 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>@@ -712,19 +712,18 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *
> }
>
> static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
>+						 struct mtk_vcodec_mem *bs,
> 						 struct vdec_lat_buf *lat_buf)
> {
>-	struct vb2_v4l2_buffer *src;
>-	struct vb2_v4l2_buffer *dst;
>+	struct mtk_video_dec_buf *src_buf_info;
>
>-	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
>-	if (!src)
>+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>+	if (!src_buf_info)
> 		return -EINVAL;
>
>-	lat_buf->vb2_v4l2_src = src;
>+	lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
>
>-	dst = &lat_buf->ts_info;
>-	v4l2_m2m_buf_copy_metadata(src, dst, true);
>+	v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_info, true);
> 	return 0;
> }
>
>@@ -1154,7 +1153,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
> 	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
> 	int ret;
>
>-	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
>+	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
> 	if (ret)
> 		goto err;
>
>-- 
>2.46.0
>
>

