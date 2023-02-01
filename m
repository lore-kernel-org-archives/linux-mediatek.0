Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BC9C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W0uwriFZ/qWa8L1CESLZ45Mvp1IN80djmUBD3/EzTo=; b=i9IR76SxrNd5PhVBTyn4jnlY0D
	Pa35kvKOw+Z0iaGxLNM9DJWTsozj3xBPNpJ3I8DTdaRdQ6PeMzTYk6JwJBGIF/RAhQkz+K2UE8/Xn
	DtLjud87xnJrLVoiFxogIk8t+GinxXpTBDp53yS1F0oa8AOAzB04fRGtH8lxl0XPEoEJIuQR3xWsW
	5S42LdT5Z0Yll6nSq8txLXJF9ZCBXjh+0itObA1JQS56ynrTS4PA8VpbY817vDu6Y+xw60cFZxQ6v
	R7lfQYZ500vHFEqoBJA495+ZwMcBwjj27Ac5ptgIfZL9JfMiUp9Xr2pWZfLOPvwn28bh3+XecpNAb
	tb1HyvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Sk-00B1lk-41; Wed, 01 Feb 2023 09:31:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9S9-00B1Qy-AR; Wed, 01 Feb 2023 09:30:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id hx15so29992328ejc.11;
        Wed, 01 Feb 2023 01:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W0uwriFZ/qWa8L1CESLZ45Mvp1IN80djmUBD3/EzTo=;
        b=HTkcHa8jyOLjzkZpHjI4NCxstknuNZlj+HN2dJ1zaqNxSgO9PQ8W04vpviVTSjAVPU
         EqgG4dyCipoOAo0byMFhNi0CzWgP92T6iL4pCVy3yVoutx8RHKLxWx4ROMLuZmAJfOOV
         gGthZllAk2jDrFQdMrFdfN/kratEJQe+q/gZ2gLHTTf6eFxRSpPFyGMEivsqnYRUoPSl
         Y0ljCEE+CI0zgT7LdontXHs2wEmcVTr9lIgXVhcIOoc4VMJLSjycweWk0oQzuubEmV1u
         /ZPIgX/ZL8giIu6eivQYaobyQgDVj3GbVdbxDttvVUSRBvGx17XpIWEnesXUorpnvhhm
         pZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0W0uwriFZ/qWa8L1CESLZ45Mvp1IN80djmUBD3/EzTo=;
        b=MT2GtpAlq4C9mgRUQL4dPva/niuZ6xW1CRT0jI19kVGOLdmjFwtytBvLE1oymwSbLw
         Z5ZqGHI5UlP38ZSh1MfFrTmPZBybyDtkhwTfKpnq7fkRqpstMGD7BQWqpyrgOly/vs9L
         Sq3kMEiWBiLBz3G67bwlIyRNuRcprKjzC7FiIglTjRsZaf5O1Wg8Q+4t0e1EgAt9blUh
         oOYFP+W+WxD8Oo8sAPziDg+A3NvlVCcAs8v1QtuGXIjemVg+s7rK8ysE1UETFd3ubZTI
         0OmwM7UfElzZGY0mOybFpnnraM7xoOYjw5zjtWfwWcXoSu/9d19p9tTR9uSiyX/Kh6W4
         Icnw==
X-Gm-Message-State: AO0yUKVJsUmeT3cD8FLMGZRPFb0Bte+MLRwC8qKG/AL2eLZMbnP08/NA
	6w6qPeKk515eAp/3YKDZT40=
X-Google-Smtp-Source: AK7set/0cQB2FiTDh1W3kpeL3CSXwH6Hu0hx8ld2hzv2F4WbquBKlup62j9maJz2n/aHSCvmd/vckQ==
X-Received: by 2002:a17:906:fb19:b0:86b:9216:2ddb with SMTP id lz25-20020a170906fb1900b0086b92162ddbmr1602330ejb.52.1675243851020;
        Wed, 01 Feb 2023 01:30:51 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id r5-20020a170906a20500b00871075bfcfesm9656003ejy.133.2023.02.01.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 01:30:50 -0800 (PST)
Message-ID: <8452b341-8695-05d8-9d03-47c9aeca0ec7@gmail.com>
Date: Wed, 1 Feb 2023 10:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO
 one
To: Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org, hayashi.kunihiko@socionext.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mhiramat@kernel.org, rafal@milecki.pl,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org
References: <20230201064717.18410-4-zajec5@gmail.com>
 <20230201084821.1719839-1-michael@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230201084821.1719839-1-michael@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_013053_431291_854E7643 
X-CRM114-Status: GOOD (  21.70  )
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

On 1.02.2023 09:48, Michael Walle wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Mediatek EFUSE uses a simple MMIO that can be handled with a generic
>> driver. Replace this driver to avoid code duplication.
> 
> I don't think this is the correct approach. You'll restrict that driver
> to being read-only. I admit that right now, it's read only, but it can
> be extended to also support efuse writing. With this changes, it's not
> possible.
> 
>> static const struct of_device_id mmio_nvmem_of_match_table[] = {
>> 	{ .compatible = "mmio-nvmem", },
>> +	/* Custom bindings that were introduced before the mmio one */
>> +	{ .compatible = "mediatek,mt8173-efuse", },
>> +	{ .compatible = "mediatek,efuse", },
> 
> Why do you assume that all mediatek efuses will be the same? This should
> rather be something like (in the dts/binding):
> 
> compatible = "mediatek,mt8173-efuse", "mmio-nvmem";
> 
> So if there is no driver for the particular efuse, it will fall back to the
> generic one.

Oh great, I'm making circles now.

Rob suggested I should convert existing drivers, see:
[PATCH 2/2] nvmem: add generic driver for devices with I/O based access
and I thought efuse ones should be good.

Please tell me how I should handle brcm,nvram without wasting more time.
I thought I had it sorted out but I just wasted 2 days.


I believe I need to make brcm,nvram NVMEM layout. Without converting it
I'm afraid you'll refuse my changes adding cell post processing (that
happened to my U-Boot attempts).

Before I convert brcm,nvram to NVMEM layout I need some binding & driver
providing MMIO device access. How to handle that?



