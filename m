Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D439EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 14:52:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4978820738
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 14:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r8uGbna3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlsT+ygO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4978820738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pnv7osxK9+GA7NvA4TDmhJmtUrPZoAClcVh2glM735c=; b=r8uGbna3dImM58iLPk0RwTs8k
	tTFN8F5KpAVjyzybJSZc5U10J46F9EbDgBl86p1RTXjgwuxhSdHvYxVdWUr9D9icorgAG2pv8Z9BK
	HrKGu+So9kUwls7HQrjkcZt3DhpiLP3lGunllYKbiq6YP4rA3for75JsEvqU5c9hl2st0ODxOSseg
	FhumYrLLKgbaDhDdrEDto1Bb/C3K4rLhHLkZa5YropmiKSgMF8i9Dg5Qx8yRjMlF/u+Xqt7J85g60
	g3XG8JK8U8N+K48ns/YETyRIcEL2X9MfXy0DMSBDQ//SdLS+JXF/WPJr0cIkUqzpwQc1b6RAq9/P1
	OUIEPXmCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY9HZ-0002cx-PA; Thu, 29 Oct 2020 14:52:05 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY9HX-0002cO-Ii; Thu, 29 Oct 2020 14:52:04 +0000
Received: by mail-wm1-x343.google.com with SMTP id k18so117193wmj.5;
 Thu, 29 Oct 2020 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AFFmqs9Jzg2CBvGq0/RAb9bueZj0QRM93cJN24vLo/g=;
 b=mlsT+ygOuRPeLbbg2/X3s0BssdBWUrtOU5Z5tMSj9B398yqQ4PztYfVs0HGQ+Cms+H
 Eh1p5UGg1mgW9dAeOQCBw9pdm92eVwJ0fTjUcoovc8r3aPouGlr6OuB5frC3bfg5mecV
 Tn1OqPn0nrqtEP2C10WfInAaNFspCnaUhDRw3Dw4IgOtAsb91KiRknOfMgW9w8z7I4bZ
 xG1UJ5GibCIDhqGDXPTjd4pXKeRqcKK7gLhHuBh97Tm699zU4tRIAELTZtCRjLI/Vdnz
 27wFxFHpOGdRIizXgu7lRAuhbZogWEXqkKUKZQ3Gijok04lY86YYVlROm9s5yaP8XM4y
 hA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AFFmqs9Jzg2CBvGq0/RAb9bueZj0QRM93cJN24vLo/g=;
 b=NKPX5VUW5uVTzCmh+Wk9+xXPg02TvaIbW9sOSdnsdKjcfrrNIJ/HYmeBF/6/trP2ef
 qgkrar3Q6dphcjzGb07lsKlempJHv+og7DRw3lRcGxSmlR9SyLddQD9r6o4x0U3JqTMx
 Bu7pAxpzn/gtJpQoM7pCepU2hTvQ9rVxECPHMYndFNWzNHZHsMX71o313TyQUNW53U7p
 i5dj1ZZjOuuRJp6wzdglIb/KvLG7/JKw63k6ab/KkLnq3zpVeIYiJwEPywWbHfZcct8q
 Jn5dB11pOXe68tAv64UJJFUY8ibsfRUoTOfudLsfW9acsC/5/JFVVu4df5azH7X1RMFt
 EnSg==
X-Gm-Message-State: AOAM5323YBw/G1IBfft3R/0wd4HDDzCvUgJ4bj9zSsvp4v+9GX9aW6ky
 mDjBQou9fdid9dtZ3BSW9xY5TTjN/dFBVA==
X-Google-Smtp-Source: ABdhPJyRmXDMMlqLf2r5d2iixnFqEChax1O6Zs+WOLgjm/1pylu/Ki+RiI0wEZOrsLCDOkPS1LGkcw==
X-Received: by 2002:a1c:e006:: with SMTP id x6mr173380wmg.107.1603983122020;
 Thu, 29 Oct 2020 07:52:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id x64sm140151wmg.33.2020.10.29.07.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 07:52:01 -0700 (PDT)
Subject: Re: [PATCH v3 15/16] soc: mediatek: pm-domains: Add default power off
 flag
