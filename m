Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6466BC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wlyXiuObJJjktYiyreCZzL3rjA4zKtmBixPoT6R+F0=; b=MfBwlVo1w0IiUuuUMDRQfz/Uh2
	0F+DzHfCvvZ2ZTE2Hduaj2T762HZSqyap+sf/Ngcv+tfvM4V4ryy4KLa1fJv4yzv0YgH7XP1ooEUV
	DIJexplvrvZVrANIQ6mdS4LaouMtI5Inch42p1BRPEsFv44O68tWfJ7iKRl4mnEqzQM4AyZq4SgKc
	v+pHMttk2xdpzoF0tguK54NqDMKqHj8r6wr/6vH/q5z6Ay49xu+m6yaZEj0+PMPpOYAeAuKmIpNZ2
	XZpTO9m/P15Mgkc9GlPBKpX+EFYfRFTnCFrLR9McxPN6z6fiKCuOOay/DioIKrD/7DeqtMEJ50jEF
	8KWKvBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phodK-003I1I-0w;
	Thu, 30 Mar 2023 09:31:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phodH-003Hyo-1F;
	Thu, 30 Mar 2023 09:31:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso2983578wmo.1;
        Thu, 30 Mar 2023 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680168703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wlyXiuObJJjktYiyreCZzL3rjA4zKtmBixPoT6R+F0=;
        b=Y4OoQAhVGOqI+uv0pxKJRu4ZsIvPkStPkTUbv/2I6V3iDEot8HwhvO6dInlCxKYWBc
         bad03C5wA4wX8bLnfeOGwydUjNhDacl6qyErhJ2XmtoyJipMNSIuJ1eD0afSmtPlZgv4
         3VuwgNhG0xmkrhPVS/AXsIONapDnDoANbq/0JoqJeAPqulZOOfuZrfaZBgRa0YZ0KX0u
         61yL6jG5GqP/yUlIdvtrRqUjOZF0scdaKVObg3LqAyb5EKJ4mfh/IaXPNwt82a0C2uVA
         p1cSHvykOG99d3Br0z5fqhMb+1v5wFHN0KyfDnZosrZ35uNnKUJeCCd1mdcAp3mYgcH/
         YFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680168703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wlyXiuObJJjktYiyreCZzL3rjA4zKtmBixPoT6R+F0=;
        b=lky6pNplUMGRM2fFCngAkLq1qi6IaoAPOZxKi5GsFXw08tMMkrjbLsJ1a1JEIkjvyZ
         9dtobxzEvqb0I4W+2SH6XjaJlBgZ0CjZQLaDl8atqqMpUruCya+UqiuonljGni0yAOIH
         jGjrTyCT2Mf6FZWIHvs2P0Z9JKe9BcJV3QXVyIa2MJh0wtUTQsJACG5u6nBUe6tCOeSv
         9oIoJQ9r4rzDwfj8pDV+LIY1A7i6l+bFDqANJcBQ1s3fdVOAc5lLrZn3LrEZ+tiTihtz
         4Wkr1GOghjuWb21YxEobIyh4vIzAd4SU1MFN1gmIOSBA/PiTZNV2tRFfMdIW/cn2lPIn
         0drw==
X-Gm-Message-State: AO0yUKWd8euEQR2V+4bBY9eWtuRifjy2HhvZDKmHSXrtzuV7v3bQelr9
	8aw6m4cmamjZkWiGjsqxF1s=
X-Google-Smtp-Source: AK7set8MoRoP1u28J2KlqIRCUvbhxPNq5qX8D5y1gRGG9mTbXEF5Z82DXD5g1HsNB5h8AJgc4McNiQ==
X-Received: by 2002:a7b:ca4a:0:b0:3ea:e582:48dd with SMTP id m10-20020a7bca4a000000b003eae58248ddmr17293179wml.34.1680168703616;
        Thu, 30 Mar 2023 02:31:43 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bcb92000000b003ee58e8c971sm5107057wmi.14.2023.03.30.02.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 02:31:42 -0700 (PDT)
