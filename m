Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9C9C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24MutwcHiBZkjQYCos7XDdDwAEGZOLUpdfO5OhJienA=; b=igBF23ydwQcdG/FM90Qunu7FEF
	VzOnWcS4IJHh3h6WtaGQzSZaJcTKsE4k1u2qKATjrVtqLjcMO76D5feobaVcaHGLZW6x2U34hywpK
	lfpHdWZwKF5A6FoXQ83M9fcxgGSwu1283qwuo1wotY3fmb7FnifZbZkMrYp3J5yh7wZc5a7IugAw/
	mkeQHBYiewOdS/dlMPu6roc5RQ6KXbPdoBN1x87v8fHwfi5SdBwivQQna37bCRnAY4sPn+iJwnOTE
	pWcwsOFbxnKq4tAFkrS2hZUMw2UvWilzBtmRyHIrvyP+TGT1d+Z5ak0U1kSKmu9eJgKPva8oQqcoI
	KSwFmCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl97o-00000000baq-1Njl;
	Fri, 15 Mar 2024 15:05:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl97j-00000000bXk-0ggr
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 15:05:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a36126ee41eso272936266b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710515126; x=1711119926; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24MutwcHiBZkjQYCos7XDdDwAEGZOLUpdfO5OhJienA=;
        b=lPovJcFCgirvceEPL7Ohs7D0IxWaU90L1+2XS3S8+OQWoB3J7vZNFV22jjlrd6o9SC
         4RviLtvjJ5UJMc2vTGNPzBDNf/+jL9un5xNhFCSZCwPqAL8WEHhKk3HvIy3ToXlTIbOc
         Iom7qrI9rpWZh0nGEqJszX7AHWgfpdjyM89RmHHY2+AaDz79wuHt2ru3FnctzTSy0CbD
         UrfGa7Ef5vN90s/wIy4ag14Ii2XZozunh37mkQRmNyOTWnxqOlS2NYpcm6A4ox4rP4Js
         /qr67GoLeogdqeVVloVUmUGPvh75/G9dC2mJUkgFl47UlY7y85Lku3hGP6T140tMynyd
         Kj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710515126; x=1711119926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24MutwcHiBZkjQYCos7XDdDwAEGZOLUpdfO5OhJienA=;
        b=q8kQTg6YSgRtZrY6nSQ184l2U64wAsD42ufRgOGE8XnjTH/8nwVreiinABjRVfF3Ca
         vSNx77SSh+0EsXpnbYzxpHqgk6ZD55Klh+dwPldpRvpWeJkPAQD31YDNnPo72y1KHwGG
         ImXmCrpCq5Qz0054SBHSi11Ct8KMrRRqpyAxwU0eO2BYJ/bKN/yKqFshJxkFSHyzV8/o
         CAUDsM6d4XwbHkZyTpHHDrAzTX/sU1RlCFK3Wvw2+9njtVfZcnro0aJhecMqmDAEww20
         j8K1NLRTQBjaKW1tngBYvTc9d4hiPuxapZzC20NKHozn/K1l+TFV9NznhlnqE5emyBmv
         NZJg==
X-Forwarded-Encrypted: i=1; AJvYcCU8lM1CUkVOklX6zDmB/+xhKwGJnDWMCgz6kqx24sPqZz6ivk49nLdCPaWZa5DjNDEZ9v8ml2fjleIrZ2S25hXkVvnfcx38eZW6NhWNg397voDo
X-Gm-Message-State: AOJu0YyiG6Ml3zUzThy91cDJWIGTYUbMbAOOLewK5g3V3M/FKVVKbLYu
	Ia2Jh6+5MxlgnH8qOwlPY3hVJsZWPqOw2LtKI3pNuxBjRJco5wPRucArIyGJMTM=
X-Google-Smtp-Source: AGHT+IEO2hyzf/1xUUR4DWAg0e4i1y4j4ET1cfOEMZuvZS0x8BJ0B3U9ZhIu1vGtdXCzcUUMUTMYUw==
X-Received: by 2002:a17:906:9c8c:b0:a3e:cdae:7aa2 with SMTP id fj12-20020a1709069c8c00b00a3ecdae7aa2mr4284674ejc.35.1710515123916;
        Fri, 15 Mar 2024 08:05:23 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id j22-20020a170906051600b00a441a7a75b5sm1773189eja.209.2024.03.15.08.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 08:05:22 -0700 (PDT)
Message-ID: <fd53a0e7-fa70-4c0d-b578-393183487335@baylibre.com>
Date: Fri, 15 Mar 2024 16:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
 <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
 <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
 <0d31ffb2-9df5-4c3e-a728-902b71a1a713@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <0d31ffb2-9df5-4c3e-a728-902b71a1a713@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_080531_256285_41274290 
X-CRM114-Status: GOOD (  26.27  )
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



On 15/03/2024 15:30, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 12:01:12PM +0100, Alexandre Mergnat wrote:
>> On 13/03/2024 18:23, Mark Brown wrote:
>>> On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:
> 
>>>> Actually you must save the values because the gain selected by the user will
>>>> be override to do a ramp => volume_ramp(.....):
>>>> - When you switch on the HP, you start from gain=-40db to final_gain
>>>> (selected by user).
>>>> - When you switch off the HP, you start from final_gain (selected by user)
>>>> to gain=-40db.
> 
>>> You can just read the value back when you need to do a ramp?
> 
>> You can't. Because you will read -40db when HP isn't playing sound. That is
>> why the gain is saved into the struct.
> 
>> Let me know, when you change de gain to do a ramp down (start from user gain
>> to gain=-40db), next time for the ramp up, how/where do you find the user
>> gain ?
> 
> In the register.  You only need to reset the gain to -40dB at the start
> of the ramp.

Sorry but I don't understand your logic, I'm not able to implement it...
If I'm at -10dB and doing a ramp to reach -40dB, next time I will read 
the register the value will be -40dB.

This implementation is also done in other MTK audio codec drivers.

> 
>>>> Also, the microphone's gain change when it's enabled/disabled.
> 
>>> I don't understand what this means?
> 
>> When microphone isn't capturing, the gain read back from the register is
>> 0dB. I've put some logs in my code and do capture to show how it works:
> 
> Is this a property of the hardware or a property of your driver?

At the end of the capture, the gain is set to 0dB by the driver.
At the start of the capture, the gain is set to the setup gain.

AFAII from the comment in the code, it's done to avoid the "pop noises".

> 
>>>>>> +	/* ul channel swap */
>>>>>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
>>>>> On/off controls should end in Switch.
> 
>>>> Sorry, I don't understand your comment. Can you reword it please ?
> 
>>> See control-names.rst.  Run mixer-test on a card with this driver and
>>> fix all the issues it reports.
> 
>> Ok the name is the issue for you AFAII.
>> This control isn't for on/off but swap Left and Right.
>>  From the codec documentation:
>> "Swaps audio UL L/R channel before UL SRC"
>> This control is overkill, I will remove it
> 
> This is turning the swapping on and off.

-- 
Regards,
Alexandre

