Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBB5C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHmh3jIgu3gJ5X5XJyol2T2r9Uf09jmGOhMtS3FzeP4=; b=XIL0RGy3AS6IWkYkmto2e5Dptg
	4ZJ5DP13QEqws7mZkaNteQ5Qp90CGy/hyT+slJU5EaBif/101XHUvX8UL1ccAbdhbrGM26VW+vCkZ
	4Qthqfv0igVAaf7FM6v+k7wbrgr3/8rPBfvwle75uc4lcmbdzkO17FJfpZKKmEoZZLI/SWGrSNF6l
	n4PUBTgdbiVMl3fzW6YxK4WlakLgfH/ZxE+8V1o5JMKR3/vQcVv7HcGTfmEOTnXzvjXzCYVqko2sU
	bN5BraYHBHrLHnZHgoG52+V1aUp8Ou5SJWcIcqnjZT/t2LIYCQJZyvUCI+sgFIbWU06Tsi899wwro
	SQFPvWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4vN-00Bhrt-3d; Thu, 26 Jan 2023 16:16:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4v9-00Bhnv-Bt; Thu, 26 Jan 2023 16:16:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CFAC6602E7A;
	Thu, 26 Jan 2023 16:16:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674749773;
	bh=V0gLbpx5AMKGj7vJSigmDaOo8Wzyv86wPBOn8FimbE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q77sY0Tis2lsA5SbxnzsuZmN0xkug9r4USlDwoFZ5VBJDNVFhw5Ny0tsUW+wnByOx
	 tbn5ToaTzOJjZrl2M087Zz8I2m+Z4DImVkC3sKjb8EQuWskUySmLVMs6IYAsQqfRB4
	 APYWxGqowLryBr6RCJ6sDyJL8IltywJJOXVldYzOEjAKzVV9QsMf9MgN1MPyuOyDmu
	 yHsOVE2ZSIN9CW2i8I//G1SXMqfcYs0oC+AR3j+vwJ5/5dNpYlD7OlUI3xcrWgW6vF
	 2hMMxCZI4NE5DjVW31C8ZByEBt6zQIpAU3IBQSjaj/CYC4S2Uglg3GR1RxVfLX+pzk
	 JODVKxntoMbjg==
Message-ID: <e9fc3199-234e-911e-fff8-734225c3f346@collabora.com>
Date: Thu, 26 Jan 2023 17:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] pwm: mtk-disp: Configure double buffering before
 reading in .get_state()
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, weiqing.kong@mediatek.com, jitao.shi@mediatek.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20230123160615.375969-1-angelogioacchino.delregno@collabora.com>
 <20230123160615.375969-3-angelogioacchino.delregno@collabora.com>
 <20230126151914.rhwhioz6yyhaq3z2@notapiano>
 <aa17fa46-0f16-2102-1bd3-6d76cee90ee1@collabora.com>
 <20230126160927.4hgifpmybvsgshro@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230126160927.4hgifpmybvsgshro@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_081615_694706_90020E86 
X-CRM114-Status: GOOD (  29.20  )
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

