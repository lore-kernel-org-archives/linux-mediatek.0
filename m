Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93A4EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmJMNYWOyAMPkRNeRSlqkhWBpdpt6txL24H5u4lADL0=; b=hVLm5iYtSRXrh8Kt0chPJNomls
	5xGf+7g6kA6BKQNIj7mH8yievxWGs+7m8nuXTwitetVEKVlSagr0xrGpBN9ZtKM+h2hhvszrzaSkw
	HYkQnoxQNbtrlZTEZfS7Xmu5HbEgjeL7odjYtjxAF/aP81Sm/aaQ/fl6IMWdBcmeuEYF/6Vl2W2Yr
	OlC5xRS9z7sSGOusaglLvQWDbhQ+tuIK10WfDx+mwCz3s37cwq8NFdaMgVgUHAR5mQ19HAC3B44mt
	LvQ+kY3shrl943LWGOGOYXX+gsKzhLWwBgkmQpFUCUtfbX2aijnebM3D6DUWqG0ag90o9pF/fd1rL
	X0BTTpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOMS-001g0E-0H;
	Thu, 06 Jul 2023 12:45:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOMO-001fyg-2Z;
	Thu, 06 Jul 2023 12:45:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FEFB6606FDC;
	Thu,  6 Jul 2023 13:45:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688647520;
	bh=wWn6TJpPGJwpnJEW5eOYnGJj8SEgi8uRCntKKcZ2N54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=feAJ7w3kphSYGpfQQAUINeYeVSxE9Ngfvmhl9z/y7dfTFoy1768rrwezjNtkr3apO
	 O5uf9ofWRFJXIsZohnA/QqIfZ0qdZNdSHmdKTg2NqYflCnzvst2VG3lJchF9d5cQpw
	 jfe/cWyyPn+kA9H3l8pSY/Krta7xx4tyZYgIlWYv46ZqGpSSVBXjk8LknPV0F6Lfub
	 keCmq1z9CDF3vckMRKaJZoF0tApfmyYlAQKnt5nNyCFhrO83tJ1zFM4jLArLukt+mb
	 eJqn8yggvHs+uaNc0/ITUSwng2g/teb5HMY+Y+GR2UKnyUEbdPMVwRYC1GNnMu/vFK
	 E4kpJEhSsLscQ==
Message-ID: <152b6912-ce2f-5580-1e2a-550a6fd7e6ed@collabora.com>
Date: Thu, 6 Jul 2023 14:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] pwm: mtk_disp: fix disp_pwm coverity issue
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Shuijing Li <shuijing.li@mediatek.com>, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <20230706100454.28998-1-shuijing.li@mediatek.com>
 <55c3a448-e6c6-5e04-2cee-b2a18f0033e3@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <55c3a448-e6c6-5e04-2cee-b2a18f0033e3@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_054524_983596_C9D0C922 
X-CRM114-Status: GOOD (  21.18  )
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

Il 06/07/23 14:29, Alexandre Mergnat ha scritto:
> 
> 
> On 06/07/2023 12:04, Shuijing Li wrote:
>> There is a coverity issue in the original mtk_disp_pwm_get_state()
>> function. In function call DIV64_U64_ROUND_UP, division by expression
>> Which may be zero has undefined behavior.
>> Fix this accordingly.
>>
>> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>> ---
>>   drivers/pwm/pwm-mtk-disp.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
>> index 79e321e96f56..ca00058a6ef4 100644
>> --- a/drivers/pwm/pwm-mtk-disp.c
>> +++ b/drivers/pwm/pwm-mtk-disp.c
>> @@ -196,6 +196,14 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
>>           return err;
>>       }
>> +    rate = clk_get_rate(mdp->clk_main);
>> +    if (rate <= 0) {
>> +        dev_err(chip->dev, "Can't get rate: %pe\n", ERR_PTR(rate));
>> +        clk_disable_unprepare(mdp->clk_mm);
>> +        clk_disable_unprepare(mdp->clk_main);
>> +        return err;
>> +    }
>> +
>>       /*
>>        * Apply DISP_PWM_DEBUG settings to choose whether to enable or disable
>>        * registers double buffer and manual commit to working register before
>> @@ -206,7 +214,6 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
>>                        mdp->data->bls_debug_mask,
>>                        mdp->data->bls_debug_mask);
>> -    rate = clk_get_rate(mdp->clk_main);
>>       con0 = readl(mdp->base + mdp->data->con0);
>>       con1 = readl(mdp->base + mdp->data->con1);
>>       pwm_en = readl(mdp->base + DISP_PWM_EN);
> 
> IMHO, it should be done int the function `mtk_disp_pwm_apply` too.
> Do you agree ?
> 

I think that realistically this will never happen.

We're getting the clk_main clock's handle at probe time (or fail and get out),
then the PWM clock never has the CLK_GET_RATE_NOCACHE flag, as there wouldn't
be any reason to not cache the rates for this clock.
But even if we had the CLK_GET_RATE_NOCACHE flag, it wouldn't change much, as
our validation actually happens at probe time...

This means that our call to clk_get_rate is guaranteed to have a not NULL
pointer to this clock's `struct clk_core` and, unless the declaration of
this clock in the clock controller driver was wrong, for it, or for its
parent, the branch...

	if (!core->num_parents || core->parent)
		return core->rate;

...is always satisfied, so, in the end, this instance of clk_get_rate() can't
really return zero.
If you got such an issue, I suggest to check what the problem is, as it is
likely to be outside of this driver.


...that, besides the fact that the proposed code is incorrect, as clk_get_rate()
returns an `unsigned long`, so `rate` can never be less than zero, anyway.


Cheers,
Angelo

