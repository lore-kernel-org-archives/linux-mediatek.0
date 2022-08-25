Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AFDC28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCeRgAr90AjP72BARFiQs5/0imRongy9yblqwBgpMJw=; b=tKqA3sZHJXJRWKi/f8EFZZEvf9
	A0VFmUn4Kw2wc6dsMQOtMfqtgjXdrgzYcZAYumw7X7BFxMpptDpEeIUmeztn0wAOaWpiS/CfClbU9
	9L3FkoVcX+/C/6cuLZEr6Fw6Ze9ZiZVFrRDqDaypH5bfEIJmUdBCOS/hGVK0LDhu2m6sqBSmBX8Lj
	A7WUoaLI9dPDzW7dDDJFjrhQVx3geviA8g8PP/ROnS/orav2bnrc+jIBFroJiJCr0ke1rj3Q1jKc5
	ssDJHEG0fStbeZKtBFFVypC0SUI1vjEw1Y917VFuRoU8G5TgTjaQZjbpfFQysY/pv7pSz515PlMQP
	OfrY5mDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6ES-007pJF-TF; Thu, 25 Aug 2022 06:20:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6CR-007oLq-D9
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:18:45 +0000
Received: by mail-lf1-x12e.google.com with SMTP id d23so22542352lfl.13
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LCeRgAr90AjP72BARFiQs5/0imRongy9yblqwBgpMJw=;
        b=c3RlXRDaCp4vYWxqcyLpXjoAHiDJ0wrIIcONyeaAraWpAjQYEC51alebj1AQrr5xJ3
         0JCZnlpUQtsKJjJiTgWDccNqR6NMnrbXCDj6LAnTJ6rw9OFPRtR5zWwLrhJFNhECVhBz
         UOunN4yWD7EJvjCey/CBpxxnCxhmToSfFIgqj4U0BuArgrJYUp+NZ8aYfT5EZkeTBjEt
         fnvIoiqL9uoXq6oYoaeSf7SFQXkoBLaowtzcRdPB62ZimXRQh0OvG09QjFjQE2k1SyUK
         PSGe3qgXUg0uN95oS5On0SV6qM7neLlUYfAPe5iG5411BzKn1lvKoSeZYwmAX8HLAkev
         7Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LCeRgAr90AjP72BARFiQs5/0imRongy9yblqwBgpMJw=;
        b=HD4vEdnI4NkdAwHamxhvqGtQ6RXq2O0pl2SF/emI1yJ+ZmwZId5Lg2q1w7lZI6TXc9
         tJJIr8wr3fHnNvNpLXeFFL95bT9+UGXv81wCW26q2017fMLEFNNli/W6COrNAE+b59+b
         X7R8D2unKuzB3hGLpmAfgl3Fv8MbMTJr22VhqXMOthGNErdIhUwiYi/kt/5R3+1NlLYs
         N8aQKk+L163+WzmFOc3vssYYkP2gm31lvBYKktFkhlPVXk1ga3m+Yd85/fVauzQTZAqW
         Es7uvV/3UqhByc3PrAW+KjkWbVuAFFM0J58HSPdtkzkWmno9aylBfb0K6v6tAj5P9j69
         /NCg==
X-Gm-Message-State: ACgBeo3uxg+49ef9uKavfM9fOapEs0Pp5NwZDyyXDBYPU1E3aZ9kqugC
	Dj18pzeCq7WiIEHwIj700JOw6w==
X-Google-Smtp-Source: AA6agR75ynzRVgvfBbdqJ2QkXycl9WBPmjwpM9MQUP9CsZJX93WYal3zBWqrzkkwzk66jgGdDVldhw==
X-Received: by 2002:a05:6512:2302:b0:492:ce48:1bab with SMTP id o2-20020a056512230200b00492ce481babmr612617lfu.266.1661408319341;
        Wed, 24 Aug 2022 23:18:39 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id o13-20020ac25e2d000000b00492b7d7ee20sm323634lfg.87.2022.08.24.23.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:18:38 -0700 (PDT)
Message-ID: <0eea5c56-534a-aec6-b9f1-dd306fccf282@linaro.org>
Date: Thu, 25 Aug 2022 09:18:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 5/7] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per switch
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
 <20220824104040.17527-6-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824104040.17527-6-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_231843_475317_BEF6EBA2 
X-CRM114-Status: GOOD (  13.42  )
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
> Define DSA port binding per switch model as each switch model requires
> different values for certain properties.
> 
> Define reg property on $defs as it's the same for all switch models.
> 
> Remove unnecessary lines as they are already included from the referred
> dsa.yaml.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 55 +++++++++++--------
>  1 file changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 8dfc307e6e1b..a6003db87113 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -127,37 +127,45 @@ properties:
>        ethsys.
>      maxItems: 1
>  
> -patternProperties:
> -  "^(ethernet-)?ports$":
> -    type: object
> -
> -    patternProperties:
> -      "^(ethernet-)?port@[0-9]+$":
> -        type: object
> -        description: Ethernet switch ports
> -

I don't see improvements here. We might have here misunderstanding,
because I mentioned it several times yet no effect.

This hunk with reg and maybe few other properties which are always
applicable should stay. You do not need any defs for this binding...


Best regards,
Krzysztof

