Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA07C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOmt6GmbND2DTZY0XLjubQdf140bRjMSvvv4lHutls0=; b=0jLENoaXiB1yUYfsVuZ9VzLFSF
	hP9BGf+eclbF7+6X08PAZsS86ao1G7gbwecihJ76YrDPOd6oAKg+jpUb0p5iDB8GIrQGAANN778H8
	7Yckz6cbXUyyp3LGYeO9Y7yrf+5O8yhIvkVUVXQ/5JMKDovJIcJdQ38s48LcehBbwJz+EBGo/wRb9
	CxcYbA3feOYlDmUrD4P7pOuaH+aj1inzFtxxuW1rOcpPSoNBAN5K3lvfyQsqZlICu6yQgQUM2GgCD
	BAti99UBrMB4gsMGxJzj1UM9OS2nSn7IIja/mw0Hk7+zPn5IkXX72rrk+4a5XwXHSm2wRxzURJold
	LJjDl2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r17MV-006f4L-0P;
	Thu, 09 Nov 2023 15:54:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r17MR-006f3T-17;
	Thu, 09 Nov 2023 15:54:29 +0000
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B90C66074E4;
	Thu,  9 Nov 2023 15:54:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699545263;
	bh=3WWL6wQEComAANvAj1qEV/UYxsJ1yDBfQ3tP5uX/YLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D/dUZwI3iQpedaY/GdQjHQS1scxyhcN7jhgn6D47iDVOWAXLkJYI6JlliE4PqmW/F
	 dMEOOPkxJ8ZlzQybUFvpUZmlGi79eHqyaJx0Yxup3HJ5Yd6Ze+dQnNfdhHKlpO8PSd
	 xeXAr05Z1tf0hQAm4iDfRDXdrOnBv1+GpDuUaeyED4Kd+IQ8QxcOkJsa+goDTcXPQg
	 cs+yV0VQgJo5pHMGahaM5nsibUwKDyBxIKWaWQhTwPBpbwc4vz7xxBxDOLmmP5aVKf
	 1weo50VNmE7smJkaFraV1l9OxfnyeJPl9QQ7xCmBW2qThbML61PtQ3rgYO5gVG8+gT
	 dko5b02V9ORdA==
Message-ID: <22f2aee0-aea7-465d-b7f3-b1add1bf7bd7@collabora.com>
Date: Thu, 9 Nov 2023 16:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 35/56] media: cedrus: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 kernel@collabora.com, Maxime Ripard <mripard@kernel.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-36-benjamin.gaignard@collabora.com>
 <083e43d9-452a-4b11-b7f1-f75992bc795e@collabora.com>
 <ZUzpSXDbO60uGr0t@aptenodytes>
 <618d5b67-ba46-4c33-ae7f-990f4b522ba8@collabora.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <618d5b67-ba46-4c33-ae7f-990f4b522ba8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_075427_650008_9175733D 
X-CRM114-Status: GOOD (  22.00  )
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


Le 09/11/2023 à 16:48, Andrzej Pietrasiewicz a écrit :
> Hi Paul,
>
> W dniu 9.11.2023 o 15:14, Paul Kocialkowski pisze:
>> Hi Andrzej,
>>
>> On Thu 09 Nov 23, 12:27, Andrzej Pietrasiewicz wrote:
>>> Hi Paul,
>>>
>>> W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
>>>> Use vb2_get_num_buffers() to avoid using queue num_buffers field 
>>>> directly.
>>>> This allows us to change how the number of buffers is computed in the
>>>> future.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>>>
>>> Given you've alaredy A-b, would you be ok with adding this sentence:
>>>
>>> "While at it, check the return value of vb2_get_buffer()."
>>>
>>> to the commit message body?
>>
>> Not only do I agree, but because this is done in a function returning 
>> void,
>> you could even:
>>
>> if (WARN_ON(!vb))
>>     continue;
>>
>> so that it doesn't go completely unnoticed.
>>
>> What do you think?
>>
>
> I'd ask Benjamin.
>
> But my take on the direction of changes is that ultimately
> there will be "holes" in the array of allocated buffers (hence the
> bitmap to track which slots are used and which are not). In other words,
> getting a NULL sometimes will be an expected situation, and a WARN() will
> not be appropriate for an expected situation.
>
> @Benjamin?

That should never happens unless you add delete buffers capability to the driver
and in this case it is normal to have holes.
Other drivers do not use WARN_ON() so I will not do it for this one.

Regards,
Benjamin

>
> Regards,
>
> Andrzej
>
>> Cheers,
>>
>> Paul
>>
>>> @Benjamin:
>>>
>>> With this change, you can add my
>>>
>>> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>>
>>>> CC: Maxime Ripard <mripard@kernel.org>
>>>> ---
>>>>    drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 9 +++++++--
>>>>    drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
>>>>    2 files changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c 
>>>> b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>>>> index dfb401df138a..3e2843ef6cce 100644
>>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>>>> @@ -653,8 +653,13 @@ static void cedrus_h264_stop(struct cedrus_ctx 
>>>> *ctx)
>>>>        vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, 
>>>> V4L2_BUF_TYPE_VIDEO_CAPTURE);
>>>> -    for (i = 0; i < vq->num_buffers; i++) {
>>>> -        buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
>>>> +    for (i = 0; i < vb2_get_num_buffers(vq); i++) {
>>>> +        struct vb2_buffer *vb = vb2_get_buffer(vq, i);
>>>> +
>>>> +        if (!vb)
>>>> +            continue;
>>>> +
>>>> +        buf = vb2_to_cedrus_buffer(vb);
>>>>            if (buf->codec.h264.mv_col_buf_size > 0) {
>>>>                dma_free_attrs(dev->dev,
>>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c 
>>>> b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>>> index fc9297232456..52e94c8f2f01 100644
>>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>>> @@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx 
>>>> *ctx)
>>>>        vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, 
>>>> V4L2_BUF_TYPE_VIDEO_CAPTURE);
>>>> -    for (i = 0; i < vq->num_buffers; i++) {
>>>> -        buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
>>>> +    for (i = 0; i < vb2_get_num_buffers(vq); i++) {
>>>> +        struct vb2_buffer *vb = vb2_get_buffer(vq, i);
>>>> +
>>>> +        if (!vb)
>>>> +            continue;
>>>> +
>>>> +        buf = vb2_to_cedrus_buffer(vb);
>>>>            if (buf->codec.h265.mv_col_buf_size > 0) {
>>>>                dma_free_attrs(dev->dev,
>>>
>>
>>
>> _______________________________________________
>> Kernel mailing list -- kernel@mailman.collabora.com
>> To unsubscribe send an email to kernel-leave@mailman.collabora.com
>

