Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028B1C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KES0qKbicUtkHeDA01vT90sM8TZzq0snxQN6ReVe14A=; b=dA3vhftUkMHC+fyg0Em/sA9gmc
	YiVWBI+4hvmU36rXp9nxOmBJrhJL3d3rf/FWTstxftfY4H9Y9KtyyocfpGViUS6lygMQByMR0k4pK
	d3HNFBST5xPgfTMIiT9xdtd6o4P1QDiTtALCShGjIV+4Cpi1V/G+WlvXdbAR36twh7jbQ6b5lMqcF
	sNXiZASkN8CA5lFfwgGqWLg+kFoCmZanDaWQNS6L09lATXU7Jh3uVN4YVEBBZ+M7ntk8aOdaUCQRg
	/tprBswyYLQPmen3Nsx06f6dFB+2fvLaUCNuMaDWmLnBJOH841FdROIqnQRrmjy/C5mEqfRdU6iSU
	h0GiHzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsOSq-009r3G-2o;
	Mon, 16 Oct 2023 14:21:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsOSn-009r1b-2f;
	Mon, 16 Oct 2023 14:20:59 +0000
Received: from [IPV6:2a01:e0a:120:3210:e07f:e79d:cb73:481b] (unknown [IPv6:2a01:e0a:120:3210:e07f:e79d:cb73:481b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B8AB66071C7;
	Mon, 16 Oct 2023 15:20:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697466053;
	bh=c/L8dFl388l4YQCDz27EHWC74G2f0t+CGWGDGeHXxIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TAuSs6sYKBn1pNWDBY8a/rjZSeEKDhnhW0jJDLB5hhIl4bEgokQoe/H7qHSkEuHnZ
	 d11Ftw1Icbpqx3LmTZTNS73YUWg3Ut4+nZz0laSrd/sfMHp8qRtRXBXax8TxNnnX8D
	 s0fvJ40lAvvX9ub9o70tTXBmnQdrOkaamT5vyScngNztRGde7fWfO1X5aGMEWc9ezA
	 JX8WWyQ0yXffPc8mhrO8+XDrruoNVMw6MUn7Ms13ZfVnj99mPu+1U7bxBhezz5vn96
	 vd7ucQAnxX17sG4Jzkxe1TAr6T66A4JUEtf3Pz5oVG83gpWUgWvVkJAL5IYUz0W0Vt
	 DLPOJJK9DhrAw==
Message-ID: <b689e7d2-ff87-499e-a165-d227b1865488@collabora.com>
Date: Mon, 16 Oct 2023 16:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 45/56] media: test-drivers: vivid: Increase max
 supported buffers for capture queues
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-46-benjamin.gaignard@collabora.com>
 <0ca82921-b71a-4d87-a1f1-6a6158f07c8c@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <0ca82921-b71a-4d87-a1f1-6a6158f07c8c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_072058_080618_C173E0BF 
X-CRM114-Status: GOOD (  12.95  )
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


Le 16/10/2023 à 12:32, Hans Verkuil a écrit :
> On 12/10/2023 13:46, Benjamin Gaignard wrote:
>> Change the maximum number of buffers of some capture queues in order
>> to test max_num_buffers field.
>>
>> Allow to allocate up to:
>> - 64 buffers for video capture queue.
>> - 1024 buffers for sdr capture queue.
>> - 32768 buffers for vbi capture queue.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/test-drivers/vivid/vivid-core.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
>> index 394c9f81ea72..b5656330578d 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-core.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
>> @@ -876,6 +876,13 @@ static int vivid_create_queue(struct vivid_dev *dev,
>>   	q->type = buf_type;
>>   	q->io_modes = VB2_MMAP | VB2_DMABUF;
>>   	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
>> +	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		q->max_num_buffers = 64;
>> +	if (buf_type == V4L2_BUF_TYPE_SDR_CAPTURE)
>> +		q->max_num_buffers = 1024;
>> +	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
>> +		q->max_num_buffers = 32768;
> This should use the same calculation as MAX_BUFFER_INDEX.
>
> I wonder if those defines should move to videobuf2-core.h instead.

I'm not sure about what you want here, q->max_num_buffers is clamped in vb2_core_queue_init():

/* The maximum is limited by offset cookie encoding pattern */
q->max_num_buffers = min_t(unsigned int, q->max_num_buffers, MAX_BUFFER_INDEX);

Do you want to reuse MAX_BUFFER_INDEX for these drivers ?

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>> +
>>   	if (allocators[dev->inst] != 1)
>>   		q->io_modes |= VB2_USERPTR;
>>   	q->drv_priv = dev;
>

