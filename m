Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF734C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ovkwMOA+QyQHqz9MVuLQScQHwHMR4fuInMHAu2oahY=; b=CC6DfJJonsV6QrpcdNp/YnEmbs
	E0XlDG25+tQenm10LDzv6C43eL/6FY8ccuyrBFZtNfxcvOGpvFaGKOLcFwo2xMEEqNEhgvwEppcJ0
	seOOmMIIk+27q8AqGa1iQd1fYfFosd5I/wxYX++t0mpMIxeZnSwoOEThZ4f1hQY238H6n5M/8t7Lx
	uud4II1ZUurBqcjMabyYMNgyixyuofKRlAvya19fA7RNfrjIsJzisGn7D164xlKZYAA4heaoF/2M9
	EozXaYPFrf4/BKxgjBjLOj1i6cEOJYyq41578MkK2PHdVhI1388Nu3nxOtPoGLs4nHBK/COjfVKA+
	4GFrgVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r127k-005vBU-2F;
	Thu, 09 Nov 2023 10:18:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r127i-005vAw-0f;
	Thu, 09 Nov 2023 10:18:55 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 400616601F0E;
	Thu,  9 Nov 2023 10:18:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525132;
	bh=KpcH3p7Di0WfpDAec7/coHT3wwJ2tMCcKVBEP9IvkxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S7hKjWNqdY4+kEYTV3fHYECTnId1ck6/Q8VjUtOzsTzCur5OxfLGsk8FZafnsHbHQ
	 dhKL/PrZE9qssX7AgYWZfg+dKczsNmmn5FCQceo9tR1XilOCt2tcsDotyc0s+zXCKX
	 lLdKPcVjh27J/oRLsGMb83WQXLuxrMulequvQfVkPOTiB+8Kj7cCk5o/y5JW/hRByM
	 83wxC67EdZ+CTVjPH9WXNEZI7ahrP+eIu95J/BgcQL0tIjZIN3PC1je2T3KkcbTrqN
	 +215fO6cvTMxZdmc1K6xyr3EzUUi2TbgR/qD6BasIsWFBVCP/BqWf+04jHKXe55EOE
	 tEs96G0UWbtTA==
Message-ID: <683359b7-bab4-4eef-a047-c3dc1a04f9d6@collabora.com>
Date: Thu, 9 Nov 2023 11:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 26/56] media: i2c: video-i2c: Stop direct calls to
 queue num_buffers field
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
 Matt Ranostay <matt.ranostay@konsulko.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-27-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-27-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021854_373562_2AE65B6C 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Benjamin,

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>   drivers/media/i2c/video-i2c.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 178bd06cc2ed..ebf2ac98a068 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -405,9 +405,10 @@ static int queue_setup(struct vb2_queue *vq,
>   {
>   	struct video_i2c_data *data = vb2_get_drv_priv(vq);
>   	unsigned int size = data->chip->buffer_size;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

This actually changes the logic. Maybe it has already been discussed and
the result of that discussion is this change in logic? Looking at other
drivers *nbuffers = 2 - q_num_bufs; seems the right thing to do.
But then at least the commit message body IMO should mention this change.
Or, preferably, the change in logic should be a separate patch to be applied
before this one.

Regards,

Andrzej

>   
>   	if (*nplanes)
>   		return sizes[0] < size ? -EINVAL : 0;


