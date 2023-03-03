Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A1FC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 07:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PbStGtTBem/zlIjosDLJ3+4EFL9CTyA5QKL7zAuqqU=; b=uAET1fAk4tDhYY
	BRCvMWkO/gSuEuqMmANomfgetPZ/cLDl+X4s8lonAGURZcxlUGQmobJeRG42CEc5W79FYQOV5bqO+
	N0pT3oki/eLrFGGYNMlCq0V7D3weFOp1Eps/Ixmg8pVXoH3TKlt8oETwiZ4U7nerzJTaz912zhSUG
	51N2D0sYhi8h2opGG0y6m9+SJxLMYCKpVus0w4B0SrzunBgmWrwuj8b1NKx/9FdtqHtprqsOJXudA
	DaGiVP4bXVudkCG/h4j6C/83Aq+joTQt1gLw9LAvRR2qt3Pjcb5drbh/gb/t6utZ2osxzs1sqd8+w
	6+6UOmFUJZFmdpqM092w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0ES-005IEV-Eu; Fri, 03 Mar 2023 07:53:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0EE-005I9I-7y
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 07:53:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id g3so7014850eda.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 23:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677829997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PbStGtTBem/zlIjosDLJ3+4EFL9CTyA5QKL7zAuqqU=;
        b=R16+5AMP9JbBAvAQ0qtcfoPtvc2hQi1t6gWkCxIA5GTfFGcoKWoIrNGyBRjKPWpCBu
         fRiMyUof1aFyO+u5bXCwL+mDByp2MaOYQ7mQTc4ZAx7quxAVRvs7FyWcESsW0ghKMjdv
         orzM6NarkLZ/q2tMDpbM7lCw7AYGrv8qMlH8tVN8mh31P103wpXjCo1oJQ28V5e+HxHL
         I/TnyNsohkvchnp5JlT4x6tgTp+aH2KxKWICJN1e7d0CJCQSsUvlqZ8AiXry6QTWOt2Z
         /eXl2zuVdejfenWWqAeE24YzJpL1vz/XSPORZNHGa2+8qU/aWP5t5mg+EQeGLTHQO0to
         VpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677829997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PbStGtTBem/zlIjosDLJ3+4EFL9CTyA5QKL7zAuqqU=;
        b=220dR6JicuWJrP28PiReRFWTDvODPV24tkEIf0CiK4sH6B6oHUb4M2xMKpRJYE9Ef5
         NrxILHne+VI24LmVm0RcPpDSKBSEDLvzYswmszA4w0yG08GwLhsAaYlcMBANqzNlo5sV
         AZvzNMXaEYYRXkZNBffGnpuMn+NnMXtj7qM1dc7dM9NVXnNHKZlgHnzyzoiNGPUoVgrk
         0pkLjjwUf7MHGvj6+6Pm5EJv/lN+IzQH+4pWSHYJQzgCHKQ7GF7gieBnCCz+xj6D970T
         u1spSyd6TppXpa4KFoGDGnfTdOqSRvdwwXCX7ApV7oQeft8yKswneODmx4LRI/syvIcz
         2VHw==
X-Gm-Message-State: AO0yUKXxrwdJnepmh0J50b//wdT2zyU6FI/VLkFrMTweKVRvvXslgrhM
	J77vq7sDmFdbZ7AmnOSUTPQENA==
X-Google-Smtp-Source: AK7set9x3dOthKcO2LgSNonWauqXUr6ExI9x8gAo5dIsgQqaxoMqhXT+yzhwKRkXWfzJXa+kwcnCWA==
X-Received: by 2002:a17:907:204c:b0:8b1:7e1a:ef22 with SMTP id pg12-20020a170907204c00b008b17e1aef22mr689933ejb.45.1677829997641;
        Thu, 02 Mar 2023 23:53:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090682c400b008d4b6f086c9sm654201ejy.185.2023.03.02.23.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:53:17 -0800 (PST)
