Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D31C54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5wMiw22c5vII85IvPgCG/zbOc7PIefhra+kZ3K8oIE=; b=rCBa+t4AS/c03UoOTZpZa+lZNI
	onl8sNhRETZCY4UYksQqlxppjI1n+bwBKfiuu0dllPMVCG9AA3e5t9HFkH7coKtG7ZBYFU6yzx/TH
	b7FuxMTLao99nA06GOUZAWi5zUn2Tv1a1OEzxxbtvw3drDP/+cUws/nIDyHxCy6NLZCc4ecKU9DJ2
	j+R58qCUlYPgM6FyAGosx87MPbLaiCo7H2I1vxKWAj8qEqY48d05nlmOdLl1hVkIE/ofjWjr4vD2n
	2DTwVEailjUvXuplgGKsafpCMQMC95G6sSjCz1Uk1QRG+6w4MzO+93RtmbEq5Kk+p7uzmHu/GQq5n
	U+f4nXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmha-0000000DUNy-1XRE;
	Thu, 28 Mar 2024 10:09:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmhU-0000000DUKC-2Xeo
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 10:09:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34175878e3cso532371f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Mar 2024 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711620574; x=1712225374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5wMiw22c5vII85IvPgCG/zbOc7PIefhra+kZ3K8oIE=;
        b=LaqYCvNWv8hphPBrLU6V64wZXc5vfDfI7TD8JUfRBI0NnNIRN+rHBP+uTWn/hOtJsb
         dr+htirTfkM2YaOHZuc0P/NVPQyrbX89l/bIr066Z7tuhjPeOO5YmFFGxhunBNSTdZn4
         cgI/mgVwR28PVQz63uvaHnuwjxilOrg2IVXYONmkbq6hd7sYyqBoLIOJplrG3cq//zz5
         KYqi3EBv9v/vhpVXwbcr+tS7K89c37gOyJ6a1nnz+KOX9vCeDs0uNUjWTm4yjB/5ZyD1
         iEphKuQu7nY9BjdfFCpBc1zciHMYJze/RUDyzfvawTZzi2BU+DPFcflcEzlpjz+sUnlq
         WEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711620574; x=1712225374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5wMiw22c5vII85IvPgCG/zbOc7PIefhra+kZ3K8oIE=;
        b=GmrAPd71SNuI1P1GUjb3dWMJigNQD9hQGbkq5z11r0ATV0DoXvIGNFoI5hoX85nyf6
         KXu95gHcdDc/wnqjIOQsEGmyci7+YMDajC7BJBqKhikzmaPptM0Y93aqFJuF9HPqoYhD
         jLrw1auBlD4IQ6elMkGozObb4t0FrLYFKj6ow/+mNT4/MH8yRcFgrrCDZ05o3sIlMzOs
         /l2O5TT/jCKPvAghddmxW6zcPjb1cjvb/irts/f3qcWg1CIOL/a0BXxFaaNxZxlMot4Z
         rsQ7+h2VtMV9EnAXtsEKxcwPai+EyTbqAZOe22aRlD+SJT5p+UxaV6I6QhOqmgtz5uNY
         S2WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPRMe6n7DwPQigzOQFy/XJbVIzpjWEqOJkmDgeC1jpxYqTtlBb1OQoQi5ej7KXsTkaTq9M/AByyUHSl54WFw1SW4ERJWhQl4GGNWa/Gwglzu53
X-Gm-Message-State: AOJu0YyPlFB957PfdNW+yHAD01FmIAZ/hXDer7pRlij/7n6fs9uMh0PM
	Kvwj/4xhaYYdo9eWa0lveSsvxzi5l20d8sDW9kFn24Ti1W2pyrvH9R7Ytm74Bb8=
X-Google-Smtp-Source: AGHT+IFGHWYadDJCgABhwjbgmr/G/9ahD5CWJZRFUjAkHe014xq2ZOOYv0q270M74EFrQt4il5g9rw==
X-Received: by 2002:a5d:6d82:0:b0:33e:9292:b194 with SMTP id l2-20020a5d6d82000000b0033e9292b194mr2493550wrs.14.1711620574475;
        Thu, 28 Mar 2024 03:09:34 -0700 (PDT)
Received: from [10.1.5.127] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id ea2-20020a0560000ec200b003432d79876esm1316197wrb.97.2024.03.28.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 03:09:34 -0700 (PDT)
Message-ID: <4dba5a65-d1dc-4a80-bcaa-fe9ba02c5082@baylibre.com>
Date: Thu, 28 Mar 2024 11:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley
 <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Flora Fu <flora.fu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <53671deb-9c11-43c1-8deb-93fe4708651a@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <53671deb-9c11-43c1-8deb-93fe4708651a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_030936_680959_A3053866 
X-CRM114-Status: GOOD (  16.80  )
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

Hi Angelo

On 26/02/2024 15:54, AngeloGioacchino Del Regno wrote:
> Il 26/02/24 15:01, Alexandre Mergnat ha scritto:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
>> - Capture
>>    - 1ch DMIC (On-board Digital Microphone)
>>    - 1ch AMIC (On-board Analogic Microphone)
>>    - 1ch Headset Jack (External Analogic Microphone)
>>
>> Of course, HDMI playback need the MT8365 display patches [1] and a DTS
>> change documented in "mediatek,mt8365-mt6357.yaml".
>>
>> [1]: 
>> https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> Actually, I am cooking a series (I'm finishing the testing....) that 
> brings quite
> a bit of cleanups in MTK ASoC, including the commonization of the 
> machine driver
> probe, with the dai-link DT nodes, and which also modernizes most of the 
> existing
> drivers to use that instead.
> 
> If you wait for a day or two, your mt8365-mt6357.c driver's probe 
> function can be
> shrunk to ~3 lines or something like that.. very easily :-)

Just to inform you. I'm aware of your serie. Currently, I've fixed my 
patches according to the comments. The next step will be to rebase my 
serie over yours and do the changes to be aligned with your new 
implementation.

I've planned to review your serie during my last task, but it seems 
already approved and already (partially) merged into linux-next, sorry.


-- 
Regards,
Alexandre

