Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D831AC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9Qke3iBXi7bHq6bOZpRdTikoykkN7piHbBurlNvIaA=; b=jO0YfREZkzjLSdM/NWNNe9GvE7
	ciZA/9+J9S+l4Qhc1JnMurisB3HsE2u3NGSa5VDUj3ytlU1hQ0EQ4vUzR2YKdiLlyxH4j1QUYdDn6
	DP23x8TY8I+wrsX0lqcrgsthPENBGxEGISr7foNROeWIborM7iHRjBGZQyus7N56+ec4v+jY/pbkR
	6ivWhstEI51LLsKDmyWCtpe7ayNXaWWXEJzfNa4HYd5NWmVZADdJ19Y3N5Wn5U4rgbOYkUoUkbPhU
	xp9CvT05czTvWd1SBg6o+ZD5fB4e4GtM49/5QewEbUCdlcRS7H+lAX6ql0pg4oI1nWlAnDuE++SNz
	JD5hzQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1plU-00Dj2G-0L;
	Wed, 24 May 2023 14:47:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1plR-00Dj0w-0z
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 14:46:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso896469f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684939613; x=1687531613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9Qke3iBXi7bHq6bOZpRdTikoykkN7piHbBurlNvIaA=;
        b=IHxSDxOcgTZ/KPYWpohVQG4p0ZbEiSTPcIVJB0YomCsORWeeWzEnP23G4lm4yKW3H4
         M8pWjpR3pqMS1rqjJLju/R+tua1H16uqbo32sKz9uro4i9hspQHSjFP3/Z4UIzFKnlA6
         9p0VlDcodzaicsH9Ckyd7rZ33qV2ENfP2Ke7a3h/8iPIsCGY8ULM6RIui9bJtK9ozZdM
         bcrhPYwILyuoV6Qy2aGfmD+tCnTHHY8Z/kYBfH7FG9kToWN73CDsLuSSrWItmYL7Wfat
         eoinQooIwTjvxXKYrOt4itiGM+fi+CGu9p4D7L8Yzd9NUYgIijY7yz/sEe6dyKxxKW1G
         vgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939613; x=1687531613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9Qke3iBXi7bHq6bOZpRdTikoykkN7piHbBurlNvIaA=;
        b=MWSpJZbi8XKvkFRe7ohSy7ZOGOIW3uxkWeNBlpMp9guzAwPve48Yd3fowVTdM47aLA
         v4x6FsflLxWeb1SCmo7HazCdZTzXgXxYgktodC0Lbe3mRJcdDZdQij0UYslI6O4bfLeY
         +4X4x/KyACryICAztWer9Xa58y7N1TOROzcjmrkMgCCfGWq7GuVFIfl+zn6kUy8AXCyZ
         jkLuPM0Lv5+05ppzBUegZHkzDdYQdrQrBoxSgFD0dAi1VDGvjQHUNTMWVPuD0zlMCK1n
         GjLw1z2aFvnEWbAehgvtUHXuekFJUTfDYg+HNt1v/cFcxIpLAmnsThV6f4NhfNA1Wir1
         VGjA==
X-Gm-Message-State: AC+VfDyBxfomija/aF3raMzN/SilysF1Y0mOsPwjLf1pxRRzI0yCcanx
	iMc1Cx6iI9OV4El9YqqvwdYxRQ==
X-Google-Smtp-Source: ACHHUZ5w6sruo9TAxLIm5fq60R7miyYwyXDbuHMJ4cdoF0aoWVmUoBqb8izRaYYGP2bjSZwq4DIzCg==
X-Received: by 2002:adf:feca:0:b0:30a:b46a:a443 with SMTP id q10-20020adffeca000000b0030ab46aa443mr18120wrs.51.1684939613498;
        Wed, 24 May 2023 07:46:53 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b00306281cfa59sm14863678wrn.47.2023.05.24.07.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:46:52 -0700 (PDT)
Message-ID: <e7d82e49-340c-5eb1-27e3-e6cde900fcf2@baylibre.com>
Date: Wed, 24 May 2023 16:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove
 ADDA_BE from link-name
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-3-trevor.wu@mediatek.com>
 <cb69dbab-0966-8ecb-d9b9-017f430fd7ea@baylibre.com>
 <b9eecdf886b6496131e51e1e2f49536c782c3b67.camel@mediatek.com>
 <56b892cd-977e-5b24-55f0-df25e187308b@baylibre.com>
 <e0fb6da4974407726cdf668577fe0d40e6e6e9e2.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e0fb6da4974407726cdf668577fe0d40e6e6e9e2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_074657_363190_2CCEA5D8 
