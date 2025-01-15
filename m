Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C74C02180
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2025 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYIRfzMIoEey6eiQZC1qlV3nAdw1Yt+nNSYPyfY46Hk=; b=lKgw8ZRxqTcABeXfCh6m2kANWX
	zaKmI0/980CwW5hvkfvvUtFpHfbdD0dmjfnvOQsHA7nYR6ZDejRV0o8gqc4qcA0DGiCL0BPrK6GLK
	HNYdfa9xpVsU0b1blTVBTUcVeEQLwrw9haJEsK7fgIyvIVUiypxFFsaQNo6Pi5a2xQmwCpju0DBpN
	9fzhxBtW9yBAJyC4r5uXoZS8mJug4HfJvVbjV0qJVAL7kpU6aZpAkCbA4wKu3dDuidLDcx+7E81e8
	2yKUU4s419T9sL448b06Wf704jvZuciBGVuO/WWq9+8+u/W01VjJR5M6VijozO+Mpml7LSwM/5nw6
	CqUH+vFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8wY-0000000CtIQ-2AwO;
	Wed, 15 Jan 2025 19:20:46 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8wW-0000000CtH0-1iWn
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jan 2025 19:20:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so15548a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736968843; x=1737573643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYIRfzMIoEey6eiQZC1qlV3nAdw1Yt+nNSYPyfY46Hk=;
        b=dc61bTqgTJqVYwGB74OU4sie5OWfTK8Sp0hKe51u9oC+u0+9EufaT0iF1LXHQnj2Ns
         A3um8fBN32EtGMB9iCsu5HYE2gY7u+97MLyxENrT6XWe+NGAADKPiHCnOKpdtuAiy5dF
         9KTZWdyIQXBodvM8BdHKrsUDSM9fpzewKWfKefeTLIA7mKId14Zvg1jXlh6yvYhhb0bk
         kscTM3otCPgjEL4GQ+CguttCoMMXeMQxHX7JSJNhuWMvXctPvVgdXE+cYo92+fO3Le4w
         RBKcGHBupopyvQMVYaT7+CJahzZYNvGPSjq2DaU5e+pbOVDpkcdglH7UG0GzKGOJHMa5
         AGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968843; x=1737573643;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYIRfzMIoEey6eiQZC1qlV3nAdw1Yt+nNSYPyfY46Hk=;
        b=P0YH17tZGkt3p9r1cr0U2+ERd7UkwYl5i8g1/G/0oD6oS4aQ+F3ak23IF6FBmalWvu
         PPZFCN7F8HzEzswK8brGMfND0cgQDQCdX+912nJg6zrzGSQhUwlyiPCR667ADMU1snXU
         a6VDwUQ8nYNQ2OOLDtDmxllvpqTKJwPRLYK1KfiUrv/23WIwvtoT8WzgHwj6zjjV9Yok
         6RMCx5tczd4HtHdOWm9wWIjnMSjAVHh7ca4jLiDFZJHyPTWdzjCHCejZL3/nivQfaNw2
         2GTyWziGHIf9uDGEXGUDYvhA4sQCFRoz+dinxyUsGb2qwaiiHTaEgTcLGBT+AJK7d3qn
         nLiA==
X-Forwarded-Encrypted: i=1; AJvYcCWqXQeM3BTElSf0vlJfJaXy962C0DLIysrAcy4+IsnOpWv+R1ZZhsnUwlgpxdFAi5CzouUtBRkMPBryU22zUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1qApvh8S+gJMLgTlKIZmIo294CzrMBu3XAqUJy/vObQ42Vbx2
	GYRCssoAg6QaK+TCaADhcjMu+ujG9DTtFpG8U2Ts5+IlLYtG/FYhXebKo7X6SPw=
X-Gm-Gg: ASbGnculiM6L0++6zPXYhC8CAG9rTwWsbmREchVMlKwSAp1JznZn1ZARU34qLSN1p27
	Uh3kLzZnM5UT5aX+OQz6HoZDn4VNDVUEi0I4bC1X7xcllRSxzAId1CGLHI3PvKKkxX8ijFb5RAS
	URMP0hL30DxVhzsvhNRoyR11DdRq92do2EA6vG/pkpw/mGSxUmvhafER614OxgZaNH6MquXw/2M
	7JBrzfT/OWL1K02hyOmTEc/jViSeDJqD635CsqWw2hJnoJw2QMd2Vh8nABRXSEFJxogi2249uVS
X-Google-Smtp-Source: AGHT+IEobeKPSb66dhQJB8BVuTHa5PVEBMft92rOBD4aCHAR3KxGt12rfIWH0l1xEEGi6zqG+032uw==
X-Received: by 2002:a17:907:bb8d:b0:ab3:2719:ca30 with SMTP id a640c23a62f3a-ab32719d024mr384947066b.10.1736968842769;
        Wed, 15 Jan 2025 11:20:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9565517sm800167966b.130.2025.01.15.11.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 11:20:42 -0800 (PST)
Message-ID: <37603c73-cab7-4973-8705-1deee6445a7d@linaro.org>
Date: Wed, 15 Jan 2025 20:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: Use str_enable_disable-like helpers
To: Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250114200716.969457-1-krzysztof.kozlowski@linaro.org>
 <ca5482da-1612-4fab-bfeb-bdc72cd65662@acm.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ca5482da-1612-4fab-bfeb-bdc72cd65662@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_112044_478755_BAFA3250 
X-CRM114-Status: GOOD (  13.95  )
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

On 15/01/2025 18:53, Bart Van Assche wrote:
> On 1/14/25 12:07 PM, Krzysztof Kozlowski wrote:
>> 2. Is slightly shorter thus also easier to read.
> 
> Does this change really make code easier to read? It forces readers
> of the code to look up a function definition. Isn't there a general

There is no general preference, up to you.

> preference in the Linux kernel to inline function definitions if the
> function body is shorter than or close to the length of the function
> name? I'm referring to functions like this one:
> 
> static inline const char *str_up_down(bool v)
> {
> 	return v ? "up" : "down";
> }
> 
> Bart.


It's subjective - in some places ternary is really complicating, from my
other patch:

	data & XCSI_DLXINFR_SOTERR ? "true" : "false",
	video->hq_mode ? "on" : "off", video->jpeg_hq_quality);

note that's ternary is split here:

	dstat & BT848_DSTATUS_HLOC
	? "yes" : "no");

I understand if you don't find the code here better.

Best regards,
Krzysztof

