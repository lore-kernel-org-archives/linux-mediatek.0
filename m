Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A26C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXTnvqOYAoUiu+whGo+63YbjNEbPWQfhPfSgrtMPdy8=; b=qO60SYiLKvmkWH
	O4rq6hTjEhpbvZbO1Ih481YtjrG07HBvs5Pz6tfq+QP3cIjOwuVFC8x69T5OOvNPUXWm6HAJHfjDj
	b6KR7SmHVqHpdhRHKT2eW2KcWLsO33O1ivnrz7Jk2uML8diumoDwOudKvPpWJyyoW+zeYVs7iFhsj
	SIVMwCnZXiTDvCPvMRWdewWI9UAnRgC4WpocY7/PntvkDNdoKRr44KCRNYpuw63IKgzb/NZDj53x+
	Omm1ofXEZr/JAe+mQM5YZBzKrcl9Fz8y63TjIDpLMOVq3yNhSOmUj+nafOLytb2mLMt9JyhvSTH8j
	0NvnXr8hzrW7FKxkPkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmsBM-001mHq-CF; Fri, 06 May 2022 07:15:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmsBI-001mGm-UA
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 07:15:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id z2so11168287ejj.3
 for <linux-mediatek@lists.infradead.org>; Fri, 06 May 2022 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BeRODHN5BKHdYqCpyT3vOELgLz8mBkeltgcKtiKMp4w=;
 b=g4TlTYxLR3HgIll7nXj0AF8/r89vyRr8TehXbuimjjfEYJccXGgABWYlPWVPZr3PYW
 g2VAiB6F3XUnbACivG4wyIHzNoFUNpjcaiA9kScMgL7fSMJzihnSNEqyOO88Apxph3/l
 G4URVFL2tqrQdjLTkPvZApvG0KAocTJPRzCwwj9ncv9ILchN5blI27jqGplvHCyVc/JH
 FbO529vOx597xt77lw6dgm5980DDVRJx2sLJcnexgLGqpMpEEZXImo9/n4+j2ZdTDIsX
 9jDzhNjlO/o/QZlfMpBHPfEUDB9P0gpwBGGu1/xrrq2mUVVgfSHqz7RXsiPCwJc3vAPI
 HAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BeRODHN5BKHdYqCpyT3vOELgLz8mBkeltgcKtiKMp4w=;
 b=SyGpAO4RBcRFn7S6O1vuv8zHQYbhio2H4TsDQxIkkpMKrOZ4V4NgEfnzx0/gzJ8d26
 2K+3YAAGC3OwAGr8mE69UaS/bdZZomoArAH5/yb6TRB/DtbSf6GEhiGaxahnsWVYO9RH
 pcKOWIQgs5LEhVjVYtsOobnNiS88vJKfUbWXSNbrIiozbxFoOGs5IPhjbCKukL00nABs
 XtK6i5/DlrgmcRpieOvod6Wc9/rEzLAsMoo+ncVJC90/Mmc+KA6NAtRzi5Je76eZHvMo
 9uiHKLI+rZDbjtP9YNOMw8AS0ON+a0pFBg5wqOUk7NsiG1cllkT+0VVwmx4lzLARk6x6
 hipw==
X-Gm-Message-State: AOAM532RMymHigGjg76QLFalZ78ff3e7eDVkh6ulgNqu3v992qE54BOl
 D87bSu9XEqJh5mNxT2MIRmnohA==
X-Google-Smtp-Source: ABdhPJw+9MHfJJlxEEjx+RbBnEi8cHVQYqz5vIyQL24y5z6dfIvIfMX1LfWdV4dF8kIRqorulfWLkw==
X-Received: by 2002:a17:907:2da5:b0:6f4:7cd1:8cf5 with SMTP id
 gt37-20020a1709072da500b006f47cd18cf5mr1769503ejc.328.1651821314516; 
 Fri, 06 May 2022 00:15:14 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w16-20020a170907271000b006f3ef214e42sm1559641ejk.168.2022.05.06.00.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:15:13 -0700 (PDT)
Message-ID: <ac70ae6d-7e1a-d6b9-e33e-793035d5606e@linaro.org>
Date: Fri, 6 May 2022 09:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Aw: Re: [RFC v2] dt-bindings: net: dsa: convert binding for
 mediatek switches
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Greg Ungerer <gerg@kernel.org>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20220505150008.126627-1-linux@fw-web.de>
 <6d45f060-85e6-f3ff-ef00-6c68a2ada7a1@linaro.org>
 <trinity-12061c77-38b6-4b56-bccd-3b54cf9dc0e8-1651819574078@3c-app-gmx-bs21>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <trinity-12061c77-38b6-4b56-bccd-3b54cf9dc0e8-1651819574078@3c-app-gmx-bs21>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_001517_009639_02247DE9 
X-CRM114-Status: GOOD (  13.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/05/2022 08:46, Frank Wunderlich wrote:
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +  core-supply:
>>> +    description: |
>>
>> Drop | everywhere where it is not needed (so in all places, AFAICT)
> 
> is it necessary for multiline-descriptions or is indentation enough?

It's necessary only when YAML syntax characters appear in description or
when you want specific formatting.

https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree/bindings/example-schema.yaml#L97

https://yaml-multiline.info/

>>> +
>>> +patternProperties:
>>
>> patternProperties go before allOf, just after regular properties.
> 
> after required, right?

properties do not go after required, so neither patternProperties
should. Something like: propertes -> patternProperties -> dependencies
-> required -> allOf -> additionalProperties -> examples

> 
>>> +  "^(ethernet-)?ports$":
>>> +    type: object
>>
>> Also on this level:
>>     unevaluatedProperties: false
> 
> this is imho a bit redundant because in dsa.yaml (which is included now after patternProperties)
> it is already set on both levels.

dsa.yaml does not set it on ethernet-ports.

> Adding it here will fail in examples because of size/address-cells which are already defined in dsa.yaml...
> so i need to define them here again.

You're right, it cannot be set here.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
