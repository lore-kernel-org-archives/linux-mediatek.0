Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01E8CD5BC0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjfE4FS0XUhNXw7ZmYG/2XxMW/vg4yD0xFMzaQHgzDc=; b=1+ANQripboZ2hMuz/5XqTYVP51
	WElXRufyoLHez7VEoQn+v6Je0TDwp0koRml/FAnnyguSlwFPxKh2Z5g37v30ONsvVysgyU+ncZcZm
	8VHebSN8AdkTR+hxSbT2sCJDlhZIHHe5oQ188bfeP21mflkW0q2fb/2uZs9rmgixDnsZtIUIa9atW
	mJEJMevgaobV/iu7KeXbsb1sdIM94HngF4x9dQejQpyuvOmmbU/9+SHFoc37x5pP9lKRtp6MPt7V6
	32g6nNyhxIb4V3LQ+hDj/it3qjLLci/LR3ZIuIfsHvXJwgiOWKsfzLlBlAmDnAczfPIss877iZcCF
	BU8b/tLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qib0O-000Z1s-1v;
	Tue, 19 Sep 2023 13:43:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qib0L-000Yzv-1D;
	Tue, 19 Sep 2023 13:43:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3FD49B8160F;
	Tue, 19 Sep 2023 13:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F513C433C7;
	Tue, 19 Sep 2023 13:42:57 +0000 (UTC)
Message-ID: <08551a93-a4b6-40c1-88c0-2c419987cc3e@xs4all.nl>
Date: Tue, 19 Sep 2023 15:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/49] media: pci: cx18: Stop direct calls to queue
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
 <20230914133323.198857-24-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-24-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_064305_560942_9BE8F981 
X-CRM114-Status: GOOD (  17.72  )
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
>  drivers/media/pci/cx18/cx18-streams.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
> index 597472754c4c..a7a7e006b3be 100644
> --- a/drivers/media/pci/cx18/cx18-streams.c
> +++ b/drivers/media/pci/cx18/cx18-streams.c
> @@ -105,6 +105,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>  			    unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cx18_stream *s = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	struct cx18 *cx = s->cx;
>  	unsigned int szimage;
>  
> @@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>  	 * Let's request at least three buffers: two for the
>  	 * DMA engine and one for userspace.
>  	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

From what I can see, this driver already sets min_buffers_needed to 3,
so this check can just be dropped.

	Hans

>  
>  	if (*nplanes) {
>  		if (*nplanes != 1 || sizes[0] < szimage)


