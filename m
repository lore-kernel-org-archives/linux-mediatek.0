Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD33ECAA27
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcjkA8oR36peP3szO6S9L8w7MpN9/Fk3Gid3MLuZnfs=; b=UH//czWdHWjRuVEB3uCgRUKDCx
	sYVqEyS00DFoJ6NzhY3w7jc+hruPoiDCb1UiPlGSTtkGkj/G6+WirZEmdxDcYUOhtUvFysqSpFxBk
	/3Uxy1cBXOmqV7zQem42b69VwS+/aZASs/VsFz3C7T/6jXyBoRtmWj3YKjsRHsNneE3ShCkAywIel
	DxWFTIVUxLmH0SBcNEMr+ygUDufnQUsMgtDHi0lPzs4inoBDslfNzlZCqdTAmAcQiC5ifl/Guzz+9
	/Rv9r1ntoYVOyk4bRFgL/48Twyksy4UDxVJQKNWZeeHuwAzYl6zxxJs7Cdau6SSfzykKnYoWeHdbn
	Fa83duTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRJ93-002zGE-04; Thu, 25 Aug 2022 20:08:05 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRJ8z-002zDZ-Sa; Thu, 25 Aug 2022 20:08:03 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11cab7d7e0fso25156512fac.6;
        Thu, 25 Aug 2022 13:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=dcjkA8oR36peP3szO6S9L8w7MpN9/Fk3Gid3MLuZnfs=;
        b=nd6Tl4+3GQZt39u0SdXtHSqMN43YGqjZgSgH3e31SuA9iFx+49mEKec4ZoWGILkX28
         lO1wGwyV3P3fFLwCOFI4zF5jDdIfP0TqymbOG7w2cQ7mxW2YLyHszmtXfr6Ng6l4UNFn
         Bmig4Ylfl8hW0tVtJCrlIb0u2dNhP6JdxgGdbNTrhwQ84ASmfprntvl8rny48d9O6Voq
         kUFUakt4D1PtBnwCfb6CnRGSlD4jbqIwdfbcOxYptSccSOE0OGjIVIckLPfviFs4pexh
         ll3RPPm0ciWHRNNSwYhgoE0SrrzKGKFBNO/7QmiJ6vtjtBxOIHNSCHNhrNQRhNn5xS4v
         PM9g==
X-Gm-Message-State: ACgBeo3g+ps6djXVYFSAqZzff/RhlZ0Uow3e/VDI9+ibTdnTFzICq1mI
	oSXPdQEDMCoD/kegIrwqtQ==
X-Google-Smtp-Source: AA6agR5PXbEwCG8AwialgepZdugBrmMEZdowrhrFPXaxg+wjPbVy2Oz6dHDL8A5G0BoeyqvlBsw2Bg==
X-Received: by 2002:a05:6870:5820:b0:11c:b6d0:b84c with SMTP id r32-20020a056870582000b0011cb6d0b84cmr307885oap.236.1661458077465;
        Thu, 25 Aug 2022 13:07:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t38-20020a05687063a600b0011bde9f5745sm79713oap.23.2022.08.25.13.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:07:57 -0700 (PDT)
Received: (nullmailer pid 1604965 invoked by uid 1000);
	Thu, 25 Aug 2022 20:07:55 -0000
Date: Thu, 25 Aug 2022 15:07:55 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
Message-ID: <20220825200755.GA1604801-robh@kernel.org>
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
 <20220825082301.409450-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220825082301.409450-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_130801_948602_CFAF1A08 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 25 Aug 2022 11:22:56 +0300, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Stretch descriptions up to the 80 character limit.
> - Remove lists for single items.
> - Remove requiring reg as it's already required by dsa-port.yaml.
> - Define acceptable reg values for the CPU ports.
> - Remove quotes from $ref: "dsa.yaml#".
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 50 ++++++++++++-------
>  1 file changed, 31 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

