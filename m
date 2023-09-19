Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D52CD5BC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8barereW4MNAzpUE+KWV0FERXdwDs1l6JstpqaZJQY=; b=g0SuqGo3CIUx7xJ7HqbpMgYLlq
	4z7iutxBgWt6iX2oXRouw+ZSplpDcIR2qV2Yz7oxL7+KrkcqzTJIMAcmE5TpfmO/4hrjhea5qHOH7
	h0UtiqH6LXfbM2k7GZY4EO59Tstc17nWe7iwpXxEaQylVYBpOf45hPrn+o1FSxtfY3NMnJrREzntj
	E/ul6x9wCT+srtspYZLkq3aIQ67GLgYHkKlTO5zJKW1P1+Dm03AcmcHEnVsL4QLpppbsNMhaHTL1s
	mwrqJIWlM4KcIfTmoCH2Uyw5OREZooQ57+AMkwWf+06heSAssXL/bNhYmrOhTmmHXX6fZ9N0iwUW/
	y4WvmqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibbH-000dp9-3A;
	Tue, 19 Sep 2023 14:21:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibbE-000dnq-2T;
	Tue, 19 Sep 2023 14:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BE22B80185;
	Tue, 19 Sep 2023 14:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6884C433C8;
	Tue, 19 Sep 2023 14:21:06 +0000 (UTC)
Message-ID: <d6d62f0c-d39b-4f50-9d08-2a92d9f383a4@xs4all.nl>
Date: Tue, 19 Sep 2023 16:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 40/49] media: usb: usbtv: Stop direct calls to queue
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
 <20230914133323.198857-41-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-41-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_072112_949523_356518DC 
X-CRM114-Status: GOOD (  15.29  )
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

On 14/09/2023 15:33, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/usb/usbtv/usbtv-video.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
> index 1e30e05953dc..41704d45c65c 100644
> --- a/drivers/media/usb/usbtv/usbtv-video.c
> +++ b/drivers/media/usb/usbtv/usbtv-video.c
> @@ -725,10 +725,11 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
>  	unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct usbtv *usbtv = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

Drop check, set min_buffers_needed to 2.

	Hans

>  	if (*nplanes)
>  		return sizes[0] < size ? -EINVAL : 0;
>  	*nplanes = 1;


