Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE5C77B73
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX879Xbtaq85/UPwb2f8tq7maPJyO+QLeOiqV5vIfjA=; b=BUOjuin18XMCaNZ44ANshOIJYQ
	8pAd2FAE1h6jsYYunGJKYeS+Wo8HffsE4mr/C1U294GcIFCVm55aQwh2dzqLh9pgEf32TS+suXKpg
	OV1DQEsRt9xmDL048aNSnCnm1H6KK+lgDjJT2uUvsodX5ammEdv0wCk0OA1zMPvuAxh6y1jXfYlgm
	WlEL+sKN7LISkU54rvg6Qes5PFEyCEBvk9MNy8RWiI7VMnadPM0xSds2tumSw+Z0Xq2MeQqoxDN+y
	l9eXJnfmkYF5xDrYJYVV7nA63+tCK4bBaJ47W2bRhfkHhVXypt/sgL9JdJZclol4TEqqwSCiaIGtj
	Wz/hJDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Zdc-0031C9-1d;
	Fri, 26 May 2023 15:45:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZdX-0031AI-2O
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 15:45:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-30adc69c0dbso392215f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685115949; x=1687707949;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OX879Xbtaq85/UPwb2f8tq7maPJyO+QLeOiqV5vIfjA=;
        b=wcwdcdzgtFryBiRdWxpCymHOki7j+wUintN3/adfIJ575HFiGwWvvLiGL3NjuxwRQ3
         gnUjpSgJCSKNn+8anAU5m8DeoSjJYKZLGPLMI87dIP859SN/KobgtxhHNXERf3MpE9K5
         wJZUC7GW/spdUYxb446kFGqU4Uox1guSsugZJ1mL4Sxg+LrCdgMTx4Y4akJ/Mt/7RFwi
         B5nFj66Up8V+9vb6gRJa0CQVT00R3zPujsuOvvvrh439gLa0zVGQpFB4Xigr6dOrgHbQ
         bI0KYS1ghZCHj0a5KknxdXkNKb6dYjp57m9fazVfgxJPBaDmVRu6NgMEzB6jnFMUzpvT
         dqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115949; x=1687707949;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OX879Xbtaq85/UPwb2f8tq7maPJyO+QLeOiqV5vIfjA=;
        b=Ar6fdWh9L11i1HaBJe75s0fqsqWcy+FGFV/MNuBGobgoAIVMjHZxhskavvIiV7G1Xn
         kOTu81ASvvV5mxB4cV432uC4Zo+gQCCEwz4Y0rTDAL6A29RpnjN9WWzob7aKJPCf6g4b
         Kuuc7P5owUy0lIZ+49eM3FH00mF/ttUML30WatHM4QxRfmslpRntb60/uL3iDpAIu2Kb
         H3RaOqwUiRVYvGvGQKSYJ8VuA5uQQg9P1OolCNb7ZKFks0powkfFAnP1v3XumFhSXXHc
         BUPOt7wpfP4jK1EEL5WbCOTqn23kmg29RKqAGN5ZWTubM+BWmDb5hCokRdwLoJcm24Re
         Q3cg==
X-Gm-Message-State: AC+VfDznUic/z7AraMC/O1HxhnY7wQk5Zoz7Vq32/NkPUrSjuh6llO3v
	wyYUWs+7DC4VynOVdoS27oU6vQ==
X-Google-Smtp-Source: ACHHUZ5UA+yXPBx7fP3hSIrT+zIrLky1zEBpDc0IHgjMDGgcI9UwC6u1LCxdVBVyifx+CDLiyp1GIA==
X-Received: by 2002:a5d:6ac4:0:b0:309:e24:57b0 with SMTP id u4-20020a5d6ac4000000b003090e2457b0mr2066240wrw.30.1685115949116;
        Fri, 26 May 2023 08:45:49 -0700 (PDT)
