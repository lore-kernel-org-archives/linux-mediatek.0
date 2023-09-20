Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B7BC00523
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IQ2bBUK5r4t7wXfmLJV5NwETRZfzSAEBm4iT23NQtc=; b=ddv0yRLDxq33x+1VFZD9EqVX5Z
	3/1ye/buZjdXi+K0MTS0oYcpk3gNdqVrNEey7ohuIne0N99qSLkdAZYu2/XqkgxZpoUqa2DEulWrG
	6zFZ7MIHdbp3ZIoF/zMXtTp8B4CQ/GoE+Mm7+Y/oC7OE41SGU4ExE4b+2Rf21enOluz21sIiMLBnR
	AOFnE52I85k53d63L1bwCkg995LpOc2PSXXWgRu0V27IWYMRi0aJNzazPPKigUriSENo4dP9Rr/7A
	qjVXbFAor5QekuBhCb4BEd/NdAgvp7OuS17/jgg6u/NwPW5RuVdfLvyfyySLazBdcdgL0ToBxgosL
	D4BSG7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyxa-003Tcc-1u;
	Wed, 20 Sep 2023 15:17:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyxX-003Tb6-0r;
	Wed, 20 Sep 2023 15:17:48 +0000
Received: from [IPV6:2a01:e0a:120:3210:def9:8f6c:3807:7d89] (unknown [IPv6:2a01:e0a:120:3210:def9:8f6c:3807:7d89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 365C366071DC;
	Wed, 20 Sep 2023 16:17:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695223063;
	bh=sVWbeVvViH+sanbxD7UOCdPMVWb4cp4MCMV6I8qEHqU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fgjOVRxHl8kCiwY7Hcd8T0jWmApbiH0ed+OZ+JjHsOgnk81FeqgeM2NfWKpSyo393
	 tWZdmT/mZxwtvLVhu2lpoxiO3Gj9JGJYBJJVnuDIqefxCVQ6rcdllneEzVEKrRB1/e
	 jNKWiKjocDbGPpaDX3JAMzrBqU0vTo9NCdtaHu1pRNRyWgE8CBjekFaQzyyXhqKEHj
	 jBcC12vTx/Ho6DbjY7Ow4kmQyy53rsA/NxZIfylqsR4qcHvHDrOLELIuaUyr6j0GF6
	 gPylEuqd7wDouKvgZ05UYjO9coGCA0zBwD+8tGXMt3joh1WfqVi77e0AtVidQsYYAl
	 6LF8/U/HCyRCA==
Message-ID: <10a9a265-6910-807a-57c5-62ee41c731a5@collabora.com>
Date: Wed, 20 Sep 2023 17:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 45/49] media: core: Add bitmap manage bufs array
 entries
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-46-benjamin.gaignard@collabora.com>
 <1142bbb4-b8f1-44ec-962e-9347a231782f@xs4all.nl>
 <20b6b93e-eef8-3d7b-a3c2-795f220059d4@collabora.com>
 <470682b4-c14b-4237-bc46-fddfdd085026@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <470682b4-c14b-4237-bc46-fddfdd085026@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_081747_433661_5A73C85D 
X-CRM114-Status: GOOD (  14.04  )
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


Le 20/09/2023 à 16:56, Hans Verkuil a écrit :
> On 20/09/2023 16:30, Benjamin Gaignard wrote:
> <snip>
>
>>>>        num_buffers = min_t(unsigned int, num_buffers,
>>>>                    q->max_allowed_buffers - vb2_get_num_buffers(q));
>>>>    -    first_index = vb2_get_num_buffers(q);
>>>> +    first_index = bitmap_find_next_zero_area(q->bufs_map, q->max_allowed_buffers,
>>>> +                         0, num_buffers, 0);
>>>>          if (first_index >= q->max_allowed_buffers)
>>>>            return 0;
>>>> @@ -675,7 +678,13 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>>>>      struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q, unsigned int index)
>>>>    {
>>>> -    if (index < q->num_buffers)
>>>> +    if (!q->bufs_map || !q->bufs)
>>>> +        return NULL;
>>> I don't think this can ever happen.
>> I got kernel crash without them.
>> I will keep them.
> What is the backtrace? How can this happen? It feels wrong that this can be
> called with a vb2_queue that apparently is not properly initialized.

I will add backtrace when doing test on v8

>
>
>>>> +
>>>> +    return (bitmap_weight(q->bufs_map, q->max_allowed_buffers) > 0);
>>> How about:
>>>
>>>      return vb2_get_num_buffers(q) > 0;
>> vb2_get_num_buffers is defined in videobuf2-core.c, I'm not sure that
>> an inline function could depend of a module function.
> Not a problem. E.g. v4l2-ctrls.h is full of such static inlines.

I will change vb2_get_num_buffers() to inline function that solve the problem too.

>
> Regards,
>
> 	Hans
>

