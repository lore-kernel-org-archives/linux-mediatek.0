Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F08C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjXUkXzHmLJkLJqGLPZFXqBqkIkhEgvZocnaDYnUcUg=; b=csld7xK6thM80z5flEiUBILjSi
	/S7tpBSFuALVXVZl9Vm/9XfCu2r7WgWwmjzIW45HqLCVQkqvN9dGwUd9+KN0o8yJnmbAOqAsYfFTS
	/TZi3Mk3GG1yRK4a+Xji1XMFMxQwJlfVkVAA7AnFBRedINu9rDOw39KtVwOPD10wFzueDGyes7hY9
	reZCxChzYil9GSYAkRyVNV9zZwxchQJjJ6+lo3nHaSdtChw9nQ4QN6KxpWTs7+Ym3W0RPMC0OakhH
	8vJ5Cgqt781ZHuCIGztxMdxo2ZGl8J4BOP4FWmV0NguOQXrMLonOd4/U/ItVAWe6yOqKIwMMMSnYX
	R1qqkG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMfs-00B8Av-0Z;
	Fri, 12 May 2023 06:54:44 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMfo-00B89y-3C
	for linux-mediatek@lists.infradead.org;
	Fri, 12 May 2023 06:54:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94f4b911570so1514037866b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874478; x=1686466478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjXUkXzHmLJkLJqGLPZFXqBqkIkhEgvZocnaDYnUcUg=;
        b=NNUd1P4piw1vL7STEfyXPEakse7eOF1CEYsj3zx6+aoQfc81g50Hb+o7tN9yPC/xZC
         7SFeVpqQjfnzWv8Q4l8DQz3L6yj8SeEi7QZKDAkcDBL3qL4dP1CC7bEEGXbabW6IYcEW
         GaYkg9UsrmgR81loqen4dwEByQQd0eJFgAgPRZWXGRSdFiqcy1N+CLa+HYSMQ4/Lck3f
         uhDLT3aZBK09/iBP9STeIhdx3PYHvG5aWvOVjyxo1UAhWxDE0LYtHVdqyDLDaUCZFY01
         dsKJydZeU9Wl35NAPsig8FlcQxT0j/bvfWmulbF7sNEm4RJJS7Ajt/YeQdEXtghwwRR9
         pFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874478; x=1686466478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjXUkXzHmLJkLJqGLPZFXqBqkIkhEgvZocnaDYnUcUg=;
        b=Q3ufRb3VuWhZuvVR3H6wUoSJJExK5Pqmr7Z0DB/KOnnZ94EjXH6S1vxVkX4IkIqCYw
         4wkG+Zv27e0aIIAOriWNvoshsliQv38gEOFt6CmAIhzd0/sOsn212YJdw5Ht6VYGl/HV
         v054Z8wIzb5PywJBnoGCFHk/E+zYq/u2ZN6toHXKM766tKSeM9eFGltHRq9dxJIoBKOv
         ONt86Q6B/PeGyN054ysm8UQwHbaf5WpWqBpJhkVcadFiRFaOuRHPBwT3RNUrpm6hEOaB
         wgBRxpHjmrrWpEoRfXZLf1AUzc+q08y9QDONyBFK/BVqUS9EnNgiw1xxGS6HK8oM/h1x
         2tRw==
X-Gm-Message-State: AC+VfDwa3pIxaTQJDYlw6tySelsnoz+8I/A36YWcXb4WI1+weUrWlmn9
	1pog7tx5USmG6B3oyVovyH8kVQ==
X-Google-Smtp-Source: ACHHUZ4yy5HgsrY8PHBO7NaE2kkMJm6oRaQhNMbX4qWxwK89SLe2e4ju+bwDOzRDTJUx/bMnGgBdrg==
X-Received: by 2002:a17:907:3f0a:b0:967:21:5887 with SMTP id hq10-20020a1709073f0a00b0096700215887mr16008252ejc.40.1683874478238;
        Thu, 11 May 2023 23:54:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id k10-20020a1709067aca00b0096a1ba4e0d1sm3386641ejo.32.2023.05.11.23.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 23:54:37 -0700 (PDT)
Message-ID: <7e8d0945-dfa9-7f61-b075-679e8a89ded9@linaro.org>
Date: Fri, 12 May 2023 08:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: arm: mediatek: add
 mediatek,boottrap binding
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Simon Horman <simon.horman@corigine.com>
References: <cover.1683813687.git.daniel@makrotopia.org>
 <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
 <55f8ac31-d81d-43de-8877-6a7fac2d37b4@lunn.ch>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <55f8ac31-d81d-43de-8877-6a7fac2d37b4@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_235441_034834_86E2E23C 
X-CRM114-Status: GOOD (  13.39  )
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

On 11/05/2023 17:53, Andrew Lunn wrote:
> On Thu, May 11, 2023 at 04:10:20PM +0200, Daniel Golle wrote:
>> The boottrap is used to read implementation details from the SoC, such
>> as the polarity of LED pins. Add bindings for it as we are going to use
>> it for the LEDs connected to MediaTek built-in 1GE PHYs.
> 
> What exactly is it? Fuses? Is it memory mapped, or does it need a
> driver to access it? How is it shared between its different users?

Yes, looks like some efuse/OTP/nvmem, so it should probably use nvmem
bindings and do not look different than other in such class.

Best regards,
Krzysztof


