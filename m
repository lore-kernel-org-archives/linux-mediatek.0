Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6541FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 22:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYvcqZ5hiDqxVVAFnA+15FX5ixyDB1lMqbOYof+Aaw0=; b=Wb1cuUbMWslI4P
	EBHh81LtsK6wwV1gVY0dqMljO1H6CX8JiQTsYy4ZJd+QHcyAXDPqXRZZD0xljVCpO/HjDyMWIEULf
	jGlU+DKhCNxADE60tAEXeqmT+jTAKvP0jCVkLhNNsWTJfb/ImkR8S57JZVlX7VM2DdPyuozwizJDy
	BqZWy3a1F7hquiRAm07aAjMJPFcxFJbU9Kk0pIOAX2J1Oos1P4bXpzQAyM35iZadztgIqZ90qBFx2
	FyeGE6bmhLmupL7u+pCAUNIu6grry0jgfoyLmNuCO1fNmkCj6YXoeEGbEZVfHcld2dRzMWASaL5v5
	G2Y6MpHSeFQz/Ja6CmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxcWl-002wuF-BW; Wed, 15 Dec 2021 22:13:35 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxcWF-002wlf-EQ; Wed, 15 Dec 2021 22:13:05 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso26610846otf.12; 
 Wed, 15 Dec 2021 14:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITxrC42cpEdFPF3axFsIeZiANWHi83eE7MbTcA8W+gg=;
 b=GB90dd7RvXVqn3oONOE0Fqj7dGJYm2roKCPKkN/XY1yENVeH0jmxTWdEDPgqaNc3pQ
 ySaPHw30y2xwVFq3YGF0S+r1lf60uATvS8dfZbu1kYMyE9V42VRp5s5PwEeMMtqv9/mF
 mvobKWSHi4Ux7KVnVdBA0T1rfOPjXixk+i6lMe8kHxZUrLE/i3WyLpBoZg+xbAG8U1a7
 xkW9CSq0jmxA431CyahoSetWhvM0UQMFpLE0XtBcRmA+fKHMSm9VdeulXlaMoHE9wqxA
 EtEM2rS3grBfC032hOMrg0LGvMt1LAse2riYEw2MH0HbezoILiF0GOCYjPz4jJfTmwqP
 HvPg==
X-Gm-Message-State: AOAM530IUSI+DW6qrAU1/LJawVzhpQ2pqSQL5SndYWzfa59ivWnz7Ddp
 J+4G9MJIK20DFjON1yJThg==
X-Google-Smtp-Source: ABdhPJwaDEcWGo2pJ8CHSx9viVOHay+ZBu3YGBOyUvT6TDJu7jRsraMtVM63nT7+QEIcvGrQCS8ePw==
X-Received: by 2002:a05:6830:1092:: with SMTP id
 y18mr10206759oto.119.1639606382307; 
 Wed, 15 Dec 2021 14:13:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t18sm698156ott.2.2021.12.15.14.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:13:01 -0800 (PST)
Received: (nullmailer pid 1932976 invoked by uid 1000);
 Wed, 15 Dec 2021 22:13:00 -0000
Date: Wed, 15 Dec 2021 16:13:00 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 srv_heupstream@mediatek.com, macpaul.lin@mediatek.com,
 angelogioacchino.delregno@collabora.com, dkirjanov@suse.de
Subject: Re: [PATCH net-next v9 6/6] net: dt-bindings: dwmac: add support for
 mt8195
Message-ID: <YbpobIscSDPKuxxY@robh.at.kernel.org>
References: <20211215021652.7270-1-biao.huang@mediatek.com>
 <20211215021652.7270-7-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215021652.7270-7-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_141303_526876_38FFBDF4 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Dec 15, 2021 at 10:16:52AM +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 42 ++++++++++++++-----
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 8ad6e19661b8..44d55146def4 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -19,6 +19,7 @@ select:
>        contains:
>          enum:
>            - mediatek,mt2712-gmac
> +          - mediatek,mt8195-gmac
>    required:
>      - compatible
>  
> @@ -27,26 +28,37 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - mediatek,mt2712-gmac
> -      - const: snps,dwmac-4.20a
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt2712-gmac
> +          - const: snps,dwmac-4.20a
> +      - items:
> +          - enum:
> +              - mediatek,mt8195-gmac
> +          - const: snps,dwmac-5.10a
>  
>    clocks:
> +    minItems: 5

As before, you need 'minItems: 4' in the previous patch.

If you aren't clear what's needed, run 'make dtbs_checks' yourself 
before submitting again.

>      items:
>        - description: AXI clock
>        - description: APB clock
>        - description: MAC Main clock
>        - description: PTP clock
>        - description: RMII reference clock provided by MAC
> +      - description: MAC clock gate
>  
>    clock-names:
> -    items:
> -      - const: axi
> -      - const: apb
> -      - const: mac_main
> -      - const: ptp_ref
> -      - const: rmii_internal
> +    minItems: 5
> +    maxItems: 6
> +    contains:

No, you just threw out the order requirements. And this schema will be 
true with just 1 of the strings below plus any other strings. For 
example, this will pass:

clock-names = "foo", "bar", "axi", "baz", "rob";

> +      enum:
> +        - axi
> +        - apb
> +        - mac_main
> +        - ptp_ref
> +        - rmii_internal
> +        - mac_cg
>  
>    mediatek,pericfg:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -61,6 +73,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> +      or will round down. Range 0~31*290.
>  
>    mediatek,rx-delay-ps:
>      description:
> @@ -69,6 +83,8 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> +      For MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
> +      of 290, or will round down. Range 0~31*290.
>  
>    mediatek,rmii-rxc:
>      type: boolean
> @@ -102,6 +118,12 @@ properties:
>        3. the inside clock, which be sent to MAC, will be inversed in RMII case when
>           the reference clock is from MAC.
>  
> +  mediatek,mac-wol:
> +    type: boolean
> +    description:
> +      If present, indicates that MAC supports WOL(Wake-On-LAN), and MAC WOL will be enabled.
> +      Otherwise, PHY WOL is perferred.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
