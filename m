Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4139AC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AJ9uYi5FBdY0F56jf82JNJUqTiUucvjpT0DBXjyIwk=; b=U0QK6qJ9D1SxtV/ltm8xYRA1Cw
	GpT2jTLT58pEj/6aRTDStkxmGC7BfiEHBhd+4+M9FBclUp+ugLIGnTQH+4MlqjXM83fTLYsPb7rem
	xLJiAXgecF8iwchct3BuYC3XssT7qgDALav1ItvIgmMTIpInvT4LxsKZl2z4IElUXDIWE4y7Sdub/
	0HESMyGRWt13gtofbMFwKLCUgPsEJoo29gIteKvg/amgwCR3LzG6IH34ct1AZSJgaP9Brtk07Yx3I
	4/o9FOHwHlaalcTzhHzdqnfC9z9h9ZYr4VCQoloWTretPXlqSOeF+/JdNW9O5f3GM0rRvFwXHDN4w
	Meubg9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL43Q-00BTB4-K8; Thu, 26 Jan 2023 15:20:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL42x-00BSy1-Rj; Thu, 26 Jan 2023 15:20:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A20E16602E71;
	Thu, 26 Jan 2023 15:20:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674746414;
	bh=OywIBlYA1AVg3BlrPI6L6pWZL4oBO4rPFqy2frGycWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KiXMxmmruai7/eenLApiVXIE+CXu0LMn3aKg4yB2g1ygPM/ZWlO4q4SFJnGsJUXSH
	 Br7as0ozqq6NM6O4FvJIHj6YxpUHfBXXvEe4+EDd+xiCB5rGmJ9FpdK1E+t6TuWeyH
	 LhMgFsTHP+sSAQfcQL844PnHHxZyI5r8fZD0PH2dDbIji0mpDI0n91T0jBuIIkK4sr
	 +RNobIRQ/Ts5GWsJb1L8LcKdI0AcWxaAN04klcOhOaCc9l5i5CJCmRaB1oj6gH3EjG
	 tvDT26nwSSCi7J8iYWzKz5YuO4h/W4xrO5HuVg0hVMvZ0guUdyWezdA865oDOzJsLk
	 oAGUoNH4GRkgQ==
Message-ID: <231dc0a2-c900-1c71-49e2-d9fe55bc8af1@collabora.com>
Date: Thu, 26 Jan 2023 16:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] pwm: mtk-disp: Disable shadow registers before
 setting backlight values
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, weiqing.kong@mediatek.com, jitao.shi@mediatek.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <20230123160615.375969-2-angelogioacchino.delregno@collabora.com>
 <20230126150203.dnsbw2l2fzyg3oi5@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230126150203.dnsbw2l2fzyg3oi5@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_072016_072257_CD1E1776 
X-CRM114-Status: GOOD (  22.38  )
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

Il 26/01/23 16:06, Nícolas F. R. A. Prado ha scritto:
> On Mon, Jan 23, 2023 at 05:06:14PM +0100, AngeloGioacchino Del Regno wrote:
>> If shadow registers usage is not desired, disable that before performing
>> any write to CON0/1 registers in the .apply() callback, otherwise we may
>> lose clkdiv or period/width updates.
>>
>> Fixes: cd4b45ac449a ("pwm: Add MediaTek MT2701 display PWM driver support")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/pwm/pwm-mtk-disp.c | 24 +++++++++++++-----------
>>   1 file changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
>> index 692a06121b28..82b430d881a2 100644
>> --- a/drivers/pwm/pwm-mtk-disp.c
>> +++ b/drivers/pwm/pwm-mtk-disp.c
>> @@ -138,6 +138,19 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>>   	high_width = mul_u64_u64_div_u64(state->duty_cycle, rate, div);
>>   	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
>>   
>> +	if (mdp->data->bls_debug && !mdp->data->has_commit) {
>> +		/*
>> +		 * For MT2701, disable double buffer before writing register
> 
> Not necessarily part of this series, but I guess it would make sense to remove
> the "For MT2701". It's no longer exclusive to that SoC and the condition in the
> if above makes it clear when this happens.

Thanks for the review and test!

Anyway, for that "For MT2701", well, it ... should actually be exclusive to that
SoC (and some others) because, in reality, MT8183, MT8186, MT8192, MT8195 and
also almost all MediaTek smartphone SoCs do have shadow registers which we should
use for the backlight.

The bls_debug writes that we do are to disable writing to shadow registers and
performing commits because this driver does not (yet) support mtk_mutex handling.

The right thing to do here would be to grab a mtk_mutex, lock it, write shadow
registers, perform "backlighting adjustment magic" in mediatek_drm, commit, unlock.

Now, the "backlighting adjustment magic" is something that we do not support (yet?)
in mediatek_drm, and it's also not really easy to implement: part of that magic
needs RGB ALS readings and implementation of some more IP, which serves the purpose
of, for example, adjusting the backlight PWM while taking account of some GAMMA
adjustments to enhance readability of the screen in direct sunlight, or to decrease
(slightly) power consumption of a display lit at night.

So... the current way that we're using right now (which is disabling the shadow
registers and performing direct writes to working registers to atomically set the
backlight) is something that *should* disappear in *a* future in which that "magic"
gets somehow properly implemented.

This 9k lines mail, just to say that "For MT2701" is technically exclusive to that
SoC, between the number of supported SoCs of this driver :-P

Cheers!
Andlo

> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> On MT8192 Asurada Spherion.
> 
> Thanks,
> Nícolas
> 


