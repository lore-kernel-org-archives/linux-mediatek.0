Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30667C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GkkSM6uGyms/phZR7XyFKOmqJzQQT53LYPG7cGU++k=; b=eIJQvdwwjFuz55TsG9yHZysRRG
	/P3DjvkT3ousEGYVYY/iMctTpDsvCJICU3bN4ayZ834eYsnqsr5dHISASw55oeqwwRVwSYWUEp0/K
	rTxd4jdvQIIi+FLDg3A8+jK84FrSQl78xlM0wS0seatiAKO/CsHEVrS2mO4uuqbIpbGZbk6tFKYMl
	1UkmuWULrWlRDGI6BHkGhj2cEix0lqhyfbF8aR7RdIdOLbbqAVz1BSu86Ey2KozFNi4JZvY5Udn+w
	EFToHs7PcHsUJqDZL5mclVxSssfUM1n3kG57nr667vct1DLljuV7DHYXeR5JiF2ChXAN7XCv+jk1c
	1S2S3JLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScMC-009vZi-BY; Thu, 16 Feb 2023 11:23:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScM2-009vXY-FP; Thu, 16 Feb 2023 11:23:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1349274wmb.5;
        Thu, 16 Feb 2023 03:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GkkSM6uGyms/phZR7XyFKOmqJzQQT53LYPG7cGU++k=;
        b=TN9UsM3jbCuGt/lbfTp34HAj+qsa7YdTjGfvyBq0OWvWKJAbwU3tXRaM1ftwnR7KUW
         xXNG9JqNrKI033tlzisPnGlqr8coXs8mV0mKxOne/9CHiHVL485oMOPJ/azOuvmUeWpt
         Adv6S3JfWhT3UB2ooazFKPiaa6Xknl1XCwfvKTLgswh45dYV5M4tsYN5G0065X5Kes5w
         s5H0CHQ6Dh7kODOue/X7R/+lsYlQjJ5NfvT+qg1fdDUVvQaS1uKC3EzHyNI8SUw7gYx2
         JSOnhkGPcORWc8MwvW/bY9PJHIMEtdjashwQOQmfb+O6l9zthkXnFSJzjQVJ5dDhJEJu
         gKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GkkSM6uGyms/phZR7XyFKOmqJzQQT53LYPG7cGU++k=;
        b=jaaMzzzQZH3RrRiqvu8Ri3K6ODVKnDMZk5rY1/JOry06apUlHFTgRhrQu5kc9Jf9TD
         3AubxEdQZRoFeAJlc3xscz30sR+txlloWaoINjCI+txMHCfap5iaDy5yOSSrC0kn1/vK
         aeV8NR8yPRw8xvHlpY0IsMpbCFKj7S+asCDZXYjydcPtKVuM63ioMlWm6vUeqjDDNjJW
         CeqGlsxAFnXuTGs4zbvu/Si1Qg8SzyLiNhaNg7/kwsz+UWCcE99SVisQ7gYsKKF+PfqJ
         r5GY0Bxm5qEXqpoI1dBHTl84ZgYrf/LdTLnJF1l9QSChDYVKW+CzKkFKwOUkg1wswiYb
         tcEw==
X-Gm-Message-State: AO0yUKXRn4FuElYUApETZnp/ldY9OW46t5EhIR16HRXm/HnpD+/gBptL
	kUMEyd8vP0O49PcKFOPVRUU=
X-Google-Smtp-Source: AK7set+CU8UF+oc71jPePBMDXE75DgzGRMd/XKIWTPh/oHMmhxBdOLea5I4IootQeUIkXsa4ohX6iA==
X-Received: by 2002:a05:600c:3094:b0:3dd:97d6:8f2e with SMTP id g20-20020a05600c309400b003dd97d68f2emr4488600wmn.17.1676546588003;
        Thu, 16 Feb 2023 03:23:08 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b003dc3f195abesm1364420wmi.39.2023.02.16.03.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:23:07 -0800 (PST)
Message-ID: <96d6f405-22bc-f112-2c88-76da280eed46@gmail.com>
Date: Thu, 16 Feb 2023 12:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Maciej W . Rozycki"
 <macro@orcam.me.uk>, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
 <20230214222021.k3tsfwezhnh7tdlx@bogus>
 <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com>
 <20230215131849.mcgz53jf24atialp@bogus>
 <53f0e612-b5cc-262e-df98-add1e8a06573@collabora.com>
 <20230215144627.ddjc7x365qdnhymi@bogus>
 <7ac030be-8b5e-d190-6676-8cea9cdc1915@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