Message-ID: <fd2018b2-757f-bd7a-5efd-8a1f28b178cd@linaro.org>
Date: Fri, 3 Mar 2023 08:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
 <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
 <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
 <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
 <b48e0a5e-dd45-8b8a-4ee3-357a0985ca9c@arinc9.com>
 <83a03258-9e52-3d09-67fe-12e9e5ed4b76@linaro.org>
 <11d10e4e-65ec-3bec-3e0c-7e57feb03506@arinc9.com>
 <a696bea5-3ba6-3b71-10ad-a04a7412c178@linaro.org>
 <4c522dc3-d6f4-fd3e-e715-4c7795576541@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4c522dc3-d6f4-fd3e-e715-4c7795576541@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_235322_319372_20D4E3C6 
X-CRM114-Status: GOOD (  28.58  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/03/2023 08:44, Arınç ÜNAL wrote:
> On 3.03.2023 10:05, Krzysztof Kozlowski wrote:
>> On 02/03/2023 12:50, Arınç ÜNAL wrote:
>>> On 2.03.2023 14:36, Krzysztof Kozlowski wrote:
>>>> On 02/03/2023 11:47, Arınç ÜNAL wrote:
>>>>> On 2.03.2023 13:29, Krzysztof Kozlowski wrote:
>>>>>> On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>>>>>>>
>>>>>>>>> ## Incorrect naming
>>>>>>>>>
>>>>>>>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>>>>>>>> introduce new ralink->mediatek compatible strings to address it.
>>>>>>>>
>>>>>>>> So this part was addressed by Rob - we don't do it, because it does not
>>>>>>>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>>>>>>>> with different vendor used.
>>>>>>>
>>>>>>> I think Rob was rather addressing that updating compatible strings based
>>>>>>> on acquisition or marketing whims is not permitted. This condition does
>>>>>>> not apply here as these SoCs were never Ralink.
>>>>>>>
>>>>>>> I understand your point that Ralink is now MediaTek but still, calling
>>>>>>> these SoCs Ralink would be a bit misleading, don't you think?
>>>>>>
>>>>>> Misleading yes, but also does not matter. At least matter not enough to
>>>>>> justify ABI break, so you would need to deprecate old ones and keep
>>>>>> everything backwards compatible. You still would affect 3rd party users
>>>>>> of DTS, though...
>>>>>
>>>>> I intend to do just that. Introduce new mediatek strings, keep the old
>>>>> ones so it's backwards compatible, therefore don't break the ABI.
>>>>>
>>>>> Instead of deprecating old strings, I intend to introduce the checks I
>>>>> mentioned, on the schema, so the pin muxing bindings only apply if the
>>>>> DT has got a string that won't match multiple schemas. This way it
>>>>> shouldn't affect 3rd party DTs.
>>>>
>>>> I meant, 3rd party users of DTS. You will replace the compatible in the
>>>> DTS, right? So the DTS exported and used in all other projects, OS,
>>>> firmwares, bootloaders, out of tree kernel forks will stop working.
>>>
>>> I plan to change it on the DTs for MediaTek SoCs, yes. Is this a
>>> problem? From what I can tell, what must be ensured is that old DTs must
>>> work with newer kernels, not new DTs on older kernels.
>>
>> Can I be clearer than this?
>>
>> " So the DTS exported and used in all other projects, OS,
>> firmwares, bootloaders, out of tree kernel forks will stop working."
>>
>> Yes, this is a problem - they will stop working.
> 
> I've never seen any project just exporting DTs from the latest kernel 
> version and slap it onto old versions, as a new devicetree that was 

Really? U-Boot does it all the time, other projects (like BSD) do it
periodically to some extend as well.

> introduced with a newer kernel version is not guaranteed to work with 
> older kernel versions.

Not guaranteed but it is expected, though, to some level and under some
conditions. Therefore it might be or might not be a problem. For some
platforms no one cares. For some people care.

> 
> If someone is actually doing this on a project, I think it's the 
> responsibility of the maintainers of these said projects to account for 
> this and modify the DT for the kernel version they're running it on.
> 
> What's more usual is one'd run the kernel version where the new DT was 
> introduced, which will work fine.

"kernel" as Linux is only one part of it. I mentioned several other
projects.

> 
> On to real life implications, popular projects like U-Boot and OpenWrt 
> maintain their own DTs for this platform so I think the impact is very 
> minimal.

And they sync with Linux kernel DTS.

> 
> Anyway, I'm not doing this change on this patch series so why don't we 
> cross this bridge when we get to it.


Best regards,
Krzysztof


