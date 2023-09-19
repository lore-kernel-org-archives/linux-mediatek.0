Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7769CCD54B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEQzetw+wrWrJvlw/we9c6IM22naaJi8GeUZ1VSD6nI=; b=gVjC067Au3bisqGaO+Ocakmmoa
	no/NZ7YO7Mtq9CbkKYlrxPZBnIyo2y7zr+JxHyaOXT9i5aoV5VuU0fYTxDgBOkVZVuredLd9oNk+o
	U/oLjPNcLA9SCTVk93i2R750H0MfHuNQNaCzaBEHFhJkrJWjceOBjstuqh59V7bKJTNGiwLNabMce
	ySTH0JJu22nfGmiK5QTO0+RNNaKIyFOkKa0aLduGBcw3OA1X1UhSAlblw8eUeh6VQM4B8O58pRuzB
	FIwXRfDAmsgGPF+XBHNWqiHiV2qZf5vyLFRj2+UwnWrmR5rQZm/Y2oBjV//khscQeMTPwhApS/zeC
	HWDcxDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXwW-00019H-1G;
	Tue, 19 Sep 2023 10:26:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXwT-00017Z-05;
	Tue, 19 Sep 2023 10:26:54 +0000
Received: from [IPV6:2a01:e0a:120:3210:f3aa:7b57:c12d:de68] (unknown [IPv6:2a01:e0a:120:3210:f3aa:7b57:c12d:de68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0458166071A9;
	Tue, 19 Sep 2023 11:26:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695119208;
	bh=9GznNVqH1Ybwr4tIQTMWuRZGIorRMwUugPSjPmcCLZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XO9H4/8C7f+OUKeg1Mkv+AUV19wPV/ZlVGl2jFaXnKFn49tesOobnKUVYgrqzkFdD
	 AmgO61O+MqKYj0RPLSjtO1CXKKVhRKhknNmQHBs5FoTRTI1CsOw62ZWYaL9OJvfTuI
	 0R4jtMtjVguGXM0jZb/hSOrkXrrtDJ4dV1xldBkR0FE8QSvcIMkM2x/2x47d9aFBSY
	 gMKGn3ySqqk6PYDuoiP2T7VnYDpXDfUS6NFnsT7Uvq3YBTQK8PvwkYmNZlu9NcLjH7
	 5Vaa+35SR1wCEASc1HRyeax3SKlWLMnnsZ0qABRUIW1jwYCO/9rUz4EwORBOviWy5g
	 wjwScOpQKTSQw==
Message-ID: <ecfd1641-3cce-dfa4-b88c-3619fb12d710@collabora.com>
Date: Tue, 19 Sep 2023 12:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 07/49] media: sti: hva: Use vb2_get_buffer() instead of
 directly access to buffers array
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-8-benjamin.gaignard@collabora.com>
 <93e9b143-664c-4fbb-8722-0beabd5b2c0c@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <93e9b143-664c-4fbb-8722-0beabd5b2c0c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_032653_215335_F578D0D4 
X-CRM114-Status: GOOD (  14.69  )
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


Le 19/09/2023 à 11:31, Hans Verkuil a écrit :
> On 14/09/2023 15:32, Benjamin Gaignard wrote:
>> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
>> This could allow to change the type bufs[] field of vb2_buffer structure if
>> needed.
>> After each call to vb2_get_buffer() we need to be sure that we get
>> a valid pointer so check the return value of all of them.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/platform/st/sti/hva/hva-v4l2.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
>> index 3a848ca32a0e..326be09bdb55 100644
>> --- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
>> +++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
>> @@ -577,6 +577,10 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>>   		}
> Above this line there is a buf->index check...
>
>>   
>>   		vb2_buf = vb2_get_buffer(vq, buf->index);
>> +		if (!vb2_buf) {
>> +			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
>> +			return -EINVAL;
>> +		}
> ...I think that check can be dropped since vb2_get_buffer checks that already.

No because in "media: sti: hva: Stop direct calls to queue num_buffers field" patch
I remove the above check since it use queue num_buffers field.

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>>   		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
>>   		stream->bytesused = buf->bytesused;
>>   	}
>