To: Weiyi Lu <weiyi.lu@mediatek.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-16-enric.balletbo@collabora.com>
 <05be2a94-d6e6-36e5-2c14-6d971e4a7677@gmail.com>
 <1603797517.25228.3.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <83197162-6bfc-b861-653e-4fd21035b5ae@gmail.com>
Date: Thu, 29 Oct 2020 15:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1603797517.25228.3.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_105203_671506_49E98827 
X-CRM114-Status: GOOD (  23.37  )
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/10/2020 12:18, Weiyi Lu wrote:
> On Tue, 2020-10-27 at 11:53 +0100, Matthias Brugger wrote:
>>
>> On 26/10/2020 18:55, Enric Balletbo i Serra wrote:
>>> From: Weiyi Lu <weiyi.lu@mediatek.com>
>>>
>>> For some power domain, like conn on MT8192, it should be default OFF.
>>> Because the power on/off control relies the function of connectivity chip
>>> and its firmware. And if project choose other chip vendor solution,
>>> those necessary connectivity functions will not provided.
>>>
>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> ---
>>>
>>> Changes in v3: None
>>> Changes in v2: None
>>>
>>>    drivers/soc/mediatek/mtk-pm-domains.c | 23 +++++++++++++++++------
>>>    drivers/soc/mediatek/mtk-pm-domains.h |  1 +
>>>    2 files changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
>>> index 63993076a544..fe0e955076a0 100644
>>> --- a/drivers/soc/mediatek/mtk-pm-domains.c
>>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
>>> @@ -378,10 +378,16 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>>>    	 * software.  The unused domains will be switched off during
>>>    	 * late_init time.
>>>    	 */
>>> -	ret = scpsys_power_on(&pd->genpd);
>>> -	if (ret < 0) {
>>> -		dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
>>> -		goto err_unprepare_clocks;
>>> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
>>> +		if (scpsys_domain_is_on(pd))
>>> +			dev_warn(scpsys->dev,
>>> +				 "%pOF: A default off power domain has been ON\n", node);
>>> +	} else {
>>> +		ret = scpsys_power_on(&pd->genpd);
>>> +		if (ret < 0) {
>>> +			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
>>> +			goto err_unprepare_clocks;
>>> +		}
>>>    	}
>>>    
>>>    	if (scpsys->domains[id]) {
>>> @@ -395,7 +401,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>>>    	pd->genpd.power_off = scpsys_power_off;
>>>    	pd->genpd.power_on = scpsys_power_on;
>>>    
>>> -	pm_genpd_init(&pd->genpd, NULL, false);
>>> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
>>> +		pm_genpd_init(&pd->genpd, NULL, true);
>>> +	else
>>> +		pm_genpd_init(&pd->genpd, NULL, false);
>>> +
>>>    	scpsys->domains[id] = &pd->genpd;
>>>    
>>>    	return scpsys->pd_data.domains[id];
>>> @@ -478,7 +488,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>>>    			"failed to remove domain '%s' : %d - state may be inconsistent\n",
>>>    			pd->genpd.name, ret);
>>>    
>>> -	scpsys_power_off(&pd->genpd);
>>> +	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
>>> +		scpsys_power_off(&pd->genpd);
>>
>> OK, so you merged Weiyi's patches in this series :)
>>
>> So same comment here: Does it really hurt if we turn-off a already turned-off
>> power domain? Or can we get rid of this check?
>>
> 
> We do need this check here. If you try to turn-off this power domain,
> you might make the clock or regulator reference count unbalanced.
> 

Correct. Could we check via scpsys_domain_is_on() instead? I'd like to avoid 
MTK_SCPD_KEEP_DEFAULT_OFF use here.

Regards,
Matthias

>> Regards,
>> Matthias
>>
>>>    
>>>    	clk_bulk_unprepare(pd->num_clks, pd->clks);
>>>    	clk_bulk_put(pd->num_clks, pd->clks);
>>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
>>> index 2ad213be84a5..0fa6a938b40c 100644
>>> --- a/drivers/soc/mediatek/mtk-pm-domains.h
>>> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
>>> @@ -6,6 +6,7 @@
>>>    #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
>>>    #define MTK_SCPD_FWAIT_SRAM		BIT(1)
>>>    #define MTK_SCPD_SRAM_ISO		BIT(2)
>>> +#define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
>>>    #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>>>    
>>>    #define SPM_VDE_PWR_CON			0x0210
>>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
