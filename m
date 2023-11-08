Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C880BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0Qu+tg07n+H9SEvc3Z/QkhSxGYPbRPBBV/XJAKrQac=; b=SKPxnTpdDgH4p5J30tRUF2CGIC
	1lguAAmMcpX4HfU1aydTHW9q0hRBfOZVHRMkSyQoYeIIqss2JpvR6LxKoXkACWjNCfngBKZesSW50
	k8qiTfOXrBSw2o5w9QzDB9C5EiJK5LG2A81PY90vxBFIn0YcZSWY6rjK281KogDY1m90+m7hnLxMi
	A4uceyY9UkZ32km1r60ZQj1QH1Mv4Gw28SMOlVNuCIqJmCJtCc4WQEY9E+XPIaGY4ZtVXwbHH9VqA
	YylN/eG6b+QsMuCdLAjy/VV/sP247PNn5algSyc6umgPhKmHZstcPdaEtHX79dgwYd3+6Q/b7k43T
	4z3OBZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fja-003R2Y-2h;
	Wed, 08 Nov 2023 10:24:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0fjX-003R1H-1J;
	Wed, 08 Nov 2023 10:24:29 +0000
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DE406607479;
	Wed,  8 Nov 2023 10:24:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699439064;
	bh=1WvgVc1+K2XUROLlhm8g5+A8m40Jn66cUsAkrEjr3jQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=inly/7/eYOOZIZyr4l+rz7Bn/JzCmL/k2f/YftO/dPe8S0VNL7c3+YfALP2E75l4V
	 Z8+JPFIeDksI97R07f4kJ539z4bpyUM1P5Kl58n2CwuNj15KtSb+dS8kr8janniR7o
	 aTxOZL9Ty1wvkNfJs/1RKZlTe5zs5+8+pom6nGUAPl0I8iWEFvP84Ryhd9xFc9MrCW
	 9PelD/WyxYauwICjNkrksg/MNL5AdKlsPlzMBuypLRZM/ly+HkCK9nFH7ByV+HxksI
	 fSey8d+1kG+b6Yhf1+USE7KudoMO4r1exbPug/Kk9YeP2zJDwfBArh34cB/9VCzG/o
	 8WX8OSP2EnyGg==
Message-ID: <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
Date: Wed, 8 Nov 2023 11:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com>
 <20231108085016.3kmhmdroh4qs53f5@chromium.org>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20231108085016.3kmhmdroh4qs53f5@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_022427_577463_C6492D8A 
X-CRM114-Status: GOOD (  25.17  )
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


Le 08/11/2023 à 09:50, Tomasz Figa a écrit :
> On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
>> This patch adds 2 helpers functions to add and remove vb2 buffers
>> from a queue. With these 2 and vb2_get_buffer(), bufs field of
>> struct vb2_queue becomes like a private member of the structure.
>>
>> After each call to vb2_get_buffer() we need to be sure that we get
>> a valid pointer in preparation for when buffers can be deleted.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>>   .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
>>   2 files changed, 149 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 968b7c0e7934..b406a30a9b35 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
>>   		vb->skip_cache_sync_on_finish = 1;
>>   }
>>   
>> +/**
>> + * vb2_queue_add_buffer() - add a buffer to a queue
>> + * @q:	pointer to &struct vb2_queue with videobuf2 queue.
>> + * @vb:	pointer to &struct vb2_buffer to be added to the queue.
>> + * @index: index where add vb2_buffer in the queue
>> + */
>> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
>> +{
>> +	WARN_ON(index >= VB2_MAX_FRAME || q->bufs[index]);
> nit: Would it make sense to also ensure that vb->vb2_queue is NULL?

Since vb->vb2_queue and q->bufs[index] are always set and clear in the same
functions I don't think it is useful to test the both here.

>
>> +
>> +	q->bufs[index] = vb;
>> +	vb->index = index;
>> +	vb->vb2_queue = q;
>> +}
> [snip]
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index d19d82a75ac6..2ffb097bf00a 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -377,6 +377,12 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>>   		return -EINVAL;
>>   	}
>>   
>> +	vb = vb2_get_buffer(q, b->index);
>> +	if (!vb) {
>> +		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
>> +		return -EINVAL;
>> +	}
>> +
> Is this a leftover from earlier revisions? I think it shouldn't be
> needed anymore after the previous patch which changed the function to
> get vb as an argument.

You are right I will fix it.

>
> Best regards,
> Tomasz
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com

