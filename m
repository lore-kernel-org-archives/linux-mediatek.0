Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B569AC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:54:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 646D221D7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rjrgYWrC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYOrQc3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 646D221D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OrSYihYXr+vLtaS4Q37zdiY5j0+YCdvA6J+s3L3mLn8=; b=rjrgYWrCX54/C6lk7Nkyah5Sx
	cYeL+OK8+1lzxGeHfx/iuDNf9deiMnXDbgfItEiT7Tmfz+zKEdzJokK0ewEN0tBJHgvEKJKGYwx6G
	7dBQ5x4qtlfCVFAvGfJiuT+5Z16RaGBYhdq5YCJVakq+ozOxi3oFOfoIDpeKuFFptknB5iFDXcYmG
	tepojQsw3pXmsdw7/g1AOdPtwQQIY0rAlqzEY7MkjMAOkoOGFEoQarrKdoAY3H7oFfzDBapEudvrc
	z7EvorrLAi2utaDcW6Vpx/nie84qwDUvu+dBU2MKEgi2Y9VwrcEYeqHNa07JYR8z3rsR0BWfzhPtg
	uYs24Y+cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFwoR-0003R8-51; Wed, 09 Sep 2020 09:54:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFwoM-0003Pi-S1; Wed, 09 Sep 2020 09:54:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id o5so2190748wrn.13;
 Wed, 09 Sep 2020 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5YhVcwcb6Wgk1PCPZ8YCcZaGe5dXRg4SVb0CRjkFkgA=;
 b=nYOrQc3JozoKIR8lxuzT8bln2t+PdtuqzCCkyIdk/xjOMRc22tyJ1oUMUFGmeRPRix
 bCcR8TZBiiS4I0vJL4e3Bb1sDzBVEqafFMcW07KmUO2q8lwF3mJIqioT9pUzeURPWRkA
 bUAwKSbPfWtvAgG2jjldOHWh4Xrbbqxc3PTeZInVIBc2s8saMlxnsRGAm9Ir9V2PqSFO
 LXqZEBAs+6Fe0l48PKFQJcPlDn2pw+/hpa4xkC+jMGY6f4e6otRRS4RWA7mVULKmBuZT
 NefxPlUrmQOpwEGpS/qAq1ER4n614vXZRgS6K8oZV8O/b+aSyDk0ptRNp5ft76/4yF1I
 iMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YhVcwcb6Wgk1PCPZ8YCcZaGe5dXRg4SVb0CRjkFkgA=;
 b=KS1OqhopIX2KpEgiQVRHcRHkiLChvUZhz9Ahrj0C2QIHcQRguwLjBmD8CIEvkjK4QB
 UifE6hVkNE2aNNUBHQ+3DOen7aWXzbAo8W/1uj0KrKoXA0sfSiV2h4cqh5xhYKynAGtB
 2Tnk+3HZFi8bO3qLGQ81Fo24O4WtZTUz8cgV5UtFxjE+u7B69lhM9Uwx5p8V886fgiCI
 LYhrDzjWCAxFGb4UOkKtPkqsEnp5mqQCREm4HGmVWkg+HI6C5yhjYDtao7XzHBZjBYZm
 AosB7hBlaYRpUtAli9AMQmZQkkvT99YkBsFgZTTiFyoRQP4FflnwilWZ1LhuMceJJZ7V
 bzdQ==
X-Gm-Message-State: AOAM530wiQXg5MDRFPdcFFHeJEVjXTefL8ZTHbh58eQWKD0g9mHFXNsP
 RvJNhatCXDXutjqd9HZVMLjuou/GF7s=
X-Google-Smtp-Source: ABdhPJxv4K21NSQFaosgqbX77J5T+sjyZ/mqOq2NHXzwzUy5eaLztRepGwchvzhm/AWWCaZCdLX0Jg==
X-Received: by 2002:a5d:6343:: with SMTP id b3mr3178210wrw.179.1599645281761; 
 Wed, 09 Sep 2020 02:54:41 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id u66sm3116098wmg.44.2020.09.09.02.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 02:54:41 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8173-elm: fix supported values for
 regulator-allowed-modes of da9211
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org
References: <20200903142819.24487-1-dafna.hirschfeld@collabora.com>
 <5d504bea-0934-91a9-c052-e463ad6c6d95@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6b281668-3316-6b81-47b2-d17cc6348449@gmail.com>
Date: Wed, 9 Sep 2020 11:54:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5d504bea-0934-91a9-c052-e463ad6c6d95@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_055442_927180_E90F7C55 
X-CRM114-Status: GOOD (  20.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: dafna3@gmail.com, kernel@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 04/09/2020 10:02, Enric Balletbo i Serra wrote:
> Hi Dafna,
> 
> Thank you to work on this.
> 
> On 3/9/20 16:28, Dafna Hirschfeld wrote:
>> According to the datasheet the allowed modes for the da9211
>> regulator are sync and auto mode. This should be changed in the
>> devicetree. This also fix an error message
>> 'BUCKA: invalid regulator-allowed-modes element 0'
>> since value 0 is invalid.
>>
>> Fixes: 689b937beddeb ("arm64: dts: mediatek: add mt8173 elm and hana board")
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> Double checked the regulator supported modes and I can confirm that this patch
> gets rid of the error message, so:
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 

Applied to v5.9-next/dts64

Thanks!

>> ---
>>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
>> index 1fe5dac24ba1..1a51879d5c6f 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
>> @@ -5,6 +5,7 @@
>>   
>>   #include <dt-bindings/input/input.h>
>>   #include <dt-bindings/input/linux-event-codes.h>
>> +#include <dt-bindings/regulator/dlg,da9211-regulator.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include "mt8173.dtsi"
>>   
>> @@ -293,7 +294,8 @@
>>   				regulator-max-microamp  = <4400000>;
>>   				regulator-ramp-delay = <10000>;
>>   				regulator-always-on;
>> -				regulator-allowed-modes = <0 1>;
>> +				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
>> +							   DA9211_BUCK_MODE_AUTO>;
>>   			};
>>   
>>   			da9211_vgpu_reg: BUCKB {
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
