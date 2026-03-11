Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC17FD88D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 00:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=; b=jnPPbnBDyCMgLrMlPjYHORZ1oo
	J7BYpd5ar741ss2PBrw02cuPYWKzpLmwbvXxKndCntO1xHP0JtUyYfeAf3Jj2Os6LEBSghabR/s2H
	rMm3Lztfj8UefZaXSlm2NhYLsXR+dwT1/B9TXtxWU7BK1PasWRyxFAUrthcEu6pm18M3zjiTOo4Ti
	HFAMyym/ysBOlUdN1SHKOCbQcBCVtOcifj2SjEHQ6aHx5n2yst1KqC0NmrX3R8sRiYEYokXA8NFdo
	FXsdLylIecrg+rJha0DvqfVitPiIOP88WtnvYnOwpdHqa0a2fvbiC6aGP67LCzXDYcw6/YY1GPXGE
	xVpDeIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w073w-0000000AP9I-3Ury;
	Wed, 11 Mar 2026 00:04:32 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w073t-0000000AP8b-1olp
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 00:04:31 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-466ec4c6852so2380383b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773187468; x=1773792268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=TlGRNu8w1b67dUilXeID628ePJ+o2sgZJJvuiCb5oocg8PI5zDHUYLb7uIN5yfDbgv
         nK5lacKW1m6TWmviInHf07ogHl5qiRGzWwkVxZNbkx/EX3D+1oZFiWfOG/6PTSM8sFp4
         fnZ5W6lx1xXJjC+aW/AJ0kHR4I1yPrPZUPbFqriXru1CEtsDjszfaKBj9Ju3UaHHPGmW
         SOwsG7SFjL4zX3NUmPsLcw/v4X91rj9AgVxj+hS+rwhS3UAb9gsj+dpfhoWJG8xJJxoe
         gYwVJZyyIhQCac1RqMDFKT64L55EgqzPzSOX75HXWv7j3fTUX9a4Jb9Kr7KQLOPM68rI
         s0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187468; x=1773792268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyycAT2xnAdXjbETtQQr3m+mbib4kFnv3znRqdNWGp8=;
        b=aBpevay4KknI37BoXwYLYXJFTOylFEoToh3VFB7FWd4h7u8XML8gsxlTWyPUPpWkPw
         WmAnG+g53bjgZSKwRBsmqNlavJnuH+8/KTdLtKqeJ8at4cpB9Q/ZLUYVxsJjzbTRi3JG
         01guEk8RnN3zYCLN8bZa5+llis7uUGCk7awdUJ22KNPV+f6w0ex+QZ7SJnrQKcjPFwKR
         wyN1GutSrXPR1QBI6boIFZZC9hdApdS1d8Gn0n/rvyXRCnkohyxzNWnZWuZxdecHB449
         JSBn/BUXOsgCKGQPLJclidAYZXrU4EXmEuDfZSV/rj8yzwZXSLgSDl1XUqOMQSzxGZ5M
         7unA==
X-Forwarded-Encrypted: i=1; AJvYcCUE2nFRQNk5UqfBTEVwkV5kRQX8Do5va9ZxPNGo7LAUjCdMhDwugo+9SoFW26Fk/Xt0nDRWtodE7k5J0YBMXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YybMxIluu122D0pWFuyep7aWUbRIJuT9bCaLsuv1y13l/aRFFJT
	VcODa6kx5aE9gC2k663sWXhYB3Cg5AVVUsYoQfUV0SVNuIgeY5SGziiF7/Yk5HpTWko=
X-Gm-Gg: ATEYQzyAkPtMQ568IXcU9qIpxfQ/PaEhszwm47yZbbnqF5JH4Hfc7+pyFaEg7yaOgiV
	z0dKM255Nd9s6pCs6CEwn/OLmHPOfenCpdzDaIK9hi+hBaDJnPiziJ0HNAqv5110pNN6jkeGGuE
	nXLl7MMTltY8Te/cGdyobJoVXu+byr/w2EirlU+j2rm91fvR7zxI4QEf/fgPlagdOi3O9HS6nti
	Ic64sCgoNu3Nkt5fT92BCoJBODT/KVyooX+7o1uwk/odOiKmyM7Iqb0McG+4iF6uoSHrPXRyBIk
	0Unib/WYtupdijMUyqkXEFeoJtiDO0xQwhxOD0OBp4kMthFqAz+Z96fPqzfk6cRAAf+L4bW48Ag
	OqCy3WH0+ctEF9iBvr935hnCG4wmbSxhbrcgGFrx/UE7Bab7y0EYHwZLyTSLxMmSaJ1bPkiCK8j
	Ob9cFlnQoRQezk6J9slwtGR9E9b090vNI+j6FTJYjNtYt42DQnJmF6R4J1eXZa2cEG0EUJ2Px5z
	A==
X-Received: by 2002:a05:6808:14c8:b0:450:b249:718c with SMTP id 5614622812f47-46733547c85mr330873b6e.31.1773187468063;
        Tue, 10 Mar 2026 17:04:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03? ([2600:8803:e7e4:500:82ac:f3fe:2e5f:ec03])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734160cebsm233690b6e.7.2026.03.10.17.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:04:26 -0700 (PDT)
Message-ID: <04ffc988-f4ce-47f8-a998-66d2553d88af@baylibre.com>
Date: Tue, 10 Mar 2026 19:04:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
Cc: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
 kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
 marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
 hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com,
 dan.carpenter@linaro.org, lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_170429_755085_71CCA87D 
X-CRM114-Status: GOOD (  14.88  )
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

On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
> index dac593be5695..f641b62e692b 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_core.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_core.c
> @@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  
>  	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
>  					ch->scan_type.shift, 8);
> -	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
> +	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);

Even better would be to not alloc new memory at all.

We could probably reuse buffer_data from struct st_sensor_data for this.

>  	if (!outdata)
>  		return -ENOMEM;
>  
>  	err = regmap_bulk_read(sdata->regmap, ch->address,
>  			       outdata, byte_for_channel);
>  	if (err < 0)
> -		goto st_sensors_free_memory;
> +		return err;
>  
>  	if (byte_for_channel == 1)
>  		*data = (s8)*outdata;
> @@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
>  	else if (byte_for_channel == 3)
>  		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
>  
> -st_sensors_free_memory:
> -	kfree(outdata);
> -
>  	return err;

Should be able to change this to `return 0;` now.

>  }
>  


