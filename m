Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 19:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4jitQPReLtllU2b8RUbCzG56mgw9dNhEevxH7gLQ8c=; b=31iNbLGjOpVD0q
	vYG2GBtNw25alclgx5hNia9X0RFt16kWQWQYGNqG8bGR6QnN044Bp2bZTxGvNmZPBrnhAqW9JHtWL
	3XxRWLdvuzRXfa44wuXvv0ehlsUPa0uIFKOPm5GJ50M0u2IXu60S1bQURRDQbJgiJQ1ilVnx9kTsN
	jOXwkuIHATpOj07UgiG+YEUsi2pRqzVMikKMVNKKDNbu3rd3HMJNkoww5/3dIpQr+CqbDZpbsg1a6
	X+lsor9of0pYR3ugpXff81b0K+fuMZOWAdrxtGV3j30mNXSODa2iGQrZ6I84D26vIu2pf2dHxPBNk
	gSP0r8uNqYcjz+dfHE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxw5W-007ItF-1Y; Thu, 16 Dec 2021 19:06:46 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxw5T-007Irc-66; Thu, 16 Dec 2021 19:06:44 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 v19-20020a4a2453000000b002bb88bfb594so25549oov.4; 
 Thu, 16 Dec 2021 11:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CG56Jwgd9cUomWDpy5o7T6p7P8N4Uke3kC1sOxkLV7I=;
 b=0uffbV3mzI2qpLEptlm+7p9zZauKj5PD6CI10EUpt7HJaxsNhqcxK7T9+w+cNGk7KO
 evxa29KjZTfmzNe9A6afLo/SD2hdD/DWWDlhm/kCEPEc7Fg0fWxjwK8i3CQYhs7NjlcG
 ZrNc/5grXoPqthYWURAFD84j8TqOL/GQDqnJObCL1viKxtfBybTwcJDUZ4qIlfY27MFP
 F5E/LVepYpEVFBKo1tr4tDFwy6HAEA1pxvWI293Qp0brJ2By3LscrpqvsZbuDPNvQGTb
 0Z7biymEjGHApFH9pL8oRjLfKBpYNNYMmkD8SL2hmzakZLoVa2f015CMZvN/2a/Rjp6B
 T2Ug==
X-Gm-Message-State: AOAM530ZQNGNFKHg9cIcQlpcGxJF7JhGdbyor6B4uvJHnSRrLx1JDJb3
 YjGtTLoedgGJv1VdWGkeSA2JkAMpeQ==
X-Google-Smtp-Source: ABdhPJw/lKVAgvYYodsYmDHJIPLbu+J7eSYgLLi1L5y8TZtPzYt8+RFx+b/nx3iF88MBdKkrVbZ9WA==
X-Received: by 2002:a4a:e50e:: with SMTP id r14mr12353606oot.27.1639681601738; 
 Thu, 16 Dec 2021 11:06:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 184sm1132342oih.58.2021.12.16.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 11:06:41 -0800 (PST)
Received: (nullmailer pid 579625 invoked by uid 1000);
 Thu, 16 Dec 2021 19:06:40 -0000
Date: Thu, 16 Dec 2021 13:06:40 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, jiaxin.yu@mediatek.com, shumingf@realtek.com
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8195: add clock property to
 sound node
Message-ID: <YbuOQOH3esG1pFQU@robh.at.kernel.org>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <20211215065835.3074-2-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215065835.3074-2-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_110643_291809_575227B4 
X-CRM114-Status: GOOD (  18.83  )
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

On Wed, Dec 15, 2021 at 02:58:35PM +0800, Trevor Wu wrote:
> clocks and clock-names are added to provide MCLK phandle for sound card.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml  | 12 ++++++++++++
>  .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml  | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
> index cf6ad7933e23..b57c856d0cf3 100644
> --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
> @@ -32,11 +32,21 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/phandle"
>      description: The phandle of MT8195 HDMI codec node.
>  
> +  clocks:
> +    items:
> +      - description: phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    items:
> +      - const: i2so1_mclk
> +
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - mediatek,platform
> +  - clocks
> +  - clock-names
>  
>  examples:
>    - |
> @@ -44,6 +54,8 @@ examples:
>      sound: mt8195-sound {
>          compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
>          mediatek,platform = <&afe>;
> +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> +        clock-names = "i2so1_mclk";
>          pinctrl-names = "default";
>          pinctrl-0 = <&aud_pins_default>;
>      };
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> index 8f177e02ad35..e4720f76f66b 100644
> --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> @@ -42,11 +42,21 @@ properties:
>        A list of the desired dai-links in the sound card. Each entry is a
>        name defined in the machine driver.
>  
> +  clocks:
> +    items:
> +      - description: phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    items:
> +      - const: i2so1_mclk
> +
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - mediatek,platform
> +  - clocks
> +  - clock-names
>  
>  examples:
>    - |
> @@ -54,6 +64,8 @@ examples:
>      sound: mt8195-sound {
>          compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
>          mediatek,platform = <&afe>;
> +        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
> +        clock-names = "i2so1_mclk";

Being a virtual node, how does it have clocks? This belongs in the h/w 
device that consumes the clock.

>          pinctrl-names = "default";
>          pinctrl-0 = <&aud_pins_default>;
>      };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
