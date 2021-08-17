Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367BEC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015E26103A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 015E26103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vA9GuYX0HWyN0QWfoJgSLpLVzZ5ezqwUPKUdDXWkMtg=; b=l0uPawiTfe870h
	w86MWnJHgPs+auR/fjdo3JHaha1C3YL/1z3SIp7WGjVPhQ4G9+EFJluvM4WJRCk7BdcDxol3kv+Ed
	Y99/Qv01lxKvMaAjzXZXBr7vfug66OQsMy2CYXMRk/iB830OlYNGwv1ZfJwCS0F/w83JRye22CpXE
	c0WvJtKRT7NEaJcP0QIok1D24hVsNPNMGA9lp7m/cQa2mlze8TQ5XviHByU4wIBzOlQvLmFjF1465
	yOvf4zKuaUl4+dnhtc3oIha5gdptkw8xADVmlGnx2FVKwsjPdNiPi2301zhr2ijbaS24+SfeUOv3I
	HVXrtqv/LFrTLGFMe8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG5RU-003N4o-LZ; Tue, 17 Aug 2021 20:12:12 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG5RS-003N32-71; Tue, 17 Aug 2021 20:12:11 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 b25-20020a4ac2990000b0290263aab95660so6242764ooq.13; 
 Tue, 17 Aug 2021 13:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Y8O/ugVUGd/pj+YpwBoilPPzVox4p1gBlgEBXz9RZM=;
 b=OChgonzUAkLokmpc1CTCiyI/6IN9jyem+35+y8zt5Q7gCH2anD/I2ksja884y/n+mt
 Zart/cGxm+6ybuzDZyw4EcbDdvHJ4ZaayCVyLgCrjvh/uYTVjnWPvDGKTfQHfhO6ha7l
 KKBzkQPEWsvhdOKNdAloKTm0bZk+rykE3Wp8PAL3yK+m6gKH9WisIqGQtEAyUIH3lai9
 hzf2UPcZQkpGA5BTnA+6x+07344ivAQRTWHh7xv2LvMAYlIXZ+CJjG8JwJsJeEgsE/X/
 HSsd7BeMUlHk9KiOoyH165qHM6V3FLM8+4AX8a0JmXFkfoTj3rNeaEFgy/44TjAeMz2d
 bZpw==
X-Gm-Message-State: AOAM531ioILURbw9JpU3ZU/blnDB2v0Z32es0x/jaf1O6WbBmNEsKONH
 w5B5FXZUH529LcNbCtB3nQ==
X-Google-Smtp-Source: ABdhPJzXi2Qb6T0n6M6hziTxPBlA6ZUr+4xKRXs2HwFfG0DIibNMEo5wtI0feqdM1bdl918jWY2pRQ==
X-Received: by 2002:a4a:d5d0:: with SMTP id a16mr3910689oot.18.1629231128239; 
 Tue, 17 Aug 2021 13:12:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i188sm708832oih.7.2021.08.17.13.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:12:07 -0700 (PDT)
Received: (nullmailer pid 762404 invoked by uid 1000);
 Tue, 17 Aug 2021 20:12:06 -0000
Date: Tue, 17 Aug 2021 15:12:06 -0500
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v3 02/13] dt-bindings: memory: mediatek: Add mt8195 smi
 sub common
Message-ID: <YRwYFtVlNjxyRwX+@robh.at.kernel.org>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
 <20210810080859.29511-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210810080859.29511-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_131210_310631_4660183E 
X-CRM114-Status: GOOD (  28.78  )
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

On Tue, Aug 10, 2021 at 04:08:48PM +0800, Yong Wu wrote:
> Add the binding for smi-sub-common. The SMI block diagram like this:
> 
>         IOMMU
>          |  |
>       smi-common
>   ------------------
>   |      ....      |
>  larb0           larb7   <-max is 8
> 
> The smi-common connects with smi-larb and IOMMU. The maximum larbs number
> that connects with a smi-common is 8. If the engines number is over 8,
> sometimes we use a smi-sub-common which is nearly same with smi-common.
> It supports up to 8 input and 1 output(smi-common has 2 output)
> 
> Something like:
> 
>         IOMMU
>          |  |
>       smi-common
>   ---------------------
>   |      |          ...
> larb0  sub-common   ...   <-max is 8
>       -----------
>        |    |    ...   <-max is 8 too.
>      larb2 larb5
> 
> We don't need extra SW setting for smi-sub-common, only the sub-common has
> special clocks need to enable when the engines access dram.
> 
> If it is sub-common, it should have a "mediatek,smi" phandle to point to
> its smi-common. meanwhile the sub-common only has one gals clock.
> 
> Additionally, add a new property "mediatek,smi_sub_common" for this
> sub-common, this is needed in the IOMMU driver in which we create a device
> link between smi-common and the IOMMU device. If we add the smi-sub-common
> here, the IOMMU driver still need to find the smi-common device. thus,
> add this bool property to indicate if it is sub-common.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> change note:
> a. change mediatek, smi type from phandle-array to phandle from Rob.
> b. Add a new bool property (mediatek,smi_sub_common) to indicate this is
>    smi-sub-common. the reason is as above.
> ---
>  .../mediatek,smi-common.yaml                  | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index 602592b6c3f5..26bb9903864b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -38,6 +38,7 @@ properties:
>            - mediatek,mt8192-smi-common
>            - mediatek,mt8195-smi-common-vdo
>            - mediatek,mt8195-smi-common-vpp
> +          - mediatek,mt8195-smi-sub-common
>  
>        - description: for mt7623
>          items:
> @@ -67,6 +68,14 @@ properties:
>      minItems: 2
>      maxItems: 4
>  
> +  mediatek,smi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: a phandle to the smi-common node above. Only for sub-common.
> +
> +  mediatek,smi_sub_common:

s/_/-/

> +    type: boolean
> +    description: Indicate if this is smi-sub-common.
> +
>  required:
>    - compatible
>    - reg
> @@ -93,6 +102,27 @@ allOf:
>              - const: smi
>              - const: async
>  
> +  - if:  # only for sub common
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-smi-sub-common
> +    then:
> +      required:
> +        - mediatek,smi
> +        - mediatek,smi_sub_common
> +      properties:
> +        clock:
> +          items:
> +            minItems: 3
> +            maxItems: 3
> +        clock-names:
> +          items:
> +            - const: apb
> +            - const: smi
> +            - const: gals0

If not allowed for other compatibles, you need:

else:
  properties:
    mediatek,sni: false
    mediatek,smi_sub_common: false


> +
>    - if:  # for gen2 HW that have gals
>        properties:
>          compatible:
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
