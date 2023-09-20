Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12095CE79AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klqsCD86XTvwWc9qHTqpSI+uHAcUnXRwyajeb6INonM=; b=G8L8T70CuqXVirXLssiqVUzX4b
	9YLs/8KBXjLkQ5GpjSi7F76FCHXQKjiy+EC8vaseWk4FgpwLZgGBGWE24JOX4ZL8YFd7dlqXOGoB0
	uS8EIbVDxi9xP5nyQkdtoi5dVgOX0iP5GI9X99hWcOuHLqNG9IPV5NutYnq7BFgWoQhTdF/2V7kFO
	kqzKr6DHh08GHrpXb6tTcfJ9I4wjzZPDXkF8PJFMI/j3t8hUIHuTn9sJyZsPUpTtWTksCAAOuyeLa
	pDdnl8sN6i7727QLyxS7wZxBg1j8R+NpBekSETZjagca7xRy5DgjVfAEVw+nUVx2tzdRw9OHSfDnH
	zlrFHCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirsb-002ANY-2K;
	Wed, 20 Sep 2023 07:44:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirsY-002ALs-0z;
	Wed, 20 Sep 2023 07:44:11 +0000
Received: from [IPV6:2a01:e0a:120:3210:def9:8f6c:3807:7d89] (unknown [IPv6:2a01:e0a:120:3210:def9:8f6c:3807:7d89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47BA36602173;
	Wed, 20 Sep 2023 08:44:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695195845;
	bh=eSYDs+qZU32e2E7cB12pTV5zRWbHto0dzuV5YKjfLWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xalbv7WF546UBvMJ/uGdPNld1qXxWIZmEZBQNskDrTzN3Kc+mJm2K9bvp4I5jtKtk
	 xh/X+B7ucMdy42dseAz54rg4P7I9YJA/3FoQItb9vwQqHPyUNl7fc+dshVakekBHXb
	 QcP1y4mgDUSV5tY2k7TpkbMndUSxWS785NAY9lNPZHJ6xrOwqoVA0akSgEhrXfyBKv
	 Zwaxq58FH2PeIV5GsXJ0NbMHwbSwRC/aW/RyPQ+MIUv1c82tP51tb2XKxB3Y308Gqb
	 6NwPnaeD8HFNYScL6HU9hUz1inEGA8duZz+ac3Je4mIy3XMK6cx+laUynATVkjms8Q
	 FvmXdUFWloOmA==
Message-ID: <f6332d70-4392-3eee-edaa-0f7e4308fa67@collabora.com>
Date: Wed, 20 Sep 2023 09:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 16/49] media: verisilicon: postproc: Fix down scale
 test
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-17-benjamin.gaignard@collabora.com>
 <cbfef598-8faa-40e6-8dc2-a1efd03f9560@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <cbfef598-8faa-40e6-8dc2-a1efd03f9560@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004410_505599_9505422A 
X-CRM114-Status: GOOD (  25.74  )
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


Le 19/09/2023 à 13:16, Hans Verkuil a écrit :
> On 14/09/2023 15:32, Benjamin Gaignard wrote:
>> Do not allow down scaling if the source buffer resolution is
>> smaller  than destination one.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Fixes: fbb6c848dd89 ("media: destage Hantro VPU driver")
> Is this really a fix? I gather that this relies on "VP9 resolution change without
> doing stream off/on" support, and support for that is added by these patches.
>
> Adding the Fixes tag would cause stable maintainers to queue this patch up for
> older kernels, but I don't think that is needed here at all.
>
> And related I also think that this really does not belong to this patch series.
>
> As I understand it, patch 13/49 extends the verisilicon driver to support more
> than 32 buffers, so that one makes sense in the context of this series.
>
> But the other verisilicon patches appear to be unrelated and instead add a new
> feature, and I don't believe it relates to this series at all.
>
> If I am right, then please post this as a separate series, possibly mentioning
> that it sits on top of this series.

Marek has send the same patch and got it merged in stage branch:
https://patchwork.kernel.org/project/linux-media/patch/20230824013935.303132-1-marex@denx.de/
so I can skip it now.

The other patches are needed to enable VP9 dynamic resolution change, which is the feature
I target with this series.
2 patches fix chroma / motion vector offset issues.
1 allow to change the resolution while stream.

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>> ---
>>   drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
>> index e624cd98f41b..77d8ecfbe12f 100644
>> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
>> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
>> @@ -107,7 +107,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
>>   
>>   static int down_scale_factor(struct hantro_ctx *ctx)
>>   {
>> -	if (ctx->src_fmt.width == ctx->dst_fmt.width)
>> +	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
>>   		return 0;
>>   
>>   	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
>

