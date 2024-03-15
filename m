Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5EBC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy8mkoyNdDIbEjZYoeFWO0a66QImPA2CQk2NlxXrdT8=; b=zmkLEHXj75Z0h1KaYnZ3TgU335
	w944SgyoensUq2+afut3NvMWxV1U6jJVTlZqQsR75KU+Yiv32migcnn5lknAReHFAm3n3khDnmwGN
	RomEx8hDB0XjQGGnKPlTUWlG6dcXigmGx8e17xTJi9K9h72MdZoDYHLiECVABrXehck+7Vnpi7uy6
	kgTf9wiAE08jJC/2T9iDF744QFlbC4VwYWFyWkjX7onoeR1qSjN9iQY8UGkimTsnY3iVOBWP2Rb+e
	tZX6vHjy8RR7IRcjBQF3m73LCktV6poOXF2aYr88DNbaGj1/iGli3NS6bmPtKniAKot7kdpXBotrb
	RZCjHuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl9U0-00000000ffL-3Efc;
	Fri, 15 Mar 2024 15:28:32 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl9Tv-00000000faW-1KBH
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 15:28:29 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d24a727f78so26573681fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 08:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710516501; x=1711121301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8mkoyNdDIbEjZYoeFWO0a66QImPA2CQk2NlxXrdT8=;
        b=b41bHhTv810nFrv4uJ76E+wjI+8N03M40myFVSKJxUzZccU8hNfIfhOyk9v9F2qpM2
         RZntZK0wEynElA4+c4HzIxII0atPgmeIUDAzUsqkdlThvBvPsJsVZassziv7oWlPfMVe
         cboLiKNrSqv67zYKsAsKblzFPXSQufmLv2krIVupk8NUunH2o862eqj/TFIC4LYkXBLc
         KRJ7A2/qUp9qbtKrMGj1jpTUSG0hOIGOU3Gowlu2AMhKtf45o5wbfHtuS+ddWCclr24w
         92mrtDN+kITnoIMTRsCI0yBXbDDcoil/1ZiG3ySdgZGtKLONfVkmW9clPZNZoMSvUDiY
         H5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710516501; x=1711121301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy8mkoyNdDIbEjZYoeFWO0a66QImPA2CQk2NlxXrdT8=;
        b=lDM6+abSKn6lMPVjE2c2orwurT5ldr1214Vg3bl1xTV9oXTYK2471CjPCIoDq4R2DI
         TceaAtgGVzbTxDo9+uU6yZxMEOiuQaq+c1Wg+O+QIy+tKucsaAgD8dM9+XVvFA3GWt7c
         Vwx4nt5XJ7C1acU264iNOECFlGKSVaK7cA7TpMAh+FWUT7RK8etDGQcmzpHVWLg/7Dsk
         kdzEkqwmbI5lNKEIRZQVFuh+lBgb5i5BA8lIsBLN2bjSxgloy8zj9BN/wy7WHEVPq/Zn
         c0r/AqTzgQYtlopE1bdEt8CuJImZkHlrYKr6EwTIyYv/Sb74K/iF7/g02BE9depgWqjD
         Kh6A==
X-Forwarded-Encrypted: i=1; AJvYcCUG9zGrd1viROLzUjlE2Gv3Hi3+tlfLRkjYIocgnf8UaGeJHckUYegXn/dRFPYYO9URQrOTwEOfiTNy+6nEM3RCGB2Lds0FfTRi4MRRCAfaAY2L
X-Gm-Message-State: AOJu0YwJxSp1mBEnEEyTlMw9P3qUyVxduCnr5g/XdIfp6D3GksnzczO/
	4CxY9aYZjcfwhCuB1Pv1EPLkJbBh0Sqnod4palN5wgeHLakcM9xcJJ7zawD+P+M=
X-Google-Smtp-Source: AGHT+IEv4KiX0VUKEaEam0pND8+D1J+qGZNRSiefb3SsE1hMQAKXvSamp9kPr2MXTXqoHfBaWZW3RA==
X-Received: by 2002:a2e:a68d:0:b0:2d4:57c5:886c with SMTP id q13-20020a2ea68d000000b002d457c5886cmr2953623lje.13.1710516501469;
        Fri, 15 Mar 2024 08:28:21 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7c751000000b00568b43fffb0sm527149eds.96.2024.03.15.08.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 08:28:20 -0700 (PDT)
Message-ID: <65cf39ab-6813-4412-9e45-30c26ab27cd6@baylibre.com>
Date: Fri, 15 Mar 2024 16:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
 <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
 <bf418207-7f13-4ced-8c21-2824dd07fab5@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <bf418207-7f13-4ced-8c21-2824dd07fab5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_082827_367569_9B8F40C5 
X-CRM114-Status: GOOD (  17.37  )
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



On 15/03/2024 15:38, Mark Brown wrote:
> On Tue, Mar 12, 2024 at 09:58:05AM +0100, Alexandre Mergnat wrote:
> 
>> I'm a bit lost for mixer-test and pcm-test.
>> Currently, I cross-compile the alsa lib project to be able to build the
>> tests and put it on my board.
> 
>> I can execute it, but I still have 2 issues:
> 
>> 1) I've a lot of missing module in my environment (Encode.so, Encode.pm,
>> Symbol.pm, IO/Handle.pm, ...). AFAII, I've to cross compile the missing perl
>> modules and install them in the rootfs
> 
> These tests are both simple C programs...
> 
>> 2) I don't know how to configure pcm-test.conf &
>> Lenovo_ThinkPad_P1_Gen2.conf (or new file to match with my board).
> 
> The configuration is optional.
> 
>> My test cmd:
>> ./run_kselftest.sh -c alsa
> 
> Just run the programs directly.  I'm only asking for the output from two
> of them anyway.

ok

-- 
Regards,
Alexandre

