Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0929FC001DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQg97wBXe3P0z07YZIHkWsGOthPp2ylFeuaEh8lcL5g=; b=mEvuTiXhgiXqeYlPOsv6JHhQfy
	IAMlB54XyUumreLiJaVHOI9bho59Lg+Xso3RWXLJ6MgMowh0Oi0Hhr04Ve8PIddPTmJ9dWK3T1J7j
	2DFzrWtGYjEDMlYZ+E25SR6ZdlQndQXPEoARVCF0AYgXAou8aGqtucvlndro39fE10BGGzakDNFw9
	HUYXdK+oCvl2CGyfbL32x3JQNhy7PnNB/Ex+iYbYVdJY6UXp/k/6SNLavS219tu9Dw87Z09TpFcSo
	Oj7RHGxdzJLiuWFrLXH7TT/ytxX0nQdi6i53BkMoIdnm8Ys08jkLV/LAvUbT2ZdRShWBuD9Vn6i64
	b5ggoBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuKY-0033p4-1d;
	Thu, 13 Jul 2023 11:17:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuKV-0033o7-0g
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 11:17:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3159d75606dso689721f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689247068; x=1691839068;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQg97wBXe3P0z07YZIHkWsGOthPp2ylFeuaEh8lcL5g=;
        b=fnT0JxbBGGoisk9+3XNkZZcv2SkvY8ojpQLL8pva71+onsqpaGXHZCsn7i2GLweYFl
         9hWiYrw/Ewjk7pN7/Q5hwbkTvrXVeCgpEx8J3oXbWljZqUkCGAKsyFQqygMikg04m1fF
         HgUD604I2qNi05XgZKtkc/j9dx+9YrXjRgGFlIay3w2t8ZeZghgJY4U6hMpzQvRy9aEU
         pFd6SdERn3qrw+qEe0NjSzxnPDGKR3nzV9EP8axpOz0aQio+chMOpTFEkvU36KgwV37o
         uqPYVo9RqPup0SGnN5xa4BZhhMvEhfjyispMYjYaPdLOG8gjoGPM5E1tCeNUjd/wd6Sp
         nEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689247068; x=1691839068;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQg97wBXe3P0z07YZIHkWsGOthPp2ylFeuaEh8lcL5g=;
        b=XAxW6zgML7xrDCEQHVvPCbuYAKNdDgsenbzrzeVnIo9gReB3auMb5fQx/7146qcYLN
         G8Yu44pzsYobLSOCRR6KB9D9eOQZ85aIcdKZZip0unsPb647wvXQnETMp8v8VoBlb/fu
         Dc5nr2zj04Rb+m1UjfpS0ciIzyQnr3YJ8Cx93OXSXPykvr9/2q8kSZB75MHqaIFWpaFy
         qYIB98zJzDPCfJugr/f/pSaBbKruy3sW2L1gyFDhtqdq5nIYv+bVZrMWGqGNAUdUORdk
         iY7IhJNUjPbGS2mn4bAHzDNJqDTxBvwi/EEKXz4/Vs14gcJ/sW3gBqn+kM0Dun2JR82w
         sNnA==
X-Gm-Message-State: ABy/qLYXOwFDG1xAvuzxQ7P6KL+olyr5KlnsSv2L4QLsg3+AKqF2BKZq
	xWbzlsgbjxkKCNwsWtxYfcshpw==
X-Google-Smtp-Source: APBJJlH87+cyagSht4LdOPuIJ+1dwMis7Qky9NEDILlxQd4l8J85GnFiCzPwZ/cdZ2oAsxEtwt50HA==
X-Received: by 2002:a5d:5966:0:b0:313:ebbf:3696 with SMTP id e38-20020a5d5966000000b00313ebbf3696mr1098202wri.46.1689247068442;
        Thu, 13 Jul 2023 04:17:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fc17e8a1efsm7832235wmd.45.2023.07.13.04.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 04:17:48 -0700 (PDT)
Message-ID: <61ca392d-fbfb-2c1d-16ce-771193252e67@linaro.org>
Date: Thu, 13 Jul 2023 13:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 net-next 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>, Florian Fainelli <f.fainelli@gmail.com>,
 Greg Ungerer <gerg@kernel.org>
References: <cover.1689012506.git.daniel@makrotopia.org>
 <6c2e9caddfb9427444307d8443f1b231e500787b.1689012506.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c2e9caddfb9427444307d8443f1b231e500787b.1689012506.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_041751_276289_BE68B328 
X-CRM114-Status: GOOD (  13.59  )
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

On 13/07/2023 04:17, Daniel Golle wrote:
> Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
> The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
> 10 Gigabit/sec supported by 2 packet processor engines for
> offloading tasks.
> The first MAC is hard-wired to a built-in switch which exposes
> four 1000Base-T PHYs as user ports.
> It also comes with built-in 2500Base-T PHY which can be used
> with the 2nd GMAC.
> The 2nd and 3rd GMAC can be connected to external PHYs or provide
> SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
> 5GBase-R or 10GBase-KR.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Beside that:
1. no underscores in property names.
2. Don't use syscon as an excuse for laziness. PLL is a clock, not syscon.

Best regards,
Krzysztof


