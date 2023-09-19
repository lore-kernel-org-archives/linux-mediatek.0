Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6581ECD5BBD
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8ZrKzcwuWjcrybdscpBGFZ6TYnSnCFlYWiR3Zt72+I=; b=4xxoS/R/jqeA78FXXJ3yPIdfqq
	nWsaM2rFlK2MI5qGXypB/fxXL63Dg0TP3MjFtLJBCDOtbzJX7ENrVLXgmgjvtEEOUCSrOCvOTJfhC
	ld10cEBza0+wQvo8xL0If4V4MIwcQhTL2yhpbfXBM0RmzSRXxpKUZiCOuyZmyhe5QZHh2Y21blOam
	sk/lVtXTxp9myG5G366v7FtuSniCUt2PwLEOIcIiKn0jsDSMOBaf/iBbPOSoXgoJxGYxl9fzW9nr/
	QGjeCxDbBPYrtuBPUafw8fGXyvu4PcoOcWRVJ0aGPPmomxgJDvwPiiuDuOikQi34ZFzApQbk9GNv+
	nDlcvOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiayU-000YVW-1M;
	Tue, 19 Sep 2023 13:41:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiayM-000YSk-2B;
	Tue, 19 Sep 2023 13:41:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27FA06153E;
	Tue, 19 Sep 2023 13:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA3CC433C9;
	Tue, 19 Sep 2023 13:40:57 +0000 (UTC)
Message-ID: <3652023b-f4ab-4316-ad11-b598ef1f4bd2@xs4all.nl>
Date: Tue, 19 Sep 2023 15:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 21/49] media: dvb: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-22-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-22-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_064102_756571_25A79F73 
X-CRM114-Status: GOOD (  19.01  )
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

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/dvb-core/dvb_vb2.c          | 1 -
>  drivers/media/dvb-frontends/rtl2832_sdr.c | 5 +++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 3a966fdf814c..a731b755a0b9 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -177,7 +177,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
>  	q->ops = &dvb_vb2_qops;
>  	q->mem_ops = &vb2_vmalloc_memops;
>  	q->buf_ops = &dvb_vb2_buf_ops;
> -	q->num_buffers = 0;
>  	ret = vb2_core_queue_init(q);
>  	if (ret) {
>  		ctx->state = DVB_VB2_STATE_NONE;

This touches the dvb-core, and should be in a separate patch.

> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 02c619e51641..023db6e793f8 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -439,12 +439,13 @@ static int rtl2832_sdr_queue_setup(struct vb2_queue *vq,
>  {
>  	struct rtl2832_sdr_dev *dev = vb2_get_drv_priv(vq);
>  	struct platform_device *pdev = dev->pdev;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	dev_dbg(&pdev->dev, "nbuffers=%d\n", *nbuffers);
>  
>  	/* Need at least 8 buffers */
> -	if (vq->num_buffers + *nbuffers < 8)
> -		*nbuffers = 8 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 8)
> +		*nbuffers = 8 - q_num_bufs;
>  	*nplanes = 1;
>  	sizes[0] = PAGE_ALIGN(dev->buffersize);
>  	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);

This is really a generic issue with most of these patches:

queue_setup checks for a minimum number of buffers, but that should instead
be configured through the q->min_buffers_needed field.

A lot of older drivers were written before that field was added.

This is a good opportunity to just drop this check from queue_setup
and instead just set q->min_buffers_needed to 8.

Regards,

	Hans

