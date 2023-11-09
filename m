Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87511C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hi1E76xSXBmToF025D6ID4u6rWwptVihvShYHyk0QUw=; b=y7ASOUJSbfcR3oNbA5OyuF2Hpb
	ytXBlIMXpfbBvfGwwhCNTG+RVCs3plDxJGE/Of5rldA4npFVeqU3fZyMrwxWZxQJV+Inz60VOhyt7
	SfL5dxkbXcsX/RwKgYHMEmdcVZjYNn0KPEt6fXzj3O/4z/am3k9vwebSBMza7cUkxPpfkdhd/Fuby
	qSYpN3Wv8aFPOVMTwSs84D/SU3kPTx4d+ZQuLgktSmVR7uM9Y7OTEhIxbNAN9Sl4mWmxQxBk9CJYW
	aw+aGHi0LBbxmIGQQH4fdCaRW/HAlWpytWD/1OtvFcIA+RgWUtJbM4CZEPRpUGaLYQHcp+vqKL3/H
	6pgl6VyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r123m-005teO-1X;
	Thu, 09 Nov 2023 10:14:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123j-005tcQ-0s;
	Thu, 09 Nov 2023 10:14:48 +0000
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16FA0660745F;
	Thu,  9 Nov 2023 10:14:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524884;
	bh=DYQUOdQcPcJ4Aq46KvrXHshkkZ0xtkz1temE8dvo4hY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jGFnl9QYxLTR1iCasDsKgh5KjX0WEiVITzhb2iP3q2GV6W7TaWBnb8T3n4llYsxIT
	 7foTAs37hfm+thUbvOafvV6atzvZBSxXd+IYp+P97xkAA34AGjDhixQHoTJFQNS6Hb
	 QsnIe4dAkBAnWYUHUiKV3HHD9Cl33RYsFbJGwgkb/54LkLTIWZUL3ZWPeffNrD1M/o
	 ReO1b1RAmKUUeFqiEF29N3EQibA1Px8cNTrth7gkES0UPscm2JQbvpDeUHJLQysYPh
	 15JWxvJm1jX7z737UZrErqZ7swEBsl+XDlYV6vGCU4k+EfuyGJ+EBKg6RjOQZZzS+B
	 uGhYi+jKIeUvQ==
Message-ID: <a8bbf1b7-5f9b-4466-84ec-88f3fb2568dc@collabora.com>
Date: Thu, 9 Nov 2023 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 19/56] media: dvb-core: Do not initialize twice queue
 num_buffer field
Content-Language: en-US
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-20-benjamin.gaignard@collabora.com>
 <fc11c361-7d5b-493f-96c8-8495293f2544@collabora.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <fc11c361-7d5b-493f-96c8-8495293f2544@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021447_464691_5C20B279 
X-CRM114-Status: GOOD (  14.61  )
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


Le 09/11/2023 à 10:50, Andrzej Pietrasiewicz a écrit :
> Hi Benjamin,
>
> W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
>> The above memset already zeroed all the ctx fields, it is useless
>> to do it here again.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/dvb-core/dvb_vb2.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/dvb-core/dvb_vb2.c 
>> b/drivers/media/dvb-core/dvb_vb2.c
>> index 3a966fdf814c..a731b755a0b9 100644
>> --- a/drivers/media/dvb-core/dvb_vb2.c
>> +++ b/drivers/media/dvb-core/dvb_vb2.c
>> @@ -177,7 +177,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const 
>> char *name, int nonblocking)
>>       q->ops = &dvb_vb2_qops;
>>       q->mem_ops = &vb2_vmalloc_memops;
>>       q->buf_ops = &dvb_vb2_buf_ops;
>> -    q->num_buffers = 0;
>
> A few lines above this one is this:
>
>     q->is_output = 0;
>
> Can this also be included in this (cleanup) patch?

Nice catch, I will add it.

Thanks,
Benjamin

>
> Regards,
>
> Andrzej
>
>>       ret = vb2_core_queue_init(q);
>>       if (ret) {
>>           ctx->state = DVB_VB2_STATE_NONE;
>
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com

