Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF6C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuvMTKrS538OQBDa2jdh/t6qnPEHbqMc8PN+mILzuvs=; b=yO0uebfVW89kEU7L9BxYP2rtub
	ed8RdmXdQ24rnZ+gqXiSXT3WQIGyVXECeXMdiWf0J8LljAHGKi2Rk4qSmWlaeUxHli10waZIENXKI
	pzkVlSeHVY/8Ra9851zupFp1ogIqacDq5hKEex6SyjBHOpK/ffc1WIFvaM9735ogrH4m1uquh7ikR
	IxxSKLy3MZtxgu+TYgHD041yHmZsl9xGRhnwuX3xL4zT+ZTeNZTaGAzaIk/oYNH6/c0NmQafMI2XK
	qMf8x9OxSiWIUzHGJM42XowYapaFOr/P6H5w3ToDHO/IrR0aMbYuYmki0CMZ3PIQYYZW03gw2drfv
	QAHKEiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0K8-0000000F90g-129X;
	Wed, 17 Apr 2024 08:07:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0K1-0000000F8nd-2EEm
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 08:07:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a526d0b2349so382337766b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 01:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713341215; x=1713946015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuvMTKrS538OQBDa2jdh/t6qnPEHbqMc8PN+mILzuvs=;
        b=R+hG/TO8wm5EJ++C7rV+Xok9hT76RpDP1MI/u0PtP4RNsxi3oeNeZOtt3atxchFXYz
         gvp2ihjJxuUkEF3Tf3dG1H3LI6MIIBHgj5Ha4g6OMAGEsc56FDb8C3cOlNFm9wdkk/OC
         28e9TCD5ZOUh/UJA3EG9Mpg6IRz9CgOg5kSxsgGDR+TGNedorhcH/ThGT15xxtiZgLka
         2tOtKwHP5YItxWjsx2+G4S0d2eywcHsqzTvJvrmWD54CoqR6MAq6KpHpIP1mdn7tLldS
         s5Ergh97GaOHjpvP8YYfLD2ezcC2Nm4hy/ny7ww75YQy41QIXAx43N64kZOw2jKzQ8KI
         OdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341215; x=1713946015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuvMTKrS538OQBDa2jdh/t6qnPEHbqMc8PN+mILzuvs=;
        b=wbIyLFyaZajv6e3kAGT2Jtvhz26KpedOfWc4gdu60jcWTY73uaYXyUcuxpnQE88VJx
         V1x4xE4YNAcN39oU+FaL68w01U9ba5Ay5q76M3/H1mbG0DTB7IqhgjFeyKKIaVukE/nd
         hVEHxLTJF5Bfnow/0jtHJFRGIKGmGRYNpeGcbfZUJafJfkXmUFETDJ/4jl+T6F/tJuUC
         Bj+sAUT21aF+QA8pN8WKd13ZCo2GfH6INiUXzof/v8f+jtlf483jA09PqGTUAi8C6AqU
         EPGO/ynvmYNagzgEl9Y9WK5aaXqK5AxsCsp2pZ7IwWEktPrm4k3r9lT7tH/r7yYCjiyg
         9a0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6rBJMIRT242r1MH4fYVJX4eWzt38E5iGtnIWOAcO81lqng+CqhazzBpESYxdBmQIwrWzghcF14A71zuUc997UjZxgjwTCtwiUIGzldRGVspi+
X-Gm-Message-State: AOJu0YwO9qtHu91D9XY3ZnOG3WgBGxhXJXfv9bazAQDUdOhCSCTeM8KY
	yssYG7VF1MQyYZ25vtptV2uwn/6+HGofkALk8+RrA2wOt1gwGVecyAfBvCNPAZ4=
X-Google-Smtp-Source: AGHT+IF9QNj2+LEOTDvCsMmUjHTc38pjE+FDvplPR3KiswRdx9pL2ELeUrxLu0thmtQsPq4SfA0PEQ==
X-Received: by 2002:a17:906:a016:b0:a52:4d96:85e with SMTP id p22-20020a170906a01600b00a524d96085emr6795036ejy.53.1713341214788;
        Wed, 17 Apr 2024 01:06:54 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id cx10-20020a170906c80a00b00a51b5282837sm7852622ejb.15.2024.04.17.01.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:06:54 -0700 (PDT)
Message-ID: <cd5dcc90-bd34-40d5-af79-4943883411ad@baylibre.com>
Date: Wed, 17 Apr 2024 10:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
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
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
 <22yeoik77sdhmg43odjftzjn2douq74zhxwy6qx3hsrvr53r5e@7w3f3zbgxult>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <22yeoik77sdhmg43odjftzjn2douq74zhxwy6qx3hsrvr53r5e@7w3f3zbgxult>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_010713_595730_B62836BB 
X-CRM114-Status: GOOD (  12.65  )
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



On 17/04/2024 10:01, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:12PM +0200, Alexandre Mergnat wrote:
>> According to the Mediatek MT8365 datasheet, the display PWM block has
>> a power domain.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> I already pointed that out in reply to the cover letter, so just to make
> it more easily to spot for people considering to apply this patch:
> 
> This is already fixed in next.
> 

Hello,
Sorry I've misunderstood the previous message.
I will remove this patch for the next revision and notify it in the cover letter.

Thanks

> Best regards
> Uwe
> 

-- 
Regards,
Alexandre

