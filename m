Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFABC3ABBF
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0cBa9PVs+oAQ53ekJJBPQ5CTxO23NSJ0+4h1zfsmKE=; b=fvc5i2nJlyKbulIepcX4kigiHE
	ExWyiOQKWAB14x57MzJBVxUoq9eSpoCz8QDV9AKtvigxDBoAaYomHmCVuaXyhQBn9AVp1Yo+T9ADt
	1a4dBsuy/UBHaR/aetOD2Dr2Xxn24HBOepzrqcVHXwoFT7KuruLNwB68GutnX89+jhxoGXspCAyzm
	vit+cybil3hm5AZqi28UGZ85L2qYoxSoOT5X5KcoZE4wU9Edk0ha8lN+zZGp3h6Rm8lm9HTwVmdCA
	bTYKmyG8NgMUhP6hkLiT/kcMZKj5oIQ1r9pm9XiiWLeSnjHCgFExdPgvQ3x9uR+N4eNsG2lCH1QPK
	evtHJy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEmB-0000000BQ4n-1zMr;
	Tue, 06 May 2025 09:39:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCE45-0000000BEXM-2foS
	for linux-mediatek@lists.infradead.org;
	Tue, 06 May 2025 08:54:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso33513815e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 May 2025 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746521651; x=1747126451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0cBa9PVs+oAQ53ekJJBPQ5CTxO23NSJ0+4h1zfsmKE=;
        b=ktp75EFBOxrbSPoTIrU37a0RWwjCCQz5mIZuEljK9fN/U5jAjdF+w/r/AKm/XlOlJG
         lIKcaRy/zsQBM+WNGO7azgByQ0vU/M5W17UgVZMxtbv78jUAkJtCxqFpa+c3aYOUjpJT
         RsyUvY1ppodRLnMhG0qRhELp3YmE71WEvQg1+D1xtrhwf301GhpkrLe351fwZw3DJ3O0
         Lk2NuSkGF5QFj9B1Wok3Km9+LXc5qwuPKFGliwWOt5cC7dvgXmfRbLb8uBELFe/ZjmL2
         meZ5Thw8OeoUwqSyTj/bOGmncMlwuplNcF8trEcR0P7WTd3fwhZxZrQ/tV1LmGqfmtk/
         gdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521651; x=1747126451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0cBa9PVs+oAQ53ekJJBPQ5CTxO23NSJ0+4h1zfsmKE=;
        b=s+F4gHiySQkNCnhbsKenjh3NsnV2rL9wLTcaqqNrqFNk6IopOlclVgUxImr1AEJa6e
         PjVMz3ACjy1CNPwOEP7eVSuPsP/vtonBYifWZPAmPs1HuUyy2dwlBKFS/QOX9SamqbVc
         iPNjBfeps1BMAXM56h+oS9H/RnId5+fGq6bfqCNMbY3yU2JXR27vCsfo3/9kMSDQlEjG
         6ylnCcpF7vOlgSv8V1AVDkfXDQ8xY0kBWh/W5ut+8zDChAZ8cyyaMQO5c7hMaYwCIRF/
         vcapZpc9kTEHZhq4eeil2nQ8+Bued/ZOYFnFcL1kHj847K7nZ6V1kShHCpkP1vzK8Ceq
         aliQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPnszdldlv2lkPYzZ6KZOFL8pneAFOsXiF++wfKK2d0bdYn2aN9T8DZcs9EklLZnW/IW49lF3fO4x2s7THgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx77lBheFnotfsRAKrz0ugN84Xd4woECnUJDA/37SKA5GROr/ss
	9ItSf2xqoNo8d1be9ZNwOvuC5Qa42VpLKC1ETc3yazw66Ricwb9Jk1R3hkWfHl4=
X-Gm-Gg: ASbGncvWG6M79RUN4idUlP5t6nEFTKKu1zek/ZYxapiLVKCYsJYzQrxA0/yw6w/37mh
	XD2/5lT3sAVPH+UE8U41KFV1lyxiTlLMUzJZAA7kr0rG6PL6I1udbDfKoO44XZiUYkDpPTBWtUM
	083pwK/Ftq+XOoqno1ykg6qD06zstobPCx1ACMJ8ZTnSXyBVsS1DcKd/bmOu0enGZtzOjxVcHw1
	IcLmqjYCuJhLkuM0chI8WbgdFzZ56TgZMxNxY9LhwhGBNduU40SWLbXFiRAHjR5kNN8hsg3tjWN
	6ZkzHBFCj3+rZtYP3KyBPKm6iYJXYCHz/1RehGF7jvlAVwmJphKq6wJpYDDgnkbAmt8k3lW37ts
	drK8L
X-Google-Smtp-Source: AGHT+IHXEKsH42KRLrEmKISrJCPG8Apw+QWhDI341ouWaA3XrXnmpLIfMz6s/Acz/PZ//Y59wBBHlA==
X-Received: by 2002:a05:600c:1d0a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-441d053b038mr18104455e9.30.1746521651357;
        Tue, 06 May 2025 01:54:11 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-441b89ee593sm158952075e9.24.2025.05.06.01.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:54:10 -0700 (PDT)
Message-ID: <7c08cc9e-f39f-490c-85fe-5738656380e5@linaro.org>
Date: Tue, 6 May 2025 10:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-3-cjd@cjdns.fr> <aBjpBpJAIP89oiit@mai.linaro.org>
 <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_015413_675171_B4FCE237 
X-CRM114-Status: GOOD (  17.90  )
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

On 05/05/2025 20:09, Caleb James DeLisle wrote:
> 
> On 05/05/2025 18:36, Daniel Lezcano wrote:
>> On Wed, Apr 30, 2025 at 01:34:28PM +0000, Caleb James DeLisle wrote:
>>> Introduce a clocksource driver for the so-called high-precision timer 
>>> (HPT)
>>> in the EcoNet EN751221 MIPS SoC.
>> As a new driver, please document the timer (up - down ?, SPI/PPI, etc
>> ...) that will help to understand the code more easily, especially the
>> reg_* functions (purposes?).
> 
> 
> Sure thing, I can elaborate the comment in the header of
> timer-econet-en751221.c. Let me know if you'd like it described
> somewhere else as well, such as the help of config ECONET_EN751221_TIMER.

It is ok in the changelog, so it is possible to get the description when 
looking for the patch introducing the new timer.

[ ... ]

>>> +
>>> +    cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>>> +              "clockevents/en75/timer:starting",
>>> +              cevt_init_cpu, NULL);
>> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ... ) ?
> 
> I see that Ingenic does this. This is the only timer so until it's up,
> sleeping causes a hang. If sleeping is prior to CPUHP_AP_ONLINE_DYN is
> considered a bug then this should be okay, but I'm not informed enough
> to say whether that is the case so I'll follow your guidance here.

Hmm, hard to say without the platform. May be just give a try with 
CPUHP_AP_ONLINE_DYN to check if it works otherwise stick on 
CPUHP_AP_MIPS_GIC_TIMER_STARTING as it is already defined ?

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

