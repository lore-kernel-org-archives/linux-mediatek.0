Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D59C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oavyZzfsV6FJISm/QcD5fOkSoIYhzQxAZsTQbEuse4=; b=XnmLT5CyLCUKT73yRItypm18o9
	wr0S0yCkEkemFQVudioRK2MuoKYYOK+1qu4bmbG1YKeh96IIzjcnD5ULpc0vzmgTrOjTFIrTEY1RM
	Ffs0v61gie6yeFpuI768SncvsRo78Rwxn/hHEsv0nWeD8t+BHHrS58AvdFK5Jnnn4AkjbO3tYkCGV
	h0MM7aRVKgiL6T4nzMdKm+Ps5a0717TEAFKTlnOqMFrdowLHEusNl/PlCEDG961e4TsemrwfWHnre
	W/e8tH0tuQPdqcLLXC2+8B3RXnqDOnpyH+Wf5k8TYrxBEvzskRNVHa9lxdjVRSARxNG/qvRsNCc/j
	mO6RZ7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESm9-00000002CNo-3sOM;
	Tue, 04 Jun 2024 11:56:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESm6-00000002CLi-08Af;
	Tue, 04 Jun 2024 11:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717502178;
	bh=wgiLKeETLd0enQWH2R7xL/1nILeAJ3O6Rgd7nuj4+BI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ULsmnPiSoYyXJ+dreCG1S9Uh9XC6wgkriFKuneivrqZm1oO4OK/FQOV9mT9D8AlZQ
	 Hl+LPPCtXnfR00e9arEtjkzOPWIcR6eebL2BdcRcoJxx7xlPO5aFPz95XkkGxNt1Dc
	 bPYpUWsZpAo01MVitiME5195vCXALwi1bmO5y8x9jd/AiCPEU79ZXWB+OoSTc/GyZ8
	 z8PQGxMXu1gu2xPko+0XUERgsGQqaezi5dDjf+5d6H3W9PY4dGr7mvCg7XX+bymO9r
	 XgWiiTsH99lSbljAqt1VU62klL3FuUhABsilJ8kNRYKZcrtwv24T3aIlu38yCN8Gcu
	 tDw4mg6ZgT1MQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9FE1B3782199;
	Tue,  4 Jun 2024 11:56:16 +0000 (UTC)
Message-ID: <3e741571-9086-4f26-a158-d86a4cdcc349@collabora.com>
Date: Tue, 4 Jun 2024 13:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
 <CAHp75Vexddt1xUGogRDZA9pM1pFp2=ZtCQnCfXePahSCb+oKpg@mail.gmail.com>
 <84f1c58c-0a5d-4131-a16b-b76bf28862ee@collabora.com>
 <CAHp75VcwnjrsAY1qF68MpBWV-NLFSxTP_PDL+ER==KNdBAFFTA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAHp75VcwnjrsAY1qF68MpBWV-NLFSxTP_PDL+ER==KNdBAFFTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_045622_404944_0106C21C 
X-CRM114-Status: GOOD (  26.42  )
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

Il 04/06/24 13:05, Andy Shevchenko ha scritto:
> On Tue, Jun 4, 2024 at 1:38 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 30/05/24 15:34, Andy Shevchenko ha scritto:
>>> On Thu, May 30, 2024 at 12:34 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
> 
> ...
> 
>>>> +#define PMIC_RG_RESET_VAL              (BIT(0) | BIT(3))
>>>
>>> In this form it requires a comment explaining each mentioned bit.
>>
>> I don't have an explanation for this, I know it's two different bits from some
>> reveng, but the downstream driver declares that simply as 0x9.
>>
>> Should I just "mask" this as 0x9 instead?
> 
> In this case for all of the questionable forms, please add a oneline
> comment suggesting that "these are different bits without known
> purpose of each." or something like that.
> 

Perfect. Comment added.

> ...
> 
>>>> +#define MT6358_IMP0_CLEAR              (BIT(14) | BIT(7))
>>>
>>> As per above.
>>>
>>
>> Same, I don't have any explanation for that.
>>
>> If you prefer, I can define this as 0x4080, but honestly I prefer keeping
>> it as-is since I am sure it's not a magic number but really two bits to flip
>> in a register.
> 
> As per above.
> 
> ...
> 
>>>> +       u8 r_numerator;
>>>> +       u8 r_denominator;
>>>
>>> Can you add struct u8_fract to the math.h and use it? I will Ack/R the
>>> respective patch.
>>
>> Yeah, I did that exactly because u8_fract wasn't there and I didn't want
>> to waste more bits, but since you just asked for it... well, I'm happier :-)
> 
> Note, it's enough to have my Rb tag and route that change via IIO
> tree. We have done similar way for other changes in math.h (or aline)
> in the past.
> 

Sure.

> ...
> 
>>>> +       /* Assert ADC reset */
>>>> +       regmap_set_bits(regmap, pdata->regs[PMIC_HK_TOP_RST_CON0], PMIC_RG_RESET_VAL);
>>>
>>> No required delay in between?
>>
>> No, as strange as it may look, there is no delay required in between: this is
>> because the register R/W is behind the PMIC Wrapper as much as all of the other
>> MediaTek PMIC (sub)devices, so, missing delays was intentional here, yes.
> 
> Maybe a comment?
> 

Done :-)

/* De-assert ADC reset. No wait required, as pwrap takes care of that for us. */

> ...
> 
>>>> +       mutex_lock(&adc_dev->lock);
>>>
>>> Why not use cleanup.h?
>>
>> I want to unlock the mutex immediately right after executing read_imp() or
>> mt6359_auxadc_read_adc(), and I don't want the reset to be done while a mutex
>> is being held, as that makes no sense for this driver.
> 
> That's why we have scoped_guard(). Exactly for such cases.
> 

Thanks for the hint, looking at other usages that was straightforward.

>> Besides, I find the macros in cleanup.h to be cryptic - in my opinion, they
>> require better documentation as, for example, I don't understand when the
>> guard(mutex)(my_mutex) is supposed to acquire the lock and when it's supposed
>> to release it.
> 
> They are cryptic due to limitations in C language. But for the end
> user it doesn't matter. The behaviour is well understandable and makes
> code cleaner and less prone for errors such as missing unlocks. So,
> please use cleanup.h.
> 

Indeed, but my point was that the documentation can (and probably should)
be improved.


Cheers,
Angelo

