Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E8C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jan 2024 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJUyDVGU0XKgaKwYDjGSDxNTROvNmlr5rGkLfg67AJU=; b=t4I6f3QWMGzQf9SA9woenNAXKD
	NzfhJ0/QvgBdel6VmqMaYpwDTGh8xyC80Id0N4RBMpW7OpKciWaMXW/TfeAsOb4NmuFFhXt9aPaZ1
	hjn/z7DfD63nrFLqW1ZVs1aILPlqeiYpTEV9+6fEY95vyhJTz9qQS9majWWkSazMG0RGOg16+ICzx
	j3We3iSm41gEIqxLG1bj2XagjOfSpewde7blVD5DBuU2RSU4K5UMKmxdPpqp0idnMgdQafykAGAOY
	AicKhuEQBfNbFb81WdvlP/Pl+RNjgKDgQVh3ksv+BmXgm1shN98RBR4xCFaYF2BlCeRLeJqyTKvC7
	zCK6Cj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLgbi-00GP5d-1T;
	Fri, 05 Jan 2024 09:35:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLgbg-00GP3a-1J;
	Fri, 05 Jan 2024 09:35:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40d5d898162so10251655e9.3;
        Fri, 05 Jan 2024 01:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704447308; x=1705052108; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJUyDVGU0XKgaKwYDjGSDxNTROvNmlr5rGkLfg67AJU=;
        b=V1UFSspoG+iF5nllGyRJHxWKCjH0fBs04vvekeN9Wr9VMSt6t0UpTgEBwgK9jXlPl6
         ytRGsgN6dz5eksuliK1/OViRmMJilJbtM1B2ujkRPdMOvr7AX2I+iOYmGsISyUUYy5od
         P3nY9AGE4SLL1PJKC8qwDD24SBg7uGLFuMrthMRy97HwM1HgwXCgWeSu3GQSMX0Uo3rS
         6Kmpb0wElYJbtkr/VnKdfaKMr1va4AEHU6jOi2xDWG1TaIDS0yQmAkMG41WNjKMyeVaQ
         layHSGqOwWicuyHF0tw9T4csha6sT94LlUHQr6ibc6QwFVpQjQSVUtbCiY7IPndWKtc7
         FqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447308; x=1705052108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJUyDVGU0XKgaKwYDjGSDxNTROvNmlr5rGkLfg67AJU=;
        b=gZOc+aSOR0RVmuPVUj07zxrbVty2CK1UWjeDbu/7gE7jx0HtrqiqLw6eol1O3gvX1R
         11nLfnMTv8X5wWxPzn2673ZS/kft5flCgKMoT1kDIcoJXETC7t8cEs72zEHb5bKn4yzH
         wcPukUkQIv3QKxa4JtAwI1zeaB1mHaOqCtuVnzS4rIlXUz9EZg8eh0YGaYD8ipCz9mS4
         TDJu7haAEeff71TEY/8wsjm28pOhG8P2LiAjJi7YFuhuE8xI7ZAv8Gf89hxKq/fuDhZi
         UkNbOQWrjZZDkEpea715xcl7aToQYstr3U/ah3g98SyADGzp9f1l4CrNHa8xlLbzvTOZ
         BHhw==
X-Gm-Message-State: AOJu0YyvhSFPAZmkwfnBSsapQwPGvFTk/ZijwxefvaxRrC0mnpnirTru
	GhA3yK/Udwr3uZQdz6//TV0=
X-Google-Smtp-Source: AGHT+IGdYoX12msFQex2gQBmL00N+tTwnAfTSgVHTKvPHEqpTgUu6NAX8rJzRZKET7C6gVrEN0zBkQ==
X-Received: by 2002:a05:600c:4fcb:b0:40e:347e:b4d with SMTP id o11-20020a05600c4fcb00b0040e347e0b4dmr1100921wmq.89.1704447308037;
        Fri, 05 Jan 2024 01:35:08 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id j26-20020a05600c1c1a00b0040e3804ea71sm1002466wms.10.2024.01.05.01.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:35:07 -0800 (PST)
Message-ID: <160df81d-e5fa-4798-96d4-5ab1809a9680@gmail.com>
Date: Fri, 5 Jan 2024 10:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Content-Language: en-US
To: Jeffrey Kardatzke <jkardatzke@google.com>, Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Joakim Bech
 <joakim.bech@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
 <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
 <20231213161614.43e5bca8@eldfell>
 <9m8eC1j8YSwxu9Mr8vCXyzF0nfyCSHpFbfc__FtUjjKppew65jElBbUqa-nkzFTN-N_ME893w0YQRcb3r3UbIajQUP-Y5LxnHKKFoiBepSI=@emersion.fr>
 <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CA+ddPcOew7Wtb1-Cakq_LPN1VwtG+4vpjpLFvXdsjBunpefT1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_013512_451355_6FA770CC 
X-CRM114-Status: GOOD (  21.78  )
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

Am 04.01.24 um 20:50 schrieb Jeffrey Kardatzke:
> Any feedback from maintainers on what their preference is?  I'm fine
> with 'restricted' as well, but the main reason we chose secure was
> because of its use in ARM nomenclature and this is more for ARM usage
> than x86.

Well AMD calls this "trusted", but I think that's just slightly better 
than "secure".

+1 for using "restricted" cause that seems to match the technical 
consequences.

Regards,
Christian.

>
> The main difference with similar buffers on AMD/Intel is that with
> AMD/Intel the buffers are mappable and readable by the CPU in the
> kernel. The problem is their contents are encrypted so you get junk
> back if you do that. On ARM, the buffers are completely inaccessible
> by the kernel and the memory controller prevents access to them
> completely from the kernel.
>
> There are also other use cases for this where the hypervisor is what
> is controlling access (second stage in the MMU is providing
> isolation)....and in that case I do agree that 'secure' would not be
> the right terminology for those types of buffers.   So I do agree
> something other than 'secure' is probably a better option overall.
>
>
> On Fri, Dec 22, 2023 at 1:40 AM Simon Ser <contact@emersion.fr> wrote:
>> On Wednesday, December 13th, 2023 at 15:16, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>>>> It is protected/shielded/fortified from all the kernel and userspace,
>>>>> but a more familiar word to describe that is inaccessible.
>>>>> "Inaccessible buffer" per se OTOH sounds like a useless concept.
>>>>>
>>>>> It is not secure, because it does not involve security in any way. In
>>>>> fact, given it's so fragile, I'd classify it as mildly opposite of
>>>>> secure, as e.g. clients of a Wayland compositor can potentially DoS the
>>>>> compositor with it by simply sending such a dmabuf. Or DoS the whole
>>>>> system.
>>>> I hear what you are saying and DoS is a known problem and attack vector,
>>>> but regardless, we have use cases where we don't want to expose
>>>> information in the clear and where we also would like to have some
>>>> guarantees about correctness. That is where various secure elements and
>>>> more generally security is needed.
>>>>
>>>> So, it sounds like we have two things here, the first is the naming and
>>>> the meaning behind it. I'm pretty sure the people following and
>>>> contributing to this thread can agree on a name that makes sense. Would
>>>> you personally be OK with "restricted" as the name? It sounds like that.
>>> I would. I'm also just a by-stander, not a maintainer of kernel
>>> anything. I have no power to accept nor reject anything here.
>> I'd also personally be OK with "restricted", I think it's a lot better
>> than "secure".
>>
>> In general I agree with everything Pekka said.


