Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F8C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GL6LH+BfCpPhnQFTnfx9E9mchRzyAcCrxMpSJkmF0aE=; b=I9KyXn7//x1fjUaNYYo3K9V7AY
	Ao162kShBqaPiO1RHcxA1oI9QA2f1koCrkHUwSA8TV4APyIiGdSJwrXg7Cl/tXJd4YUDbFF3K02uL
	6gEUO0U0/TjP6dgt+bfBMlZhBTdZle6/c5Xi0kYBxOoGBBVSdggnuQ+uLlPUJT2MP1S8cOboAF7tO
	CtLtEhcBgMS/kQydRIpCFVv5k9bLQiWIfCv6l8cDis+P3b/Gex/k8tATjkYFK4VBwmJD7g/zMm/BX
	cJ8GAbe313Y6rI54zaO1ThwsLmcTzdV7ej7gz5m15OEIy23GOXewxxoaSDRA3Q5FSyc5NGo7fM1Lh
	aRcm/P1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peuhR-00FOBm-0u;
	Wed, 22 Mar 2023 09:24:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peuhO-00FO9z-0W
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 09:24:04 +0000
Received: from [IPV6:2a01:e0a:120:3210:cd0d:1462:ffab:ab3a] (unknown [IPv6:2a01:e0a:120:3210:cd0d:1462:ffab:ab3a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 52A896602E3A
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Mar 2023 09:23:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679477039;
	bh=5gl4/myBd+EDbET3jKaPs1WJ5OJGv7vlkzRyxtnLbg0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UKGcqJU/c3UIPDr/SlXqH231atMz++MplNpsvswSb8W0n5YX8gvU8jXkPiNfrO3U+
	 CFPT817+DW4r/LmYfawNsEDxgYsiPg6rYOPVsKACnnFxHOfCsjXpjcb0wuJZu+Tuxv
	 7pUC+O0o6xA4qfVVOdcWjg5GOYoEAPrlDfZZ+rZbIw/eTiT4+pxklh02GRn8bKh3TZ
	 qIyGmqkx7cj6fLZZgp7PcMVcENH/xCZG2gwVdgEFKFk44noVSCol8T10VneaAgLr+2
	 ibQS0AEgTj8UwAwlsQ+H+FWdvvv88YoYiFVBtub4p/zTsIYobTW2Qjnl7GzZ/gjud8
	 brrRJVXeVDzWg==
Message-ID: <8029aef8-ec8f-9ffc-a47e-1d9ee29b0192@collabora.com>
Date: Wed, 22 Mar 2023 10:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [EXT] [PATCH v2 3/8] media: videobuf2: Add a module param to
 limit vb2 queue buffer storage
Content-Language: en-US
To: linux-mediatek@lists.infradead.org
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-4-benjamin.gaignard@collabora.com>
 <AM6PR04MB6341CDD7A104C7BC6667C100E7869@AM6PR04MB6341.eurprd04.prod.outlook.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <AM6PR04MB6341CDD7A104C7BC6667C100E7869@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_022402_556916_1F96EA38 
X-CRM114-Status: GOOD (  19.04  )
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


Le 22/03/2023 à 07:22, Ming Qian a écrit :
>
> Hi Benjamin,
>
>> Add module parameter "max_vb_buffer_per_queue" to be able to limit the
>> number of vb2 buffers store in queue.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> drivers/media/common/videobuf2/videobuf2-core.c | 15 +++------------
>> include/media/videobuf2-core.h                  | 11 +++++++++--
>> 2 files changed, 12 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
>> b/drivers/media/common/videobuf2/videobuf2-core.c
>> index ae9d72f4d181..f4da917ccf3f 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -34,6 +34,8 @@
>> static int debug;
>> module_param(debug, int, 0644);
>>
>> +module_param(max_vb_buffer_per_queue, ulong, 0644);
>> +
>> #define dprintk(q, level, fmt, arg...)                                 \
>>         do {                                                            \
>>                 if (debug >= level)                                     \
>> @@ -412,10 +414,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q,
>> enum vb2_memory memory,
>>         struct vb2_buffer *vb;
>>         int ret;
>>
>> -       /* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME
>> */
>> -       num_buffers = min_t(unsigned int, num_buffers,
>> -                           VB2_MAX_FRAME - q->num_buffers);
>> -
>>         for (buffer = 0; buffer < num_buffers; ++buffer) {
>>                 /* Allocate vb2 buffer structures */
>>                 vb = kzalloc(q->buf_struct_size, GFP_KERNEL); @@ -801,9 +799,7
>> @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>>         /*
>>          * Make sure the requested values and current defaults are sane.
>>          */
>> -       WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);
>>         num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
>> -       num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
>>         memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>>         /*
>>          * Set this now to ensure that drivers see the correct q->memory value
>> @@ -919,11 +915,6 @@ int vb2_core_create_bufs(struct vb2_queue *q,
>> enum vb2_memory memory,
>>         bool no_previous_buffers = !q->num_buffers;
>>         int ret;
>>
>> -       if (q->num_buffers == VB2_MAX_FRAME) {
>> -               dprintk(q, 1, "maximum number of buffers already allocated\n");
>> -               return -ENOBUFS;
>> -       }
>> -
>>         if (no_previous_buffers) {
>>                 if (q->waiting_in_dqbuf && *count) {
>>                         dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
>> @@ -948,7 +939,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum
>> vb2_memory memory,
>>                         return -EINVAL;
>>         }
>>
>> -       num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
>> +       num_buffers = *count;
>>
>>         if (requested_planes && requested_sizes) {
>>                 num_planes = requested_planes; diff --git
>> a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h index
>> 397dbf6e61e1..b8b34a993e04 100644
>> --- a/include/media/videobuf2-core.h
>> +++ b/include/media/videobuf2-core.h
>> @@ -12,6 +12,7 @@
>> #ifndef _MEDIA_VIDEOBUF2_CORE_H
>> #define _MEDIA_VIDEOBUF2_CORE_H
>>
>> +#include <linux/minmax.h>
>> #include <linux/mm_types.h>
>> #include <linux/mutex.h>
>> #include <linux/poll.h>
>> @@ -48,6 +49,8 @@ struct vb2_fileio_data;  struct vb2_threadio_data;  struct
>> vb2_buffer;
>>
>> +static size_t max_vb_buffer_per_queue = 1024;
>> +
>> /**
>>   * struct vb2_mem_ops - memory handling/memory allocator operations.
>>   * @alloc:     allocate video memory and, optionally, allocator private data,
>> @@ -1268,12 +1271,16 @@ static inline bool vb2_queue_add_buffer(struct
>> vb2_queue *q, struct vb2_buffer *
>>
>>         if (vb->index >= q->max_num_bufs) {
>>                 struct vb2_buffer **tmp;
>> +               int cnt = min(max_vb_buffer_per_queue, q->max_num_bufs *
>> + 2);
>> +
>> +               if (cnt >= q->max_num_bufs)
>> +                       goto realloc_failed;
>>
> Is it likely that goto realloc_failed directly?
> The cnt is likely equal to q->max_num_bufs * 2, and it will greater than q->max_num_bufs.
> For example, the default value of q->max_num_bufs is 32, when vb->index comes to 32, cnt is 64,  it's greater than 32, then goto recalloc_failed?

I had in mind to check that we don't realloc more than
max_vb_buffer_per_queue buffer so I will remove this test and check
if vb->index < max_vb_buffer_per_queue instead.

Thanks for your review.

Benjamin

>
>> -               tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q-
>>> bufs), GFP_KERNEL);
>> +               tmp = krealloc_array(q->bufs, cnt, sizeof(*q->bufs),
>> + GFP_KERNEL);
>>                 if (!tmp)
>>                         goto realloc_failed;
>>
>> -               q->max_num_bufs *= 2;
>> +               q->max_num_bufs = cnt;
>>                 q->bufs = tmp;
>>         }
>>
>> --
>> 2.34.1
>

