Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1E9D2069A
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 04:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuSywXYoElsxrjkfwv/M1S/AVxPVwxoJ4Eg9UCE0j2Y=; b=Fr4YSHHzkCDw0t9WEaY8CDefWp
	LZISycQ+uiHQFrJ2DvPngBsopD/1JLcOqnOPUk/1JmJM+jkesXu1qxgn55Z6+1IPE7eLasUf1mP+A
	SpXN1HajPJnx2EfqMAM4kGEEz4fC8nigEpvjCtXCtVT0pGFuWXWIGpW7SW+txsMW1jKYi3cmuU4Ad
	y/jDu69IT6d813tCYnD4zoV8qaQByUziBoV/jJWlZxk5PBbhJd2K6Dd6D+Cq9PahYTUdnXWZTUldK
	iBU0NbV284Q7W3hVf7nUmHsRh0l8Ccp0kT830hWvXB+7nhzgsxk0+3ZHPxJ3EfWFtnAZNX63fuhJM
	vGYXvtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0vcy-0000000ATsj-3UmB;
	Wed, 16 Oct 2024 04:27:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0vbX-0000000ATXR-1wsJ;
	Wed, 16 Oct 2024 04:25:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so3135467b3a.0;
        Tue, 15 Oct 2024 21:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729052746; x=1729657546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuSywXYoElsxrjkfwv/M1S/AVxPVwxoJ4Eg9UCE0j2Y=;
        b=H4HLOWhJjzCEDSyx+Bz51oVvBkPDYDMNou3oZf4wsytaqdo822YlF/wsgU0DAVSCXY
         dwznn0fC5uAUr+vgCYLXzosjzX+22pllxYESn98w+yik2PdSlIKDenURgXtceGbYl3v8
         BcYhSI0jUZXN6JsRxtPg2meGRg3eDYXmT2IYhjbzj35STsEt5yk97SJ0hsmtXTVDMstP
         ZjK4fUkd1dNIU3HTXl59+QF05lk0CnPotksftplzqC3wV/tBqPWEonULsuCv0d+Oacza
         7sXIpiDkKTtiyvOaMcGJ60+PxK6EWjsGintr7DjhxfB+/S5FxIjQV5yIUIw9DJDlShVP
         WChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729052746; x=1729657546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuSywXYoElsxrjkfwv/M1S/AVxPVwxoJ4Eg9UCE0j2Y=;
        b=UKwQVxpyV2tlABhrcZGMeWJRNomoumrNTW5jEWroNjFj+OUEV0raAtceZF+TzHi/y4
         gNTTl61u86ZbvAVf1mJNRzBcFbXDKTWnbfqhQrqS5BJRuYV3P1YjPMgH8I9Xa/+Gnmbg
         bxrS2DEvSq7vGKy/W+W/V5RPbeEPxF23tveluiXokUo64IczXp2L4QU+4eBj0IJpaoEP
         5iOrS72+lx9SliljXxY+d2n1/AmkPh766xtLONHsAozU9vQ0n9nDseoRUdq9+butx/n8
         klk8bLI73yh9bTXGIiVmBDmYxqxK5Klw4gSbRo4t3r41s9Hz+5PoRIhR9nXj44b31fVX
         oSOA==
X-Forwarded-Encrypted: i=1; AJvYcCV0r2pIplV0/sR+0zZNoxOcONhT4thpxoDJmj9tq8IZq88syrHhaevuk/HabqLsKlH3v9X6qBmL+q9iVj/qAUU=@lists.infradead.org, AJvYcCVuJY91miVHBY7LSJHXil03unFgvaumvmE60IgrZwtbtQGOrP6VSiQQ8v+V9hJQGsbQX69AlzklySFdM61APhFT@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCcIjbiljKWyma/AsPj0LCCq71CZ7Q5qtmR5BGsVKRq2kfdNW
	Rna3iz4FMcCVo4kR4aC9ZRNZCjRjdOy8A3GypVobdJl5ntx9U+8d
X-Google-Smtp-Source: AGHT+IEOVdMM8PcWZxl1hPvTCKwG2lQG4t9e4+Akb4lepcYLEtP3F6f9LMfzoo6aVvTlm9dEICcxmg==
X-Received: by 2002:a05:6a00:21d5:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-71e4c17c145mr21607003b3a.16.1729052744203;
        Tue, 15 Oct 2024 21:25:44 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a6:bd6f:94e5:e911:e544:8911? ([2409:40c0:11a6:bd6f:94e5:e911:e544:8911])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2ffbsm2173954b3a.81.2024.10.15.21.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 21:25:43 -0700 (PDT)
Message-ID: <c824a2f7-e661-4d8a-a11d-a4df0aeff720@gmail.com>
Date: Wed, 16 Oct 2024 09:55:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
 <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
 <20241015085842.GC8348@google.com>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20241015085842.GC8348@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_212547_527496_7BBB4364 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On 15/10/24 14:28, Lee Jones wrote:
>> On 11/10/24 14:39, Lee Jones wrote:
>>> On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
>>>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>>>> to resolve the following warning:
>>>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>>>> error: uninitialized symbol 'ret'.
>>>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>>>> access.
>>>>
>>>> [...]
>>> Applied, thanks!
>>>
>>> [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
>>>         commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e
>>>
>>> --
>>> Lee Jones [李琼斯]
>>>
>> Thank you! I'm glad the patch was applied. I'll ensure future patches follow
>> the necessary guidelines.
> Sorry, this is a tooling error.  The patch was not meant to be applied.
> 
> Please resubmit it using your updated .gitconfig file.
Thank you. I have updated my .gitconfig to use my real name "Suraj 
Sonawane" as requested and have resubmitted the patch.

Best regards,
Suraj Sonawane

