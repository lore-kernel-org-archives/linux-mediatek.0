Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38405C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObgT8N4PunDzglBZ8rgRQveYkUTJaqYbnVba8fiBZYs=; b=mrvVfZU6IV8s7n
	mhJwQVxNCsBQEvs5TiITg4mAIXBtBcy7Hw4ioZ1mvIYEwoSOLPgc1FmFqHVc6+5TpMdf6PpH+mwwH
	YUncZMjvv03AgFcdMLWH46S2np249Nwxc/6cCpc80JvmcmMKqeHY7FiHD9hb7DvQymVkIgljxM+OM
	QYgzXgQmCV1hEChYoZW4znnwScxbWRJE8yMGIKMbGxmi58XtkUgwZCla7TInE4ZzzDp/loD/j0ktO
	1hIHRYTT7T6E3HSrPAuhZKpua4G6HfyVFFl2MqBzGI9bMjX7LbKbWgCNYO2f+HQSRnXfiV/Pa6Qyd
	SfSGNVj1F+m6iJ5hKedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwmRL-003eVB-A1; Thu, 02 Jun 2022 15:08:47 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwmRA-003eTr-Tq; Thu, 02 Jun 2022 15:08:38 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-f16a3e0529so7115022fac.2;
        Thu, 02 Jun 2022 08:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OUwSxoOwcEaIjyrHRa2+WezhILR4wTzd8pNvmgqO9d8=;
        b=QoM4hWTo9BCInK08P//nN/hWRfvNZHMIkoWyjb0GxgCl97yZxeIsjPN3IM7Sqy4o8J
         aPa59o2UYH7PXUL5LkGQmMCPD2Avc0SgMGR8pA/E7AQkSbGYIdqU4Pje1PC58zirry+c
         FuAqPtS5HMyF+nE9vOKVOof2BNb8U9AKoGbGJjtgfrpEGztFninKi//rdkbjqgpOuUjo
         157f2yGJgwt/p597WlSv3QapEmCkAaCorNmbqs/uFO/m4xwSvRYP8i26KpPlw9MKwslF
         whWmhmnf3SMPn2k0AAlFvfG3UVbjioul4pwl7Id/R0kzD+utja1i1glcSYaB6Q3NLPQd
         FZwA==
X-Gm-Message-State: AOAM532pIulIqSw5VdnymmeIfD2MHfZRxvkZdqww0j+5kumYiKOL6fab
	4Hf0Rs3h9W6KO1K+JRj9Tw==
X-Google-Smtp-Source: ABdhPJwTdgjdDnA+5v6Y9CtE8w0PKrFsdD9tVYp5ME1xfF2mCS5P8rTTHo6sGULXKENTH0KKZpx/Ew==
X-Received: by 2002:a05:6870:b609:b0:f2:74e7:9bf1 with SMTP id cm9-20020a056870b60900b000f274e79bf1mr20018480oab.141.1654182514305;
        Thu, 02 Jun 2022 08:08:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n25-20020a056870241900b000f309d52933sm2146679oap.47.2022.06.02.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 08:08:33 -0700 (PDT)
Received: (nullmailer pid 2329687 invoked by uid 1000);
	Thu, 02 Jun 2022 15:08:33 -0000
Date: Thu, 2 Jun 2022 10:08:33 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pwm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: add MT8365 SoC binding
Message-ID: <20220602150833.GA2329628-robh@kernel.org>
References: <20220530205038.917431-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530205038.917431-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_080836_996363_3D6564D9 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, 30 May 2022 22:50:37 +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2: fix clock description (five -> three)
> 
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
