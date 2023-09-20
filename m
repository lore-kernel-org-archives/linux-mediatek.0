Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E82CE79DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K04NXoJ7Y9q3wftpmynpfOQNlwxqB3uOMfQ/7UMdNAg=; b=zJHcptTx1yoI2gVFhlAkoboeFt
	eyWPtzlzaoIW3azcm8gWezepgNFHjzf1u/nmkl+2LFYw3pUZwD88MMn5hRZFLsMIpiBXVkbbeUcIR
	HWKf3CZEvfAo17lxVQR/na9Ln3mGPCv4VMfIblaROhu5grfwiV3zRfbXCsxnaYve5ECuBJZ03r9x5
	SuscIHaEbPM3fu8PCIF8uSDP1aUioeYph3A/uCEARaW603Kr2C1fw64zenSfnIhsbM26hXxiZ/cTC
	r6qRPbqj7Y2yfI3zWODWMIA987qTM84JUzhco9BtvCK4tCZts29MakNnyBBXhg/WbWqp/Xg8aRM9z
	gWE+y2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyd4-003Qz5-0b;
	Wed, 20 Sep 2023 14:56:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiycz-003Qxd-3A;
	Wed, 20 Sep 2023 14:56:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35B3C61A1D;
	Wed, 20 Sep 2023 14:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E83CC433C9;
	Wed, 20 Sep 2023 14:56:29 +0000 (UTC)
Message-ID: <470682b4-c14b-4237-bc46-fddfdd085026@xs4all.nl>
Date: Wed, 20 Sep 2023 16:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 45/49] media: core: Add bitmap manage bufs array
 entries
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
 <20230914133323.198857-46-benjamin.gaignard@collabora.com>
 <1142bbb4-b8f1-44ec-962e-9347a231782f@xs4all.nl>
 <20b6b93e-eef8-3d7b-a3c2-795f220059d4@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20b6b93e-eef8-3d7b-a3c2-795f220059d4@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_075634_092053_D691933B 
X-CRM114-Status: GOOD (  12.73  )
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

On 20/09/2023 16:30, Benjamin Gaignard wrote:
> 

<snip>

>>>       num_buffers = min_t(unsigned int, num_buffers,
>>>                   q->max_allowed_buffers - vb2_get_num_buffers(q));
>>>   -    first_index = vb2_get_num_buffers(q);
>>> +    first_index = bitmap_find_next_zero_area(q->bufs_map, q->max_allowed_buffers,
>>> +                         0, num_buffers, 0);
>>>         if (first_index >= q->max_allowed_buffers)
>>>           return 0;
>>> @@ -675,7 +678,13 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>>>     struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q, unsigned int index)
>>>   {
>>> -    if (index < q->num_buffers)
>>> +    if (!q->bufs_map || !q->bufs)
>>> +        return NULL;
>> I don't think this can ever happen.
> 
> I got kernel crash without them.
> I will keep them.

What is the backtrace? How can this happen? It feels wrong that this can be
called with a vb2_queue that apparently is not properly initialized.

>>> +
>>> +    return (bitmap_weight(q->bufs_map, q->max_allowed_buffers) > 0);
>> How about:
>>
>>     return vb2_get_num_buffers(q) > 0;
> 
> vb2_get_num_buffers is defined in videobuf2-core.c, I'm not sure that
> an inline function could depend of a module function.

Not a problem. E.g. v4l2-ctrls.h is full of such static inlines.

Regards,

	Hans

