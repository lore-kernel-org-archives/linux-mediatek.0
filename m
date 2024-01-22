Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DFFC47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RabbX6Gki8udX9fVIXmTnIqe6Awyq5G6O4BYZpPJAwo=; b=2+dFJcYxI5qpjOu1fuRodcDuME
	i16oEWUOrSYuB7Ik65Azp6QrWfll1Vqiv4Qof5A/2Qq1sDuO/VuxUorZO+Ss+vzAwaW/1yraz0lSW
	MSSUf9de/Q7Vi7rEO0FjOp66wy1nSEOP4gd3hCKvnmcqVjHtBRZOW/x0NNrxE9mVElK2qc5PIScsA
	cWjdB8Mt5k0VZyL6zv/pLVwJPFPySPhboXePmIngpTUUmUE0sXZdoFnW0SFs8tWOOrCOB5dDElT/q
	TS/CmQtk1qP+lpXLDdjQDb+jCpuV4cX6GA+HyfNmmIGRsR1EfK7SskpvnF30jDzn8lSNgdOXG+hf4
	woucwpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRp8p-00AwBm-34;
	Mon, 22 Jan 2024 07:54:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRp8k-00Aw7x-0i;
	Mon, 22 Jan 2024 07:54:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so34941655e9.1;
        Sun, 21 Jan 2024 23:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705910077; x=1706514877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RabbX6Gki8udX9fVIXmTnIqe6Awyq5G6O4BYZpPJAwo=;
        b=UsvrA9Z6kvXkF+jojxn2OSeHNAo5nHz848sq9u07wvXvmnAqOlgw09C66lVixBx1kv
         bglwKUClbQ7EYWkDoTn6kpWc4+FGJUT5+evPWdEjtEjDTz+IvN4IMAOcJCBoRkSzw97h
         db5hVlnLfquQ08EDnEuw88dyGAa1i0LbUgXxgHQ3xdjGTqlmNYnTRLc3gQ9uLr/npcHK
         qhMFuUN4HeB+SLcOz/xtthaJCCysGYvziHMd5/mfpcsOcp3hTWb1088qHQPKy3xRwA9b
         aGE/BmpB5lX4bDNEqmT0vAzXTIGBZaqV/1NsL4/ZqGo9AqgZQxMM/d739tV7TOZNX0yr
         MVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705910077; x=1706514877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RabbX6Gki8udX9fVIXmTnIqe6Awyq5G6O4BYZpPJAwo=;
        b=g6QDdOp77bmbGXrSxpUfwx5VGFBbW0gh1X6eukNM0WuMPoDXM23DOdFpz6KeO/jFuo
         lFiP9rzGUm5Dr5m2ejkqK6O5NYrceCa13AWQh34jtam9VmRBQDUfa4fqTIKB9d8PdlUI
         njLmXrBs2RuXd4nHF+hM/S4WG2a7W5VLbPUd3s0LngNwHTBI+gcofAv0CWMJsrjH7mJv
         ysO6iJjJ4LdbmEtG9owcycnJ4yP3Y+3TwAHLorWqzRYU7DcnUN8upJrmD5WckEZVNuuN
         cwu0HnxhscixVBZjiOAuHxgxA44MM2EC6X6cCEPI+ZB84mDjfs6EDY5Wv1ZhWf4fSw/8
         hCaQ==
X-Gm-Message-State: AOJu0YyKkK2VvDcnq9kt23sBH0ypCGfUxGCmcgRXDtb+53+2JYOrxpyl
	aifWO7x4w0vKWWbHNMfNZffjdxOFWUPW8595QGftDdxaQIR5gL4n
X-Google-Smtp-Source: AGHT+IFUXMwoASwaT08yq7oCYxK7JHY4M48Muo93TI2g9XhuhCgYy//a3jzYQTs3TsQAwjAFmBA33g==
X-Received: by 2002:a7b:cb8f:0:b0:40e:55a5:85f0 with SMTP id m15-20020a7bcb8f000000b0040e55a585f0mr1493445wmi.87.1705910076812;
        Sun, 21 Jan 2024 23:54:36 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b0040e3488f16dsm37761046wmq.12.2024.01.21.23.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 23:54:35 -0800 (PST)
Message-ID: <115ec234-64b8-4dc0-8db2-aa1e81b4f3db@gmail.com>
Date: Mon, 22 Jan 2024 08:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max
 ioomus count
Content-Language: en-US, ca-ES, es-ES
To: Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh@kernel.org>
Cc: bin.liu@mediatek.com, angelogioacchino.delregno@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
 <20240109032731.GA2578937-robh@kernel.org>
 <94beea2a-c4b9-4241-bbfe-8c57ca50fbf7@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <94beea2a-c4b9-4241-bbfe-8c57ca50fbf7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_235442_266879_1A6344C5 
X-CRM114-Status: GOOD (  14.37  )
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



On 15/01/2024 04:57, Eugen Hristev wrote:
> On 1/9/24 05:27, Rob Herring wrote:
>> On Wed, Dec 27, 2023 at 03:08:11PM +0200, Eugen Hristev wrote:
>>> MT8186 has 4 iommus in the list, to cope with this situation, adjust
>>> the maxItems to 4 (instead of previous 2).
>>> Add also minItems as 1 since iommus are mandatory, to avoid warning
>>> on the example.
>>
>> maxItems alone means minItems is the same size. If IOMMU is required,
>> then 'required' is where that is defined. Is there a case where 1 IOMMU
>> is valid? If so, what h/w has this case.
>>
>> Rob
>>
>>
> 
> Hello Rob,
> 
> Without setting a minItems , the example in the binding fails, because it has just
> 2 items, while the maxItems is now 4.
> I set minItems as 1 to avoid restricting any kind of hardware to have at least 2
> items, but if you claim that previously, maxItems=minItems=2 , I will change this to 2.
> Is that fine with you ?
> 

I think that's what you should do yes. If in the future there shows up a 
platform with just one iommu, then we can fix that.

Regards,
Matthias

