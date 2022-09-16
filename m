Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB83C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 19:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnBpLy/J1dgd76aFhw5FRIiMycfqNVIws11h81p/NbU=; b=Ag1E2fH1e/r7SgrAt3868ITK2r
	t3WuEA2hogS3zftEVpKPVs0rcwwHoIiBvATmXiO/ntElBXz3+p1l53Z0IKirxoMnkfnOcdPqNXcWB
	PzQJPsiVSpveBulfxmA4lpCiErZVc/qLRxy8unpjicf5Ky0G7zD+jyfDGGobONhzjZ9wO8CT6QFYF
	z2avtowTNbR7fhYzYleyUYcyCWkjDlvxBhq3FBCPYsW0YZeNpn7reQHwcbDo7Uustv7tksDTgjb76
	jVRoG/aRMBaFxxzCP+jtnaJixgyQdJS5AoBVod4HBzJw/ksIA7NQWBSicwc0xm+Tl3KlF7XnFALXn
	8NU72kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHEB-00GMuq-S1; Fri, 16 Sep 2022 19:42:19 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHDP-00GMaX-I8; Fri, 16 Sep 2022 19:41:36 +0000
Received: by mail-ot1-f49.google.com with SMTP id ck2-20020a056830648200b0065603aef276so10117255otb.12;
        Fri, 16 Sep 2022 12:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rnBpLy/J1dgd76aFhw5FRIiMycfqNVIws11h81p/NbU=;
        b=x/A7ByQ9wm/o7gvLRrwiQkWlJwrC0TIL0VC5/dod/Z/vKs/0RtvnBG1kNMmUKKqLOK
         qoGlG670vPjdj9v2V2ei3sOSpGqFhZfOoiM0EIXgPwGexrj8XRWdq2EUXmjNZIJ1NH/C
         7XJBkcqxKeJw+Eu4Z90nqfdDz1mReGUXfauV+2IeMYbnEIT8U6KAsfoxhl9MDXTQeQiJ
         S8koQVQu+P2Xge/6CnYswWZFarNi+SVSadBThjRj/i4e6XQ0BGkNuoECReDqYDB1RkXJ
         9M4Nk9EGIpW8KY7yUaCUiJRycIiRp2ab9kLMH/H1GkZEN5sp4hZMbeWLY3w9w5yDMGle
         k5Mw==
X-Gm-Message-State: ACrzQf3YgfFLTkmS+Xu8ohjd23AZ3ICk635yQB4uE7HkoJew/awNS0Gu
	GNw6TdOxgYhSbNOVNV8laQ==
X-Google-Smtp-Source: AMsMyM5pqr2hJIPZ5Ycq9i2ddvBU0Tqj0jiQjbffC/+TCU+VgGx6xTzvHWQ4WsRCZjTtPRkCSNER1Q==
X-Received: by 2002:a05:6830:2706:b0:659:de15:2cae with SMTP id j6-20020a056830270600b00659de152caemr1661203otu.4.1663357289198;
        Fri, 16 Sep 2022 12:41:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p13-20020a056830130d00b006391adb6034sm10333282otq.72.2022.09.16.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 12:41:28 -0700 (PDT)
Received: (nullmailer pid 1149627 invoked by uid 1000);
	Fri, 16 Sep 2022 19:41:27 -0000
Date: Fri, 16 Sep 2022 14:41:27 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 net-next 04/10] dt-bindings: memory: mt7621: add
 syscon as compatible string
Message-ID: <20220916194127.GA1139257-robh@kernel.org>
References: <20220915065542.13150-1-arinc.unal@arinc9.com>
 <20220915065542.13150-5-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220915065542.13150-5-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_124131_711876_E6398A52 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, Sep 15, 2022 at 09:55:36AM +0300, Arınç ÜNAL wrote:
> Add syscon as a constant string on the compatible property as it's required
> for the SoC to work. Update the example accordingly.

I read this and start to give you the same reply as v1. Then I remember 
saying this already...

Update the commit message such that it answers my question and I don't 
think you just ignored me and have to go find v1. The fact that this 
change makes the binding match what is already in use in dts files is an 
important detail.

> 
> Fixes: 5278e4a181ff ("dt-bindings: memory: add binding for Mediatek's MT7621 SDRAM memory controller")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/memory-controllers/mediatek,mt7621-memc.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
> index 85e02854f083..ba8cd6d81d08 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt7621-memc
> +    items:
> +      - const: mediatek,mt7621-memc
> +      - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -24,7 +26,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    memory-controller@5000 {
> -        compatible = "mediatek,mt7621-memc";
> +    syscon@5000 {
> +        compatible = "mediatek,mt7621-memc", "syscon";
>          reg = <0x5000 0x1000>;
>      };
> -- 
> 2.34.1
> 
> 

