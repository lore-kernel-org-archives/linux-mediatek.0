Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70EEC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgmRd3XXtmgxLA24mAUIlEO65b+WzjsAI/lFLj+OhXo=; b=StXSiDvSvGDSZ592fWukyyF0YR
	VnvOqVZSLnwNGMiyvVP/0dVCeGnleFBeHyIVlbHXEcV2xC3t0+NMlhskc1GtFfeiTgdb5RYLjaafl
	UcfaFzda79lK0bjeAHdP7zhqrxWeI5WILv2CvpooVsZeukWuOuPvYSvuCm6JNxdkDE2eIvg6JqUib
	G/CQJq1T/0wt1s5DV93WEXNIXs2oZu0vgo2TlEkJwtLmO5WRmzCwMVqkIGJhTUhNQu5tP/gK/EJu+
	Vm8Je5gxE5OxpscEv36PGu1Te7yoFGmsXaa+se5UwQyXGQPLrlXAQXK6K0tahGghySKzydmAQum9H
	df9YNMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wf-005sG3-1w;
	Thu, 09 Nov 2023 10:07:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wa-005sAk-0q;
	Thu, 09 Nov 2023 10:07:26 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1479B6607435;
	Thu,  9 Nov 2023 10:07:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524442;
	bh=2u4132PKQo/IFXxEHHXQCfjEEBtnpTKPKk3Jkg0X8BA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aPdvntNYeqjb+XoPa1QOJWzij5Diogua7gCy81chfR2XskUq1ILkXzf2tZRnG3JP7
	 phwa5ILJKXBUJNil2qBTzLotFJcrNeFLUPu1d7XoMzWtTPyFR1nLM6DwIxHdkvoj1/
	 Jp6XyNdh9JXMySrU9kpIB5DXb8A3RAHMx9n0kucsSkAZAzg9mkO+utTdnp+dE47s4z
	 uVauM1T92AGxYC5Vo2ibB5bJMDeIHosARg3QA0cjpXGm6PKhRK45DpdILnmtsPYnsf
	 mL5JH3wTXwWXQgMh75/hAjYMUUVm/cjfq6YltNYU97n0DQyVSdQAJouj849HgL22hl
	 WSSDwlp0gymLQ==
Message-ID: <c4f47aaa-d712-4905-b77d-6fe1b897d94b@collabora.com>
Date: Thu, 9 Nov 2023 11:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 23/56] media: pci: cx18: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-24-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-24-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020724_443795_857D57D2 
X-CRM114-Status: GOOD (  15.99  )
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
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Sergey Kozlov <serjk@netup.ru>
> CC: Abylay Ospan <aospan@netup.ru>
> ---
>   drivers/media/pci/cx18/cx18-streams.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
> index 597472754c4c..cfbc4a907802 100644
> --- a/drivers/media/pci/cx18/cx18-streams.c
> +++ b/drivers/media/pci/cx18/cx18-streams.c
> @@ -104,6 +104,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>   			    unsigned int *nbuffers, unsigned int *nplanes,
>   			    unsigned int sizes[], struct device *alloc_devs[])
>   {
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	struct cx18_stream *s = vb2_get_drv_priv(vq);
>   	struct cx18 *cx = s->cx;
>   	unsigned int szimage;
> @@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
>   	 * Let's request at least three buffers: two for the
>   	 * DMA engine and one for userspace.
>   	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes) {
>   		if (*nplanes != 1 || sizes[0] < szimage)


