Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE55ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsCqlhcAYszwylafTVn3AQU14ABBFNYiw25xksQ//Tw=; b=HMx4UYh1BAQeOoECkgVCLRVtDO
	Z+SXPmkPdMc2dmkh96GE5KMRQ482B8EQYM+otRr8dfDDnQQYmOnlFqAvf5Gdczb4GVXkQOdew9hcr
	C/WJcnYY81ucwZK4t3vvZo+zl5t3y4NzzGh5JNkZ293+DD3OVu3WN+eBPWPTHTcxB1AghCUN5JuHz
	U7hqKG3Cn6Zh7xUpZy2L9zlFunzblm9fs4Nf95a8JYjrGsCcCornQKe064AB2/8nm8OYI4VK8aAAh
	UgwdrxVvr3gxezdWTSxz/le/acMKRlQt+NeM6mYqktIxu0F42TUq2peX9SNj5A0X7dVqRHyISWLPw
	4Kz3u0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYU0I-003JaN-2o; Wed, 14 Sep 2022 15:08:42 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYU0F-003JMh-9w; Wed, 14 Sep 2022 15:08:40 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-12b542cb1d3so32011397fac.13;
        Wed, 14 Sep 2022 08:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WsCqlhcAYszwylafTVn3AQU14ABBFNYiw25xksQ//Tw=;
        b=J8AspA0ythFvY5ECkXstmZZpVJesGLPW4ncZgqCAcA94HRrdQjXwEvZqswAzWML3iZ
         5oAPTSnAohzDmPdCXMrkK8Wi5wjZB6N9Ba6XB4TKuJd6Nxb447XqmelUTo/R9cYQsg+g
         FtLvx9Kap5lIjj0qmZsQaZMiRy3mRTVTQ8FcrjcX2e6VF6fuX3nMQBXw9S1rsbWUJ5XA
         x9yFw2Xc7McMx2KhtQxxtnvnSybqM988JlxuNfpgBQuLISHwoFnArVYqKnwOoKEHtrQu
         h3uy8mRWM0QVrWIb9yX9Gu3hpL1BgE7LF8WXd1RKXmBFDs30VvJVLP/Coqy2yZ57CiRI
         3zWw==
X-Gm-Message-State: ACgBeo1D0zAd5WC6Gz135vhT/XKFeaZrU8Sizw+nJJcerf64zvXzQptY
	kvv6R1rzYYdzK920m0/eCA==
X-Google-Smtp-Source: AA6agR4kABtEsUG4U3/uBVd8jycn/uZuDvvgX1kd+YNFBGMNnvsFazZEHBl1ANF49t/a2LRWJdwUkw==
X-Received: by 2002:a05:6870:524f:b0:126:7220:c90b with SMTP id o15-20020a056870524f00b001267220c90bmr2653054oai.21.1663168102573;
        Wed, 14 Sep 2022 08:08:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c10-20020a4ab18a000000b00432ac97ad09sm6561797ooo.26.2022.09.14.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:08:21 -0700 (PDT)
Received: (nullmailer pid 2233439 invoked by uid 1000);
	Wed, 14 Sep 2022 15:08:20 -0000
Date: Wed, 14 Sep 2022 10:08:20 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, erkin.bozoglu@xeront.com, Eric Dumazet <edumazet@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>
Subject: Re: [PATCH 03/10] dt-bindings: net: dsa: mediatek,mt7530: expand
 gpio-controller description
Message-ID: <20220914150820.GA2233308-robh@kernel.org>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
 <20220914085451.11723-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914085451.11723-4-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_080839_375784_615EFC13 
X-CRM114-Status: GOOD (  11.98  )
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

On Wed, 14 Sep 2022 11:54:44 +0300, Arınç ÜNAL wrote:
> Expand the description of the gpio-controller property to include the
> controllable pins of the MT7530 switch.
> 
> The gpio-controller property is only used for the MT7530 switch. Therefore,
> invalidate it for the MT7531 switch.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

