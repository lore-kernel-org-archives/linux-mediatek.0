Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F93C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 20:44:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18C66115B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 20:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18C66115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BCDQhKmAPax00yJQkQllnkmj2MDTS2KZMAapic8Vow=; b=JVZ3FkV6hXkaqBNYvt36+hGPu
	6I5SHE1dEI63k337rI9wFrQaLMIY1RcZMCPmnX1y82073DicFacImmWUAdiTg6cARcs0vXaKrbW1P
	w4JFx3HdLrJWo6Jr6CLp2JP3/fR9Nzu295ghjL8p+C6JDrg6Egx/kGdQF0PFnvmaEfPdEIO5YtMoD
	hLTaUj6f1L4TCS720AYYFBcFxcL83l7iQlhykepzs2cPkMjYujpqZnXIKDE00/eGa6w/P8B4fysem
	fAIuopzwsIrZEKSDiKGPUtW6Iby+H6fjDfVkiF+W7aJE0fcDIWDpglhNVpTrKNkeC4BdxfNrwvxT+
	hvJ7kNmUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUbVY-009F7E-3z; Thu, 08 Apr 2021 20:44:08 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUbVN-009F5u-04; Thu, 08 Apr 2021 20:43:58 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so3635392ote.6; 
 Thu, 08 Apr 2021 13:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XBBWatDedME9VyLo4T5IHFnIvoyrnrBYPGAfSuhqOXk=;
 b=OBnHXbQsRdkX8saDPH9bV0SgbBecSjxse8Vt39mDq/Ko/YcaFqn+zw5uWMVD5aXVzl
 8WBBy8rk3ESygCggL/3lbVL3pe9P2o9X9af+7urHt18eJzaPSY9UFu5kuP4V7fPu2YNZ
 WPrhRBoyxrVW0ArMFw8uT7LaTfOvn6bydikst8BlvA/dL5M/+oskYrjvwNhOyUBmztVZ
 dua4MGxLtjRzs2bNYCVu7GRzQa853QnOKTDnEy5nReSA3fHL/RCsoOyg30J7O/9fmUix
 8nHhTXnVhAigJM7xxs8Jhwm7eyOQQtQSWXkNYvnHlGlWZes/qY93tKP2umB4GMlsIsv5
 zy+Q==
X-Gm-Message-State: AOAM531TXVR3/TgD5LuugD/4U2s7JxvE5rr2f12g2MBsv7T/gHDwWrWX
 gg9rwnTwBMinYRNPLNb8ww==
X-Google-Smtp-Source: ABdhPJxwQ73CtdR2JuZH2FV4YaDwVXoMQhPH7akp4CbOyMrNAslj3Uw/VM1upErlyrG9GQqMt6FHww==
X-Received: by 2002:a05:6830:144e:: with SMTP id
 w14mr9442181otp.0.1617914635873; 
 Thu, 08 Apr 2021 13:43:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e20sm104197otl.15.2021.04.08.13.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:43:55 -0700 (PDT)
Received: (nullmailer pid 1927882 invoked by uid 1000);
 Thu, 08 Apr 2021 20:43:54 -0000
Date: Thu, 8 Apr 2021 15:43:54 -0500
From: Rob Herring <robh@kernel.org>
To: Nina Wu <nina-cm.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Neal Liu <neal.liu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Jackson-kt.Chang@mediatek.com
Subject: Re: [PATCH v2 1/6] dt-bindings: devapc: Update bindings
Message-ID: <20210408204354.GA1926089@robh.at.kernel.org>
References: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_214357_088296_7CC6A433 
X-CRM114-Status: GOOD (  16.74  )
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

On Thu, Apr 01, 2021 at 02:38:02PM +0800, Nina Wu wrote:
> From: Nina Wu <Nina-CM.Wu@mediatek.com>

Every change is an 'update'. Perhaps mention mt8192 in the subject.

> 
> To support newer hardware architecture of devapc,
> update device tree bindings.
> 
> Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index 31e4d3c..42b284e 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -20,11 +20,17 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-devapc
> +      - mediatek,mt8192-devapc
>  
>    reg:
>      description: The base address of devapc register bank
>      maxItems: 1
>  
> +  vio-idx-num:

Needs a vendor prefix.

> +    description: The number of the devices controlled by devapc
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1
> +
>    interrupts:
>      description: A single interrupt specifier
>      maxItems: 1
> @@ -40,6 +46,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vio-idx-num
>    - interrupts
>    - clocks
>    - clock-names
> @@ -54,6 +61,7 @@ examples:
>      devapc: devapc@10207000 {
>        compatible = "mediatek,mt6779-devapc";
>        reg = <0x10207000 0x1000>;
> +      vio-idx-num = <511>;
>        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
>        clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
>        clock-names = "devapc-infra-clock";
> -- 
> 2.6.4
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
