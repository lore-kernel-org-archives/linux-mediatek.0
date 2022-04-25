Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D5FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OXkg3MIXbfmSQDoOdlFtXoum99zuICSNv85CBRCcxY=; b=QhkE6BzG86Irjz
	IxVv/s6iLHc39E0+hwIteWB1S2YutvWjwMxPs6HVGE/Rc7uIBvq4kNU53y9D4Dl6Z6bq2WmIhoOrG
	cujviGHuQgDVwisTPQHCJz3JnXK9AOU+nFT0Hm9Tku6dpSjqBWuLozdGdbXGTNK4y1u2OTO2+/lC/
	jQltn/q3JqUuinUCvOdjfCI0IoJ3YGX+5UXzTR9pG7koDzhOd6MzIcQZEA5gtDNUAnSAtQ93LkpQc
	cD7ZkyS2apR3lIDf/Z+O7XpiJmjBdzCbAuG3srAyJ/VDhCXief5Udw+U0GM5FwWY30KrxOqPloFbJ
	aieg3ISzBqke3aaE4FXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niwIX-009BXG-8X; Mon, 25 Apr 2022 10:50:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niwIL-009BSQ-Va; Mon, 25 Apr 2022 10:50:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w4so20179389wrg.12;
 Mon, 25 Apr 2022 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tqEMndNZi/OKNdfz1rG66xAmo29YAR2nDbIFZiYUSJA=;
 b=CHjRkfofF3zINo2vMexr7UwqWc3ZT7wy9/uXigv05NN49JlV6fSr9/pLePECJSd/Qo
 9A5QIKP9WHHvquE23IF6GjiIfBi9PUXca66j4fOruNceF/Qq5kBxplxq69Lza0l7D7p/
 Vzqrcv+FEmdhgclG+Rry6A1IWp4c+zHRm1ucGAdGXQ/t69oSnSCyVCcmA6av5EZkUaMf
 pHMqh1i6CBjIkQnRlFBqKDk/Sggj1GK0X/x5nGPSyOpr1t0MPvhiu1k4F/kUkEnT/Q75
 9J4FuuNAV0pk9+X4o+1vj6z/F0uIiZtdCvwHBy6uZfWYutKQL8Or7eg80I7zbPhj8hpq
 //FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tqEMndNZi/OKNdfz1rG66xAmo29YAR2nDbIFZiYUSJA=;
 b=2M/QRRPXnEaCY8mg1k92xVMntFuyMVZFwtK/pOhwo2G46oT7UC6D1KimBkb/0XLFrT
 QjYLnjuR1XERGD010c4PMoamfHUPS10HFy1xr+GyPnMPz6bSJM2U3RplTDjmP8dBtv03
 9ACad5Eb16NWstnvrFjR50qHFfMhfCGTSmbKaTL0xQra0CxLH48fM+55MegMRAhXyr5j
 q0sNc7KGAJliDYXqZU6PeU5hOB4j8Fh1ATYhXvuePNSzAIh6MDdal+FW4zi9DH7hpwTH
 7U91e060PXg/xA4g99DSYICbAggHAA1U86ansxeBZgsNeNBSnyfYPqZFO/cVcqZ5qPAC
 WgJA==
X-Gm-Message-State: AOAM532U+xtM2BzAfg3mEyFhWq5CSwOAWnO5XWCBWxzgqsMFz7YD8Rol
 hK7J9wMf0zL9SaHmGvXqR0g=
X-Google-Smtp-Source: ABdhPJytLP4Q67vqs3Kg8q3ChLI+iVz+M39ebWpml7bTG89AGDrCGsh10oITG3WA437PGB2/bYTmmQ==
X-Received: by 2002:a05:6000:1e0a:b0:20a:c33e:2834 with SMTP id
 bj10-20020a0560001e0a00b0020ac33e2834mr13993327wrb.552.1650883814687; 
 Mon, 25 Apr 2022 03:50:14 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 k23-20020adfb357000000b0020ad7c36332sm4350095wrd.110.2022.04.25.03.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 03:50:14 -0700 (PDT)
Message-ID: <7f472706-6e25-ee97-13eb-6022ced4bcfb@gmail.com>
Date: Mon, 25 Apr 2022 12:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/1] pwrap: mediatek: fix FSM timeout issue
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: srv_heupstream@mediatek.com, hui.liu@mediatek.com,
 tinghan.shen@mediatek.com, hsin-hsiung.wang@mediatek.com,
 sean.wang@mediatek.com, macpaul.lin@mediatek.com, wen.su@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220424025738.32271-1-zhiyong.tao@mediatek.com>
 <20220424025738.32271-2-zhiyong.tao@mediatek.com>
 <862706781d408669cd80e7e041d96a878178283c.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <862706781d408669cd80e7e041d96a878178283c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_035018_067837_44EFB81B 
X-CRM114-Status: GOOD (  21.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/04/2022 04:05, Rex-BC Chen wrote:
> On Sun, 2022-04-24 at 10:57 +0800, Zhiyong Tao wrote:
>> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
>>
>> Fix pwrap FSM timeout issue which leads the system crash on GFX VSRAM
>> power on.
>> Add a usleep delay to avoid busy read for the H/W status.
>> For avoiding the system behavior(ex. disable interrupt in
>> suspend/resume
>> flow, schedule block task)cause if (time_after()) be turn first,
>> we change it after sleep delay.

I'm not sure what you mean with this sentence. But it sound's like we want to 
paper about some issue. Can you please explain better?

Thanks,
Matthias

>> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
>> MT8173 SoCs")
>>
>> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
>> ---
> 
> Hello Zhiyong,
> 
> IMO, commit messages should be
> 
> Fix pwrap FSM timeout issue....
> ...we change it after sleep delay.
> 
> (=> one blank)
> Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
> MT8173 SoCs")
> (=> oneline)
> 
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> 
>>   drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index 952bc554f443..ac7139a67e87 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   #include <linux/reset.h>
>> +#include <linux/delay.h>
> 
> Sorry, I do not notice this in previous version. It will proper order
> the header in alphabet.
> 
>   #include <linux/delay.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/reset.h>
> 
> BRs,
> Rex
>>   
>>   #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
>>   #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
>> @@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct
>> pmic_wrapper *wrp,
>>   	timeout = jiffies + usecs_to_jiffies(10000);
>>   
>>   	do {
>> -		if (time_after(jiffies, timeout))
>> -			return fp(wrp) ? 0 : -ETIMEDOUT;
>>   		if (fp(wrp))
>>   			return 0;
>> +
>> +		usleep_range(10, 11);
>> +
>> +		if (time_after(jiffies, timeout))
>> +			return fp(wrp) ? 0 : -ETIMEDOUT;
>>   	} while (1);
>>   }
>>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
