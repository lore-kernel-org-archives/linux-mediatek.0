Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E449C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=; b=2DBrEqWS4MoHouOpBuC2ljSMrR
	Voe/JCk+2drYiGSBbvrGvH6Pfvj2u2/M+2fM6Uq3wedvjQGZNGa0rL8O2P/L3p59JTI6F0BYR9+ki
	8MHTxy9F91YULINtqmeXjTqUGVe1ExKgAJC8Lr/ypQgMHlf5MAsE48Yq7SHqdAp6PYbrOcr/Mok6T
	mQkgRztw3LbOhgge8QLvcg7ZTk6cA1MXOWrfCh3fOSlQzNPuF6d3jgLwg71+q7yCX5138rD/L7H28
	GayV8WhRd/fHNCjmlAGAjAX7jgKlHvzEDwLX+3uQKZKrY+pr7HYrFTzw5Jg/MBRkdkO9ZWqiMy3OW
	7dzbFgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0P1-0000000F9rv-3Fi3;
	Wed, 17 Apr 2024 08:12:23 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0Oz-0000000F9r7-1P0J
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 08:12:22 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516d6e23253so5890041e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713341539; x=1713946339; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=;
        b=tX4Zz3Xgp6/dtB7/RuqLV5A1mjY6Xa/XNckWwc+Swkmr9Q9czXDqVgp8AyanXVJ8Nm
         X/v7vDsO5yjlgPOskdGNFkfmwK2kqC+KX3+bSkFI7icaja9McCsawtUPibQsZIaBaUKF
         T7nYtzYZKQ6XkRPwhdwcH2vG46Vf3kC/zzz5CLCOZQoZG1GUVlwpI94y/NhwnNmkTmjD
         U/QQ6stDtkkEl+Wy44MQdA0Oet90bEABgu0HPR0b7K1TofiGAjRnlbhrw7erKQRO+WEr
         3icSHtDbgbO82Mwe+QIoEZBUCbDVemu+Zfa3RcjJhZ3YYJlK5cbBFsRfu4RzbhOgV0de
         Bx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341539; x=1713946339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=;
        b=w8Diz8MFn5LsiyIl7z0rT4L1arBsibVEoXvMhyB0j+Q5KVkoRtLvMU+R1WxteVeagP
         34hSeQx8qDQuRjNkhfJWBq1lSM8qxk3AjxGvY87Ehgjkg5X4XLNxuop8tbz6YtlUxZ6S
         +uROpNT4YnXoDuByPg7VlIqTW0/CpXZzp7JuJZE855ONklbM6oozO8HP9s7rJSo4AgeI
         YaTAsSCAg5IGRVMnpOto7aHTIesf5rfQ0YaBiT5l4Ymcp/2jzvjGLGdmtq9kwHp/pVM6
         PaHwJqto+RPYvf4unLKUOhjFJHDlb5BN1U/6XI9gB3+TGS9f4WPbIOL9QMxALfG8cZqB
         L23w==
X-Forwarded-Encrypted: i=1; AJvYcCWjqaUKCuWQYHJM23kUoGLYdt+l4p0GOP/uanjD+HvGOQQJiBssT+FQDmRTip2quMIPJquAgz3Ki9iqf+/9JgDpROtwFGw6pj0ZQZ/hUbfDj4mC
X-Gm-Message-State: AOJu0Yz+qJiThQPqPsCfVO5AJhmZTK3SH/vxac0IDg5eVHdJ2y4avqg1
	eVm8DR2bQKxelDN3aFY4UsIFBc8E7qJ73xuERSRHK1lFLVhKnXDMY57wy6wYvJg=
X-Google-Smtp-Source: AGHT+IH4Ux+OgM8GODN1EjrwY/h8hAJyaOMv9iN+0tmp9IOucYOjlUfi/JOumwmy4S2/VC/nm5QgBQ==
X-Received: by 2002:a05:6512:1106:b0:518:9183:864f with SMTP id l6-20020a056512110600b005189183864fmr15160417lfg.34.1713341538799;
        Wed, 17 Apr 2024 01:12:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7db8a000000b005700ef75274sm4950049edt.33.2024.04.17.01.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:12:18 -0700 (PDT)
Message-ID: <5c2a1b27-5602-461f-abe2-1b65f8245d8f@baylibre.com>
Date: Wed, 17 Apr 2024 10:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Add display support for the MT8365-EVK board
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_011221_380115_A11EF2C9 
X-CRM114-Status: GOOD (  11.89  )
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



On 17/04/2024 09:58, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:01PM +0200, Alexandre Mergnat wrote:
>> Alexandre Mergnat (16):
>>        [...]
>>        dt-bindings: pwm: mediatek,pwm-disp: add power-domains property
>>        dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
>> [...]
>> base-commit: 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e
>> change-id: 20231023-display-support-c6418b30e419
> 
> I cannot find 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e, neither in next
> nor in stable nor in drm-misc nor in Linus' repository.
> 
> For sure it's not based on next, because otherwise you'd have noticed
> that the power-domains property is already documented there. (Currently
> as fb7c3d8ba039df877886fd457538d8b24ca9c84b.)

You're right, this V2 is based on v6.9-rc3

> 
> Best regards
> Uwe
> 

-- 
Regards,
Alexandre

