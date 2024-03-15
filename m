Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46CDC54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=; b=hFrFCxrJlKzxNbaX+9fJxqMqHt
	S6cggwpKWhVok3HvRsomg/F4kt1jTL0jrPcGx5ner4JQTQwM0GmyNze8xxYs1gfznDK7y4rPzhsaN
	RmFQoF0kRqQIT8nme+yb480fun7i1GguFQsb4RVBDukpeXSSdlw8ksY9ImoEb2FhsW6Cl77YiYahc
	4UqVVwnNb6PWuxGTjdENAekzhtb2vcUgvtCOr4ElJd4biKcoknfEONqvw1gYR5PnWdVELL9cZUsOm
	7j/pq2vdHPPF3ecdAtjEGhJMG+d60p08BzgIvqADqNbftaWjOyYc49QRu3iZzcmYzdscSgn3JwONA
	zMFzs7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5JV-0000000HXVN-0DcX;
	Fri, 15 Mar 2024 11:01:25 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5JR-0000000HXUP-2X5D
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:01:23 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-42a9c21f9ecso9497231cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710500478; x=1711105278; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=;
        b=VCn59rYw3BHCYS9Em2a4iDARxW2EhnoNECWq2Xpg24/WfHNjYVvCxo8hTVYhb7oWaZ
         tCTGa5Y3qAQg5/41hmBnEOp26tHeUkg1+bNgNQy7+dl/K56ALBQBDWEedL+eJwd6HvH7
         XRO01FFTF25smeRdSCi0Q+7CbfbnwpISpV+u8QpopVUxKPGzS8Gzc9MFrGcXpU1ZdOm8
         C7pyhKVHDnwpuZ/8Slo2/yhG3xfU5/ZIF0bbOBkVcSQa7pwR+H8Ur8QC3b+5MhrbyWT9
         M6haaD3Qb1XFcs3VJGIxjo3IAWyogzcbf4safaK6n4aQY9iow8bgM/RNHFJnCmtZyj2C
         v4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500478; x=1711105278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=;
        b=TRpcqnX5adDHnFl8SqgHXJA8K1yly46S/UaYoNWGBrw4ohVeuH6hfoNELthBXZdTeW
         7529Xlz2P0TfYVysv2pBQHHt+YtP/o2Habe+IIbR+25zzdExjsLSXhkYHjECzkFdxy8h
         /jFr3EMceGqjnOQEya7SiB5+YQSDKU137jHi1ekrqm8Q9mL9Un+PV6Htb2S+/f6UEzy3
         LhuAsbqiX4VTgqCbKpYKTp+no16QaBVGbN/XWI6Mt4v17svcidyKxRX8UbJY6NduMw1y
         +DKQWG8YpEpDv6WyGueHUgu1THm5sjbQuGSP8nDp0djKEtyPIW4CWyAxusEJ2XFjsaIe
         nTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKLJcTcS/5VCsrFHfbq86Z8kbxVsz23rC/GabGPDmsXMfqVGpL9RGoqqB5U0efbkCfZ/kIvM9AbSR5eI5trVWXX6Im8NgjosuyYmJvGIsQWH9Y
X-Gm-Message-State: AOJu0YzAMFv7Ywk3rV01VNyADUi9pihMgcAgqf0ABPn+Gjsmt/qyKHG+
	SxCiPgsYaA9Gya9vdSZB5YMeCPXzooR8ylJao6NuNW6fBONrcmT1o2zywn0bFKI=
X-Google-Smtp-Source: AGHT+IEVOOgZFoxsLMo3B/9DgMlPg+8mCIQzmFSjWr5NC1POGFlHlr6r0UtoZZxyVjffb0W7416VFg==
X-Received: by 2002:ac8:5783:0:b0:42e:b90c:c5a9 with SMTP id v3-20020ac85783000000b0042eb90cc5a9mr5156478qta.51.1710500478406;
        Fri, 15 Mar 2024 04:01:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p3-20020a05622a00c300b0042ef88b7daesm1838670qtw.19.2024.03.15.04.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 04:01:17 -0700 (PDT)
Message-ID: <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
Date: Fri, 15 Mar 2024 12:01:12 +0100
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
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_040121_715232_8182AAE0 
X-CRM114-Status: GOOD (  21.67  )
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



On 13/03/2024 18:23, Mark Brown wrote:
> On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:
>> On 26/02/2024 17:09, Mark Brown wrote:
> 
>>>> +	case MT6357_ZCD_CON2:
>>>> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
>>>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
>>>> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
>>>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
>>>> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
>>>> +		break;
> 
>>> It would probably be less code and would definitely be clearer and
>>> simpler to just read the values when we need them rather than constatly
>>> keeping a cache separate to the register cache.
> 
>> Actually you must save the values because the gain selected by the user will
>> be override to do a ramp => volume_ramp(.....):
>> - When you switch on the HP, you start from gain=-40db to final_gain
>> (selected by user).
>> - When you switch off the HP, you start from final_gain (selected by user)
>> to gain=-40db.
> 
> You can just read the value back when you need to do a ramp?

You can't. Because you will read -40db when HP isn't playing sound. That 
is why the gain is saved into the struct.

Let me know, when you change de gain to do a ramp down (start from user 
gain to gain=-40db), next time for the ramp up, how/where do you find 
the user gain ?


> 
>> Also, the microphone's gain change when it's enabled/disabled.
> 
> I don't understand what this means?

When microphone isn't capturing, the gain read back from the register is 
0dB. I've put some logs in my code and do capture to show how it works:

root@i350-evk:~# arecord -D hw:mt8365evk,2,0 -r 48000 -c2 -f s32_le -d 
10 recorded_file.wav
[Mar15 09:31] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_afe_fe_hw_params AWB period = 6000 rate = 48000 channels = 2
[  +0.000126] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_dai_int_adda_prepare 'Capture' rate = 48000
[  +0.107688] mt6357-sound mt6357-sound: TOTO set mic to stored value
[ +10.072648] mt6357-sound mt6357-sound: TOTO set mic to 0dB

root@i350-evk:~# arecord -D hw:mt8365evk,2,0 -r 48000 -c2 -f s32_le -d 
10 recorded_file.wav
[Mar15 09:32] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_afe_fe_hw_params AWB period = 6000 rate = 48000 channels = 2
[  +0.000133] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_dai_int_adda_prepare 'Capture' rate = 48000
[  +0.109418] mt6357-sound mt6357-sound: TOTO set mic to stored value
[ +10.164197] mt6357-sound mt6357-sound: TOTO set mic to 0dB


> 
>>>> +	/* ul channel swap */
>>>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
>>> On/off controls should end in Switch.
> 
>> Sorry, I don't understand your comment. Can you reword it please ?
> 
> See control-names.rst.  Run mixer-test on a card with this driver and
> fix all the issues it reports.

Ok the name is the issue for you AFAII.
This control isn't for on/off but swap Left and Right.
 From the codec documentation:
"Swaps audio UL L/R channel before UL SRC"
This control is overkill, I will remove it

I'm stuck to run mixer-test, please check the following message: 
https://lore.kernel.org/all/7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com/


-- 
Regards,
Alexandre

