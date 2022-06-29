Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742B4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUI568KKXBWt/UbA1wIV56CczfgTe2ipRJvz8jOekL4=; b=rKLcknQn6rDVArAdYSD/aeVjVT
	fnFgZaFg7tuHlxPss3wa/UjC7f+F5+kVIVjFeWf3zw4nJJBwmeaRIG64sAqGQEUkhuwlTJ4eH64dt
	Kbx7Autyq7eKbuWRznmy2XS34dqeT/UYiNOgc9aaTp4gwczwSy4SPF3HQdx+ODE/3FXb3fTdtpLsq
	b222YR+xfvpHJps/zSTFpD9ghwyjWaobDSGRNkvAa8CAN7IiHnUs5hpLpCyM2QsdD59HgI0QfWlcZ
	m+o08wApKjRkwn1XqZMCtgcSMCqX4BG2wVOctbKLRINwyatByfyyxO9infw8UqmAedUpJnETXn8FH
	GqK4k8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Up6-00AzMR-Lc; Wed, 29 Jun 2022 10:21:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Up3-00AzLG-LX
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 10:21:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id l68so4017360wml.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LUI568KKXBWt/UbA1wIV56CczfgTe2ipRJvz8jOekL4=;
        b=Dg+/K7lGSuLotSEUfjS3gnurmv3Ls9wWXf6+SkWUT8cGyAwt/fvEJr+1Ttq4qiye9Y
         hdXUYGJ0HMbnWxRaZs6PA2J9hJ1QmKztIGxEVZBrNp0IAJO9fpBuhsBWdANK2Tpo4QvD
         qcnWerCjZqxRV/tFdNll1My2DNgYExo3D1raK2FrREl9oEp9VBo1JlfI/xtFTpgjb9+Z
         XX2iTKSC+tjZKqAll7tRdmBEb08QNDXYF2+8mF21DIUneW0qNkD/q1WemgocXxI8SShR
         kz8hLD9uhFTE4E/MfabHQsewdcdUPmic23x2KnI7UsNFlKzbQs7bjwjTpR36z5tz4GaY
         P9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LUI568KKXBWt/UbA1wIV56CczfgTe2ipRJvz8jOekL4=;
        b=8ITolXEqMBf9Nxp2B+VdVxFGAsGxMNYjIGG4ZLzLRb38pgTI/EHfAL4YYHAfKqUjld
         nQEIAMkCJGlknnPBBwZJT0rL20phBZebF1O3c0Kev0U9XkteMim4r0GdP6pN56o74tEr
         r3PCsMat7n4MU3jTOG+NctHyQnsM6rbrYc9SAIuGmJ8dvaj52yQhJipTD+4zQd9D0/1e
         VGYiGHptZwE9cEh04mVvjpXFutWolNzztVsDU2JTMJutcunlVkEBimExGw4tEYtBMiAS
         ejoArJKI6NtQQZk843BldWgs9oyfMS8VGOUDCk+jUcCRzbe1z/787JNZiaIgcP7nD5tA
         SUjQ==
X-Gm-Message-State: AJIora9JBr33lopz6iUU77mLp1Dawkb3MyxvxeCFiabM6YgGL1xBJnxT
	sVC73rCSKlNGj/81JWkgdmts+A==
X-Google-Smtp-Source: AGRyM1t66misOvkWP/wDFaZ3DmxBe9/TdCWM/N12/+KveC7B17Rp6dA33RQzHq6OCHRATnzN0JeudQ==
X-Received: by 2002:a7b:c196:0:b0:3a0:3d46:4620 with SMTP id y22-20020a7bc196000000b003a03d464620mr4808384wmi.26.1656498082205;
        Wed, 29 Jun 2022 03:21:22 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm2562035wmi.29.2022.06.29.03.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:21:21 -0700 (PDT)
Message-ID: <7d3fdfb5-ed03-671b-59d8-918cc0d60612@linaro.org>
Date: Wed, 29 Jun 2022 12:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
 <20220629095302.bi3xx6yicsnjeff7@vireshk-i7>
 <1072cb84-4097-0cbd-f980-a864ea851b0c@arm.com>
 <20220629100148.67kevfelqq7d23n5@vireshk-i7>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220629100148.67kevfelqq7d23n5@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_032125_777843_61AE1741 
X-CRM114-Status: GOOD (  12.90  )
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


Hi Lukasz,

On 29/06/2022 12:01, Viresh Kumar wrote:
> On 29-06-22, 11:00, Lukasz Luba wrote:
>> Thanks for fast response. It would be great.
>>
>> I have 2 ACKs from Sudeep for the SCMI part,
>> but I don't know the status e.g. of DTPM
>> current work which is using the EM milli-Watts
>> and does conversion to uW internally.
>> I hope, I won't make issues to Daniel's work with this
>> change.
> 
> Daniel, do you have any objections to this ?

Sorry I had no time to review the series yet, give me a couple of days, 
may be a bit more if possible


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

