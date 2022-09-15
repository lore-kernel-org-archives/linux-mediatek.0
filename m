Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3448C6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 15:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FafyiLKp7Or/rqYTONtDbmDLktFN+TQm06lEnE/xp0=; b=nkGE5YHM7BlRwQAD9Phord25gt
	8i8LzojQiFQeoy05hI5MncitTvhLaog9w9PcUxWPbyLkacN5E/BiQVoc+hIBUutKqqRTMiugmWmAl
	3WYaIwQwUWcjT21mPxw6iCAzbF3tz/i3FafHmEOb+Ui1924z0aagEhHKY64pdbywdtYZxQACsE/ar
	bHf3g0XjnJQgwMqCi9EF6w1ghvc6IUXvvBpWzk8RnZuRq5rj+Eatq6dmf5TEoGrz198ht3WZLQbJr
	A/+hYEF229Tu4x7/iRYq16zzBF5M9qyF26E6fI9xOJyA47esaD7zfUZFvLhYC2l9eONjDCC83gWkY
	+EurK2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYr92-00CYyd-1g; Thu, 15 Sep 2022 15:51:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYr8U-00CYnC-Sp
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 15:50:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id f13so819345wrs.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8FafyiLKp7Or/rqYTONtDbmDLktFN+TQm06lEnE/xp0=;
        b=UGvqViR+bEKfooxOKyl61f7zfYyQvT3UR91MaRK85zA5upl5qvDxqCoYKwJ9DbWTbK
         BXQL3kZQNfu+ZhhTwX2xaT1PBD7Pu3vnSgv12g+kYrQ2LV8GjDH8vmwFKRwZPgX+gFDW
         TBPL6AoRQG31b3E6zsUUF4ThJvDyFtPPpPzwdVXByH1tUimkdPTSP2WZPTrEOMpALbFB
         gQMlu9ZPYymNR8I1+X5iHBmP91hAAVgubxZvSgnLsYX+cRx0Lclj9mYlxbT0PYlvNFFN
         FUInwGCU7YdzwE8wrt6TGzeYpZmzNrsdnFcmv2tLFaUHqB/528M+HtMe8eYJfLm+oKOn
         RBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8FafyiLKp7Or/rqYTONtDbmDLktFN+TQm06lEnE/xp0=;
        b=jsWjOupqwOJDeZJd/4x//rXPQqqC+fY0HiXyDR0648ZlMmODkKcuA/nIl6zzPTL/Zg
         +z4KnOh7ruvf1nREW9W5B4YeFjPIWLXgRtz6S9kYuBFpIBeNpvg2tbXNb2mTBqoIwnk1
         lvmepVVreaTn61ToojkJTqLrm5cD6dDLt7qJkEooq5kY+ttJsZfutJF+vQIn+V217ggc
         qh7UguSFBuXYrBD8gyMrHVXkhK48QSGu9W38sOoJkdQtSzdG4WM6qoP6bLmeFKOusbD2
         j3gBaSb6Tii+bKM0cyQ7nrNe1yjzrf0fqmzKomsSLDkbAafRAsLSIriFLJWmYK1My7hc
         4vfg==
X-Gm-Message-State: ACrzQf1vcGshpS4WuPuvqJWJx98ZDIHfhFCt5Sny8Z4Yc0+9Wi8L4tbc
	Fq+TQ4oPl2O+esHH1fDb9dbymg==
X-Google-Smtp-Source: AMsMyM73EKanDBPB3oY8SpNYbImMYZv2oSNslZxghiuD4hWcbfKeoMv+Z3dheYOFVSWUYKvpr0r0rg==
X-Received: by 2002:a05:6000:10ca:b0:22a:3318:861f with SMTP id b10-20020a05600010ca00b0022a3318861fmr207641wrx.284.1663257040069;
        Thu, 15 Sep 2022 08:50:40 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e7-20020adfa747000000b0022878c0cc5esm2880247wrd.69.2022.09.15.08.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 08:50:39 -0700 (PDT)
Message-ID: <ca326ce8-3eee-8a7a-a522-9ffbdf7d8a82@linaro.org>
Date: Thu, 15 Sep 2022 17:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones
 without trips.
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220914131339.18348-1-aouledameur@baylibre.com>
 <a8af4c54-12a2-a314-f190-f12859ef4ddd@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a8af4c54-12a2-a314-f190-f12859ef4ddd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_085042_951074_AE304B1B 
X-CRM114-Status: GOOD (  13.38  )
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

On 14/09/2022 16:15, Matthias Brugger wrote:
> 
> 
> On 14/09/2022 15:13, Amjad Ouled-Ameur wrote:
>> Thermal zones without trip point are not registered by thermal core.
>>
>> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
>> only but are not supposed to remain on DT.
>>
>> Remove the zones above and keep only cpu_thermal.
>>
> 
> My understanding is that this thermal zones exist but are not used. DTS 
> should describe the HW as it is, so I propose to add
> status = "disabled";
> to the zones.
> 

At least the trip points must be declared as stated in the bindings

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#n213

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

