Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF81C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG86IN3Vdawja4OTBqoAaDLMM3BOtyeRil5sAAAYa64=; b=PueNLAKAHvyEQFBXEoX/XDYSpW
	0bqOWB0mWnHF2h/Jm7zJnt6ckmgcw4QoQX5PjrpL6vlN6tSF38kt+Ux46WxVwQ4UUsxcQTIrwQqLo
	A4oAdlOxJOItTrKETs/ADqFTNJIJz0fKDuoC4QrivhzTM5iXSaItP5g2o03BuNvm/K1eaxBEP+2+e
	bMGFLfgjFOatt0qq38l4U02YGwkYKNrlH8nLgAYUzcS52ioKkoJ6dwqBv0rdWJ12Kt4O7G3Q+7/5z
	+HxsacR+Lm6yku0tXQokIJREnjUs6QzBB0jJoQtleHI1IV09mRJFOs6Fm0ry4KQMnKpGLlFIgpa5+
	DH6OBYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKAb-001vqR-2O;
	Thu, 23 Mar 2023 12:35:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKAY-001vpP-0j;
	Thu, 23 Mar 2023 12:35:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id y2so8632122pfw.9;
        Thu, 23 Mar 2023 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679574949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sG86IN3Vdawja4OTBqoAaDLMM3BOtyeRil5sAAAYa64=;
        b=MCd2aKuMluyeMycgMxfOfXwDXdozXv1ihRZOW33fFiVruAoiAWtLyNGnl6cNTBPgXp
         i/P03egxQrgYgCdLv9Gej5SxaQQycqd8PvT0CJa7wc5TYm1qoQpwrbd/SDNK4Xnghi7v
         jEnCXO2veOSvRIuvRtE7hwuHw3mGKTnhZ++jMb9pmGpI8+m/T+qIztVMyOSYy9w69Xc3
         G95Haw4pQeXYCcuq6AG7yQmaVJ/dWmxeR2xcswmu4lQpp3RbUy96zmdHu4zXSI43t4JJ
         0/bGfxZYvQusQPql062GdE+wTJ4oYryyeTiDWIf1DxM45fdd5p2OuMrxplV+V2KSKk6H
         V0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sG86IN3Vdawja4OTBqoAaDLMM3BOtyeRil5sAAAYa64=;
        b=ubDdHE9B7ZRUbnvb0LUcud5BwEItjmIbSDxJ2i52MUtdCg2BuypXaSjR3Koxowf+yD
         kAgO9BdomD2Qdj2EttdNJcTjWMAaGI9Jmu1v6WwBClqGpvL3VR9bZAJxZAwJHm/Gqlou
         UZV3WuXxLP6zMIg+EBvA6jcWUDKzIgQREO+VV3fwT45POU3ziDzihG2jDT7e5DMJdD42
         JjhjNg0J75+K6EP31BvgKxEMd7AJHi5GFph+cZWd93/epQAScUIwFO9I8hjLPjiEIFrq
         4XDorzZxrJ+8IHEjJOZrB8D6b3MGpcZU8bTzVvenqQW7yTYSxpdjPB2JnZrunBWIWqEV
         cOhw==
X-Gm-Message-State: AO0yUKU7/K0p5d58+xflk98NOEQv8/UWcsfKK3FU9M0QDubhdRarV2tj
	Hokzvy3FxUFWbUfq9IE9svo=
X-Google-Smtp-Source: AK7set9BVqV8PjBMAXZJ191R5TCitQaa6ikl1gIzN0x3OiW36GBmgTQUJOqoJoSAPKIdMPo+We9ROA==
X-Received: by 2002:aa7:954a:0:b0:628:642:c533 with SMTP id w10-20020aa7954a000000b006280642c533mr7091222pfq.31.1679574949055;
        Thu, 23 Mar 2023 05:35:49 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-43.three.co.id. [116.206.12.43])
        by smtp.gmail.com with ESMTPSA id w4-20020a654104000000b0049f5da82b12sm11359254pgp.93.2023.03.23.05.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 05:35:48 -0700 (PDT)
Message-ID: <da9d9bca-23d5-aaa8-a815-5a9421c05a3d@gmail.com>
Date: Thu, 23 Mar 2023 19:35:42 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] Documentation fixes for MT6370 RGB
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux MediaTek <linux-mediatek@lists.infradead.org>,
 Linux LEDs <linux-leds@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>, ChiaEn Wu <chiaen_wu@richtek.com>,
 ChiYuan Huang <cy_huang@richtek.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
 <2b8667b5-ea54-2ef4-f069-a86acd28ecea@gmail.com>
 <20230323123156.GL2673958@google.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230323123156.GL2673958@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_053550_262082_93D41576 
X-CRM114-Status: GOOD (  17.84  )
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

On 3/23/23 19:31, Lee Jones wrote:
>> ping
> 
> a) Don't do that!
> 
> b) Especually don't do that 4 days after submission!
> 
> The usual expectation is 2 full weeks before submitting a [RESEND].
> 
> Mark Brown says it best:
> 
> "
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.
> "
> 

Ah! I triggered the wrong message at the wrong time. Thanks anyway!

-- 
An old man doll... just what I always wanted! - Clara


