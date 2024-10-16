Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2663D2A52F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmj3m26uAVevKrLVIw7nRomm2+bj6OhZczGFx03aqgs=; b=JxXJyuhCI/zCsXgXQoc0bzIBfq
	8fC7B13j95ymx/euHqe9YpAtgKZefvLdEDBYOEHGfHiMcDxd68XkV7Jme9j4H5N8wMmSHcIS8VTAu
	e19ud18JCXnBpLfZGlaGiygWz21JUvy8c27AjF26HsEtMDohLhBBI/z4GhS3Tp4P6Rin89CmKZ5Lz
	x2BcwznfY5U3bXA0x39+JbDIpWyQGvuIYjcJyGxgjeyHUTfjRqctT9AQGIxwmPTnTkeFqifXjGMFe
	LGU+i6qL+vVi0Rm6igNyhq9IYluCm5XD10pkDTn8pKJ7bATyWqW9m2v6s921fGd8d+J0L+VfBZlQK
	hzgIZsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16YF-0000000CMGs-3gFa;
	Wed, 16 Oct 2024 16:07:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t16RH-0000000CKyS-0sby;
	Wed, 16 Oct 2024 15:59:56 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9a156513a1so442847466b.0;
        Wed, 16 Oct 2024 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729094393; x=1729699193; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmj3m26uAVevKrLVIw7nRomm2+bj6OhZczGFx03aqgs=;
        b=PePMNL+4LNZ00avrnPQ4sUTd7MQoR6FdRdzTj1S+1emaFlFY5HM5dEIJlC8XvUKc2Q
         v7qJYVfb8oAYkWuiuPqEYRSwubJSUXdwDWRRFm60+0KEOYP2h7+gYq+q+Mnx793P1V9z
         m6Aa1V4IqBm0n66A+s3iirq2OEvq2isvyRXe1eaumeFIQopnbC7OfqlXnit6UadgBxBP
         ktChtbZXxzcmOj726FbEkeDZtiEpr8XJKMD0pW7oBuFvd2tW5KrXSCPBt8sfQoJ8G38j
         qXuQcNZrMuVWVBej2nBmPPfP6699qsk9sgc9PdHeJW/GBvzu2XbsnxeLPRRsOFHU45JZ
         UgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094393; x=1729699193;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmj3m26uAVevKrLVIw7nRomm2+bj6OhZczGFx03aqgs=;
        b=MV07XE+0QLlC6edKgeClEvHW4Vh5TkSGeBoNrwWM2LkVqF9xfisNzoadsiZ/7+umiw
         86kuEU+gcieoEr+nM4ASONky79zNpWufVvWp+T+mK5qvLBQkfJsVYIE12xzRdC9W9hlb
         2JDCrC/Zj4hvek+KYXA5gQvgw4B8RxFCzO+qHvb3wW2ZzfgLfSugHaUI3NuCJIGGHNCc
         bitfrW1Byv5DkwIL4NwHqrPWzwgLukF9aBgLKR+AVKdPXqQidk2xS1lwy8WTDiYMZNzO
         F2+WiBJTzZnGl8A7yrjimLnp8oojIh2zsJexqu9h1JSP9GQR91wSWB7DjMpbNpkNs8+a
         cHpg==
X-Forwarded-Encrypted: i=1; AJvYcCUzO1WdosaAZYN22Qsxwg9LOx0uwDtld2lkRT2p/598nVfCYHnmgMAIxgYkizxU/bGdqjzROPtWo7u4O6DiDvBD@lists.infradead.org, AJvYcCVQB61wk7jNGXV7drKjmR/tnNXvWXHZqs7dxXvN8G50yFCu/a1oScBu+Ov5SeLWXQPTo1wtUZaNTqrkxI/eiFc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yznfg6VHQGgP2oiS34tHWTWf8xxEv02DHjh4vkVmc5jPHiH3x9o
	mHjnr4jKm7Pw8k5jAfQ32JfgixzQeOOcK/ggU/RxaAsblN/ZBH+c
