Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F8C54E67
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjT8Br7RwB5Cf9wT37+1E/wNuS7CDeDlSSoF+6MfTlU=; b=NlE0DaKUcrULD2AdGFn04lWt+5
	AwpDDPM8X4m22krjr3kh2lwp2jSNQ2v2YO7MdVNQWwhXb9m8htA2/g2N1rszjhUjSygBcVoDvJmSo
	eNNRwodEXVpAtX0t8szF2egjdF7rqKTXRpVTTz/hWObjvHQdrmG5Gl6M0+6SbXPUjjbAeLCpI0OQM
	k211MCokd7y+kAEfpuQHVAQiixBGwpTMDmEhCONlG2XTyaNuZS5aY/ltsCBLTrpSkw9uX/7E7jbgF
	+EmO3BXnbnhWEnynGokcCc4eKmaDjgbRX7Q4JjJGKDFMz+3KU2uNgg/VzCrjWmuhet+FzpeYwye2x
	N9aYEemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxxh-00000004zUU-1Uro;
	Tue, 12 Mar 2024 08:58:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxxc-00000004zSH-1KYO
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Mar 2024 08:58:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33e285a33bdso3101240f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Mar 2024 01:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710233888; x=1710838688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjT8Br7RwB5Cf9wT37+1E/wNuS7CDeDlSSoF+6MfTlU=;
        b=R+XFxrMLaaZCRfGzlFyzWkOPoGnRO6TV8HMsGEcqw4e83rZgV/ZonNirQU9M6HOMXJ
         k9XUnlA0i/Rlaxb8WlgQOmk+poCZIlcOQqywfa4XfpPj1KTNctemdjXgKu0OUqnCM+PN
         kYhR0d1T0HWha1lBS3ym+E23DT7Cci0MiVUDKgQPywCDPPf8SSp11G+7rRmvO0+7TZaj
         KUw5kgXlV5bwDforx8MXejg+0t1/kDzxhaUkBFgqbl2CHGrade+iwP0wfW8LAnIJMJ23
         GgATIO4jUCVoZ8VwtKE4Wv/11sVCyAx53Mz6retg4jhlw224eeN21MOxhhk6ryTm01Ga
         O3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710233888; x=1710838688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjT8Br7RwB5Cf9wT37+1E/wNuS7CDeDlSSoF+6MfTlU=;
        b=cQTEeULIXwruqbRi0CTUf7mERoqmMgEC0dKkTvra/rWTTJZSKRWtdWXJpFGU5hk4zK
         33RSXjIqwSvpnVHR/pmStfhvlXHOnf0BpBWKPpORbb9XQ0G4n7jC1wkezN0YZWM8arhA
         5YdUMxXQdVcB31+ZsqH6AKm6MGDVwn134XIMHB8jZdg2ZVaAVkWsavKbS/J1nQ2P/BaU
         Gzdz8bCHR43wnaKgUaphQ4aWxTK8jvDR0HqIlmD3G44D4nmWdEpe+5ZETizeM7kZSMhV
         5IQZPS/MTOu3QC7To+DK99GHSvanCRpiBhyB7ncnMrLamuJiQpePJF8qUQlNLsqr+GMZ
         hJEw==
X-Forwarded-Encrypted: i=1; AJvYcCVqlfMa703SpJSFrx2yHesZU1xRGU6tFZi5QcYBewKYwVfEfTePVCH0lqDwhdBC9RMuKEu3hreiTWq1UkUmjjEmX+5+S/T05F2N0A6sC9wXHzMy
X-Gm-Message-State: AOJu0YzQqI7hza5v0vIuhz9beYx93EipYerDalW1iwJfwEyQSYozdoV1
	H03WhT9MrGcQb6rAcDQl/gqE/tJKLHxCYUeu3+Sr8wMSPcDeZzNcvZMTAYdXa74=
X-Google-Smtp-Source: AGHT+IGEY43ahXXjF+ZtPgyw++kTwzbaMmqAYW0DyROyoKxXhlKv6tTyjqHeIgkml0d0nNzd+tbCLg==
X-Received: by 2002:a05:6000:1c3:b0:33e:8b95:b351 with SMTP id t3-20020a05600001c300b0033e8b95b351mr5064003wrx.9.1710233888438;
        Tue, 12 Mar 2024 01:58:08 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id i5-20020adfb645000000b0033e87c6bcb2sm7367141wre.8.2024.03.12.01.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 01:58:08 -0700 (PDT)
Message-ID: <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
Date: Tue, 12 Mar 2024 09:58:05 +0100
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
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_015812_543187_B2663AD1 
X-CRM114-Status: GOOD (  18.90  )
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



On 27/02/2024 16:06, Mark Brown wrote:
> On Mon, Feb 26, 2024 at 03:01:38PM +0100, Alexandre Mergnat wrote:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
>> - Capture
>>    - 1ch DMIC (On-board Digital Microphone)
>>    - 1ch AMIC (On-board Analogic Microphone)
>>    - 1ch Headset Jack (External Analogic Microphone)
>>
>> Of course, HDMI playback need the MT8365 display patches [1] and a DTS
>> change documented in "mediatek,mt8365-mt6357.yaml".
> 
> Given the number of custom controls here could you please post the
> output of mixer-test and pcm-test from a system with this driver running
> next time you post, this will help with review since it checks a bunch
> of things around the new controls.

Hi Mark,

I'm a bit lost for mixer-test and pcm-test.
Currently, I cross-compile the alsa lib project to be able to build the 
tests and put it on my board.

I can execute it, but I still have 2 issues:

1) I've a lot of missing module in my environment (Encode.so, Encode.pm, 
Symbol.pm, IO/Handle.pm, ...). AFAII, I've to cross compile the missing 
perl modules and install them in the rootfs

2) I don't know how to configure pcm-test.conf & 
Lenovo_ThinkPad_P1_Gen2.conf (or new file to match with my board).

My test cmd:
./run_kselftest.sh -c alsa

I'm wondering if I'm going to the wrong way because I don't find 
guide/readme whereas it's not trivial at all.

-- 
Regards,
Alexandre

