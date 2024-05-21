Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7F8C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHmH8MqnzRmRTFIkbLl86U1otQxMDzFVgNQ3IvUNMY0=; b=MVV3TyXoRTxSP/odET9iy3GBLi
	i7Npyv+W8tC8Wk8tWB2FPwQ98j6X5bAycleMopmG4D5maCTQ2msCixoK/QiMapV3u7D9rgIyg0ABw
	Z5EJffouxRz3tg0wQBja/T+HPAvTR+LOPEl4Eea6oW9+pVAJ/SFUSRg0Shav4y5OQd74FrsEyPiae
	26asI8u9lFuwauKzV0eHCJ1Rujy/MnV2W4NKbfsF5hEkVq281pMm6dst8mwNhfmvoE/zaHvYDmXi6
	OjDc4IWQgLV03+I0S81FNfoI4bAcj5yBCYcUjbMJlZEJBiFfPh+blOjPhDC9JVra9DDTyx9xvOBYb
	p2bx/i3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QGy-000000008Ix-3Phf;
	Tue, 21 May 2024 14:15:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QGv-000000008IM-2qs8
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 14:15:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4202c0d316cso19743585e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716300920; x=1716905720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHmH8MqnzRmRTFIkbLl86U1otQxMDzFVgNQ3IvUNMY0=;
        b=DgP8N546si9n4X6cQj5FBKcekBHwS9ev86ys/1eLpNX4r8hZr2+rBmiTjcKgBJlLy9
         xwAmzZS1tkvHlvNsfyBomahuak9uat6kc9r8nMURrYszC3KmOYUZkih9xfZ4WbmbQZqw
         CN+bRCuApdVbcLyQ6JolIAOswhUWnY5QNKbmgLTp1/6d6dgPd/nHh5aiJy9XasYE1h7Q
         C19OoSe1B8xq8LbFLUquAOMzSQpcvbtrLBTyypJDQkaB12dMuD5zpNeyAXGDNA4Ki6Iq
         GAJvDOGbbBk7FEdUyxkz16gV5l/TxHz3SZ3/wGc5fp8tVMNc7KrXqw4UOFY7xDk/Rk4U
         X9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300920; x=1716905720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHmH8MqnzRmRTFIkbLl86U1otQxMDzFVgNQ3IvUNMY0=;
        b=XEQxfk5UcMQBF6m46hLabvROYLZjcrhDX3ycjuo+gJnq5Xs0z4jSigQv/mxFLkpAW8
         augFcy+wnEwsYx8C4PpIsjwuPoLJ2MX83xD/ZucEWczP4n9cmaCF6usPMIYRzkDZX7Xm
         RNKRvH9ynaVVc3wWPJtohOQ68zLdlyzay21zLyrzc3OuzbpSMU1vLh0pJvalEOSAGkxY
         Fgc6ycKekfdJo5Itb0H3Jih28QjSfhLC5dpEF58Bms0aDhm14GUDbote/EqabUFLFgNd
         6bGUlztaWdvwsfqSAd6XCr11ZFmn1JKkX/G2qH0N5QXUoKCDYPiBjVAO9wBL7cTV1Ull
         1pcw==
X-Forwarded-Encrypted: i=1; AJvYcCWkTSJ2iJ5FsE+INa/Ta47uQcV8hRwFTXhUQF+mHs0mlRO2eHirQ8U2qpO4QnyneRLAaAFUybtXPRuRDTq8opemxqHbdpx/MuTurTuNLthi+MIh
X-Gm-Message-State: AOJu0Yzx1MMtb5Hn5456/l6WCPpFZh1yUJS75an0Er2jp2YVgIyUGpzm
	1WVzczGK1WUAmSamVl6RvreBbR6o6+qVmLSPyOvUdHZGK2XlXwSWfYfjBTDF4pg=