X-CRM114-Status: GOOD (  24.74  )
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

On 24/05/2023 15:45, Trevor Wu (吳文良) wrote:
> On Wed, 2023-05-24 at 15:28 +0200, Alexandre Mergnat wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 24/05/2023 04:25, Trevor Wu (吳文良) wrote:
>>> On Tue, 2023-05-23 at 18:26 +0200, Alexandre Mergnat wrote:
>>>> On 23/05/2023 04:19, Trevor Wu wrote:
>>>>> ADDA_BE is used to connect to mt6359. For machine mt8188-
>>>>> mt6359,
>>>>> codec
>>>>> for ADDA_BE must be mt6359 which are configured on the machine
>>>>> driver.
>>>>> Besides, ADDA_BE is divided into two dais, UL_SRC_BE and
>>>>> DL_SRC_BE.
>>>>> As a result, remove ADDA_BE from items of link-name.
>>>>>
>>>>> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>
>>>>
>>>> I don't understand how "DL_SRC_BE" and "UL_SRC_BE" links are
>>>> done.
>>>> Why these dais don't replace "ADDA_BE" in this binding ?
>>>>
>>>> Regards,
>>>> Alexandre
>>>>
>>>
>>> Hi Alexandre,
>>>
>>> Because the sound card is mt8188-mt6359, the codec for these two
>>> links
>>> must be mt6359. Thus, I specifiy the codec in machine driver
>>> directly.
>>> If the codec is changed, there will be a new sound card and binding
>>> file. In conclusion, the codec won't be updated via dts, and that's
>>> why
>>> I don't just replace ADDA_BE in this binding.
>>>
>>> Do you suggest me add some information in the commit message?
>>
>> No it's fine, I'm just trying to understand.
>>
>> When you say "I specifiy the codec in machine driver directly", you
>> are talking about this change ?
>>
>> +               } else if (strcmp(dai_link->name, "DL_SRC_BE") == 0
>> ||
>> +                          strcmp(dai_link->name, "UL_SRC_BE") == 0)
>> {
>> +                       if (!init_mt6359) {
>> +                               dai_link->init = mt8188_mt6359_init;
>>
>> I'm asking because the equivalent was done here:
>>
>> -       [DAI_LINK_ADDA_BE] = {
>> -               .name = "ADDA_BE",
>> +       [DAI_LINK_DL_SRC_BE] = {
>> +               .name = "DL_SRC_BE",
>>                  .no_pcm = 1,
>>                  .dpcm_playback = 1,
>> -               .dpcm_capture = 1,
>> -               .init = mt8188_mt6359_init,
>> -               SND_SOC_DAILINK_REG(adda),
>> +               SND_SOC_DAILINK_REG(dl_src),
>>
>> So I'm wondering why "ADDA_BE" & "DPTX_BE" & "ETDM3_OUT_BE" are in
>> the
>> enum list of the binding since the codec is already specified in
>> machine driver too. I probably miss something but I don't know what.
>>
>>
> 
> 
> The following code snippet is cut from [PATCH v2 1/7].
> 
>   /* BE */
> -SND_SOC_DAILINK_DEFS(adda,
> -                    DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
> +SND_SOC_DAILINK_DEFS(dl_src,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("DL_SRC")),
>                       DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
>                                                     "mt6359-snd-codec-
> aif1")),
>                       DAILINK_COMP_ARRAY(COMP_EMPTY()));
> @@ -140,6 +140,12 @@ SND_SOC_DAILINK_DEFS(pcm1,
>                       DAILINK_COMP_ARRAY(COMP_DUMMY()),
>                       DAILINK_COMP_ARRAY(COMP_EMPTY()));
>   
> +SND_SOC_DAILINK_DEFS(ul_src,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
> +                    DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
> +                                                  "mt6359-snd-codec-
> aif1")),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> 
> 
> This is why I talk about specifying the codec it connects in the
> machine driver.
> If you check other dai-links, you would see COMP_DUMMY() in the
> COMP_CODEC() field.

Ok thanks for the explanation. If I understand well, ADDA_BE could have 
been removed from the enum list before your serie because the codec was 
already specified for ADDA_BE.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


