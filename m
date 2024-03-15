Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9703C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ec9RrIuQWFrWDmIdusRv4/vXGJuKnTeszoS+IpWRfc=; b=LyvJrIu1ufi80nw7kMLjARzjf1
	zf9uBVc0KhS1P2570GnA94YhPAQPdwhGjq8wIp/+PjiaS8yXy+Zp8Dt/xMjVVPRPNpExMcWEwC5Xy
	+AyUZFztesIOvMxhKVIGZvX/DW3qc3Yupx92KC+g+596BeG0b1O9brnlAtJy1iYMaUYl0/QIPi8aE
	cvudsuuIN37X/bhxaQmJ2Z5vMu0UJk/4fr8UND8HSF6HSlNYmxEsEGatIWqAAxo4tThlXZ7H8ydql
	mJ4zGqmkBJjM5RWMeB/ZDhGWSFxz7SaHwOmuEXBxL6V7stFojhoo/51GRFURTY+mLL6+wJbUaYEmg
	SdnW83NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBTs-000000012GO-0sCC;
	Fri, 15 Mar 2024 17:36:32 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBTl-000000012DW-12sf
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 17:36:29 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d2505352e6so26814471fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710524183; x=1711128983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ec9RrIuQWFrWDmIdusRv4/vXGJuKnTeszoS+IpWRfc=;
        b=vev4n1HM8Rh3QV0se3zIq0CUTiSaiipkWnw5yrOak/oXcotcagJZT3Sxp7oHPKvuXy
         USawNspv5Pj+OPege1nkjJQG0EmqQ9QZor5ylWcX5N/NLCIVG7NEyoIbx72hbLDp2pby
         ODUxtkx+Tkn0oVszh39592xb2DXGK2sS/NX9fLsWnp+qNzRO+5G8tqo/WYZYudqFe4+r
         Do9vbNykcz0N9iUX8bYEeldhEDSNEvqm65GensxDR2rD8z7GoHOuBRdrFoenIAl38Kgd
         Y15K+gvEaD4Hn4yqW0XkaT65g/3IVvalxUtzscNCjZckTU2pz6nCHNVdqzz3GaAnrQkP
         OwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710524183; x=1711128983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ec9RrIuQWFrWDmIdusRv4/vXGJuKnTeszoS+IpWRfc=;
        b=WSk3bnVnYzMhd/m9BlGacG/asHX1M1stXYXnl7Mb13UU2nuyFK/jq06+4LbjzflcZy
         wAY06adHq15Lw9ee2Q5yQZVLmcFet/+M/J8lxMl1Z0bZpD1JqxbhhszWQPz4a7yJlj2l
         7zapoBh/IFDXSr5eGJ/8O+2aELbINixBLp5zXYCmqla2t67EHV0iKhrum5RvOdmSGVvt
         neoqPcMqBnC+7VQ3ZDWL3cVol6NlRqoqsgITLsCV2Fbc4Sm7m5ldPKVucO/q3fgryTHo
         u8VMn4F4ShJTp/t+BfjPpaGhddz9dDty68FHvJ8T+pjiquF+tyEZiu7yUirtWWaKL+ot
         n9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWm+VKRFqf49qLZJKG5+jJZGdlRio7X6YaAoAQKsg6TcqIYbEAkdAUhjWzqpoiTa4YkzsRaj1hQQGuZW0bGGjkPKJpYnIoXdkCKsd8dnlEUjyZy
X-Gm-Message-State: AOJu0Ywo1sGK27TAdl5Wc3JtJFmblJt70KlBof8GOxkk0X0fzqVs7xqt
	rF1Bn2pEhpOFTho/MJbBjhAOP/HggTxNSgOuGxTd9bMBsPA3Vxj3PqWcS2/XqU4=
X-Google-Smtp-Source: AGHT+IFk5NGPtCj8mXhvsYrdH1nre5XfSVGVRBDeRwQi7zLXGNIq4CodW9FczpHV1YSFYg82SuoADQ==
X-Received: by 2002:a05:651c:23a:b0:2d3:3b37:db78 with SMTP id z26-20020a05651c023a00b002d33b37db78mr3420227ljn.16.1710524182477;
        Fri, 15 Mar 2024 10:36:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ca18-20020a170906a3d200b00a469ebf37dfsm46312ejb.203.2024.03.15.10.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 10:36:21 -0700 (PDT)
Message-ID: <a9ad625a-c6fd-44f1-8776-aa5d54b448ae@baylibre.com>
Date: Fri, 15 Mar 2024 18:36:19 +0100
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
 <fd53a0e7-fa70-4c0d-b578-393183487335@baylibre.com>
 <0a41b498-5cca-4487-a0e0-0df749f6e796@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <0a41b498-5cca-4487-a0e0-0df749f6e796@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_103625_639025_11BFA5E4 
X-CRM114-Status: GOOD (  28.01  )
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



On 15/03/2024 16:15, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 04:05:21PM +0100, Alexandre Mergnat wrote:
>> On 15/03/2024 15:30, Mark Brown wrote:
> 
>>>> Let me know, when you change de gain to do a ramp down (start from user gain
>>>> to gain=-40db), next time for the ramp up, how/where do you find the user
>>>> gain ?
> 
>>> In the register.  You only need to reset the gain to -40dB at the start
>>> of the ramp.
> 
>> Sorry but I don't understand your logic, I'm not able to implement it...
>> If I'm at -10dB and doing a ramp to reach -40dB, next time I will read the
>> register the value will be -40dB.
> 
> After we've done the ramp and turned the amplifier off we can just
> restore the desired value?  The hardware is not going to care what the
> volume is while it's not enabled.

If you do that, HP will be enabled at the saved gain, and after that you 
will do the ramp. To avoid pop, the driver should be rewrite to:

   Read gain in the reg and save it locally
   Set -40dB in the reg
   Enable HP
   Do ramp

And for the shutdown:

   Read gain in the reg and save it locally
   Do ramp
   Disable HP
   Set saved gain in the reg


To resume, that add 4 more steps to save 2 integers into the driver 
structure.

IMHO, I don't think it make the code more readable or optimized, but I 
don't have a strong opinion about that, so if you think it's better, I 
will change it.


> 
>> This implementation is also done in other MTK audio codec drivers.
> 
> Perhaps they should be updated too?
> 
>>>> When microphone isn't capturing, the gain read back from the register is
>>>> 0dB. I've put some logs in my code and do capture to show how it works:
> 
>>> Is this a property of the hardware or a property of your driver?
> 
>> At the end of the capture, the gain is set to 0dB by the driver.
>> At the start of the capture, the gain is set to the setup gain.
> 
> So that's a property of the driver then?

Yes

> 
>> AFAII from the comment in the code, it's done to avoid the "pop noises".
> 
> Yes, that's the usual reason to ramp gains.  Though if you've just
> copied the code without checking that it's needed it's possible that
> this is something that's been fixed in current hardware.

I did the test at 24dB with and without the "pop filter". Isn't big but 
I ear the pop at the start of the record without the "pop filter".

To be clear, the algo/behavior of this code is an implementation based 
on the 6k+ lines downstream code for this specific audio codec. But the 
shape/style is based on upstreamed drivers like mt6358.c.

-- 
Regards,
Alexandre

