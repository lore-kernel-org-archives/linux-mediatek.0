Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YeLZvzypxwlEAy+RYyr2ZOTKa8+d9HNBpYtWhpsZb4=; b=qaAotoVNZRHp0P
	SCthguMC8sdqIRlihAGZQSHG5JLpZgVW32lgMFCkqGdcjqUDxg+9zVXFwZOtadgDagVeMlJj/UXef
	FaNHV8gLbd/RdbZI21Czf24cRBJCBlIzwR8EoV7nLcRlW56cVwY9VEDXWlQvYAhcpTi/WU21qH2Rw
	CVXPHG4w7ZDPMdzyv3P5mjqrX3bgzpmXCfPkHJIaJA2FU53ps3jj+1uyeF3xLoY8G443C4bt+G+cl
	aUOngIn+E0pIi/aItrxSRdZL+Ln82H/zLIgAhmUKXToNUNOH4JK5w+/H9DYWbLDN6R96nmDPgLgTn
	8N3tQM6Vqgwt4ec5iUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMa0-001ww8-9y; Mon, 07 Mar 2022 23:15:52 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMZh-001wpC-B7; Mon, 07 Mar 2022 23:15:34 +0000
Received: by mail-oo1-f52.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so19864959ooa.10; 
 Mon, 07 Mar 2022 15:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AI7+nqdRFcGCglUrZMOmz1VIH3qVmbPTfJ/l66ayM3Y=;
 b=SLcCHCGvPtwLdS5NZHRYIYktm8PqNQtnN7jgiUbMJ45zt15YFRY4QJYjptcL3XvFAd
 2DoIAWY1XRpmROv+2xrYM91vh9V61sGcnHudNZYTe52MPrUP+oSllST8sRIWAwRKhPLb
 zXvDLFXYTeU/wjCdf6AR0+7HV34qGy3qfPe4Lr2FiRvQaOa/re4Tph95cTbiYdXQyFxl
 V6RFyZ9SPRcjFwU0q8Wfj20vm2mbVg7SNTRE8qWrJknmOYbdzO4W71rquw+3Qh350vt5
 0UZhrhNQMVcT8BMrdlQefgxouDR1BPxO0K7MQZCOqDDYQateSFFRP0MNpeVy/fExZXBh
 ULlQ==
X-Gm-Message-State: AOAM532yFq2EWyHU2Bf2ENnWeaQ4qVGrdVzmpaqwAaztj311yJhmtGBT
 +aHxo3Hfiwsnd1imQcMJVg==
X-Google-Smtp-Source: ABdhPJxeFOFFe9Vq2gohlV5XyQjqZbVfPdy2gBMuBEd/YoU/2W3BbN5NDiSR16FW9csAOMqydlNNvg==
X-Received: by 2002:a05:6870:a986:b0:da:b3f:3279 with SMTP id
 ep6-20020a056870a98600b000da0b3f3279mr741000oab.297.1646694932365; 
 Mon, 07 Mar 2022 15:15:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bj27-20020a056808199b00b002d49b02cb41sm7268602oib.22.2022.03.07.15.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:15:31 -0800 (PST)
Received: (nullmailer pid 3443222 invoked by uid 1000);
 Mon, 07 Mar 2022 23:15:30 -0000
Date: Mon, 7 Mar 2022 17:15:30 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or, matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com
Subject: Re: [PATCH v4 2/7] dt-bindings: remoteproc: Add bindings for the
 MT8365 APU
Message-ID: <YiaSEtqLAAYmBYgh@robh.at.kernel.org>
References: <20220304161514.994128-1-abailon@baylibre.com>
 <20220304161514.994128-3-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304161514.994128-3-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_151533_455441_8EDE536D 
X-CRM114-Status: GOOD (  15.39  )
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

On Fri, Mar 04, 2022 at 05:15:09PM +0100, Alexandre Bailon wrote:
> This updates the Mediatek APU bindings to support the MT8365.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> index b640aa96d678..388352ccb2b5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> @@ -16,7 +16,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8183-apu
> +    enum:
> +      - mediatek,mt8183-apu
> +      - mediatek,mt8365-apu
>  
>    reg:
>      maxItems: 1
> @@ -26,13 +28,11 @@ properties:
>  
>    clocks:
>      minItems: 3
> -    maxItems: 3
> +    maxItems: 8
>  
>    clock-names:
> -    items:
> -      - const: axi
> -      - const: ipu
> -      - const: jtag
> +    minItems: 3
> +    maxItems: 8
>  
>    iommus:
>      maxItems: 3
> @@ -69,6 +69,39 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8183-apu
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: axi
> +            - const: ipu
> +            - const: jtag
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8365-apu
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: if_ck
> +            - const: edma
> +            - const: ahb
> +            - const: axi
> +            - const: ipu
> +            - const: jtag
> +            - const: smi_cam
> +            - const: ifr_apu_axi

Keep the first 3 clocks the same as prior h/w and keep at the top level. 
Then the if/then just needs to set the number of entries to 3 or 8.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
