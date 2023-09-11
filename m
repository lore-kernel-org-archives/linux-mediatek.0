Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1001EE801F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYPh0cl0oXeV3sWZBmcwWioBvyrWtj2dcctHO18HB6k=; b=p8bb0FihOc3rWpXQexmw5ktT/3
	Hc/y2IyscTo+cmKkRRLUPaEmV5BqDnTULkJEKmWKJzAVtswqdCfphSTbQW2vPpDxp56ldiAeMumW1
	8z892PfPOrco6iorkLIRRGqf86reWx8xkyw0AypyGzoasM0Wb3JurG773dhxffovTjrm0Co03mD7v
	kAeS1c0h6VUzfAjdplvD4tghCRE1eF4AHtleJ6KkFB5tY9M0s/MgAutDK8U0SLP/mcKbfSa88oQ1q
	hzB/ryfoDAW84eU4iB5YpMd17nlOy0WSbexzcRgI0mWFzkO0RiXEhro1FUwvk00REEAof+gam6Tr1
	h6SlIWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfchR-00HZfV-2i;
	Mon, 11 Sep 2023 08:55:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfchP-00HZcv-16;
	Mon, 11 Sep 2023 08:55:16 +0000
Received: from [IPV6:2a01:e0a:120:3210:f6d2:1ce:5613:f24a] (unknown [IPv6:2a01:e0a:120:3210:f6d2:1ce:5613:f24a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 91D0D6603102;
	Mon, 11 Sep 2023 09:55:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694422505;
	bh=bXZ/y5UwHuIW7LHJ/2UaGAz707yCMlzXFy5iLkMD5KE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LSvj0uuM7T/1Mnr3Ka3vwgUPI90SIUqU28BQnuh1OWQDZrhsHjfYL8jl60GKQdhfr
	 R14jZlT+4oGAAiDbD0SvczFfNn/jWzYj9K6Yvc4fhOiXf5To04ZZduEF38xYfwbdba
	 orjsx1a2Whu90oN2NAx/5a9CFeFaNNGbpvt2zUhOtDAn2ApK/dIsmJYm+syj84pyso
	 To0uuVEWS9AeZRuwnBoEvzL1M9nmtYQ4dB3OnVRajh78Hbx6pgBZlbNoxAi7GgIxwe
	 tVnBC2pzEoT+aGS7JwYU0dM2IiQbiSa2vhpDtb6vprr1FM7FxZTJB45HDY49iSVOaJ
	 msYSYfexglywQ==
Message-ID: <7da0a2ab-032a-9de9-e136-58f973238c5b@collabora.com>
Date: Mon, 11 Sep 2023 10:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer
 height to compute chroma offset
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
 ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-15-benjamin.gaignard@collabora.com>
 <4856958.31r3eYUQgx@jernej-laptop>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <4856958.31r3eYUQgx@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_015515_524709_CC5D311E 
X-CRM114-Status: GOOD (  17.05  )
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


Le 10/09/2023 à 15:21, Jernej Škrabec a écrit :
> Hi Benjamin!
>
> Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard
> napisal(a):
>> Source and destination buffer height may not be the same because
>> alignment constraint are different.
>> Use destination height to compute chroma offset because we target
>> this buffer as hardware output.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
>> ---
>>   drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
>> 6db1c32fce4d..1f3f5e7ce978 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx, const
>> struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct hantro_ctx
>> *ctx,
>>   			    const struct v4l2_ctrl_vp9_frame
> *dec_params)
>>   {
>> -	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
>> -
>> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
>> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth /
> 8;
>
> Commit message doesn't mention bit_depth change at all. While I think there is
> no difference between dec_params->bit_depth and ctx->bit_depth, you shouldn't
> just use ordinary division. If bit_depth is 10, it will be rounded down. And
> if you decide to use bit_depth from context, please remove dec_params
> argument.

I will change this patch and create a helpers function for chroma and motion vectors
offsets that VP9 and HEVC code will use since they are identical.
I don't see issue with the division. If you have in mind a solution please write it
so I could test it.

Regards,
Benjamin

>
> Best regards,
> Jernej
>
>>   }
>>
>>   static size_t mv_offset(const struct hantro_ctx *ctx,
>
>
>
>

