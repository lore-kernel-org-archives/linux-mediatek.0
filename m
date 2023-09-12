Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74295CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS+/7HU0dMozzIH2Bod3EU70I6A2khCMZzPERxDritk=; b=E5YB/n5v4YczocLFwguU3k0z/+
	13A87yO7SA8JTuHfAyBR4lWJMqTrzv2TYwL9okko4OjeI0mjGsPV5L3UpANcwyxGZteEYPtAUi+EE
	ZFyFdtkyHH/MuazAq6rusCBqgzI5J5R2RMt/5OskDuvrmAWw71fCLBwA+4+DPbDtyqjA1WWnJTfRK
	JP4Hh2CnfYdd4mvqBNFyvK1iPz52ll1AA/qcLVY19rBT7mWnS3dHjZnxZ4/bez6NF/9p896WtlU+l
	LymIIPiU5ZVGwmG/4Vi+rRtVTuUQXEhjGV/Djvhn/Ak60fGQVbUeiCsh5Yk58zE3kX2O6hXE8L3Du
	NX5EuPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyxU-002bso-11;
	Tue, 12 Sep 2023 08:41:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyxQ-002bqH-2d;
	Tue, 12 Sep 2023 08:41:18 +0000
Received: from [IPV6:2a01:e0a:120:3210:97bb:c25c:2a33:8c3f] (unknown [IPv6:2a01:e0a:120:3210:97bb:c25c:2a33:8c3f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F33E7660731E;
	Tue, 12 Sep 2023 09:41:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694508073;
	bh=w/TdXTx3LDuhrwUkGlnc8ARDv3ZcTpp3jTCQlJdW2v8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AC9A0+iipuJDLFRye3agEFkEcsg6C2UVU2DfCR2L1ra1iXcm32H/m39HLqPjy/xft
	 fll+pDqmkVfqffuDwA5YdxATA9PHvnw1fI884Lifj+XZk1AYGDXHp/xa8bIgrNSpxZ
	 g1c+YrqE0GHxg4s7hpAADPl5/p/DgTxQ6SlY+axS9becasvU8ZiozOUgn2eH4JLSQg
	 +Z19rAlw2Dk/4fPSSv+TLEacVygXl1Z11ADpxYIlANtZV2JZcOgy10SMWPsplVyt8S
	 1GUm6ob77QADfyTrLgXphDbYV9UyGCkH+oIV6KZQcFAzgQwBgIXoXgpkm+l5hGll8q
	 EIndAywMtvAhA==
Message-ID: <40329795-a57d-d0f3-adb4-0720dd20f6e2@collabora.com>
Date: Tue, 12 Sep 2023 10:41:10 +0200
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
 <4856958.31r3eYUQgx@jernej-laptop>
 <7da0a2ab-032a-9de9-e136-58f973238c5b@collabora.com>
 <3248154.aeNJFYEL58@jernej-laptop>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <3248154.aeNJFYEL58@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_014116_982249_96254460 
X-CRM114-Status: GOOD (  17.01  )
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


Le 11/09/2023 à 18:36, Jernej Škrabec a écrit :
> Dne ponedeljek, 11. september 2023 ob 10:55:02 CEST je Benjamin Gaignard
> napisal(a):
>> Le 10/09/2023 à 15:21, Jernej Škrabec a écrit :
>>> Hi Benjamin!
>>>
>>> Dne petek, 01. september 2023 ob 14:44:10 CEST je Benjamin Gaignard
>>>
>>> napisal(a):
>>>> Source and destination buffer height may not be the same because
>>>> alignment constraint are different.
>>>> Use destination height to compute chroma offset because we target
>>>> this buffer as hardware output.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
>>>> ---
>>>>
>>>>    drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>>>> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c index
>>>> 6db1c32fce4d..1f3f5e7ce978 100644
>>>> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>>>> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>>>> @@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx,
>>>> const struct v4l2_ctrl_vp9_ static size_t chroma_offset(const struct
>>>> hantro_ctx *ctx,
>>>>
>>>>    			    const struct v4l2_ctrl_vp9_frame
>>> *dec_params)
>>>
>>>>    {
>>>>
>>>> -	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
>>>> -
>>>> -	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
>>>> +	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth /
>>> 8;
>>>
>>> Commit message doesn't mention bit_depth change at all. While I think
>>> there is no difference between dec_params->bit_depth and ctx->bit_depth,
>>> you shouldn't just use ordinary division. If bit_depth is 10, it will be
>>> rounded down. And if you decide to use bit_depth from context, please
>>> remove dec_params argument.
>> I will change this patch and create a helpers function for chroma and motion
>> vectors offsets that VP9 and HEVC code will use since they are identical.
>> I don't see issue with the division. If you have in mind a solution please
>> write it so I could test it.
> Solution is same as the code that you removed:
> int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
>
> Or alternatively:
> int bytes_per_pixel = DIV_ROUND_UP(dec_params->bit_depth, 8);
>
> Consider bit_depth being 10. With old code you get 2, with yours you get 1.

The old code is wrong ;-)
If the format depth is 10 bits per pixel then chroma offset (in bytes) formula is
width * height * 10 / 8 not width * height * 16 / 8.

I have already confirm that with HEVC on the same hardware.

Regards,
Benjamin

>
> Best regards,
> Jernej
>
>> Regards,
>> Benjamin
>>
>>> Best regards,
>>> Jernej
>>>
>>>>    }
>>>>    
>>>>    static size_t mv_offset(const struct hantro_ctx *ctx,
>
>
>
>

