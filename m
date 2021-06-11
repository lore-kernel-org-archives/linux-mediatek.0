Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B91CC48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 20:58:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FB261278
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 20:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2FB261278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvUSPPXK9Ml6Bfc0GChGTwTlXnbC6D1NzEVO8ED+trI=; b=t2X2SHV8PE+iK3
	nFTYmqLq+g0EdpGwU+6Vp7xUyecHcf3rY94CVg8i6kts2wCcN1Xky8HxlhUeikRQteLXmPkgJFDYZ
	XAatutNDCfKQDofD77F0f/jyMmjEPgpJpI+XEsautRqJbxiCT6kgs0nHRL1JAPSbR3dCpDR6EfMKf
	JxXoTQsYXffGs2yDu9qAKa4dMQpN7bu3cMGchR/JSfUONdyi0glqBU1MEvtTeopK4ePR0AqBzlLzB
	HCs/ih6Ef5kWENRu8+bWEniYnZWaGk49/67Jy2s6EPI1b8FpBaW976piTmxhxkFgJiXg88lKRVUte
	N6fFW+gtvgnG8AdqM65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lroEe-00756b-0m; Fri, 11 Jun 2021 20:58:36 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrnaB-006rAZ-50; Fri, 11 Jun 2021 20:16:48 +0000
Received: by mail-io1-f52.google.com with SMTP id f10so17963909iok.6;
 Fri, 11 Jun 2021 13:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q0+x2SqoxWiaPifmKrDxHGfFMZV2vnASbAUPISmleOI=;
 b=Au0ExgR8BkAipVKUcnB2s2CH4ZwATdujk4Yosg69lZJqK4zz6iZTAir5Gn46A/FvS3
 Oh9grHleIuyqE6bv4GOQR+QLkHQzW5Izv7+sglEYwldtTvSobHch8k72+D5zNVb4tQx0
 AsL2jC0CR5Y/XHEdt6qoCyLhEeqbzpJ53KormtCN+8HgerIwaiCs+5JLQphdyphydMmv
 sR213L7OjeKS7em1QlA1DhzP6TDZisHYuh72YSHSkl4YQvee++7DueQnGG7L8vAUr7wo
 nRL7Dd89khQo6F8NElJ3VEnhitd4fr6hZLrhB9cqKXe41iY7mGQYSF7LQF1kR0MqLQFp
 iOgQ==
X-Gm-Message-State: AOAM531nR9mZJdY/nwz2F0NlpDX75/FFjCH7hc76Er8iUCgVzkJnj//5
 q4PUekhSVOZ1CVYG7h/U3w==
X-Google-Smtp-Source: ABdhPJzQIm/BqMSQwWzSA9z9gs+k22W0KTiGbehcPSKI8jfx8c3oJlpVku2pmx/4kzLFd1YTq5DgtA==
X-Received: by 2002:a05:6602:29d0:: with SMTP id
 z16mr4427962ioq.207.1623442606182; 
 Fri, 11 Jun 2021 13:16:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i13sm3833718ilr.16.2021.06.11.13.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:16:45 -0700 (PDT)
Received: (nullmailer pid 1608484 invoked by uid 1000);
 Fri, 11 Jun 2021 20:16:43 -0000
Date: Fri, 11 Jun 2021 14:16:43 -0600
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 gene_chen@richtek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, cy_huang@richtek.com, gene.chen.richtek@gmail.com
Subject: Re: [PATCH 1/2] regulator: mt6360: Add optional
 mediatek.power-off-sequence in bindings document
Message-ID: <20210611201643.GA1583875@robh.at.kernel.org>
References: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_131647_248531_7139C7FB 
X-CRM114-Status: GOOD (  19.16  )
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

On Wed, Jun 02, 2021 at 02:54:34PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add optional mediatek.power-off-sequence in bindings document.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Hi,
> 
> Originally, we think it must write in platform dependent code like as bootloader.
> But after the evaluation, it must write only when system normal HALT or POWER_OFF.
> For the other cases, just follow HW immediate off by default.

Wouldn't this be handled by PSCI implementation?

> ---
>  .../devicetree/bindings/regulator/mt6360-regulator.yaml       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
> index a462d99..eaf36e2 100644
> --- a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
> @@ -24,6 +24,16 @@ properties:
>    LDO_VIN3-supply:
>      description: Input supply phandle(s) for LDO6/7
>  
> +  mediatek,power-off-sequence:
> +    description: |
> +      Power off sequence time selection for BUCK1/BUCK2/LDO7/LDO6, respetively.
> +      Cause these regulators are all default-on power. Each value from 0 to 63,
> +      and step is 1. Each step means 2 millisecond delay.
> +      Therefore, the power off sequence delay time range is from 0ms to 126ms.
> +    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> +    minItems: 4
> +    maxItems: 4

So this is the delay between BUCK1 and BUCK2, then BUCK2 to LDO7, etcc? 
If we wanted to express this in DT, we'd made this generic which would 
need to be more flexible. A poweroff delay in each regulator (similar to 
the existing power on delay) would be sufficient for what you need I 
think.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
