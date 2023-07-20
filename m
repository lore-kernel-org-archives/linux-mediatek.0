Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF601EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mSDaVl3JU+HvwGjSR+QaJjRAnEFc4saHjf//VvH5Yk=; b=kiTYHFjAKxj8wkosnBX32RNQrh
	mkJYNX7RFzAiUPWVOPtwXhm1jqbOeeDMiCGtRzyP5ZE1ocNExWZmzeEiDeF9b7zESzWm7FiynYvqT
	B8juntyt+8n3UDN0Faj9oCy1ZAOqpqU0s65kZoBviyIpb0qq8ApVU7bIIoS5AgCW5T7CsD3PWdpU+
	iYu93qj7ORg6AXV5nLMFG5BSPVOnlyJ4Ez8PA/YgOz5A7pvn1lxLJf1XNcScN/JqoxHoGIih5H1UA
	paxJ7CISjJhQn0KphK3OF3GTy+ov5jKuGEpS5VHRbrmPWdiRBoRXzJUB9nyrITPpm9G6u81A5g0Vj
	e11GRL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSLu-00B4OU-1f;
	Thu, 20 Jul 2023 12:01:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSLs-00B4Mm-0n
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 12:01:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso5980375e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689854505; x=1690459305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mSDaVl3JU+HvwGjSR+QaJjRAnEFc4saHjf//VvH5Yk=;
        b=m33sstRpwA3obptMsfRSnHmYzIdeCUSdQQk48Er2O/KW30oRJP2HU9hyWf4hOQ7IQI
         FfYbeKiwKphLtlWkVoAdfS0DQ7gUDlQrNpJCB+yZt1WtvRJ/bpe71HRbai/16dLy6d6u
         I+W39l1BkIU/pYyFhuRbTl+JFXKXTGeIAVBJo0D7iocZOkAnFZEH06la3cdXPVp5ub0K
         JL+h84c8ktYXXr7J2LGZAKbu1IJG2et6l7CxdL9mIC4K31TfeMwtCQAYE4A+bo6auden
         gnzkPA9HaurxSrefEI/9MP7BxjIFcgag+6P5sKsXjm6LzBDYOH9cfGIDJmEzk2tzcJYt
         tJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854505; x=1690459305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mSDaVl3JU+HvwGjSR+QaJjRAnEFc4saHjf//VvH5Yk=;
        b=dt8fllCwo+LCCtdkVyaB2eComt9TpSql2rAGhs/nQXtWzVkUYUMeDMtJpW37hPvpEw
         I5cEh+NvH4V0wPeqiYpdFN4YRWDuWNUSQ5rYJKOD5NA46JOo87K926adRx2+Tvyvmicj
         UqLslv92Pd9UY8FD4jDhcqLP+NxUA1WnCqqbfHqi0/W5ThDKfzgsbakOTafbFTq3hsKf
         bg5soyhfqT8yktRhpeKG957320qnwLcKB0u+dsoNosdbaTeyPRTrCAnL7NSITQSgMAeQ
         FpWJEkLbJxON42qYT9KPH0XHqDaEjSOc9j+P4cbCFwD8fJRkr0PXPlNfSDAFCismxOi7
         gGdg==
X-Gm-Message-State: ABy/qLbiTl/NvE00htMWJp2r6ITBl/gydtg2XijEQqxUh3sPdZo8N3kT
	AZ8edRCdwOjZf27Xh8G19nn4DQ==
X-Google-Smtp-Source: APBJJlHHRMzgk8SNYyVrru2kh5gNrEKZKOx7onWKVBzJKdh/06yDLV+HjsmKCc94OfbxF5WR7s5O9A==
X-Received: by 2002:a7b:cd0d:0:b0:3fb:e643:1225 with SMTP id f13-20020a7bcd0d000000b003fbe6431225mr4439955wmj.13.1689854505423;
        Thu, 20 Jul 2023 05:01:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6285000000b0031455482d1fsm1150836wru.47.2023.07.20.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 05:01:44 -0700 (PDT)
Message-ID: <ab463c69-59e0-99b5-1526-7c344fcc593f@linaro.org>
Date: Thu, 20 Jul 2023 14:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt6795: Add support for display
 blocks and DPI/DSI
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-2-angelogioacchino.delregno@collabora.com>
 <0809ac02-b8bf-ed63-9e2e-e77cd7e93464@baylibre.com>
 <d892a76c-165b-dbeb-79aa-70f3ebd7f07c@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d892a76c-165b-dbeb-79aa-70f3ebd7f07c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_050148_284279_99BD2D58 
X-CRM114-Status: GOOD (  13.21  )
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

On 20/07/2023 13:52, AngeloGioacchino Del Regno wrote:
> Il 20/07/23 13:35, Alexandre Mergnat ha scritto:
>>
>>
>> On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
>>> Introduce all nodes for all of the display blocks in the MediaTek Helio
>>> X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
>>> left disabled as usage is board specific.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 252 +++++++++++++++++++++++
>>>   1 file changed, 252 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi 
>>> b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>> index 597bce2fed72..d805d7a63024 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>> @@ -2,6 +2,9 @@
>>>   /*
>>>    * Copyright (c) 2015 MediaTek Inc.
>>>    * Author: Mars.C <mars.cheng@mediatek.com>
>>> + *
>>> + * Copyright (C) 2023 Collabora Ltd.
>>> + *                    AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>
>> Shouldn't be like this ?
>>
>>   * Copyright (c) 2015 MediaTek Inc.
>>   * Copyright (C) 2023 Collabora Ltd.
>>   * Authors: Mars.C <mars.cheng@mediatek.com>
>>   *          AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>
> 
> I don't think that there's any rule about this?
> Also I don't really mind the strings order, but if anyone really does, I can change
> it....

These have two entirely different meanings. Your patch suggests you hold
copyrights (which is usually not true if working for employer).

Best regards,
Krzysztof


