Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1629CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqnU8bzDLA3S7gsHpvFSVGAB1w5LghPOLGZZKl+x6H0=; b=ZSMvGeDngNAj+8/9aCNaIAS9gw
	uOiuX8p7By9/RRA3bF13VbwFNKrfoj+cAwEHAQjhyTIUmHot/HwO1HN8Jdqs14uihuePsXNUsxMQr
	Z4bDFdHDqbH7H5XEISxLPn4/Fd0T/HAzH71YwUYL8Nzas9jva3UtrRbuExc4/20sXdyzKlxZ5bY3S
	bwVgvmejFunwwcu3wLiWE+bwZL//LysiWaQ/QUcTTwPz6IqERe0VhKkZVjL6tOfvJxeVghU+CzXly
	W4iuDIf/UpdYIlGDVbu9VTv3eQP81MidmfDnnI098bTABVPAw7xPhGIHDZ0QgZCjzy1Ts+Lk6uDW8
	NLcvBvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIjI-008nfg-2X;
	Mon, 16 Oct 2023 08:13:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIjE-008ndu-2W;
	Mon, 16 Oct 2023 08:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F218960CF7;
	Mon, 16 Oct 2023 08:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DC4C433C7;
	Mon, 16 Oct 2023 08:13:28 +0000 (UTC)
Message-ID: <dd279357-bccc-41c2-9566-a7670880db37@xs4all.nl>
Date: Mon, 16 Oct 2023 10:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/56] media: amphion: Use vb2_get_buffer() instead of
 directly access to buffers array
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Zhou Peng <eagle.zhou@nxp.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-10-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012114642.19040-10-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_011332_862165_EEE758E6 
X-CRM114-Status: GOOD (  17.17  )
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

On 12/10/2023 13:45, Benjamin Gaignard wrote:
> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
> This could allow to change the type bufs[] field of vb2_buffer structure if
> needed.

Awkward phrasing, and bufs is part of vb2_queue, not vb2_buffer. How about:

Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
This allows us to change the type of the bufs in the future.

The same text is used in other driver patches, so please update it there
as well.

Regards,

	Hans

> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Ming Qian <ming.qian@nxp.com>
> CC: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  drivers/media/platform/amphion/vpu_dbg.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
> index 982c2c777484..a462d6fe4ea9 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -140,11 +140,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>  
>  	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
>  	for (i = 0; i < vq->num_buffers; i++) {
> -		struct vb2_buffer *vb = vq->bufs[i];
> -		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +		struct vb2_buffer *vb;
> +		struct vb2_v4l2_buffer *vbuf;
> +
> +		vb = vb2_get_buffer(vq, i);
> +		if (!vb)
> +			continue;
>  
>  		if (vb->state == VB2_BUF_STATE_DEQUEUED)
>  			continue;
> +
> +		vbuf = to_vb2_v4l2_buffer(vb);
> +
>  		num = scnprintf(str, sizeof(str),
>  				"output [%2d] state = %10s, %8s\n",
>  				i, vb2_stat_name[vb->state],
> @@ -155,11 +162,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>  
>  	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
>  	for (i = 0; i < vq->num_buffers; i++) {
> -		struct vb2_buffer *vb = vq->bufs[i];
> -		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +		struct vb2_buffer *vb;
> +		struct vb2_v4l2_buffer *vbuf;
> +
> +		vb = vb2_get_buffer(vq, i);
> +		if (!vb)
> +			continue;
>  
>  		if (vb->state == VB2_BUF_STATE_DEQUEUED)
>  			continue;
> +
> +		vbuf = to_vb2_v4l2_buffer(vb);
> +
>  		num = scnprintf(str, sizeof(str),
>  				"capture[%2d] state = %10s, %8s\n",
>  				i, vb2_stat_name[vb->state],

Regards,

	Hans

