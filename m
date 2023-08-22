Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF5BEE4996
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyXkpjIb1yhQ2oWJubbQtWxAtkYQa7ZqGSAGwcxYkTM=; b=LUsRd8L9zuZpvpnqh+tw4m/ONw
	ORpHRRYI52wkelhL9/jk2VufmAmCqtGgJVqQaNpB4qTAmKhzk1WrnFwm2cDAKx5DZ1FyCMIViMko1
	WNIxHY0/4upb6MckR2deW1LrZ+JOKOGRb7mNec+vm6+XPpUdHtW70BAtRfNkdJ+E6yOJaqapHg+TW
	RV3KV4/WeTqB3ZcT4Hi6FoUzHxuBtG3GzX/OC+PnVvbbAqeeBpHh5qgZS0XJa96Jgm4zg00HElnWV
	p9zpG3yrFDsBXnKlwc88k65WmZyDy2+R1NyFFRStFkv2lZlPienShX9OnlQ1hkiyiC7cQj/7jXi7W
	reixGS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQvP-00FwGf-0N;
	Tue, 22 Aug 2023 12:55:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYQvL-00FwFa-01;
	Tue, 22 Aug 2023 12:55:56 +0000
Received: from [IPV6:2a01:e0a:120:3210:3563:6666:ae23:a4c4] (unknown [IPv6:2a01:e0a:120:3210:3563:6666:ae23:a4c4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F1A2660720C;
	Tue, 22 Aug 2023 13:55:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692708952;
	bh=zXRypGU5FsRfhkFlbeXKbtBhVbkG+5Y4xfAintMySxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ARcDBLfBysC7onBBYtCrspJOHt8EjSFAYAgeuylL762rhXnUM4p5fvNTe7DvIRXPT
	 BSHTBxBQKj1T6VjIPUWTrKxwyTUoLQXcrL8j4Z5ocRtVmmuIpCUrT4P+lahDjflprW
	 LecaZRMcz4V9esjesDljvzQ/XJ+qtAnNsTL3b2ndkaKpdBbtE/zTpCaphUPYhpo9T1
	 gw/LfuDvfdNI6znMPbQze6xvhJPs8I9GTN1hah3HQIOFL7eJ1s4gabuu8aSLCBqV89
	 b+hiQVys4wFCRGeKoYYZab+W1908q6RRSKmhV9D5SqPRbghXNrdpw4/PB5Ap7Irp00
	 khZZl03hn60LA==
Message-ID: <37dec78e-462c-b7a4-1acb-253520e47c1e@collabora.com>
Date: Tue, 22 Aug 2023 14:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 05/10] media: verisilicon: Store chroma and motion
 vectors offset
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
 <20230705121056.37017-6-benjamin.gaignard@collabora.com>
 <1b87f062-9d5e-fa8e-3d3b-e766362c6e3b@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <1b87f062-9d5e-fa8e-3d3b-e766362c6e3b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_055555_194615_E93763E8 
X-CRM114-Status: GOOD (  19.63  )
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


Le 21/08/2023 à 16:41, Hans Verkuil a écrit :
> On 05/07/2023 14:10, Benjamin Gaignard wrote:
>> Store computed values of chroma and motion vectors offset because
>> they depends on width and height values which change if the resolution
>> change.
> Is this a bug fix? Does this patch belong in this series?
>
> Same actually for the next few verisilicon patches. Shouldn't they be
> part of a separate 'fixes' patch series? It's confusing to see them
> in this series.

They fix bugs that happens only when VP9 resolution change without doing stream off/on
that why they are in this series.

This one, for example, is useless if the resolution change on a keyframe because the
frame will have the same resolution than the current one but is need to store resolution
of each frames if the resize happens between keyframes.

Benjamin

>
> Regards,
>
> 	Hans
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/platform/verisilicon/hantro.h            | 2 ++
>>   drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 6 ++++--
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
>> index c8a3cf10cc64..53be00142473 100644
>> --- a/drivers/media/platform/verisilicon/hantro.h
>> +++ b/drivers/media/platform/verisilicon/hantro.h
>> @@ -320,6 +320,8 @@ struct hantro_vp9_decoded_buffer_info {
>>   	/* Info needed when the decoded frame serves as a reference frame. */
>>   	unsigned short width;
>>   	unsigned short height;
>> +	size_t chroma_offset;
>> +	size_t mv_offset;
>>   	u32 bit_depth : 4;
>>   };
>>   
>> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>> index 6fc4b555517f..6db1c32fce4d 100644
>> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
>> @@ -158,9 +158,11 @@ static void config_output(struct hantro_ctx *ctx,
>>   
>>   	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
>>   	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
>> +	dst->vp9.chroma_offset = chroma_offset(ctx, dec_params);
>>   
>>   	mv_addr = luma_addr + mv_offset(ctx, dec_params);
>>   	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
>> +	dst->vp9.mv_offset = mv_offset(ctx, dec_params);
>>   }
>>   
>>   struct hantro_vp9_ref_reg {
>> @@ -195,7 +197,7 @@ static void config_ref(struct hantro_ctx *ctx,
>>   	luma_addr = hantro_get_dec_buf_addr(ctx, &buf->base.vb.vb2_buf);
>>   	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
>>   
>> -	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
>> +	chroma_addr = luma_addr + buf->vp9.chroma_offset;
>>   	hantro_write_addr(ctx->dev, ref_reg->c_base, chroma_addr);
>>   }
>>   
>> @@ -238,7 +240,7 @@ static void config_ref_registers(struct hantro_ctx *ctx,
>>   	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params->alt_frame_ts);
>>   
>>   	mv_addr = hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
>> -		  mv_offset(ctx, dec_params);
>> +		  mv_ref->vp9.mv_offset;
>>   	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
>>   
>>   	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,

