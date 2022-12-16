Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3596AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r40LSZ/+/ZAU+L6Fli/YpabKQRcmpXucebZ+SCfPdk=; b=AzGfzajplRqipgut22eyIquYnn
	3yhsGrT0WBAhA7GtXBB6huvy+FroKAbNDYCZmXhTAHPiY2uVAM6L6fhrNcPDL+EiShZuxr3rrH9rn
	dilCKSP7ILmsXSITPuIrR+FVqzRp7B8WYzDgO2xlhi+5lmG3q/AShi1OrWNazEANb/RSqvaFzbVYL
	PwokX792+AjpJQb0k21ctYMnRZQGdTv46xysSbssSNdBjOzkB7MRtsrWdnD2ImTVcr+U7qjRAJhKn
	gUvqKujdjreaLurkCf/f9kg/sXCZu9ffzVJhcP8DeWrKg+iPiOVW/IJW5ppaaoLuOY6yBqKOgAwcS
	p7xqWGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6AbK-00FExH-KS; Fri, 16 Dec 2022 13:18:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Ab8-00FEt5-95; Fri, 16 Dec 2022 13:17:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w15so2446025wrl.9;
        Fri, 16 Dec 2022 05:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2r40LSZ/+/ZAU+L6Fli/YpabKQRcmpXucebZ+SCfPdk=;
        b=m4oNL4yKToYAtLq7BehnRnVmnCHOJAdX8n/A6r+w9r8UdYC32p/5sg/ZtCUyLrH6Rz
         f8ZEeQIMoSWbJV6Ivu79OUF9oD5rMQKCXflo/na25jXo34TTtnWWQrIsU4kiMcP2xkC9
         dI69R1EZf+ma2kwCGLyi74913VBgeb/20I9IW3nIZiCLKNL/9EC0pgBSuhdhuN5GTTII
         W1dcmtj60I5n95TrzYGNw1Et6Z44OvfxoK7uST5BFd6MCJIS408DYA/O5RtvPPGqpxTk
         cZWv2bPsfMROKhrPz0gqMJ2a+uq8eWPHY/FfbQ94um6eUVyS4XocRSQuKC5GCcZSNYWs
         xTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2r40LSZ/+/ZAU+L6Fli/YpabKQRcmpXucebZ+SCfPdk=;
        b=VH+orS2xazrJHB2FwPP1VMj1eI+iXmMMGw0iaPLlycfgoPNuS2T6RRIk+v2fQG2VHs
         /3kFi3zFhehbRpI6q1b97wv+Yfa8xBA+UZ7g93YVQBgUiv2+E3ZVU4j1IbTkNWNLaryR
         anmtm6pKBz30eIdIInD1oWvj06w6xRN1RHsig9954hWouDB2n9PBAJMPiweKbZThFBCd
         eC7oUW95GL6AvyU8EMu1irTHvlkdga15HH0AoetjzxPglNWSTWBDHI49Ayp7F8xC9KDW
         40JGRN54DlUQB7OLXf/zbALvm+czFWUGqRpftoe3Bk8/t67Jv9SrsfVqjmwaNH0KxP6N
         fRZg==
X-Gm-Message-State: ANoB5pknG+3Uk9SGrq6DFUlToVf3+fWzVlwJgaeEkVLAUbFud1MMK4VF
	Lk6W0t9KoQmEhHCbPJRTMJw=
X-Google-Smtp-Source: AA0mqf7g8RulHms7mAUgqAkszLKw5bIQ5cri/X2jVfUUUr/6n4r1sBEvqj9oEdJRfP+kSloFbuFYTg==
X-Received: by 2002:a5d:67c6:0:b0:242:6c24:af20 with SMTP id n6-20020a5d67c6000000b002426c24af20mr19469107wrw.56.1671196676742;
        Fri, 16 Dec 2022 05:17:56 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ba12-20020a0560001c0c00b002549b649b62sm2315488wrb.50.2022.12.16.05.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:17:55 -0800 (PST)
Message-ID: <05d6f9e6-a291-35c3-9b02-2235ad92669d@gmail.com>
Date: Fri, 16 Dec 2022 14:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock
 as broken
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
References: <20221130031741.3176853-1-wenst@chromium.org>
 <2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com>
 <CAGXv+5E=X_hwg76=B_jqWrpieo8bR-=r8NLbNz2=JzE=kBwMWQ@mail.gmail.com>
 <8806f4cf-2141-acb8-1f9d-cd6ade64756e@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <8806f4cf-2141-acb8-1f9d-cd6ade64756e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_051758_358653_2727AEC7 
X-CRM114-Status: GOOD (  21.96  )
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



On 01/12/2022 10:02, AngeloGioacchino Del Regno wrote:
> Il 01/12/22 09:56, Chen-Yu Tsai ha scritto:
>> On Wed, Nov 30, 2022 at 7:10 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> Il 30/11/22 04:17, Chen-Yu Tsai ha scritto:
>>>> The scp_adsp clock controller is under the SCP_ADSP power domain. This
>>>> power domain is currently not supported nor defined.
>>>>
>>>> Mark the clock controller as broken for now, to avoid the system from
>>>> trying to access it, and causing the CPU or bus to stall.
>>>>
>>>> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>
>>> ....or we can add the ADSP power domain to actually fix this properly, which 
>>> looks
>>> like being a generally good idea :-)
>>
>> Sure, but that and any driver changes have to be backported, or anything
>> touching the clocks will still break the system.
>>
> 
> I agree.
> 
>> There's no reason we can't have both. I think having this one merged and
>> backported to stable first, then adding the SCP_ADSP power domain, and tying
>> it to the clock controller as a follow up addition works best.
>>
>> What do you think?
>>
> 
> I think that one reason to not have both is that we'd have to revert this commit
> after the SCP_ADSP power domain is added (with the appropriate Fixes tags and/or
> Cc stable)...
> 
> I'd expect that entire addition to be no more than 3 commits, including the dtsi
> one... and if it comes out as I expect, we'd be solving that issue on all of the
> affected older versions of the kernel - the right way.
> 
> Can we wait for... let's say, a day or two to check how that works, before taking
> a final decision on this commit?
> 

Do I understand correctly that the correct way for now is to merge this patch 
until we have a fixed the power domain controller?

Regards,
Matthias