X-Google-Smtp-Source: AGHT+IGynb6ptfvAMU7FyntE+5C5J+L3RDqVBUz4ZlqwSEeION4wGOYacXvpwT0hTDAirBSDcrAuFw==
X-Received: by 2002:a05:600c:1546:b0:418:3ea8:46c0 with SMTP id 5b1f17b1804b1-420e1a2ff5amr82101115e9.13.1716300919774;
        Tue, 21 May 2024 07:15:19 -0700 (PDT)
Received: from [10.2.5.115] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42013b4e9aesm358546195e9.40.2024.05.21.07.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 07:15:19 -0700 (PDT)
Message-ID: <d8fe0be9-2e2e-4111-938f-e9132b96273a@baylibre.com>
Date: Tue, 21 May 2024 16:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: mediatek: mt8188: add default
 thermal zones
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Nicolas Pitre
 <nico@fluxnic.net>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <20240402032729.2736685-16-nico@fluxnic.net>
 <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
 <02ac5b07-08fe-4abd-8db8-141f4e47f68a@baylibre.com>
 <26f1f9a6-46fa-4f86-ba46-eea454ba902f@linaro.org>
 <f1cc27e1-1aa1-4495-8773-44a1f605be47@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <f1cc27e1-1aa1-4495-8773-44a1f605be47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_071521_752498_D0147558 
X-CRM114-Status: GOOD (  22.22  )
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

On 5/21/24 16:07, AngeloGioacchino Del Regno wrote:
> Il 21/05/24 13:31, Daniel Lezcano ha scritto:
>> On 21/05/2024 13:10, Julien Panis wrote:
>>> Hello Daniel,
>>>
>>> On 4/4/24 17:16, Daniel Lezcano wrote:
>>>>
>>>> Hi Nico,
>>>>
>>>> a few comments about this description.
>>>>
>>>> On 02/04/2024 05:25, Nicolas Pitre wrote:
>>>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>>>
>>>>> Inspired by the vendor kernel but adapted to the upstream thermal
>>>>> driver version.
>>>>
>>>> [ ... ]
>>>>
>>>>> +    thermal_zones: thermal-zones {
>>>>> +        cpu-little0-thermal {
>>>>> +            polling-delay = <1000>;
>>>>
>>>> Except if I'm wrong, the driver supports the interrupt mode, so it not necessary to poll 
>>>> constantly when there is no mitigation. You can remove the line and everywhere else.
>>>>
>>>>> +            polling-delay-passive = <250>;
>>>>
>>>> As little CPU, 200ms or 150ms may be more adequate.
>>>>
>>>>> +            thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
>>>>> +
>>>>> +            trips {
>>>>> +                cpu_little0_alert: trip-alert {
>>>>> +                    temperature = <85000>;
>>>>> +                    hysteresis = <2000>;
>>>>> +                    type = "passive";
>>>>> +                };
>>>>
>>>> You may want to add a 'hot' trip point in between, so the userspace can be notified and take an 
>>>> action before reaching 'critical' (like unplugging a CPU)
>>>
>>> There's no "notify" function in the driver.
>>
>> The trip point crossing is always notified to userspace in the core code. It is not driver specific.
>>
>>> Do you think it's worth adding such 'hot' trip point, though ?
>>
>> Having this trip point would allow generic trip point handling in a userspace daemon to do an 
>> action.
>>
>> If the userspace does not take care of this event, it won't hurt.
>>
>>
>>
>
> Hello Julien,
>
> I'll push two series tomorrow to add most of the power domains (all but the
> img_vcore ones, as those require a bit more work), the two vdosys and, more
> importantly, support for the GPU in both panfrost and the MT8188 devicetree.
>
> Actually, if it's not tomorrow, it's going to be on Monday - though I'm not
> sure why you feel like you're blocked by not having the GPU node in there.
>
> Cheers,
> Angelo

Hello Angelo,

Sorry, I sent the v4 a few seconds before receiving your email. :)

OK for the GPU support, thanks. After that, I'll submit a v5 that will include
the related cooling-device. IIUC, this should look something like that:

cooling-maps {
     map0 {
         trip = <&gpu1_alert0>;
         cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
     }
}

That's why I need some 'gpu' node somewhere in the device tree.
The build fails without it.

Julien

