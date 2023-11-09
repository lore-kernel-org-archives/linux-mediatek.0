Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E547C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3myw3yFki5p7TPEEVhvVaaihvGqvwpH/gcgmKflNRs=; b=1Tgc7IJ7eFptOgxgr0A0Li2bV3
	orBuLax1xr7WFPQBmpWKj9oQeor9BVEER7MqQaBvd6pKcXqUelK2YlulXymX2hbk3E74zK/zJT6I1
	k7DPq96lP4K2jOnc33QECA8YTUkIxLCChrFP5gYFwgF3NpcZp+goaUGrtoOcK8U1G7xlcWB82/nUu
	Yl2Q2BnXsB900HotlxkjRj/wbnwbTAkyAG/pmuUjx/oJKFbOu/QkB/e3mUWOfE2hFDk472NDrSVRC
	SfJ3eMfMp/LpuBIhSYf32uitT9Z3d1hQSKd1CaYFspU1pJTXKBuyOyOddene0KcDubwdCeNpU44qB
	iO7VlUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11cf-005ovg-1W;
	Thu, 09 Nov 2023 09:46:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11ca-005osA-12;
	Thu, 09 Nov 2023 09:46:47 +0000
Received: from [100.98.136.55] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 109996607410;
	Thu,  9 Nov 2023 09:46:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699523203;
	bh=IFUUFnswkX8ko/bLeA8AThrmjVyJk/S4hUBWjROwSrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWFbkLboy695UDQbgJ4kpkCDHNPparXWuzAPl3syDfNnA3rSEpOUW+0KLpE91giq8
	 l9u9xZt1uL9yz6+gfdLkeCRds6nEYOlKn4/ha7aSAeFF9WN7gTs7MdDYeJ7FmqpOTS
	 B+8pPl1uzwL8/6uPwmnstIkTogYG8rIS5oXXN0aeTymg9gmpmcMeX7aUF7yXQ7HLR7
	 l6/HXIgEaU/8Oi1lZZsd59o998YaM4Lm14KBeQ40vvf3NTRWdIoS2eXuIDTKwPm/eq
	 Ti8oKSwoZpIXVK2wQdsVuCHF4WrVL6ITjlbBwnEwFnxQq4UHE4RYsuYtUuu5qBttws
	 Lo0JnpTMmLg7Q==
Message-ID: <2f5ad14b-528d-4656-84d8-f85467c5b475@collabora.com>
Date: Thu, 9 Nov 2023 10:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 56/56] media: test-drivers: Use helper for DELETE_BUFS
 ioctl
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
 <20231031163104.112469-57-benjamin.gaignard@collabora.com>
 <20231109094311.yzmmn4vvskmrk4tk@chromium.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20231109094311.yzmmn4vvskmrk4tk@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_014644_487927_7373EB59 
X-CRM114-Status: GOOD (  14.28  )
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


Le 09/11/2023 à 10:43, Tomasz Figa a écrit :
> On Tue, Oct 31, 2023 at 05:31:04PM +0100, Benjamin Gaignard wrote:
>> Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs() helper.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/test-drivers/vicodec/vicodec-core.c |  2 ++
>>   drivers/media/test-drivers/vimc/vimc-capture.c    |  2 ++
>>   drivers/media/test-drivers/visl/visl-video.c      |  2 ++
>>   drivers/media/test-drivers/vivid/vivid-core.c     | 13 ++++++++++---
>>   4 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> index 69cbe2c094e1..f14a8fd506d0 100644
>> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
>> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
>> @@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
>>   	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
>>   	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
>>   	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
>> +	.vidioc_delete_bufs	= v4l2_m2m_ioctl_delete_bufs,
>>   
>>   	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
>>   	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
>> @@ -1725,6 +1726,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>>   	dst_vq->mem_ops = &vb2_vmalloc_memops;
>>   	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>   	dst_vq->lock = src_vq->lock;
>> +	dst_vq->supports_delete_bufs = true;
> Since we have to explicitly provide the vidioc_delete_bufs callback anyway,
> is there any value in having a separate supports_delete_bufs flag? Or we
> envision that some drivers would support deleting buffers only for some
> queues?

That exactly the case for Hantro driver, it can support deleting buffers on
capture queue but not on output queue.

>
> Best regards,
> Tomasz
>

