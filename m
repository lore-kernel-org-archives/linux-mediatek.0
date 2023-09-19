Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F3CD5BC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n12VSdKvMv2r98Jdo39dQ0bmzh7maaNjZvw37aKE9U=; b=PslxsZpUlP3MUqcqAijNMZ0JSV
	OGfIW1nb3nDE9SiFuIMqg5s788uUlYJf4aBKttkHpVt/0FyVKvnpy7Xre3sTMVwcDTHzpWf9AK5J/
	v5P5vWy3uxiScJVBTmLDFuV3WGx31gl/Fq9NJKZWDLjxqL6So3aRfKlnWs2ygmfYemgtIbd564aF3
	Jb3V9do1I//JInTOoYBsMn9EWaBBche8EVJh+pECMm3ErONy0zUuu2crC7RqbhV2ki4f7srFC2Aeg
	4kET1OqdagWq5R7c9ISLU8cI/toXnlxwc2nhutRm0RDaJDLS04spxpcu+nPsgpiSmLVGmtLjpmMC/
	4EoDeeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibMO-000bfZ-1X;
	Tue, 19 Sep 2023 14:05:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibML-000beH-0Q;
	Tue, 19 Sep 2023 14:05:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 34181CE116A;
	Tue, 19 Sep 2023 14:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18007C433C8;
	Tue, 19 Sep 2023 14:05:41 +0000 (UTC)
Message-ID: <77267d52-e423-4de7-b840-9945699884b3@xs4all.nl>
Date: Tue, 19 Sep 2023 16:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 32/49] media: renesas: Stop direct calls to queue
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
 <20230914133323.198857-33-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-33-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_070549_371668_3D670AB6 
X-CRM114-Status: GOOD (  15.36  )
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
>  drivers/media/platform/renesas/rcar_drif.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> index 163a4ba61c17..020845689ed3 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
>  			unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
> +	unsigned int q_num_buffers = vb2_get_num_buffers(vq);
>  
>  	/* Need at least 16 buffers */
> -	if (vq->num_buffers + *num_buffers < 16)
> -		*num_buffers = 16 - vq->num_buffers;
> +	if (q_num_buffers + *num_buffers < 16)
> +		*num_buffers = 16 - q_num_buffers;

This should be dropped, and instead min_buffers_needed should be set to 16.

Regards,

	Hans

>  
>  	*num_planes = 1;
>  	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);