Received: from [10.1.4.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b0030630120e56sm2580734wrn.57.2023.05.26.08.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:45:48 -0700 (PDT)
Message-ID: <01591ec1-7c87-514c-047b-bec1c45ddfa5@baylibre.com>
Date: Fri, 26 May 2023 17:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
References: <20230517145237.295461-1-abailon@baylibre.com>
 <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
 <7ha5xud3m7.fsf@baylibre.com>
 <CAFCwf10hNjGtEYDi24LREnMLRGT7mRECvqQMdZWv=-uA7YELYg@mail.gmail.com>
 <ZG3pmSnUSc9oCtev@phenom.ffwll.local>
From: Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <ZG3pmSnUSc9oCtev@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_084551_783582_5C68DD49 
X-CRM114-Status: GOOD (  46.74  )
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



On 5/24/23 12:40, Daniel Vetter wrote:
> On Wed, May 24, 2023 at 01:27:00PM +0300, Oded Gabbay wrote:
>> On Wed, May 24, 2023 at 2:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>>
>>> Jeffrey Hugo <quic_jhugo@quicinc.com> writes:
>>>
>>>> On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
>>>>> This adds a DRM driver that implements communication between the CPU and an
>>>>> APU. The driver target embedded device that usually run inference using some
>>>>> prebuilt models. The goal is to provide common infrastructure that could be
>>>>> re-used to support many accelerators. Both kernel, userspace and firmware tries
>>>>> to use standard and existing to leverage the development and maintenance effort.
>>>>> The series implements two platform drivers, one for simulation and another one for
>>>>> the mt8183 (compatible with mt8365).
>>>>
>>>> This looks like the 3 existing Accel drivers.  Why is this in DRM?
>>>
>>> Yes, this belongs in accel.  I think Alex had some issues around the
>>> infra in accel with device nodes not appearing/opening properly, but
>>> I'll let him comment there.  But either way, the right approach should
>>> be to fix any issues in accel and move it there.
>>>
>>> [...]
>>>
>>>>>    .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
>>>>>    drivers/gpu/drm/Kconfig                       |   2 +
>>>>>    drivers/gpu/drm/Makefile                      |   1 +
>>>>>    drivers/gpu/drm/apu/Kconfig                   |  22 +
>>>>>    drivers/gpu/drm/apu/Makefile                  |  10 +
>>>>>    drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
>>>>>    drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
>>>>>    drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
>>>>>    drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
>>>>>    drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
>>>>>    include/uapi/drm/apu_drm.h                    |  81 +++
>>>>
>>>> "apu" seems too generic.  We already have 3 "AI processing units" over
>>>> in drivers/accel already...
>>>
>>> Indeed, it is generic, but that's kind of the point for this driver
>>> since it's targetted at generalizing the interface with "AI processing
>>> units" on a growing number of embedded SoCs (ARM, RISC-V, etc.)  In
>>> addition, the generic naming is intentional because the goal is bigger
>>> than the kernel and is working towards a generic, shared "libAPU"
>>> userspace[1], but also common firmware for DSP-style inference engines
>>> (e.g. analgous Sound Open Firmware for audio DSPs.)
>>>
>>> As usual, the various SoC vendors use different names (APU, NPU, NN
>>> unit, etc.)  but we'd like a generic name for the class of devices
>>> targetted by this driver.  And unfortunately, it looks like the equally
>>> generic "Versatile processing unit" is already taken Intel's
>>> drivers/accel/ivpu. :)
>>>
>>> Maybe since this is more about generalizing the interface between the
>>> CPU running linux and the APU, what about the name apu_if?  But I guess
>>> that applies to the other 3 drivers in drivers/accell also.  Hmmm...
>>>
>>> Naming things is hard[2], so we're definitly open to other ideas.  Any
>>> suggestions?
>> Maybe model it according to the tiny driver in drm display ? You can
>> then call it tiny_apu :-)
>> Disclosure: It was Daniel's suggestion, he can chime in with more
>> details on the tiny driver concept.
> 
> Yeah so maybe a bit more detail on my thoughts:
> 
> First this smells like a need bypass of the entire "we want open userspace
> for accel drivers" rule. The rule isn't quite a strict as for drm gpu
> drivers (not sure we ended up documenting exactly what, but iirc the
> consensus was that for build-time only dependencies we're ok with
> downstream compilers), but it's still there.
What is letting you think that we want to bypass open source requirements ?
Although the neural network firmware and userspace application are not yet
opensource, our intention is to develop a full open source stack.
Currently, we only support Mediatek APU (an Xtensa VP6) and we have to 
use closed source sotfware to execute inferences on the accelerator.
As far I know, there software stack similar to mesa where we could add
support of a new accelerator (this is also true for firmware).
That is actually what we would like to do. But this will take a lot of 
time and we consider this driver as a first (small) step.
> 
> And at least from a quick look apu.ko and libapu just look like a generic
> accel interface, and that's not enough.
> 
> For the big training engines it's more or less "enough to run pytorch, but
> it can be really slow", not sure what the right standard for these
> inference-only drivers should be.
To be honest, I don't know what would be required for training engines.
We only target accelerators for embedded device that usually only run 
inferences. In my opinion, this is 2 different use cases and I don't 
think we could address them in the same way.
> 
> So that's the first reason why I don't like this.
> 
> The other is that I think if we do end up with a pile of tiny accel
> drivers, we should probably look into something like simmpledrm for the
> tiny display drivers. Probably still IP specific ioctls (at least most) so
> that IP specific job knows and all that are easy, but then just pass to a
> framework that simplifies a drm gem driver to "write ptes" and "run job"
> callback, maybe with an optional "create/destroy vm/ctx" for hw which can
> do that.
> 
> So maybe we end up with a drivers/accel/tiny and a bunch more helpers
> around the existing gem ones. The rule we have for drm/tiny is "1 file,
> less than 1kloc", and there's a bunch of them. I do think we can achieve
> the same for tiny accel inference engines (but it's still a bit a road).
> Maybe tiny accel is more like "less than 5kloc" since you need a bit more
> glue for the driver specific ioctl stuff - maybe that's only needed for
> the submit ioctl, maybe also for buffer map/unmap and creation.
This makes sense to me.
> 
> Also note that there's an entire pile of in-flight work for adding new
> helpers to the gem world to make this all easier. Once we have gpuva and
> exec helpers there not much glue left to tie it all together with the
> scheduler.
I wrote this series a long time ago and just rebased it recently.
I will take some time to see the in-flight work and see if that 
something I could start using.
> 
> But the real crux is that an accel inference driver really needs to have
> enough userspace to do an actual inference job with some
> android/cros/whatever framework for inference (there's just too many).
We are currently stuck with closed source fimrware, userspace 
applications and toolchains (works with android and linux).
We are looking for a solution but implementing something will take some 
time.

Alexandre
> -Daniel
> 
>> Oded
>>
>>>
>>> Kevin
>>>
>>> [1] https://gitlab.baylibre.com/baylibre/libapu/libapu
>>>
>>> [2]
>>> "There are 2 hard problems in computer science: cache invalidation,
>>>   naming things and off-by-1 errors."
>>>   -- https://twitter.com/secretGeek/status/7269997868
>>>
> 

