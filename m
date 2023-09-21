Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AA2E7070C
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JMy6MY4JfmQdnZsJ+HEEtnKkAs4zFOI9Fa4yFABy0s=; b=3aj7rjkg/eQvHNZPQpzLQnx5kB
	H6iGspywnh/a3m4/N2Cwq+NN8KP0INV/tegqNiuCanylrwjXIzNcaZskpk3aiQJ/IqN469mGB/5y6
	G6kAELQQaVjLoz1tOTVnFgOOWWqhP1CP+qRVgkAgF+jZLne7aqYww4srL60Sy/fzoqhyqz+YlIVp/
	w5dvAsvCeylTYvfEYVB8SNVOWdf6WzKGPA0gJ75MQaLhiwKNrR54Z6+U2iC8ysthmOdqR8XVZcjsz
	DoOQYT7uqtvzgMO2q8cCVCbsmjZ9TIjEEE3+lpZXnayQXjk/Uz/9FP2U7ykpllmpGoPx5rugn4nKG
	sY3lUJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGr7-005hxR-1B;
	Thu, 21 Sep 2023 10:24:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGr3-005hvG-2d;
	Thu, 21 Sep 2023 10:24:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BB6A0CE219D;
	Thu, 21 Sep 2023 10:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4979C32794;
	Thu, 21 Sep 2023 10:24:10 +0000 (UTC)
Message-ID: <b10a7414-b710-4fb9-a72d-e2d7eff2616d@xs4all.nl>
Date: Thu, 21 Sep 2023 12:24:08 +0200
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
 <470682b4-c14b-4237-bc46-fddfdd085026@xs4all.nl>
 <31f298ec-6280-d21b-3d8a-c7bf1c9c0c30@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <31f298ec-6280-d21b-3d8a-c7bf1c9c0c30@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_032418_190266_9C6794B4 
X-CRM114-Status: GOOD (  15.62  )
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

On 21/09/2023 11:28, Benjamin Gaignard wrote:
> 
> Le 20/09/2023 à 16:56, Hans Verkuil a écrit :
>> On 20/09/2023 16:30, Benjamin Gaignard wrote:
>> <snip>
>>
>>>>>        num_buffers = min_t(unsigned int, num_buffers,
>>>>>                    q->max_allowed_buffers - vb2_get_num_buffers(q));
>>>>>    -    first_index = vb2_get_num_buffers(q);
>>>>> +    first_index = bitmap_find_next_zero_area(q->bufs_map, q->max_allowed_buffers,
>>>>> +                         0, num_buffers, 0);
>>>>>          if (first_index >= q->max_allowed_buffers)
>>>>>            return 0;
>>>>> @@ -675,7 +678,13 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>>>>>      struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q, unsigned int index)
>>>>>    {
>>>>> -    if (index < q->num_buffers)
>>>>> +    if (!q->bufs_map || !q->bufs)
>>>>> +        return NULL;
>>>> I don't think this can ever happen.
>>> I got kernel crash without them.
>>> I will keep them.
>> What is the backtrace? How can this happen? It feels wrong that this can be
>> called with a vb2_queue that apparently is not properly initialized.
> 
> I have this log when adding dump_stack() in vb2_get_buffer() if !q->bufs_bitmap:
> 
> [   18.924627] Call trace:
> [   18.927090]  dump_backtrace+0x94/0xec
> [   18.930787]  show_stack+0x18/0x24
> [   18.934137]  dump_stack_lvl+0x48/0x60
> [   18.937833]  dump_stack+0x18/0x24
> [   18.941166]  __vb2_queue_cancel+0x23c/0x2f0
> [   18.945365]  vb2_core_queue_release+0x24/0x6c
> [   18.949740]  vb2_queue_release+0x10/0x1c
> [   18.953677]  v4l2_m2m_ctx_release+0x20/0x40
> [   18.957892]  hantro_release+0x20/0x54
> [   18.961584]  v4l2_release+0x74/0xec
> [   18.965110]  __fput+0xb4/0x274
> [   18.968205]  __fput_sync+0x50/0x5c
> [   18.971626]  __arm64_sys_close+0x38/0x7c
> [   18.975562]  invoke_syscall+0x48/0x114
> [   18.979329]  el0_svc_common.constprop.0+0xc0/0xe0
> [   18.984068]  do_el0_svc+0x1c/0x28
> [   18.987402]  el0_svc+0x40/0xe8
> [   18.990470]  el0t_64_sync_handler+0x100/0x12c
> [   18.994842]  el0t_64_sync+0x190/0x194
> 
> This happen at boot time when hantro driver is open and close without other actions.

Ah, now I see the problem. q->bufs and q->bufs_map are allocated in
vb2_core_create_bufs and vb2_core_reqbufs, but they should be allocated
in vb2_queue_init: that's the counterpart of vb2_core_queue_release.

With that change you shouldn't have to check for q->bufs/bufs_map anymore.

Regards,

	Hans

>    
>>
>>>>> +
>>>>> +    return (bitmap_weight(q->bufs_map, q->max_allowed_buffers) > 0);
>>>> How about:
>>>>
>>>>      return vb2_get_num_buffers(q) > 0;
>>> vb2_get_num_buffers is defined in videobuf2-core.c, I'm not sure that
>>> an inline function could depend of a module function.
>> Not a problem. E.g. v4l2-ctrls.h is full of such static inlines.
>>
>> Regards,
>>
>>     Hans
>>