X-Google-Smtp-Source: AGHT+IEXjAEvk5CdHrK8htzjtcfYfdp/XWOG5TaTbOL8TmX4lMucUTmZkpPTZn1+9nd/fPfsH42SKg==
X-Received: by 2002:a17:907:868d:b0:a99:4aa7:4d77 with SMTP id a640c23a62f3a-a9a34c83718mr303503266b.3.1729094392957;
        Wed, 16 Oct 2024 08:59:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2989797fsm196863666b.196.2024.10.16.08.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:59:52 -0700 (PDT)
Message-ID: <d7d48102-4c52-4161-a21c-4d5b42539fbb@gmail.com>
Date: Wed, 16 Oct 2024 17:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
To: Felix Fietkau <nbd@nbd.name>, Nikolay Aleksandrov <razor@blackwall.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
 <a07cadd3-a8ff-4d1c-9dca-27a5dba907c3@gmail.com>
 <0b0a92f2-2e80-429c-8fcd-d4dc162e6e1f@nbd.name>
 <137aa23a-db21-43c2-8fb0-608cfe221356@gmail.com>
 <a7ab80d5-ff49-4277-ba73-db46547a8a8e@nbd.name>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <a7ab80d5-ff49-4277-ba73-db46547a8a8e@nbd.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_085955_287044_3B53456D 
X-CRM114-Status: GOOD (  25.93  )
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



On 10/15/24 9:44 PM, Felix Fietkau wrote:
> On 15.10.24 15:32, Eric Woudstra wrote:
>>
>>
>> On 10/15/24 2:16 PM, Felix Fietkau wrote:
>>> Hi Eric,
>>>
>>> On 14.10.24 20:29, Eric Woudstra wrote:
>>>> It would be no problem for me to change the subject and body, if you
>>>> think that is better.
>>>>
>>>> The thing is, these patches actually make it possible to set up a fully
>>>> functional software fastpath between bridged interfaces. Only after the
>>>> software fastpath is set up and functional, it can be offloaded, which
>>>> happens to by my personal motivation to write this patch-set.
>>>>
>>>> If the offload flag is set in the flowtable, the software fastpath will
>>>> be offloaded. But in this patch-set, there is nothing that changes
>>>> anything there, the existing code is used unchanged.
>>>
>>> FWIW, a while back, I also wanted to add a software fast path for the
>>> bridge layer to the kernel, also with the intention of using it for
>>> hardware offload. It wasn't accepted back then, because (if I remember
>>> correctly) people didn't want any extra complexity in the network stack
>>> to make the bridge layer faster.
>>
>> Hello Felix,
>>
>> I think this patch-set is a clear showcase it is not very complex at
>> all. The core of making it possible only consists a few patches. Half of
>> this patch-set involves improvements that also apply to the
>> forward-fastpath.
> 
> It's definitely an interesting approach. How does it deal with devices
> roaming from one bridge port to another? I couldn't find that in the code.

It is handled in the same manner when dealing with the forward-fastpath,
with the aid of conntrack. If roaming is problematic, then it would be
for both the forward-fastpath and the bridge-fastpath. I have a topic on
the banana-pi forum about this patch-set, so I think long discussions
about additional details we could have there, keeping the mailing list
more clean.

>>> Because of that, I created this piece of software:
>>> https://github.com/nbd168/bridger
>>>
>>> It uses an eBPF TC classifier for discovering flows and handling the
>>> software fast path, and also creates hardware offload rules for flows.
>>> With that, hardware offloading for bridged LAN->WLAN flows is fully
>>> supported on MediaTek hardware with upstream kernels.
>>>
>>> - Felix
>>
>> Thanks, I've seen that already. Nice piece of software, but I'm not
>> running openwrt. I would like to see a solution implemented in the
>> kernel, so any operating system can use it.
> 
> Makes sense. By the way, bridger can easily be built for non-OpenWrt
> systems too. The only library that's actually needed is libubox - that
> one is small and can be linked in statically. ubus support is fully
> optional and not necessary for standard cases.
> 
> - Felix

