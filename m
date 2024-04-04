Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC5FCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMRUN9l+VfoGtxFHya9Po4N9TdgcEu8Q1oy1tPF+5rA=; b=cGfxSDFKs03Ck+Pwi0iPmgzhbM
	+cwvHmB0k7bD97HR6q9Quk/4hgczkCV2yyWGRvIxgNmnWuSVinhuJPMGhJT71eTboL3MnwLGRzbPq
	LRjpHpTZefwvm/yw+nucqq2mxJtTzR+x+o5kg1++Ardp9AsOnViQtWxeWNe05XpN+sclxcs85/b4A
	iQAegIUxYVHVg18ykr9eULDFogdme+cnjQjHGqz4KqUU0k1e02/PB1fHRQKEZnSP/pHslmiML6mqy
	yK7k2SkZHObQjl6W5YrRouXkFXCMzalKqP3m9F+Zjx+f005b0kxRmTgXx8TaXOwRxYDXGMYBNmZtM
	UMYk1zbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsQpJ-00000003dqx-2Tmf;
	Thu, 04 Apr 2024 17:24:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsQpF-00000003dpu-3eSf
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 17:24:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4162b5ba2bbso5548745e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712251470; x=1712856270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMRUN9l+VfoGtxFHya9Po4N9TdgcEu8Q1oy1tPF+5rA=;
        b=K/Lcw4/atdDaDDEW6XAMx/h45MRJyr3KRkDmK0GPc0/xMDD/fOW03YGCGLbDi6ySLp
         l5zS6MfqZZHa8ZezpAJMg+1KVCirdQNbXI0Zf637bUm/PXZuZZd+AI58DFNN5zVpW7f4
         Cg45w3/TaIgt/jppaOOcVsTJ5p3W20VJClweCB0DyfjZtc1e2YRHlaYS+c7zjzvQl+EN
         mPNrObQ9ir1fvtwknmvVR1RbFN7IRVqrV25BdLgWjEimz/tRZU1owQ4b5MJn8cGN9X3M
         O2w/m0tEdX8qvfpV7z11/I2vA+tlHpYeQVNW5lyUZr4ZB/i7y/DpZazN4FvjGCZKnSwX
         LDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712251470; x=1712856270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMRUN9l+VfoGtxFHya9Po4N9TdgcEu8Q1oy1tPF+5rA=;
        b=nh5fTIEIkWcVWiXFK7WeQTDc5i18ZnU1ITtSVuFmT0V9J9aJBPteXDsH6u7AllidvW
         E3eapKJk5Z6LjOe4HLhWcUsP9GElPwbrC2vuyS1kdumtLeGDi+6WVixC0hCI3SEaHzAk
         DmljSC5Ez0DPv2g0vyBWcr/+Ckt3UgnCu5MZIaMxpdyeEHf0bDR1P6hdYXZgToqadM9G
         RQAx2HEFGLgonqgqI+hMHK1BrGkPBcUk3nciUFqhIlgvk13l43GwLnUJrr2maicrDshJ
         YHkbJVXEaIyG/qkGD+5ZGCvRloWsMoYZmb+DQeI1xo2DcrlazoQpFD6k1y3EwG3jJRCM
         gWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoVgfcM8AqVOdCjmh8A/agJIHlW6wOL8iIkvCurAO5VznH83kilzmIxmR6z8LDZZwCJa/gI26f5lTSs/JRe0ZThNgguZKn0q27rjoIMDfxpK+u
X-Gm-Message-State: AOJu0YyCO69tIqtSJrZB4bk8pmAa1i2LAzJ4hjg4TzZHU0vJxhfiVlmD
	IHpcR0JiPz8lJOYwcfIy9uWn/+dIhXnMbHCCVHGjZy4WiMyA1F3GaIyl46nXNjs=
X-Google-Smtp-Source: AGHT+IE4boo6HQ4hVEl/BrDpnnKeh7HMhmCrytjx3SWcfCIE5a1NSzUPtd7NSje/QG2KwonuZjfICA==
X-Received: by 2002:a05:600c:1715:b0:415:4a83:88f9 with SMTP id c21-20020a05600c171500b004154a8388f9mr2313387wmn.38.1712251470293;
        Thu, 04 Apr 2024 10:24:30 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b004162678e48asm3371560wmo.11.2024.04.04.10.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 10:24:29 -0700 (PDT)
Message-ID: <ec287dfd-846f-4175-a010-191022dbf444@baylibre.com>
Date: Thu, 4 Apr 2024 19:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8395AV/ZA
 Genio 1200
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com
References: <20240404082056.93454-1-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240404082056.93454-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_102433_953718_A1A94376 
X-CRM114-Status: UNSURE (   4.38  )
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

Great !

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 04/04/2024 10:20, AngeloGioacchino Del Regno wrote:
> Add an entry for the MT8395 SoC with commercial name Genio 1200.

-- 
Regards,
Alexandre

