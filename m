Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295B4C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UKpQjRu8xM1MBn8m2R6Vj3MLhSqpic+kjA6qQjfyOo=; b=lDr6MDEKlOqqZtccsgxXO5hBN0
	jEZl1+Y3lv4ZLDCiqlW1WDWlGKaINsmExxu1gR0tULmuZzoZhPULJ38Bebw7qu0Y3SaHsUWKyw3l4
	RuMTpVsGew6iLy0yPtn5jUPv0nQTETxllS0TlSZLbEI6tDZbLGt8fiHV3KoEFx9RbvJDjHIRKuR9j
	wGx05/L05TRh5eEU3m8uQ9VptgWyjeFimrCGLb156Hx8LKMlZNcHw1YztbX+RCSBwGkNYn1pKGEQs
	Te/EtBHnueMBM/ZMe3JkT+MtnFitDxmc7CqHEt2v8aMAj6A1TZ9bMXnOWEt587H2IDxG2tZfKDgI3
	qZn1kpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Eq-0064U0-0S;
	Thu, 09 Nov 2023 11:30:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Em-0064Sd-0v;
	Thu, 09 Nov 2023 11:30:17 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A43096607421;
	Thu,  9 Nov 2023 11:30:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529415;
	bh=SVwWJoku0b2gF9Msm+qmkDJT0wgIhMp4EHQn46CbvKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XTzMyPLGtG7ot69/B3qnKksFGi+wYvy2qUIZq9vDHeuBWwPSjFg1waygDHk/Z1f9w
	 rf0aJ52auDd2kRdzE/OOhydhIUIFk3SI78eHztTvaV4RqLcyvnce1H+eA62F8d9jyI
	 Iljv87MInMY3+AZbaJjU9YvTaLWqcgBxg1J4Y77B1ErzvoAgwL0pq7czm+l+3DkuSt
	 bjtH3cbsM3owmsjkUJz60pujw+dBQuWmJYh4/E9CyEUcHuMwmbAel786rAsy6qNkmE
	 G98AJOCk6Xck6lutnSll6wNnsXxS5JO2XENUrkiHvQ/c1hBLalrDlWwMCofbiKOaH8
	 eiP+XvuXiAVjA==
Message-ID: <c8788939-15e2-44ee-b478-c377a7964f0e@collabora.com>
Date: Thu, 9 Nov 2023 12:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 37/56] media: renesas: Stop direct calls to queue
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
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-38-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-38-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_033016_450268_C5C917C2 
X-CRM114-Status: GOOD (  14.53  )
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

> CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>   drivers/media/platform/renesas/rcar_drif.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> index 292c5bf9e50c..f21d05054341 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
>   			unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	/* Need at least 16 buffers */
> -	if (vq->num_buffers + *num_buffers < 16)
> -		*num_buffers = 16 - vq->num_buffers;
> +	if (q_num_bufs + *num_buffers < 16)
> +		*num_buffers = 16 - q_num_bufs;
>   
>   	*num_planes = 1;
>   	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);


