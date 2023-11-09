Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC925C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiyIuk10plAhmZj8pcJht/x5xn/dGIVgkoYq14j2IUw=; b=PGaQf3GK14VZflZMa6jMOAwBIT
	SZ76866IBxfJMHzOcFHvk5HI9E9w3II/n3P8NL80jm0u57ZjZda6HjmjQOBIVyTVd/aJ1nVmSufim
	Iq0alu/CVVkf7iUDRdkKFXJsLSVhgvcybK+YvlvPUxyr4W7v8xUaXh6sRxgDggUxbm0/dWgu2gNFP
	WjDvxEYYF4kehhJ6IOx+sy4QEpUumsYmGNCurXs3DLhiD9R6CT4Z8tUhL5f4G2rERhgCJp/5V1oiD
	s8odO8qKnzzhJ824k35yTwZSB+hmvp2d/N4ikYZMQo+JTy9yAuihdrfCuBvm19xgEvavygDoMSd/X
	iBl38SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12CF-005vvf-2q;
	Thu, 09 Nov 2023 10:23:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12CD-005vui-06;
	Thu, 09 Nov 2023 10:23:34 +0000
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 605DA6607402;
	Thu,  9 Nov 2023 10:23:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525411;
	bh=w1gfjgdh3iORhnyqSjSpTT8O6vfAD+hPei7Wa+puwAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RuYi975NuBYiBPQN3BqI9xP9cVvJmW4tqHKo85QYCz1rPYS1lZcKLnho6eqcFXQXT
	 dmpH128i3kkaRr3a8Z4HNcef7S1VzZNUEgt/Zs2VPRE+pda8D3GGw+IrrGsfybmHBB
	 QcOX7LsqeBMHD9Zvqu4SAXqso0JREWT8wJMDq/vhoJN1OJJ6LHlKCmUxDI20MLTdmm
	 rER3hcW5wrys6I40bhIu6oA6DDceYRxTNeO8b9xTjGhPxyWa8ntK863t6xbU9+CdTa
	 +1eBvtpfI0ALhzJfmbUWBjfwQSKqDY1VHMjiZCSAaGU2/7TzmZ6zuHAzIZRJ1pzWim
	 hh7B8rK4+TeAw==
Message-ID: <92b6faac-6f74-4949-a8db-45defb02df7b@collabora.com>
Date: Thu, 9 Nov 2023 11:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 25/56] media: pci: tw68: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, mchehab@kernel.org,
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
 <20231031163104.112469-26-benjamin.gaignard@collabora.com>
 <99945dbe-194b-429c-b8ea-fc71dbc0b3b4@collabora.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <99945dbe-194b-429c-b8ea-fc71dbc0b3b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_022333_203547_8E6D16E2 
X-CRM114-Status: GOOD (  15.65  )
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


Le 09/11/2023 à 11:13, Andrzej Pietrasiewicz a écrit :
> Hi Benjamin,
>
> W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
>> Use vb2_get_num_buffers() to avoid using queue num_buffers field 
>> directly.
>> This allows us to change how the number of buffers is computed in the
>> future.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>> ---
>>   drivers/media/pci/tw68/tw68-video.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/pci/tw68/tw68-video.c 
>> b/drivers/media/pci/tw68/tw68-video.c
>> index 773a18702d36..35296c226019 100644
>> --- a/drivers/media/pci/tw68/tw68-video.c
>> +++ b/drivers/media/pci/tw68/tw68-video.c
>> @@ -360,13 +360,13 @@ static int tw68_queue_setup(struct vb2_queue *q,
>>                  unsigned int sizes[], struct device *alloc_devs[])
>>   {
>>       struct tw68_dev *dev = vb2_get_drv_priv(q);
>
> Why not
>
>     unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>
> just like in other patches in the series?

You are right, I will change it to keep the same pattern than for the other patches.

Regards,
Benjamin

>
> Regards,
>
> Andrzej
>
>> -    unsigned tot_bufs = q->num_buffers + *num_buffers;
>> +    unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
>>       unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
>>         if (tot_bufs < 2)
>>           tot_bufs = 2;
>>       tot_bufs = tw68_buffer_count(size, tot_bufs);
>> -    *num_buffers = tot_bufs - q->num_buffers;
>> +    *num_buffers = tot_bufs - vb2_get_num_buffers(q);
>>       /*
>>        * We allow create_bufs, but only if the sizeimage is >= as the
>>        * current sizeimage. The tw68_buffer_count calculation becomes 
>> quite
>
>

