Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F025CCF11CF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6hOB3WYe5ptd0V4yAFNBvH3wokk8CpFdZ0OmgAEsCA=; b=sb36svQArO2nY5JIbciaPQnSy9
	XOL8mPNx3MIFrArAdgkCZOOZk5mjusq/+g3Mgb1g01rD+WfYWmc2iqHs+NGYB3tZHhy6l1exeMGfe
	k+JiAaqpDLfEDXHmtEDNS7jxko72o1b7x5BKlhy1Lj0X+OIYOuuJriLAM4NTgIeZoe4yU+SWVBzYu
	IbGL7hXd3P4hr58xV+DTQ9WabVMiW4vxxfKNsUnySNxOC3MJgN/E01Q/WT92JHAeYxMtB7TiOcBqw
	O8o2R7sM/HcOTb148DISjTYpvrnhrxJ8tZNyK+GXjzSujMRX01GdP6a8vvztsL1ytLPtbZinjl7Hy
	JtUnFJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syqxf-0000000CUWp-3kT9;
	Thu, 10 Oct 2024 11:04:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syqvE-0000000CUBr-3BFu;
	Thu, 10 Oct 2024 11:01:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c8967dd2c7so944676a12.1;
        Thu, 10 Oct 2024 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728558091; x=1729162891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6hOB3WYe5ptd0V4yAFNBvH3wokk8CpFdZ0OmgAEsCA=;
        b=iwfo0rgxi3B4siACCB3b+xsI1PmwB80jibkE7Ik/4sND1y5OF0WXh9khgzn/hkVXEl
         xqVx5/a/Jx5tAoEa7+rFg8AF2jKqnp0M4y4GY6jDxKlKhwsGp1Z0eOnoRQrBab37jxEC
         2PyM0jROcrEcZAkHNvAEKvocjcyH2QCA2vSdxoSQSArKXwYoyXaVRTjWHSgarbPGC+hr
         uLLMM1as0fDit7hpf8lx5RdSxFJG2Sa6KL4blduQp5U+teEmjm9xotK4mR59Mgkp89cM
         O9bq1FlEc6IdlIZQDFnK+1GodeHIVwRxpIo758LvNS7vQ2H112Tk1hI+zTTpHPY2SoB6
         hnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728558091; x=1729162891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6hOB3WYe5ptd0V4yAFNBvH3wokk8CpFdZ0OmgAEsCA=;
        b=BN31JCGe1Juv+V4qhSkaan0jtTdpz5wjRcN8D5y03boK+2X24YI7zmx5wVriOEDivc
         1BYE/ES5qb7tbbGocAX3dodEYe7grqLLm1qtONWygRo67al6htRL1MlJl4R7hiTbN8m4
         +g1NMsxGfovAKxbOKnMbqbC9rfwHSfNZMl3RIKfgeSwNyOPgd5z71a7Npp4FwgHSAipM
         4tx95UVI4OSnqi2AspdEdvi0pe4NZM/lQ9Wxvfk0Sf9iwQbl7iIibEpc2SjZpaHm9MdS
         1+AjTiD6motLH62LsKkf1BnWB+r8RFRxI7/UhOR0+VxaNuM1NF/kFIAjyy6cHxT1+I1k
         A/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZh0bYVMZAs6He2PdBUH9U1sGmc2zbgTGOn1UMILOwRj7B2sx5DpXdPvk5XYJOUJU0P3P7U1JgcS+T/RAiSFR8@lists.infradead.org, AJvYcCXPV/sFqj9xWzG5H3RlV0ktD6zeD4sOtub3DjcyuDVNJPBZKeITh/TwQdBoJTiSgib1Q1QONmRQZWBNmYFvZDM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcs+aojJeX97o4zNxCY6UZ9I3fOfiOZbr75Nobvk8H5csbdrv/
	qorlZqk3SFYEPsp9cmhsOIcbNcllAB0cwCA9V1PScw7OT7FEYX4o
X-Google-Smtp-Source: AGHT+IHbNEed4HOcT5QFwuxaCRiY2AqUAYWXaD8LyYy0wMdUUxQ+IElSGs2olFBYFKuyibS7TkhutA==
X-Received: by 2002:a17:907:6e89:b0:a8d:250a:52a8 with SMTP id a640c23a62f3a-a998d11896cmr507786466b.3.1728558090475;
        Thu, 10 Oct 2024 04:01:30 -0700 (PDT)
Received: from [192.168.42.132] ([81.95.8.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f35c46sm72920366b.89.2024.10.10.04.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 04:01:29 -0700 (PDT)
Message-ID: <53db6c40-10ff-45e6-b2cf-6a6a1a4f31c9@gmail.com>
Date: Thu, 10 Oct 2024 13:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary variable
 assignments
To: =?UTF-8?B?5ZSQ5b2s?= <tangbin@cmss.chinamobile.com>,
 broonie <broonie@kernel.org>
Cc: lgirdwood <lgirdwood@gmail.com>, perex <perex@perex.cz>,
 tiwai <tiwai@suse.com>,
 "angelogioacchino.delregno" <angelogioacchino.delregno@collabora.com>,
 linux-sound <linux-sound@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
 <ZwejOZQlSsWbAWBg@finisterre.sirena.org.uk>
 <202410101755089538782@cmss.chinamobile.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <202410101755089538782@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_040132_824935_52A394A7 
X-CRM114-Status: GOOD (  16.48  )
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



On 10/10/24 11:55, 唐彬 wrote:
> I am sorry, it's my mistake. I know the rule, just mistake.
> 

Please don't top most email but write the answer below the line you want 
to respond to. This will help others to better understand the context.

Best regards,
Matthias

> 
> 
> 
> 
> 
> 
> From: Mark Brown
> 
> 
> 
> Date: 2024-10-10 17:49
> 
> 
> 
> To: Tang Bin
> 
> 
> 
> CC: lgirdwood; perex; tiwai; matthias.bgg; angelogioacchino.delregno; linux-sound; linux-kernel; linux-arm-kernel; linux-mediatek
> 
> 
> 
> Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary variable assignments
> 
> 
> 
> On Thu, Oct 10, 2024 at 03:35:47PM +0800, Tang Bin wrote:
> 
> 
> 
>> In the function mtk_dai_hdmitx_dptx_hw_params, the variable
> 
> 
> 
>> 'ret' is redundant, thus remove it.
> 
> 
> 
>   
> 
> 
> 
> Please don't send patch serieses without cover letters, having a cover
> 
> 
> 
> letter makes it easier to tell why the series is a series and makes it
> 
> 
> 
> easier for tooling to work with the series.
> 
> 
> 


