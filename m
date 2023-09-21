Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07886CD494F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMU0WnxZp+nl/FIdR7eTM4CgGJnuOwucaBF5xBRA754=; b=E0KUulNLTXUPV04AB2YyuTJoNL
	OT0bc5VgnDHSBS60u4nUbKaxBgy6ETkcc7oQ9B9q06oLWWykS6gP1mt1/4Qdu0g9gaAB2GEbDEpHa
	pSGWu+c0Whz43R/grbmxkjeNRPduBK738YAHmaER7RLzSG+GGRZUAW/buhgOvZnPXkbfTRWyxT/US
	luTEPVC/tFuaXonx4Q4vzhJHmz8LLkBBeGaKnDgpGenSJ/ToYhXm8gJ7T7qservqnggPAC+AIKFwz
	EVxQJHxhQmwgWhQO0K+rLpTyCleMsicG9v4LQSHu2gD9ffUUyH/J3kWi/8ljlPwy1bRpYwmcfdrR7
	EnNTgaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIRJ-005y3e-1p;
	Thu, 21 Sep 2023 12:05:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjIRB-005y0b-0T;
	Thu, 21 Sep 2023 12:05:42 +0000
Received: from [IPV6:2a01:e0a:120:3210:9fdf:789a:7434:5a59] (unknown [IPv6:2a01:e0a:120:3210:9fdf:789a:7434:5a59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 164DD66072FC;
	Thu, 21 Sep 2023 13:05:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695297935;
	bh=PBeBL+YRZtH0bYoq08uc36OyCfZON3dY/vzl0bwJacs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ueie0msr8g+x4ffM/JVIo7jX3lp0NPzHfeYTFXEzFW4+Xj2vqGGFwJn/QWynhofzU
	 JNOVGeOiKr5RNOR1Bzn8k2nZuGSVrQ7iJAww0vAeBzEgKgOh6A5ChsBGpYXEm8Cm+3
	 lgJCoSs+ifIZ9Hu/QZEqtgVIq5W+6UM5Vin4cgqc2h46r16F+tHGaqBoDVwtve97Q+
	 e2EPbyxwY9mK8pKlk71qVIc0KuoKvfjYJIo/XqaVfNa6rY21EHNXLI+/WxxLBTx3jL
	 8ptXikVq5KH/LBkHFaJtJUC9XwOTSj0btr+O2Anglxrqk2tY7aiINhOvQJyKvKEQIk
	 njXRo/kvdvuaw==
Message-ID: <aa649adf-8faf-801b-f6bd-d4a4760e040f@collabora.com>
Date: Thu, 21 Sep 2023 14:05:32 +0200
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
 <31f298ec-6280-d21b-3d8a-c7bf1c9c0c30@collabora.com>
 <b10a7414-b710-4fb9-a72d-e2d7eff2616d@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <b10a7414-b710-4fb9-a72d-e2d7eff2616d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_050541_494563_86320954 
X-CRM114-Status: GOOD (  16.80  )
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


Le 21/09/2023 à 12:24, Hans Verkuil a écrit :
> On 21/09/2023 11:28, Benjamin Gaignard wrote:
>> Le 20/09/2023 à 16:56, Hans Verkuil a écrit :
>>> On 20/09/2023 16:30, Benjamin Gaignard wrote:
>>> <snip>
>>>
>>>>>>         num_buffers = min_t(unsigned int, num_buffers,
>>>>>>                     q->max_allowed_buffers - vb2_get_num_buffers(q));
>>>>>>     -    first_index = vb2_get_num_buffers(q);
>>>>>> +    first_index = bitmap_find_next_zero_area(q->bufs_map, q->max_allowed_buffers,
>>>>>> +                         0, num_buffers, 0);
>>>>>>           if (first_index >= q->max_allowed_buffers)
>>>>>>             return 0;
>>>>>> @@ -675,7 +678,13 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>>>>>>       struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q, unsigned int index)
>>>>>>     {
>>>>>> -    if (index < q->num_buffers)
>>>>>> +    if (!q->bufs_map || !q->bufs)
>>>>>> +        return NULL;
>>>>> I don't think this can ever happen.
>>>> I got kernel crash without them.
>>>> I will keep them.
>>> What is the backtrace? How can this happen? It feels wrong that this can be
>>> called with a vb2_queue that apparently is not properly initialized.
>> I have this log when adding dump_stack() in vb2_get_buffer() if !q->bufs_bitmap:
>>
>> [   18.924627] Call trace:
>> [   18.927090]  dump_backtrace+0x94/0xec
>> [   18.930787]  show_stack+0x18/0x24
>> [   18.934137]  dump_stack_lvl+0x48/0x60
>> [   18.937833]  dump_stack+0x18/0x24
>> [   18.941166]  __vb2_queue_cancel+0x23c/0x2f0
>> [   18.945365]  vb2_core_queue_release+0x24/0x6c
>> [   18.949740]  vb2_queue_release+0x10/0x1c
>> [   18.953677]  v4l2_m2m_ctx_release+0x20/0x40
>> [   18.957892]  hantro_release+0x20/0x54
>> [   18.961584]  v4l2_release+0x74/0xec
>> [   18.965110]  __fput+0xb4/0x274
>> [   18.968205]  __fput_sync+0x50/0x5c
>> [   18.971626]  __arm64_sys_close+0x38/0x7c
>> [   18.975562]  invoke_syscall+0x48/0x114
>> [   18.979329]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   18.984068]  do_el0_svc+0x1c/0x28
>> [   18.987402]  el0_svc+0x40/0xe8
>> [   18.990470]  el0t_64_sync_handler+0x100/0x12c
>> [   18.994842]  el0t_64_sync+0x190/0x194
>>
>> This happen at boot time when hantro driver is open and close without other actions.
> Ah, now I see the problem. q->bufs and q->bufs_map are allocated in
> vb2_core_create_bufs and vb2_core_reqbufs, but they should be allocated
> in vb2_queue_init: that's the counterpart of vb2_core_queue_release.
>
> With that change you shouldn't have to check for q->bufs/bufs_map anymore.

It is a better solution but even like this vb2_core_queue_release() is called
at least 2 times on the same vivid queue and without testing q->bufs_bitmap
makes kernel crash.

>
> Regards,
>
> 	Hans
>
>>     
>>>>>> +
>>>>>> +    return (bitmap_weight(q->bufs_map, q->max_allowed_buffers) > 0);
>>>>> How about:
>>>>>
>>>>>       return vb2_get_num_buffers(q) > 0;
>>>> vb2_get_num_buffers is defined in videobuf2-core.c, I'm not sure that
>>>> an inline function could depend of a module function.
>>> Not a problem. E.g. v4l2-ctrls.h is full of such static inlines.
>>>
>>> Regards,
>>>
>>>      Hans
>>>
>

