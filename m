Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9E9D1AD4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZZ6IoFhK6PDXBG1QpjJe1QGZtQQvwP0mL/ZwkXR4ZE=; b=glIxTQjxP4kRgMyLMtK5RMkubG
	Wwwt98YGQe4tvc0ixrT1Tm3z7frfFimfAFfVSDayAtUOi+NpQDSymj1o1Sg5dpW9L57P3Ycw95a7J
	6rqGBE5Lb2fvA7LDfe/ObvyfZ1Mr+8FS2gZfjWFdX7FcD5ymQuwRh4hhp5SQ+PoczPuC8aRMAEiBV
	PAKsgbd0a9dRQ+uBfpXfs2jdETukuQHf6jmY7uiD1oKzv+6XKee2pkXGhcguP+b40YTF+J4W+sEXO
	bhbyHQwGb1xqczKSUamwwCP2JMbRPSgFj4SZOwA9xBJbRdJf1sp6lAmURAZkRcVhAV9Cv1Ng7OudT
	8qgjBBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12vl-0000000BhYI-0XRY;
	Wed, 16 Oct 2024 12:15:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12uI-0000000BhCS-1ldt;
	Wed, 16 Oct 2024 12:13:39 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e483c83dbso4420985b3a.3;
        Wed, 16 Oct 2024 05:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729080817; x=1729685617; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZZ6IoFhK6PDXBG1QpjJe1QGZtQQvwP0mL/ZwkXR4ZE=;
        b=C1dA9KJ4j3igKCvLsOZ3BtXaePq6atw+GN4LXxJy21akkGsU7u8T3eM2TUsl//n9Ye
         dxpoTDnF6cUK+KQYx8mv1SyEEUU6BIXhCrWTL7oMyzrQrYreZZInFqdVeAYLm7ZcDKBq
         nPn5qkoxPfttHPSDAtodwMyg29xHtJUMzbuVgdWMoj3x6ncRN/NbbbGLTMZdzQ2ZShJs
         0zeRHAPJRCNKkcOjJXMJXrn5UBQCiaxqoqozGtJx7UipLFbhDk7gg+/v9gi63lVefe7r
         y+SRiFYTZoang8xk38WWFkjAPwxQBbJdusY4jkIqd8fmlcoBPMVW+wXtiFGD8lYoc7Ws
         U7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729080817; x=1729685617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZZ6IoFhK6PDXBG1QpjJe1QGZtQQvwP0mL/ZwkXR4ZE=;
        b=n9Rh0NsGTT/xw0cX9WIMqvZljkq8V8mF3q3x6ZUJNxABJitVJ6kY17gNLsBjcSSYBJ
         Pl7gB4d/LXd0Dt2O/DgCj0VvzC6T3Fj4bfIKWrJFzVp5goBMDvtnE20+giZeTWl1Q+iF
         iWYNCWq3DgFYd1fMetktX+WMuGeYkSg/JK3wnjHWYH798Y+JCcZZ2x/dTB0L4OdneXsH
         94nE0O+WTUPro3JI61S6hyRqCl5sDXEGD0tdufQOnYOImJwo+JXA/pw+pIUnRP8qKrfl
         wJJjUVRcQ9cj9yR2Antcb7mjRcFzczcN05sG3lDPXChffnUrds2AJ8Qy31nTIshuG3xO
         Nmzw==
X-Forwarded-Encrypted: i=1; AJvYcCXgxXu2SfrcqGWm7FG7jLs8N97tZdtOrV7PoTSbZlbxwP1uiQW4q9ebqt2u5B8uN4LbKYeqymL/Qfk72VDvAdgf@lists.infradead.org, AJvYcCXiv2W364hDL1eesLCVGnWh7tsP49kJ6C7Mnuom0yQ0x0UEZ+6Idzj/j0byDuC5K35mHhSrfmPK5540Rov3Q7M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2oRvHVj8b9uBGuMOGt8usY5jgf2DslECpRRvz0YDdMAe62y9J
	MfvMQQqadhTcxs91KSd2mAgjnr227oIyxUl7nJ/EddrKqTNpLIOX
X-Google-Smtp-Source: AGHT+IGka7vQ+KnGqvwGPqMmm5jyJDtZa+anmR+UonwTf4lt2t9DshghkEXcXytCl/nQDa2rP0r9cg==
X-Received: by 2002:a05:6a21:1584:b0:1d8:b11e:19b9 with SMTP id adf61e73a8af0-1d905f69289mr5724548637.47.1729080817343;
        Wed, 16 Oct 2024 05:13:37 -0700 (PDT)
Received: from ?IPV6:2409:4040:d96:3a2:b0b8:ce41:c5f3:28ee? ([2409:4040:d96:3a2:b0b8:ce41:c5f3:28ee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6d43f8sm3105241a12.54.2024.10.16.05.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 05:13:36 -0700 (PDT)
Message-ID: <a87bee76-85a9-47d7-bdd4-70f8dbe42848@gmail.com>
Date: Wed, 16 Oct 2024 17:43:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>
Cc: angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, pavel@ucw.cz
References: <20241015085842.GC8348@google.com>
 <20241016042142.8088-1-surajsonawane0215@gmail.com>
 <172906519188.1139310.1418498131501157586.b4-ty@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <172906519188.1139310.1418498131501157586.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_051338_488780_FAA8163B 
X-CRM114-Status: UNSURE (   8.68  )
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

On 16/10/24 13:23, Lee Jones wrote:
> On Wed, 16 Oct 2024 09:51:42 +0530, Suraj Sonawane wrote:
>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>> to resolve the following warning:
>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>> error: uninitialized symbol 'ret'.
>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>> access.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
>        commit: 6cbf5c99541ac681cf5c6155b582dfbcd879eae3
> 
> --
> Lee Jones [李琼斯]
> 
Thanks a lot!