Message-ID: <5a1b22cb-4597-8137-e802-ca81ceb99c7c@gmail.com>
Date: Thu, 30 Mar 2023 11:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 3/3] soc: mediatek: mtk-svs: add thermal voltage
 compensation if needed
Content-Language: en-US
To: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>,
 "eballetbo@gmail.com" <eballetbo@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "drinkcat@google.com" <drinkcat@google.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?SmlhLXdlaSBDaGFuZyAo5by15L2z5YGJKQ==?=
 <Jia-wei.Chang@mediatek.com>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
 <fan.chen@mediatek.com>
References: <20230202124104.16504-1-roger.lu@mediatek.com>
 <20230202124104.16504-4-roger.lu@mediatek.com>
 <26837308-4837-f252-d162-f8af4859b63e@gmail.com>
 <fd62705e1abf8124706da6520fde5b77846bfd2c.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <fd62705e1abf8124706da6520fde5b77846bfd2c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_023147_425014_85AED3A5 
X-CRM114-Status: GOOD (  19.53  )
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



On 11/02/2023 12:12, Roger Lu (陸瑞傑) wrote:
> Hi Matthias Sir,
> 
> Sorry for the late reply.
> 
> ... [snip] ...
> 
>>> @@ -2127,6 +2123,7 @@ static struct svs_bank svs_mt8192_banks[] = {
>>>    		.type			= SVSB_LOW,
>>>    		.set_freq_pct		= svs_set_bank_freq_pct_v3,
>>>    		.get_volts		= svs_get_bank_volts_v3,
>>> +		.tzone_name		= "gpu1",
>>>    		.volt_flags		= SVSB_REMOVE_DVTFIXED_VOLT,
>>>    		.mode_support		= SVSB_MODE_INIT02,
>>>    		.opp_count		= MAX_OPP_ENTRIES,
>>> @@ -2144,6 +2141,10 @@ static struct svs_bank svs_mt8192_banks[] = {
>>>    		.core_sel		= 0x0fff0100,
>>>    		.int_st			= BIT(0),
>>>    		.ctl0			= 0x00540003,
>>> +		.tzone_htemp		= 85000,
>>> +		.tzone_htemp_voffset	= 0,
>>> +		.tzone_ltemp		= 25000,
>>> +		.tzone_ltemp_voffset	= 7,
>>
>> Which is the exact same tzone then in the other bank. Which brings me to a
>> good
>> point:
>> Is the tzone bank specific or the same for all banks?
> 
> Thermal zone (tzone) isn't for all SVS banks. In other words, tzone is specific
> for corresponding DVFS domain like SVS GPU tzone is for GPU DVFS domain. Let's
> take MT8183 SVS and MT8192 SVS as examples.
> 
> MT8192 SVS applies 2-line HW design (High/low 2 banks optimize the same DVFS
> domain). So, SVS GPU High/low bank uses the same GPU tzone.
> 
> MT8183 SVS applies 1-line HW design (1 bank optimizes 1 DVFS domain)
> Therefore, SVS CPU/GPU/CCI bank use different tzone because they are different
> DVFS domain.
> 
>> At least for mt8192 they are not. I suppose with this change to the code
>> mt8183
>> could take advantage of this on all it's banks as well.
>> In that case, can we
>> start to restructure the struct svs_bank to only have the tzone values
>> declared
>> once?
> 
> Since tzone isn't for all banks, we cannot declare it once for all IC supports
> from this point of view.
> 

Thanks for clarification, applied now.

>>
>> Background is that I'm very unhappy with the svs_bank data strucutre. It
>> seems
>> like a "throw it all in here". It should be structured for functional parts
>> of
>> the banks. Maybe using structs, maybe unions where possible. In any case
>> having
>> a flat struct of over 50 members isn't really what we want.
> 
> My apology. We'll structure svs_bank for functional parts of them.
> 
>>
>> Regards,
>> Matthias