Il 26/01/23 17:09, Nícolas F. R. A. Prado ha scritto:
> On Thu, Jan 26, 2023 at 04:24:29PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 26/01/23 16:19, Nícolas F. R. A. Prado ha scritto:
>>> On Mon, Jan 23, 2023 at 05:06:15PM +0100, AngeloGioacchino Del Regno wrote:
>>>> The DISP_PWM controller's default behavior is to always use register
>>>> double buffering: all reads/writes are then performed on shadow
>>>> registers instead of working registers and this becomes an issue
>>>> in case our chosen configuration in Linux is different from the
>>>> default (or from the one that was pre-applied by the bootloader).
>>>>
>>>> An example of broken behavior is when the controller is configured
>>>> to use shadow registers, but this driver wants to configure it
>>>> otherwise: what happens is that the .get_state() callback is called
>>>> right after registering the pwmchip and checks whether the PWM is
>>>> enabled by reading the DISP_PWM_EN register;
>>>> At this point, if shadow registers are enabled but their content
>>>> was not committed before booting Linux, we are *not* reading the
>>>> current PWM enablement status, leading to the kernel knowing that
>>>> the hardware is actually enabled when, in reality, it's not.
>>>>
>>>> The aforementioned issue emerged since this driver was fixed with
>>>> commit 0b5ef3429d8f ("pwm: mtk-disp: Fix the parameters calculated
>>>> by the enabled flag of disp_pwm") making it to read the enablement
>>>> status from the right register.
>>>>
>>>> Configure the controller in the .get_state() callback to avoid
>>>> this desync issue and get the backlight properly working again.
>>>>
>>>> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/pwm/pwm-mtk-disp.c | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
>>>> index 82b430d881a2..fe9593f968ee 100644
>>>> --- a/drivers/pwm/pwm-mtk-disp.c
>>>> +++ b/drivers/pwm/pwm-mtk-disp.c
>>>> @@ -196,6 +196,16 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
>>>>    		return err;
>>>>    	}
>>>> +	/*
>>>> +	 * Apply DISP_PWM_DEBUG settings to choose whether to enable or disable
>>>> +	 * registers double buffer and manual commit to working register before
>>>> +	 * performing any read/write operation
>>>> +	 */
>>>> +	if (mdp->data->bls_debug)
>>>
>>> I feel like this condition should be the same as in the apply() callback, since
>>> they're doing the same write operation, so also have '&& !has_commit'.
>>>
>>
>> The bls_debug register is used to both enable and/or disable various features,
>> including the one that I'm targeting in this commit, which is disabling shadow
>> registers.
>>
>> As I explained in the commit message, we don't want to - and cannot - assume that
>> the bootloader doesn't *reset* the backlight controller before booting Linux: a
>> reset would re-enable the shadow registers, and this function being called as
>> first to check the backlight EN status may fail to do so.
>>
>> This is as well true in the opposite situation where, in the future, we may want
>> to set shadow registers ON, while the bootloader sets them OFF before booting:
>> adding a (x && !has_commit) check in this branch would defeat that purpose and
>> make this commit... well.. partially broken! :-)
> 
> Makes sense, but in that case shouldn't we drop the (&& !has_commit) in the
> check of the previous commit too? I get that in the pwm's core current logic,

No. The previous commit checks !has_commit to select a register write strategy
between "shadow -> commit" and "working registers - no commit necessary".

If you drop that check from the previous commit, how can you choose the write
strategy to use?! :-)

You can't rely on reading the bls_debug register, either, because it may be
holding different values compared to what we want due to, for example, a reset
and you can't rely on checking bls_debug_mask because in the future this kind
of selector may be residing in an entirely different register.

> get_state() is run before apply(), but given that we also write the debug
> register in apply(), we're not relying on that. So as it currently stands, if in
> the future the bootloader sets shadow registers OFF, and we want to set them ON,
> and we call apply() before having called get_state(), we'd be back to the broken
> behavior.

No, because the default BLS_DEBUG register value at IP reset is 0 - where 0 means
"do not disable commit, do not disable shadow register read, do not disable shadow
register write" :-)

Cheers,
Angelo

> 
> Thanks,
> Nícolas
> 
>>
>> Cheers!
>> Angelo
>>
>>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> On MT8192 Asurada Spherion.
>>>
>>> Thanks,
>>> Nícolas
>>>
>>>> +		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
>>>> +					 mdp->data->bls_debug_mask,
>>>> +					 mdp->data->bls_debug_mask);
>>>> +
>>>>    	rate = clk_get_rate(mdp->clk_main);
>>>>    	con0 = readl(mdp->base + mdp->data->con0);
>>>>    	con1 = readl(mdp->base + mdp->data->con1);
>>>> -- 
>>>> 2.39.0
>>>>
>>>>
>>
>>