In-Reply-To: <7ac030be-8b5e-d190-6676-8cea9cdc1915@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_032310_535588_BDB94579 
X-CRM114-Status: GOOD (  35.78  )
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



On 16/02/2023 11:22, AngeloGioacchino Del Regno wrote:
> Il 15/02/23 15:46, Sudeep Holla ha scritto:
>> On Wed, Feb 15, 2023 at 02:30:51PM +0100, AngeloGioacchino Del Regno wrote:
>>>
>>> Both. I mean that these platforms do have architected timers, but they are 
>>> stopped
>>> before the bootloader jumps to the kernel, or they are never started at all.
>>>
>>> Please refer to:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/clocksource/timer-mediatek.c?h=next-20230215&id=327e93cf9a59b0d04eb3a31a7fdbf0f11cf13ecb
>>>
>>> For a nice explanation.
>>>
>>
>> Thanks for that. Well then I see no point in making these modules if you
>> can't have generic Image that boots on all the platform. I now tend to think
>> that these are made modules just because GKI demands and it *might* work
>> on one or 2 platforms. One we move this as modules, how will be know the
>> Image without these timers or with them built as modules will boot or not
>> on a given mediatek platform. Sorry, I initially saw some point in making
>> these timers as modules but if they are required for boot on some systems
>> then I see no point. So if that is the case, NACK for these as it just
>> creates more confusion after these are merged as why some Images or
>> even why defconfig image(if we push the config change as well) is not
>> booting on these platforms.
>>
>> It is no longer just for system timer useful in low power CPU idle states
>> as I initial thought.
>>
> 
> I think that there is still a point in modularization for this driver and I
> can propose a rather simple solution, even though this may add some, rather
> little, code duplication to the mix.
> 
> The platforms that I've described (like mt6795) need the system timer to be
> initialized as early as possible - that's true - but that timer is always
> "CPUXGPT".
> 
> On those platforms, you *still* have multiple timers:
>   - CPUX (short for cpuxgpt), used only as system timer;
>   - SYST, as another system timer implementation (additional timers) but
>     those are always initialized (AFAIK) from the bootloader before booting;
>   - GPT (General Purpose Timer).
> 
> On one SoC, you may have:
>   - CPUX *and* SYST
>   - CPUX *and* GPT
>   - CPUX *and* SYST *and* GPT
> 
> ... where the only one that is boot critical and needs to be initialized early
> is always only CPUX.
> 
> Hence this proposal: to still allow modularization of timers on MediaTek platforms,
> we could eventually split the CPUX as a separated driver that *cannot be*, due to
> the previously explained constraints, compiled as module, hence always built-in,
> from a timer-mediatek driver that could be a module and capable of handling only
> SYST and GPT timers.
> 
> In that case, we'd hence have...
>   - timer-mediatek-cpux.o (bool)
>   - timer-mediatek.c (tristate)
> 
> Counting that the CPUX timers are actually even using different `tick_resume`
> and `set_state_shutdown` callbacks (doing only a IRQ clear/restore and nothing
> else), the amount of duplication would be .. well, again, minimal, but then
> this means that timer-mediatek-cpux would be `default y if ARCH_MEDIATEK`, or
> even selected by ARCH_MEDIATEK itself.
> 
> If you think that this could be a good solution, I can send a "fast" patch to
> split it out, preparing the ground for the people doing this module work.
> 
> Any considerations?
> 

I think your proposal sounds acceptable, but we would need to make sure that all 
SoCs can boot with the CPUX driver. I'm aware of some armv7 SoCs that use a kind 
of hack to enable the architecture timer [1]. This, for one part, should be 
moved to CPUX, if possible. For the other part it makes me wonder if really all 
supported MediaTek platforms will boot with SYST/GPT being a module. I think we 
will need some effort from the community to test that.

So as a resume, yes I think your approach is feasible but we should collect 
tested-by tags before merging it.

Regards,
Matthias


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/mach-mediatek/mediatek.c?h=v6.2-rc8#n16

