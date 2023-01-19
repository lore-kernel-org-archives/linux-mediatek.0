Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54D6C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRkHxltOADy9ynfqvAg9dqzLPh81gN0Pd9b3KEsiRcI=; b=e3kzcbEHfRRCxueSKJzcBJirpl
	LkNVQOAueONPBMGerEqKBYjem2xn3mjMJublH+hb1TOVoi4JTdQNrZV38gUl3Ng+7Jr/PGsb+ebJ7
	R/vxG5+fWHMXEZ5FhfhpeOciflQMxz29/p569n9DpmvLj028o+KbhnFkNYKiFIUyLuSN+dOr5cBO0
	Zyl6ykL7EIw2Y43xsFV4LSDihUuaGY+4tW2rI8wWZOT8ruTUOkEvdhDAuq8jJoIIuLm5i1neHDyTV
	4czcHGtRIZUM1L8yYil8eYGRppskcJ/ODBZXdh2IYkC6/Fl4f4eqsb5g89r3oGOoi8sga0UEavqbK
	nCBfoOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYnW-006J7j-Gn; Thu, 19 Jan 2023 17:33:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYnA-006IzW-0g; Thu, 19 Jan 2023 17:33:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1816822wms.3;
        Thu, 19 Jan 2023 09:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRkHxltOADy9ynfqvAg9dqzLPh81gN0Pd9b3KEsiRcI=;
        b=pGwcN8w2cNHtPOjLhb/xHdlexc8kF1Umz+hd6UPmihuPQ4CJlyjDxot5gJT6uZoL15
         EXEIikiO4T4xVDbPMpcFMFqGtxm9/cSYmGC3iSSKzwpRwTwQb4NuvpRYy4uAjUrrhT8E
         CZDi5r6xOu+KgIT/93EGOtrNFI7jCDGZEyH+1ZxmfuR2Har04fhiXFfcfo9FP0ni18zs
         AABofBkOysQnILml+tMmEneuD6doMu2yZAOrj3H0J3lTMImIUVivnuYInSLiZfoPxmg4
         3Dbw8D1rzxRIjbQuX9495G8tmsmbnADmD1tk5wRRIXnbFWvC3PDAuiq5JCLpFlh79+8q
         3PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRkHxltOADy9ynfqvAg9dqzLPh81gN0Pd9b3KEsiRcI=;
        b=WJOLPchBqcmTioArHljJIrMeiBoaPRs1U0GCXeu25/CqxgLOIveEzDxVRxLkY/CcUs
         UtL3oe/5iT3b90Wg1SvMnZt/LM6LhXwlhAYIWVFhZAis7g0wa/ZwB+XsmkXFPvJwT7HW
         fcDQykuqQVQVKTLN2lFB2Ls7wPLgrtGbtDUj9SdqjC6+DBPHVqUNubOMDXBQjsxdxaX2
         ng6hFUOsMRarai+udEOWhwf08QuTRw/mQGc7g8X7i7+Jjl+8zviGSEzpiaAj+O0dNR8p
         MRndUGvD2k1EB1ANpnQMAyAmWm9fp33pIrHBA2G6DEJsXISLl+SYrkkj1xubM0Jfbj3V
         tvXg==
X-Gm-Message-State: AFqh2koN5xpRGsfXvTuKh75y/qI/lxCJzAQOIE6tFjHt6QhDzkKGEife
	GUnJL/1mqtPhGVKkNa67C+Q=
X-Google-Smtp-Source: AMrXdXv2+4MHflMXeHtA9NOmShcNOhoq7h9Pm3HghF12eXjmubTmiKbdJIrzRJazNaZnB8yCo/n5tg==
X-Received: by 2002:a05:600c:198c:b0:3db:392:ecee with SMTP id t12-20020a05600c198c00b003db0392eceemr7141224wmq.31.1674149614566;
        Thu, 19 Jan 2023 09:33:34 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003db0ad636d1sm4995466wmp.28.2023.01.19.09.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:33:34 -0800 (PST)
Message-ID: <fe2e5a9c-2505-5a95-d65a-bac387f4ea71@gmail.com>
Date: Thu, 19 Jan 2023 18:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7622: Add missing
 pwm-cells to pwm node
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org
Cc: robh+dt@kernel.org, john@phrozen.org, sean.wang@mediatek.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
 <20221128112028.58021-2-angelogioacchino.delregno@collabora.com>
 <20221202180932.5k3vymrwds5ssivq@pengutronix.de>
 <20230117213919.56cl74ffxzdpdcgp@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230117213919.56cl74ffxzdpdcgp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_093336_119538_A8F2A61D 
X-CRM114-Status: GOOD (  17.19  )
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



On 17/01/2023 22:39, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Dec 02, 2022 at 07:09:32PM +0100, Uwe Kleine-König wrote:
>> On Mon, Nov 28, 2022 at 12:20:27PM +0100, AngeloGioacchino Del Regno wrote:
>>> Specify #pwm-cells on pwm@11006000 to make it actually usable.
>>>
>>> Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
>>> index 146e18b5b1f4..f321c6d0fd7c 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
>>> @@ -435,6 +435,7 @@ uart3: serial@11005000 {
>>>   	pwm: pwm@11006000 {
>>>   		compatible = "mediatek,mt7622-pwm";
>>>   		reg = <0 0x11006000 0 0x1000>;
>>> +		#pwm-cells = <2>;
>>
>> 3 should be possible, too. The driver does only support one
>> polarity, so it's not really needed, but would be nice for consistency?
>>
>> Thierry, what's your take here?
>>
>> Other than that: Who would pick this up, I assume it to go via an ARM
>> tree together with the 2nd patch in this series?

The DT patch should go through my tree once all questions are answered and the 
dt-binding patch got accpeted by PWM maintainer.

Regards,
Matthias

> 
> The questions here are still open and both patches unapplied. :-\
> 
> Best regards
> Uwe
> 

