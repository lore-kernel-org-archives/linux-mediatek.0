Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDDFC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXamOZOGTVHNNOeM200In1Hr9BwidQ/ESZOQzJxM1qw=; b=NvGcvqB3cf5/8suCKZQhdGIVxN
	x6CcQdqJavh78urV+BQIBoxochEGMBt9hK6PMbq/ZXCzN6nxBUHfNbQDXGeviMA+lGzAq8435VmNi
	0qvM2GEuYRm4KAZAk529zVCRNHenfa6e3i7Nr0rWJu17VW6idehUH3AfQ0UBEhx5+BBvU22OISIOu
	tL6FnPY+6VXv3DRzMAmiU32TmNH5NePrXuROvm3WZ+0TFfftD/nQrsB40W7grp9HevS7mAlPcQngc
	A6aHJZ1OdWZMGiNdeu52jVt7vw0KRls5pV+fiJc/U/nQGFatpavC5OCYXX1AD614j9Mr/WLf0yD4k
	+Ja9IOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZ19-003Hp4-Nn; Fri, 28 Oct 2022 23:44:03 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZ17-003Hnp-6Q
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 23:44:02 +0000
Received: by mail-qk1-x72a.google.com with SMTP id l9so4476379qkk.11
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 16:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXamOZOGTVHNNOeM200In1Hr9BwidQ/ESZOQzJxM1qw=;
        b=wwP6Ii1aDimtcTmCi1rfa2edFs5AlyzsAi/ZoRCfw/FXwXJrqNBCFuwmqnrLQHGKeG
         xiEchsXBHhMRaeRQNn2cjOWlF0sfGWlgx0JQLrMxm+q+ENk86YSs5369tLfDPrv5GWQi
         4vjI0HOitBMfNIDj3IC6iTofBrey2WcMMFBrp5k39Fz/h5/+3bFrEL2wRzQi3jdGJbKh
         cNZQ8dJrz3GvAHqnRk3VRPTESW1gLSVliJejYEw5OkB9z7aHJjlChgP7kDSGaHD31ebm
         4KmUChzPFi4yVYLywKRmhg5DR/2ucNjLRwBTI+lNLbWahwalggFSOx6/uDvSjziHJDV5
         X32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXamOZOGTVHNNOeM200In1Hr9BwidQ/ESZOQzJxM1qw=;
        b=R32Is+00LIsiVmekY3k1wGscXkofzK2R0TtTS7xZNgUzSsIgJ1i2Lvi5LX9mOxxWGl
         gSqtV9SYnDtQOP2J+5tBZXNXnhRGcOQ/MAYVGf13d3is+yKUgyNvUy8SHYkpTB6hzkGx
         z27jzIhltofoYaq80v752E3g501vY+SLxjB9roviMNyy9ygTSYl8NRqA5XkzcRomX5yF
         ED8Pp5d0XavX2nqSPxbKHSiPBQN6d1OstWkR0IhW9t/hQXj1AdaxZfqkCqKxzGFWO9v3
         mBpXBKBA6IqL+sDclXMNYPWtkRPss6uh5/q+NSZ+NPaL91vWOzawU8Q+LtRJlvNLttYj
         ct2g==
X-Gm-Message-State: ACrzQf1KRiwXlXyRula5fDj2b00yQ0P++8jHJF/JJCs8uCtt/qX9mh2g
	/DIFjEBLSW3vFmGAOdgjjLkTZw==
X-Google-Smtp-Source: AMsMyM6q4lpfoCYqL9ZArZVTKUmD3s+5rwoMeTyY5iOqXZjEnSsnqJwPOMYY1A22NYgawkBK0T7vag==
X-Received: by 2002:a05:620a:51c9:b0:6fa:c22:84e4 with SMTP id cx9-20020a05620a51c900b006fa0c2284e4mr1393494qkb.181.1667000636582;
        Fri, 28 Oct 2022 16:43:56 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id e6-20020ac86706000000b003a4f435e381sm32061qtp.18.2022.10.28.16.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 16:43:55 -0700 (PDT)
Message-ID: <6fd28d86-a43b-b3d0-fef4-022df9d0c7be@linaro.org>
Date: Fri, 28 Oct 2022 19:43:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH net-next 2/6] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
 evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, robh@kernel.org,
 daniel@makrotopia.org
References: <cover.1666368566.git.lorenzo@kernel.org>
 <7a454984f0001a71964114b71f353cb47af95ee6.1666368566.git.lorenzo@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7a454984f0001a71964114b71f353cb47af95ee6.1666368566.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_164401_276321_3314CB29 
X-CRM114-Status: GOOD (  17.05  )
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

On 21/10/2022 12:18, Lorenzo Bianconi wrote:
> Document the binding for the RX Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> forwarded to LAN/WAN one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 126 ++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7986-wo-boot.yaml |  45 +++++++
>  .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml |  49 +++++++
>  .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  |  66 +++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

(...)
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      ap2woccif0: ap2woccif@151a5000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

In other places as well.

> +        compatible = "mediatek,ap2woccif", "syscon";
> +        reg = <0 0x151a5000 0 0x1000>;
> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> new file mode 100644
> index 000000000000..529343c57e4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both lines.

> +
> +title: MediaTek WED WO hw rx ring interface for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The mediatek WO-dlm provides a configuration interface for WED WO
> +  rx ring on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    const: mediatek,wocpu_dlm

No underscores in compatibles (and node names, but I think Rob commented
about it)

Best regards,
Krzysztof


