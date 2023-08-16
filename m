Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC54C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZoiawh33EN8egkU31l+X3dd1VdBtDLA5RvWoX+ot10=; b=GDXb8HykScLtBj2jXhst8qwgB/
	tUaQzqeUET5bU6k7r1P8mInoijCKH3uM9jsqP3FtwXQiSDxNXd0rt4GUNjKsmQpmD4pD796Z3JTiy
	eoBbwbRTh+VwkPB99h8wuS4MPHlRfaL+Qx4Kw2DEGsZnh+87XibxY4xUUC4MlEfk2Q6I5oQ2smAiW
	TTHcpwT3UJyvBZKPDZk8csZDY4+YNQt3TjSnxQsBjA/H/ONxmRgZC1t7obYoK1QXiXfN2A/1251sc
	aKlynz1//2yXnp7n3foLGP1QViIWoUzx91DNo0B5UyDDsjhLXeeTCGyGrYb9T6AnUHRKilMvroJm8
	mlQa82dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJOq-004bif-0x;
	Wed, 16 Aug 2023 16:29:36 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJOm-004bhB-1a;
	Wed, 16 Aug 2023 16:29:33 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6418dd60676so36054046d6.2;
        Wed, 16 Aug 2023 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692203370; x=1692808170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZoiawh33EN8egkU31l+X3dd1VdBtDLA5RvWoX+ot10=;
        b=it+m/f27p3Xv9yPNgEvDmy8ksdTIyC3AP6snE7vGudLdFOFQRrfUr2MwJcCvN3JEAY
         1Rd106fgNEJnl/ukfu1L9/JwsuBcJleYKjmkCL9sG7A3NwpK7KrIzhN01NBbA9ARM9hV
         SJS0X/nJum0laNlaQ5ZGvZRZiLAwdpO2BfOx9AOGaTAKR5IEPTV2zN+vNv96eS18Ni5M
         OQdwmEhPfXd2hJK2A9EROjJyevDr2gpVc2zo9GR/g0cMcibIcWxmB4Rr8Zudg6dP7kII
         9FeSRWA5ZZF+cprOdTwRT+SJ9BaGaY29vrLCSiCHnj9r0CJDDhYa0pvGeEPhGARF1zAl
         jJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692203370; x=1692808170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZoiawh33EN8egkU31l+X3dd1VdBtDLA5RvWoX+ot10=;
        b=ItIUi0y+kKsPbsd8LVFqTyYenzMMwy2ns1m1yiZzTEl901WKTLxgcbV8PvG8TlYHw+
         fPG/iEmbabvSQCmqqvIscECDGuD62PTxG0yDU1EgLwnZXWS+/KKW2YoUYZz+OWsvT0Wk
         zj3TIDNbkaTImcmX0C4cI9bJJXfMWWpwpjJ+idCDBYxPSfwb5p8yUnZ+GZGIR9+Fp2F5
         RP8ura02a9PUd+ulTKL2pkyUYxvxDw00ROzQtApeVUd9qvlneAU1Mk9bt4lDYozK7YfO
         b8x9oeZogkXOQwgBKxH77O3uJNGKvIfl7qLRmTiNHhb98sBaMaetn5dHUAVlXekplg7q
         OURw==
X-Gm-Message-State: AOJu0Yzf96IsCUxG7XLW4JuLEHhjBybmkkeDPcq/rmFWf1sBlQZmQQ9r
	jNoV3YkmhIk99WU4gtJEbHU=
X-Google-Smtp-Source: AGHT+IH2zLks0E7Y4TfQ5mZXZCXk86892jlNYmBii+ktZG2i0ZIzA4KnSgdIUoi9+5AIZpP1uON+Zg==
X-Received: by 2002:a0c:e44d:0:b0:636:f84f:f0c5 with SMTP id d13-20020a0ce44d000000b00636f84ff0c5mr1998219qvm.38.1692203369991;
        Wed, 16 Aug 2023 09:29:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p6-20020a0ce186000000b00632191a70aesm4949859qvl.88.2023.08.16.09.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:29:28 -0700 (PDT)
Message-ID: <8fb144a7-92ac-2107-8a7c-19acc109bad8@gmail.com>
Date: Wed, 16 Aug 2023 09:29:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: microchip,lan937x: add missing
 ethernet on example
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230812091708.34665-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_092932_532936_B2BB2C17 
X-CRM114-Status: GOOD (  10.80  )
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

On 8/12/23 02:17, Arınç ÜNAL wrote:
> The port@5 node on the example is missing the ethernet property. Add it.
> Remove the MAC bindings on the example as they cannot be validated.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


