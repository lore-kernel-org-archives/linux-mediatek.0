Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A96C00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 18:24:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F3820709
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 18:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eULca+TA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F3820709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i1QjMQtfxg3zHbmhwmkpKPWfzqU/aRU0C/epDJ0gGP0=; b=eULca+TAAlmJkS9wEndTSP91/
	z/Kv3ThPHMpMSXUVQFMUhBiqwYf+NxpfklYYgJ7AZtMCmQ1mTO4A8/XUwU8nenaQ6auTAKR6ZlLbs
	nmH1upiVN/PItRwTOhJv72HiBktViXcppcyM0JmdNqCLqgGekZbwVMUWRNKjzfJ56PXjBzgiZoY0l
	sVfdq2yzrrS0GBnl8dr1Ejf/HyZotBL8LDM1upewv+o0UUK1lDv1fcZI8M8piMjA8YUbehwIMPro9
	Ij0+E+B0K0lG0fYC3eY5IY/KZn1zd2vzYNKh6+ZyoYXpsueoGeuy8C/3qOk0efWHlVPN008ZzSseF
	rRtpnr+zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZ49-0001jQ-Er; Fri, 30 Oct 2020 18:23:57 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZ44-0001hc-Ef; Fri, 30 Oct 2020 18:23:53 +0000
Received: by mail-oi1-f193.google.com with SMTP id f7so7595907oib.4;
 Fri, 30 Oct 2020 11:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2inLjJbsAMkvoGMY+1AnyOCvk2aTurr24HiDc4FcZ/8=;
 b=P7ppMlELCTbnvWsdMYHUi8VxARSJwOlQD4vzlhUwjE1trf6e/a2S4GxRaiSw5qvte1
 W+soSuetAD6J/dp8M5IGpGxRA543csbX+0jsXDnFjt5O0BVDTen6+cclwfRWUx9qggo6
 INmkcWSW4uaUp6zBIQm+VI61xhM1qMQvmh20NKdqL2G45YgQ5fMJZgidNrMYClMSFFEC
 k0Lr4TbTFkBbc5rCaAVICjbPXuY4k33Vkvhqu4gQ8JrLQGsnCa31/aV42B74AGjXlV9P
 qmCaiqo5YNtohxM+EUI3nkELZquOR4kmtqy0WS5y/JNaerLHnBb2CDuv+ziRDGZjZ+MY
 1YVw==
X-Gm-Message-State: AOAM533U8oymAzws6nQKqg4NZkZ0OCWYdtAIY7CBWQyKPNmYg1qgziMW
 2mlg2Fm/DLXGU/tsMSBgBw==
X-Google-Smtp-Source: ABdhPJzaDb2ohyIsfJyr5ytEjd3zNgm/t/ARqTbOLtJdwTgoAzDkMIVKjnk/1oZSlSF1bY7JMwpWCA==
X-Received: by 2002:aca:4f55:: with SMTP id d82mr2532939oib.172.1604082221243; 
 Fri, 30 Oct 2020 11:23:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 104sm1553996otu.81.2020.10.30.11.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 11:23:40 -0700 (PDT)
Received: (nullmailer pid 4098973 invoked by uid 1000);
 Fri, 30 Oct 2020 18:23:39 -0000
Date: Fri, 30 Oct 2020 13:23:39 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: mt8192: add ul-delay-ms
 property
Message-ID: <20201030182339.GA4069524@bogus>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603521686-13036-3-git-send-email-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_142352_852238_52E02CB6 
X-CRM114-Status: GOOD (  16.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 24, 2020 at 02:41:26PM +0800, Jiaxin Yu wrote:
> We can choose to drop any length of data from the beginning according
> accroding 'ul-delay-ms'.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt6359.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
> index a54f466f769d4..fd2d02c97fe7c 100644
> --- a/Documentation/devicetree/bindings/sound/mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
> @@ -49,6 +49,11 @@ properties:
>      description: |
>        Specifies the type of mic type connected to adc2
>  
> +  mediatek,ul-delay-ms:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Skip first time data at the beginning of DMIC recording

What does 'ul' mean? Nothing tells me this is DMIC related in the name 
and 'ul' is not used anywhere in the description.

> +
>  additionalProperties: false
>  
>  examples:
> @@ -56,6 +61,7 @@ examples:
>      mt6359codec: mt6359codec {
>        mediatek,dmic-mode = <0>;
>        mediatek,mic-type-0 = <2>;
> +      mediatek,ul-delay-ms = <50>;
>      };
>  
>  ...
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
