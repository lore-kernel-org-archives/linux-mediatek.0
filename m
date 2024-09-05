Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDDCD4F5B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXkGvmrzjaju+FFxdQOqUz86ayxWamYskoaBHAk4gpk=; b=SGFz+5I7b8br93dVocdXvQT622
	qWVMmtncAkBau5+cMJYYNhjcFMlCEtJhvgPYmX4jIb9a5ZngYMMmpaVeA//Cr4wBS+aYsNIoZwRIw
	xEbTk0Zn6RcOXMAqixGpYP1vGk3N7R/dnpnIaD5Ddvm2loyRtb4M1X/eoNj6NulxVld5s3n5EHsgr
	/aDTFpVEdy8qp4/LSBgkddR0bTpH4zgqzspJEW3fZ3LLYGdMWRZsdYKJwLFZqeB0ZpEWp4f+uRGQf
	z1Te1i9loleE381TTVYt4NP61Kmp3SGmcxfxXZtFEne2inij+26+8osFuM47UIAxQDf1LxA+VvkgQ
	zPTyqHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Qr-00000007gJo-2Y31;
	Thu, 05 Sep 2024 09:05:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Ql-00000007gIV-3yg7
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:05:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374c7d14191so874121f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527130; x=1726131930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXkGvmrzjaju+FFxdQOqUz86ayxWamYskoaBHAk4gpk=;
        b=SiuksB4O1NVjpphMvBryDlPg96XN+q6CKXBuiXpbqrKkiS2A2Uk4mxJGKah3H1HPI1
         Jf7KyeBVTlGEer2YK3/9TmxjGPRdojGxueokqHqAxlA2NYh0oKwqNzffR23jjiUenFP1
         m8K/emFwcuZE5cgjudSTb7WkiJjbGwDaeSmaNi5ysJpQkLoyHwKJyAmR6AZ1HTcuDtlM
         +DHqMiFQkMfY6a2Y/LhCeAU8uGQ2MV2C/VZiYRM0ItUJZAInBfmbdBCsfapUXWqRNumo
         57TgmBP4/Z90c32NPwtLIotqrfSH/bSwbAcUF5nGFj6chbgmnCWkDSpPC0dvs8NmD1Ho
         pDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527130; x=1726131930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXkGvmrzjaju+FFxdQOqUz86ayxWamYskoaBHAk4gpk=;
        b=r5lYJDmzVkTLpH8p/4DNkLtddnu94lqIocWjWWTX3RrxprDCWQ8CSXni+I4PFpn24e
         zt81dm6N/EI+oeiCYNIYrd+35DOiSLyQyNO1xwZwhvvMGa4UQ39oSI+rDBbwUEf5TkyJ
         bovV5UMg/PC4hEcBkaK9wYTPV44j3008E5fvyDGxr1cMnOmRMAlSfCeidLQAzQfR0Hs4
         wxwLl9BCmL6o84CZPHjTm3LFmvK3NK1jcFXSnbG9Xcl+/th6QbbtkmHlGPm8qDr8KtXS
         D3RitYTV1Uv95pXl4OTxO+xPILH3iVcvHXUgNGByum66iTvpLhTYX59fg7vweT0yxxj+
         76eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSbvP4JSk5hd0cVILkFndafFoC1Q56UU4dLxRE1mdolwc0Aflwwobv8JOEYGEipIehjwDGAZEtiWfBnXKixQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP0ZR736njcRm8dUzO4YaPhjKisR4wISWkuo8VKRKvJxcVvjtZ
	+6VhR3frX0Kz4wBECzKxQp1cy6YcjpVeNKD1NAjL8iR/yh0eB67jmDxwcW1zKGI=
X-Google-Smtp-Source: AGHT+IGs8OizwWXd/YtOsSddAZr8iCEdLMOuc1WNos7Odi5UIAAcNaDDCpxTzJfQ/Nko5h3HZKUMCg==
X-Received: by 2002:adf:e709:0:b0:374:c57e:1ea9 with SMTP id ffacd0b85a97d-3779b847aaamr3083162f8f.18.1725527129762;
        Thu, 05 Sep 2024 02:05:29 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-375348df4e8sm7155523f8f.115.2024.09.05.02.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 02:05:29 -0700 (PDT)
Message-ID: <62bc8ee8-f23e-4cd3-a77a-74cb19e6530e@baylibre.com>
Date: Thu, 5 Sep 2024 11:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/16] ASoC: codecs: add MT6357 support
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-12-6518d953a141@baylibre.com>
 <c386c74c-9008-48ea-ad79-524eb85c370b@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c386c74c-9008-48ea-ad79-524eb85c370b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_020532_016596_82DFDA3F 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Sorry, I'm gonna send a V8 to fix this ASAP

On 03/09/2024 19:14, Mark Brown wrote:
> On Mon, Jul 22, 2024 at 08:53:41AM +0200, amergnat@baylibre.com wrote:
>> From: Nicolas Belin <nbelin@baylibre.com>
>>
>> Add the support of MT6357 PMIC audio codec.
> 
> This breaks the build:
> 
> /build/stage/linux/sound/soc/codecs/mt6357.c: In function ‘mt6357_platform_driver_probe’:
> /build/stage/linux/sound/soc/codecs/mt6357.c:1824:55: error: too many arguments for format [-Werror=format-extra-args]
>   1824 |                 return dev_err_probe(&pdev->dev, ret, "Failed to parse dts\n", __func__);
>        |                                                       ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

-- 
Regards,
Alexandre

