Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20492C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8MX/CWsJpRioPdRo9KXW/czQDBUa5D8abQNyyRU3js=; b=YGffk7YNl2z9D8M2dp2R+bmALv
	N9cDgxKeXmmT3+ZNppZ86gxBdtPcYdTjTygzVLy29zwL7sJzCP4hkaA2RkgpfwOnacypdUMvnKajo
	hbsKPKTQepqR27gyS83XPFlYqXbEp67PvWwpN91Q4totqUWNJnXe/+GX4YJ+DpnIzR+XlUENnBOkd
	VRAFtDi1domq3HI5aoMztnEYW9xdCawLHJflvTXZMYJLQRyLs34Irt3X5jWAm3fU8Nyq2ZkQGlgoF
	ugKPNezVR5QpBH1G6pC8/xfQnBKgSBhlWMKdttoVHeA2Dd25pps191Z98svmpwI7yj/RZwJTyJNwA
	G49vlsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r16Vq-006XC1-1n;
	Thu, 09 Nov 2023 15:00:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r16Vl-006XAV-0g;
	Thu, 09 Nov 2023 15:00:02 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 876C1660741E;
	Thu,  9 Nov 2023 14:59:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699541998;
	bh=QqR7WPB+/Ya2aRUzfOvGGvpjOokjJ1EE8CvZQdCtRc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nh7d1LMKIeIN1PuXQGQ0zMOWkQn0ovCI0hogX7dRL0hIodAnUpsBVN068K/luitTD
	 5H9d8brps2q1xdXfEGl7S8VcSBc45k0BHueDkVNJDRpBdbl2eZgvp0hmzzhmSdcGAz
	 DPtxawusYLeJDCZEanUhfwqrjCRgmEiHqjOTXP1gAlm/GREWwA1qQ+dU5Srf6UvAmS
	 iwkQy7LIMPt2Jn3gbH6KDB+siDm4PB+BL/vkoSVRUtUUn/LolBkw62glgPUF+kwMo2
	 8cjG97dQ2noCfAnzdYa/GfQ0EHRNek+/IaQ2RA/NcaaDSAiJAOxg5+YdKoxZ4aR9ek
	 39GOh/3WAnlCw==
Message-ID: <9af3cedd-1722-4bdf-a95c-15853cafb247@collabora.com>
Date: Thu, 9 Nov 2023 15:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 50/56] media: verisilicon: vp9: Allow to change
 resolution while streaming
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-51-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-51-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_070001_408845_8500599C 
X-CRM114-Status: GOOD (  18.80  )
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

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Remove all checks that prohibit to set a new format while streaming.
> This allow to change dynamically the resolution if the pixel format
> remains the same.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> CC: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   .../media/platform/verisilicon/hantro_v4l2.c  | 24 +++----------------
>   1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index f0d8b165abcd..27a1e77cca38 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -514,25 +514,14 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
>   		return ret;
>   
>   	if (!ctx->is_encoder) {
> -		struct vb2_queue *peer_vq;
> -
>   		/*
>   		 * In order to support dynamic resolution change,
>   		 * the decoder admits a resolution change, as long
> -		 * as the pixelformat remains. Can't be done if streaming.
> -		 */
> -		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> -		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
> -			return -EBUSY;
> -		/*
> -		 * Since format change on the OUTPUT queue will reset
> -		 * the CAPTURE queue, we can't allow doing so
> -		 * when the CAPTURE queue has buffers allocated.
> +		 * as the pixelformat remains.
>   		 */
> -		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> -					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> -		if (vb2_is_busy(peer_vq))
> +		if (vb2_is_streaming(vq) && pix_mp->pixelformat != ctx->src_fmt.pixelformat) {
>   			return -EBUSY;
> +		}
>   	} else {
>   		/*
>   		 * The encoder doesn't admit a format change if
> @@ -577,15 +566,8 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
>   static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
>   			      struct v4l2_pix_format_mplane *pix_mp)
>   {
> -	struct vb2_queue *vq;
>   	int ret;
>   
> -	/* Change not allowed if queue is busy. */
> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> -			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> -	if (vb2_is_busy(vq))
> -		return -EBUSY;
> -
>   	if (ctx->is_encoder) {
>   		struct vb2_queue *peer_vq;
>   


