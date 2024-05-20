Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2F7C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aASBHYEJ2GmCl53uLDmFJwacwwec87xHdsVfr2Oydk=; b=M04snjn7hH10/nUMp8mPcSJWIA
	eLziFLw44OGf6PWOjaqG6LTz0YBPBlw7XCo/PrmG2sgu8TgQyz9mofTdN/y38+xFf6fmkJttqSuk2
	+HKkbNspd2zmbhmA/qMLc3JXlIyAh5qR3oYL+jeIEfNeTK1eDWdaXMr6WBDokAkPa8HAV4yTTRsfv
	ICOU8wFKjWSwwdKRTcamTvMnac9ePr8dfa9zIogPeDaTmJ6sLtF/SN4DxVgMUS7sJiMKFatINr5J0
	2i+4gkWFN+tX5IuecHLIONVDCc5PUTLaxw7lhbpx+RCw8HlHM9320na8NLSSc2DdpsNj+nxA9+Xjw
	j5HJceig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92va-0000000EZ5R-365E;
	Mon, 20 May 2024 13:19:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92vW-0000000EZ3P-31eC
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 13:19:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-520f9d559f6so5270315e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716211180; x=1716815980; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7aASBHYEJ2GmCl53uLDmFJwacwwec87xHdsVfr2Oydk=;
        b=kJhM5CJgBb9AmMhQm39sDzGmd7eFKFySoTB4vebW3ckW3tOH+eolKAr2dlFyopF4m9
         P08/pr4NojexvUZ751YcfPIWeubIAOwtRvFvnpCUwAWCzp+1p5IHFROSnX4j7Bv6evA/
         lS6Sf6FL5GYzSRedXRLUUviJ8T2DKrq2+hXeHuUsWLndmzvY5GEy+dLMv9bsE0J/90BM
         HTqO5RHrOeWNKiLXp+0h/A0aIG1aXxjhYGOr+PkNjugFlZ49cVqprUqzJWoZds1cDh9u
         5AZ/zJZp4wksoyf5nhr+Ms/tB6U9Z/bt0ALyv9gV+3nzpJrDoUme6okHPLkfDIVB+sSB
         p6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211180; x=1716815980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7aASBHYEJ2GmCl53uLDmFJwacwwec87xHdsVfr2Oydk=;
        b=Y5OO2t9E7A+1YKumFe8DvwUWOp75YK1oovj2OepDAgZjf+0GU3JjODJi30Atn6y1xH
         VbiHG+vWV8a8wqDI8K8OQHpQyLUbb4t4jQrAlSo52p9+9cm6IsCjH/JrZah/BPJclLlA
         jJ0OrOhMDNx5ITLo/3/Q/8O1K/nWxRZ0kiE4HGedkGqujV/CDP5+LieKPWaHvOEjepq1
         wF7t3dwCjdP5nckhotDjC748GqwbF27NNFi1KFWjrbBnWFdajpSLS1nJeOWUMu52qhrR
         Krc9TzXhLkNJw8K1H15yg3vYpa4WbazmfaCLOTjjVRfg2JtyYojobRGCG/AIhMvNbgSI
         +/ow==
X-Forwarded-Encrypted: i=1; AJvYcCWbFthb2ptow9mx32PODnZJTiDZRmA/0SXI43RP6Oh3uXsLbxX38K8mwFDG/3vGt3L/77LCCL8C1K5n+HxA/YG4dC6jF7CP6RrEV9fLZuF4eLEa
X-Gm-Message-State: AOJu0YyhA4+c3bBR0x1gq5SVdw6lAn0oLweHqeo+7GC1IwjzrKwW83+G
	vaNsDIKtoAaF5lmhyOtA7bY2BLs6+dUm2WuNidI5rk968GGhEMqgaKPVMHMJ2dI=
X-Google-Smtp-Source: AGHT+IHUPykzDKwW1LbytWT4wZMwyTT0C5peIVfK/LqhFmf7eVbVhlrgRZ2xa8GpF4TZkCY6CYmKhQ==
X-Received: by 2002:ac2:5f49:0:b0:51f:b781:728f with SMTP id 2adb3069b0e04-5220fc72ffamr15400487e87.32.1716211180523;
        Mon, 20 May 2024 06:19:40 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:433:4e00:3518:6eec:d551:4012? ([2a01:cb1d:433:4e00:3518:6eec:d551:4012])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd4fsm29437399f8f.7.2024.05.20.06.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:19:40 -0700 (PDT)
Message-ID: <aa4c1439-bf9a-4710-b534-27d5f845e6e9@baylibre.com>
Date: Mon, 20 May 2024 15:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: mediatek: mt8188: add default
 thermal zones
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <20240402032729.2736685-16-nico@fluxnic.net>
 <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_061942_783552_FEE8D021 
X-CRM114-Status: GOOD (  15.23  )
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

On 4/4/24 17:16, Daniel Lezcano wrote:
>
> Hi Nico,
>
> a few comments about this description.
>
> On 02/04/2024 05:25, Nicolas Pitre wrote:
>> From: Nicolas Pitre <npitre@baylibre.com>
>>
>> Inspired by the vendor kernel but adapted to the upstream thermal
>> driver version.
>
> [ ... ]
>
>> +    thermal_zones: thermal-zones {
>> +        cpu-little0-thermal {
>> +            polling-delay = <1000>;
>
> Except if I'm wrong, the driver supports the interrupt mode, so it not necessary to poll 
> constantly when there is no mitigation. You can remove the line and everywhere else.

Hello Daniel,

By reading at the comment in the driver, above lvts_irq_handler(),
I'm not sure actually. Here is what I read:
"The interrupt is configured for thermal events when crossing the
hot temperature limit".
IOW, lvts_irq_handler() is not meant to notify some "data ready"
event, as far as I understand.
Don't you think we should keep this polling-delay ?

Julien


