Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6068C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Nti9hv6DeyPKfJj5p6BSfYPiwYGhxhttJgua1AQjnM=; b=3+pVgu6BCRXABHi/kpElqjD4dV
	uKVcOhvXsbZFrcxDM0Dw0Cfa4oh39gO5E2nBUo98F8jgzL0o9eF1td1GR1inkGptkfIXs83cHAbRq
	5x70Ge77qXAlvWgMpZokandp95hqPtElGOxk0nFC7edTsu2ntQS+pZ8RN794dzJJs58+67rCtzj6m
	UtKGMT5tluSaBE8b2YSgUOooPcRAQlNgH38RgnqWwUrcHhRvrJM3/uYDKJ7ArtdD9dQjEIF4NAw5U
	4ixSydSvxoi0ZOtdNF1KYH/qMH/0LQtcPalag20SMlgNWGQWf3sKC8PZk4VkpVp/SOsmMSw7NgrCt
	KLQmeFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Ai-007nfJ-FY; Thu, 25 Aug 2022 06:16:56 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR69D-007n3g-Us
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:15:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bq23so17845064lfb.7
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3Nti9hv6DeyPKfJj5p6BSfYPiwYGhxhttJgua1AQjnM=;
        b=qEkujIEiAGOsvsa+AZMtnZJSHXCDxAxY7Y/fPg6MN6K06AhRrf0Ifzgscpjl/WUBQc
         yHtQ3lS79ivsiXdlUee54uzNS5zpVtLsbybCLHGjT9Ir6BlerPw8HOSKjDi7kLtcZvGL
         I0EUfGbLnSw5YwthZFK2RpHn6x9ZzYnszG81/kPUxEy2knM9xKqJOBSC3PEZ3G83GVlO
         wdvGwH3S3Ax+XXMOzBcl0Jfrc6lCpFSRiRmlCcBOgfaN8BGHp/Ffjjg26emEJ+EjgwPH
         N4PjpMwEouEpz9nYpv5eQo6ldifiqsYJ+/DxiXr75Ifbvb+BhamuKugaTgs5KU8W33/8
         yuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3Nti9hv6DeyPKfJj5p6BSfYPiwYGhxhttJgua1AQjnM=;
        b=7J28dpr/3AbNG4ZbnBgTCPHGcg/x8O1dQ7fF/kyaWoYAcUQs02b8OakqJNRTrHjw5p
         ni0SyFtDgzaBlBimbYhJtoMH7YAWKhQS3jAVeiRVwVFExagOVShqWDaaN8IMmaYM6RVI
         dF4QxTi81J468QxJ1DOrH/TjfCPomWPOjNcjD5vi4A7YHjtY7BzkGwKCOhcQN+K0hpj/
         DkPFc4lyrnuhm3rLR+E1YI7pmzgotJhxg7swIlV8DCnmG+tCrGGEgShDGUZ2+b9q5pik
         KEyYkQNsmQWZ9KQVu58/DSOreXP+XTIJoE4B9qwVNl7ZvSiVO1fdyf+a3Wd42dCf8egT
         K72A==
X-Gm-Message-State: ACgBeo2z0FQAastQx75FqQPUPtgb8j6RLlFG5aboRGseb901sSiZso+q
	vHEQhMNilgNW9S+W2VlUG5wC1w==
X-Google-Smtp-Source: AA6agR4tiaowhUIgTlsa8a2jWIDtSbCYO5nt3pM1ZBue2+MYGKUaweFGXAu//9a9AXmDYtCozTtkqA==
X-Received: by 2002:a05:6512:4012:b0:492:c667:c899 with SMTP id br18-20020a056512401200b00492c667c899mr645201lfb.48.1661408120185;
        Wed, 24 Aug 2022 23:15:20 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651234cc00b0048b37d29256sm322714lfr.63.2022.08.24.23.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:15:19 -0700 (PDT)
Message-ID: <aa76756f-6f0a-0342-c654-5fb8fee54bcd@linaro.org>
Date: Thu, 25 Aug 2022 09:15:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 1/7] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>, Daniel Golle
 <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
 <20220824104040.17527-2-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824104040.17527-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_231524_068993_DC690017 
X-CRM114-Status: UNSURE (   9.71  )
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

On 24/08/2022 13:40, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Stretch descriptions up to the 80 character limit.
> - Remove lists for single items.
> - Remove quotes from $ref: "dsa.yaml#".


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

