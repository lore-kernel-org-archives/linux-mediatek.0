Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3629DC54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=; b=onp2GSfqVuvmyyGmsvDVA5YrGX
	GokMYJM1xkzAn78wcPeEqUPmKUlwBvL5nR8M3P6AW8A8vqbEnX2Y+4zNcF6fHpDuNq8cLlBRP8ajJ
	qEeUvxcmudtfa7BKyfcr1wKB3S/J1fu2vTwmxM/60gNxjEFOZ89p5CkQt8uX4NB0OPRU47BsptEri
	Knk+PqsNjMSyPsDMRtxFZGPEL31KnJYBrbBhwMY12xYX3QaPJ1Ldn63bYusY+LkTP+M9jMxCP2YF9
	T9a0fNBqXIN4ELMjDwM3gqsZ29x4aYl3lbsC4IrPxJXOryHM5uo4IMwHHc2h0wrxzJUGNsM6RAAhq
	cNSDeF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk3Sb-00000006EBp-29TH;
	Tue, 12 Mar 2024 14:50:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk3SX-00000006E4Y-2nNs
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Mar 2024 14:50:31 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5135486cfccso5385988e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Mar 2024 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710255020; x=1710859820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=;
        b=UuKxg0BeD0CofVGL5rEhISC88/LknNPmmwu01wGnkZUmQEimJzL4RaXkMGCZTejwRO
         kcFd08ot7VtqGyweCHflcnBEmh80cLVr4NkVcIhPSTrnZZDRa//RTbN/ZxX/bEN8cZHS
         IpoqPq+Z/mO3Y2GV9j9mKlyZVVVt4r0SRkHjZV0bc9v777Xh+lW5cTheVfW2nIaJ7pWQ
         JAr48hn0jsovZ9yXjKWlAAA2BfyDDTnRxIJcl6Epbgd+UPNhStxzP5cxWIxx5iubz35e
         cvccWyzWws2mx1BCvkVFQst/TgfUTM2qBVfak/X6ZByskpit+ERXlizOeL9xyy0Jam69
         KrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710255020; x=1710859820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=;
        b=upfgQrfey/qVJujPf1GAriLlMofX5Da3QsWalikFLTjG57fFELGlD8t+XC50OR0ecD
         49gR4lt6gkZyX4wHKIaqBcokh9+WwIyCTjiBjk84EO3VYl3HOjPZV1zzL1ntRFEoGqNh
         YZrgUmp65rmhfmzlChF8r3F8eIs/+Oac8wDhGe22LIwvw5bMFSntA4Hy+bVMez2vmMRr
         qcToPdnEwGoCYGUG4QvKupWOcCmA6jew5cxuMWhRRX1wdphelc2eLuvx8aOHs9qZFZKE
         sy1ryVle8nxTf6AT6P1pOEX4mr6fMTE0xFHcWGx86Hk1TIND9CrC3h6qTRx1s68G+YUO
         FGow==
X-Forwarded-Encrypted: i=1; AJvYcCW9mTvOGa63CmNrJa/20UIaqFovhk/mAkqS1msPAQX6FI1xmN3h+jdloz/1w85R0PqML5viUAspMDFczx/MNxd3oBE18PNiILJsvhD6a6+i0sQi
X-Gm-Message-State: AOJu0YxnvKtTwwDtTwYziSecgnnPVxqonQ3N6UAJZlNHptjnuQ4mm10X
	WzSIYVgdViAFivAeG8/ZvwkmW3b4lyAcW5/SN+vUzaLGi4CsnT1LTMHyaqo0ITw=
X-Google-Smtp-Source: AGHT+IF4U7++EP6lI1eUA5YZ5DAJajTZAe48hL6g0In91UMupEHYzfMoae2xpi5b5/CBMmyo7KWbtw==
X-Received: by 2002:ac2:51a5:0:b0:512:bf99:7d80 with SMTP id f5-20020ac251a5000000b00512bf997d80mr6373397lfk.1.1710255019673;
        Tue, 12 Mar 2024 07:50:19 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b0041316e91c99sm12715808wmq.1.2024.03.12.07.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:50:19 -0700 (PDT)
Message-ID: <253b4b6c-d8ba-40a3-adbb-4455af57d780@baylibre.com>
Date: Tue, 12 Mar 2024 15:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_075029_783077_B7EE2B07 
X-CRM114-Status: GOOD (  10.69  )
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



On 26/02/2024 16:25, AngeloGioacchino Del Regno wrote:
>> +    if (enable) {
>> +        /* set gpio mosi mode */
>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, 
>> GPIO_MODE2_CLEAR_ALL);
>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, 
>> GPIO8_MODE_SET_AUD_CLK_MOSI |
>> +                                  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>> +                                  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>> +                                  GPIO11_MODE_SET_AUD_SYNC_MOSI);
> 
> Are you sure that you need to write to MODE2_SET *and* to MODE2?!

This is downstream code and these registers aren't in my documentation.
I've removed the MODE2_SET write and test the audio: it's still working.

So I will keep the spurious write removed for v2. :)

-- 
Regards,
Alexandre

